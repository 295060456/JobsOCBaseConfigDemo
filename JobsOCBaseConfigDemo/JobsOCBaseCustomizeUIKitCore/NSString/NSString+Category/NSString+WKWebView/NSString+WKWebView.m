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
/// 解析网络URL数据
-(JobsReturnWKWebViewByVoidBlock _Nonnull)webView{
    return ^__kindof WKWebView *_Nullable(){
        @jobs_weakify(self)
        return jobsMakeWKWebView(^(__kindof WKWebView * _Nullable webView) {
            @jobs_strongify(self)
            [webView loadRequest:self.jobsUrl.URLRequest];
        });
    };
}

@end
