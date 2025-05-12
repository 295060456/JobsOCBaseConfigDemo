//
//  NSObject+HTML.h
//  FM
//
//  Created by Admin on 19/12/2024.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>                         /// 用于嵌入和管理网页内容，例如加载和显示网页。
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (HTML)<WKScriptMessageHandler,WKNavigationDelegate>
/// HTML 必要标签
- (__kindof NSMutableArray<NSString *> *)requiredHTMLTags;
/// HTML 标签
-(__kindof NSArray <__kindof NSString *>*)htmlTags;
/// 一个常规的WebView
-(JobsReturnWKWebViewByViewModelBlock _Nonnull)makeNormaleWebViewByViewModel;

@end

NS_ASSUME_NONNULL_END
/**
 
 @synthesize webView = _webView;
 -(WKWebView *)webView {
     if (!_webView) {
 //        _webView = self.makeWebViewByURL(self.urlString.jobsUrl);
         /// JS 回调 Objective-C 方法
         _webView = WKWebView.initBy(jobsMakeWebViewConfiguration(^(__kindof WKWebViewConfiguration * _Nullable config) {
             config.userContentController = jobsMakeUserContentController(^(__kindof WKUserContentController * _Nullable data) {
                 [data addScriptMessageHandler:self name:@"mayapay"]; // handler 名字
             });
         }));
         _webView.navigationDelegate = self; // 设置代理监听网页加载状态
         /// 从 Objective-C 调用 JavaScript 方法
         [_webView evaluateJavaScript:@"navigator.userAgent"
                    completionHandler:^(id result, NSError *error) {
             if (!error && [result isKindOfClass:NSString.class]) {
                 NSLog(@"User-Agent: %@", result);
                 NSString *ua = [NSString stringWithFormat:@"%@",result];
                 self->_webView.customUserAgent = ua.add(@"iOS/Mobile");
             } else {
                 NSLog(@"获取 User-Agent 失败: %@", error.localizedDescription);
             }
         }];
     }return _webView;
 }
 
 */
