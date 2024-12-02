//
//  NSStirng+WKWebView.h
//  FM
//
//  Created by Admin on 8/11/2024.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WKWebView)
/// loadHTMLString：包含 HTML 内容的字符串
/// baseURL：指定 HTML 内容的基本 URL，可以用于解析相对路径
-(JobsReturnWKWebViewByStringBlock _Nonnull)webViewByloadHTMLString;
/// 解析纯的HTML字符串
-(__kindof WKWebView *_Nullable)webViewByloadHTMLStr;
/// 解析URL数据
-(JobsReturnWKWebViewByVoidBlock _Nonnull)makeWebView;
/// 解析JS
-(JobsReturnWKWebViewByVoidBlock _Nonnull)makeWebViewByJS;

@end

NS_ASSUME_NONNULL_END
