//
//  NativeWebViewPlugin.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 15/7/25.
//

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
