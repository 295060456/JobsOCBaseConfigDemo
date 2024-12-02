//
//  NSString+WKWebView.m
//  FM
//
//  Created by Admin on 8/11/2024.
//

#import "NSString+WKWebView.h"

@implementation NSString (WKWebView)
/// loadHTMLString：包含 HTML 内容的字符串
/// baseURL：指定 HTML 内容的基本 URL，可以用于解析相对路径
-(JobsReturnWKWebViewByStringBlock _Nonnull)webViewByloadHTMLString{
    return ^__kindof WKWebView *_Nullable(NSString *_Nullable data){
        @jobs_weakify(self)
        return jobsMakeWKWebView(^(__kindof WKWebView * _Nullable webView) {
            @jobs_strongify(self)
            [webView loadHTMLString:self baseURL:data.jobsUrl];
        });
    };
}
/// 解析纯的HTML字符串
-(__kindof WKWebView *_Nullable)webViewByloadHTMLStr{
    @jobs_weakify(self)
    return jobsMakeWKWebView(^(__kindof WKWebView * _Nullable webView) {
        @jobs_strongify(self)
        [webView loadHTMLString:self baseURL:nil];
    });
}
/// 解析URL数据
-(JobsReturnWKWebViewByVoidBlock _Nonnull)makeWebView{
    return ^__kindof WKWebView *_Nullable(){
        @jobs_weakify(self)
        return jobsMakeWKWebView(^(__kindof WKWebView *_Nullable webView) {
            @jobs_strongify(self)
            [webView loadRequest:self.jobsUrl.URLRequest];
        });
    };
}
/// 解析JS
-(JobsReturnWKWebViewByVoidBlock _Nonnull)makeWebViewByJS{
    return ^__kindof WKWebView *_Nullable(){
        @jobs_weakify(self)
        return jobsMakeWKWebViewByConfig(^(__kindof WKWebView *_Nullable webView) {
            @jobs_strongify(self)
            [webView evaluateJavaScript:self
                      completionHandler:^(id _Nullable result,
                                          NSError * _Nullable error) {
                if (error) {
                    NSLog(@"执行 JavaScript 出错: %@", error);
                } else {
                    NSLog(@"JavaScript 结果: %@", result);
                }
            }];
        });
    };
}

@end
