//
//  NSStirng+WKWebView.h
//  FM
//
//  Created by Admin on 8/11/2024.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <WebKit/WebKit.h>
#import "JobsBlock.h"
#import "NSObject+HTML.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WKWebView)
/// loadHTMLString：包含 HTML 内容的字符串
/// baseURL：指定 HTML 内容的基本 URL，可以用于解析相对路径
-(JobsRetWKWebViewByStrBlock _Nonnull)webViewByloadHTMLString;
/// 解析纯的HTML字符串
-(__kindof WKWebView *_Nullable)webViewByloadHTMLStr;
/// 解析URL数据
-(JobsRetWKWebViewByVoidBlock _Nonnull)makeWebView;
/// 解析JS
-(JobsRetWKWebViewByVoidBlock _Nonnull)makeWebViewByJS;
/// 鉴别一个字符串里面是否包含HTML的标签。如果有则这个字符串考虑用WebView来进行承接
-(BOOL)isHTMLString;
/// 某个字符串是否包含这些HTML必要的成像标签。如果没有就要做特殊处理
-(BOOL)isContainsRequiredHTMLTags;
/// 包装 HTML 字符串，使之能被 WKWebView 正确显示
-(__kindof NSString *_Nullable)wrapHTMLString;
/// 包装 HTML 字符串，使之能被 WKWebView 正确显示 + 背景透明
-(__kindof NSString *_Nullable)wrapHTMLStringWithClearBg;

@end

NS_ASSUME_NONNULL_END
