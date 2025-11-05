# Flutter 调用  iOS 原生（展示控制器网页）

## 一、运行效果

> 1️⃣ 在 Flutter 端点击按钮：通过 `MethodChannel` 调用 iOS 原生
>
> 2️⃣ iOS 原生收到 `"openWebView"` 指令：弹出原生的 `WebViewController`，展示网页

## 二、总结

| 环节               | 实现方式                                     |
| ------------------ | -------------------------------------------- |
| Dart 发起调用      | `MethodChannel.invokeMethod`                 |
| iOS 插件注册监听   | `FlutterMethodChannel` + `handleMethodCall:` |
| iOS 显示页面       | `presentViewController:`                     |
| 注册插件（如需要） | `[Plugin registerWithRegistrar:]`            |

## 三、代码层面

* Flutter 层代码：调用原生打开 `WebView`

  ```dart
  import 'package:flutter/services.dart';
  
  class NativeWebView {
    static const platform = MethodChannel('native_webview');
  
    static Future<void> open(String url, String title) async {
      await platform.invokeMethod('openWebView', {
        'url': url,
        'title': title,
      });
    }
  }
  ```

  ```dart
  ElevatedButton(
    onPressed: () {
      NativeWebView.open('https://flutter.dev', 'Flutter 官网');
    },
    child: Text('打开原生 WebView'),
  )
  ```

* iOS原生层（Objective-C）

  * 如果是**原生项目 + Flutter 模块集成**，还需要手动注册插件：

    ```objective-c
    /// AppDelegate.m
    #import "NativeWebViewPlugin.h"
    
    - (BOOL)application:(UIApplication *)application
        didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
      [GeneratedPluginRegistrant registerWithRegistry:self];
      // 注册你自己的插件
      [NativeWebViewPlugin registerWithRegistrar:[self registrarForPlugin:@"NativeWebViewPlugin"]];
      return [super application:application didFinishLaunchingWithOptions:launchOptions];
    }
    ```

  * 添加插件监听代码： `NativeWebViewPlugin`

    ```objective-c
    /// NativeWebViewPlugin.h
    #import <Foundation/Foundation.h>
    #import <UIKit/UIKit.h>
    
    #if __has_include(<Flutter/Flutter.h>)
    #import <Flutter/Flutter.h>
    #else
    #import "Flutter.h"
    #endif
    
    #import "WebViewController.h"
    
    NS_ASSUME_NONNULL_BEGIN
    
    @interface NativeWebViewPlugin : NSObject<FlutterPlugin>
    
    @end
    
    NS_ASSUME_NONNULL_END
    ```

    ```objective-c
    /// NativeWebViewPlugin.m
    #import "NativeWebViewPlugin.h"
    
    @implementation NativeWebViewPlugin
    
    + (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
      FlutterMethodChannel *channel = [FlutterMethodChannel
          methodChannelWithName:@"native_webview"
                binaryMessenger:[registrar messenger]];
      NativeWebViewPlugin *instance = [[NativeWebViewPlugin alloc] init];
      [registrar addMethodCallDelegate:instance channel:channel];
    }
    
    - (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
      if ([call.method isEqualToString:@"openWebView"]) {
        NSString *url = call.arguments[@"url"];
        NSString *title = call.arguments[@"title"];
    
        dispatch_async(dispatch_get_main_queue(), ^{
          UIViewController *rootVC = [UIApplication sharedApplication].delegate.window.rootViewController;
          WebViewController *webVC = [[WebViewController alloc] initWithURL:url title:title];
          UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:webVC];
          [rootVC presentViewController:nav animated:YES completion:nil];
        });
    
        result(nil);
      } else {
        result(FlutterMethodNotImplemented);
      }
    }
    
    @end
    ```

  * 创建原生 `WebView` 页面

    ```objective-c
    //  WebViewController.h
    #import <UIKit/UIKit.h>
    #import <WebKit/WebKit.h>
    
    NS_ASSUME_NONNULL_BEGIN
    
    @interface WebViewController : UIViewController
    
    -(instancetype)initWithURL:(NSString *)url title:(NSString *)title;
    
    @end
    
    NS_ASSUME_NONNULL_END
    ```

    ```objective-c
    //  WebViewController.m
    #import "WebViewController.h"
    
    @interface WebViewController ()
    
    @property(nonatomic,copy)NSString *url;
    @property(nonatomic,copy)NSString *titleStr;
    @property(nonatomic,strong)WKWebView *webView;
    
    @end
    
    @implementation WebViewController
    
    - (instancetype)initWithURL:(NSString *)url title:(NSString *)title {
      self = [super init];
      if (self) {
        _url = url;
        _titleStr = title;
      }
      return self;
    }
    
    - (void)viewDidLoad {
      [super viewDidLoad];
      self.title = self.titleStr;
    
      _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
      [self.view addSubview:_webView];
      NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
      [_webView loadRequest:request];
    
      UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
      self.navigationItem.leftBarButtonItem = closeItem;
    }
    
    - (void)close {
      [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    @end
    ```

    

  

  



