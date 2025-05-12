//
//  NSObject+HTML.m
//  FM
//
//  Created by Admin on 19/12/2024.
//

#import "NSObject+HTML.h"

@implementation NSObject (HTML)
/// HTML 必要标签
- (__kindof NSMutableArray<NSString *> *)requiredHTMLTags{
    return jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable arr) {
        arr.add(@"<html>").add(@"</html>");
        arr.add(@"<head>").add(@"</head>");
        arr.add(@"<body>").add(@"</body>");
    });
}
/// HTML 标签
-(__kindof NSArray <__kindof NSString *>*)htmlTags{
    @jobs_weakify(self)
    return jobsMakeMutArr(^(__kindof NSMutableArray <__kindof NSString *>*_Nullable arr) {
        @jobs_strongify(self)
        arr.addBy(self.requiredHTMLTags);
        arr.add(@"<div>").add(@"</div>");
        arr.add(@"<span>").add(@"</span>");
        arr.add(@"<p>").add(@"</p>");
        arr.add(@"<a>").add(@"</a>");
        arr.add(@"<img>");
        arr.add(@"<ul>").add(@"</ul>");
        arr.add(@"<ol>").add(@"</ol>");
        arr.add(@"<li>").add(@"</li>");
        arr.add(@"<h1>").add(@"</h1>");
        arr.add(@"<h2>").add(@"</h2>");
        arr.add(@"<h3>").add(@"</h3>");
        arr.add(@"<h4>").add(@"</h4>");
        arr.add(@"<h5>").add(@"</h5>");
        arr.add(@"<h6>").add(@"</h6>");
        arr.add(@"<table>").add(@"</table>");
        arr.add(@"<tr>").add(@"</tr>");
        arr.add(@"<td>").add(@"</td>");
        arr.add(@"<th>").add(@"</th>");
        arr.add(@"<form>").add(@"</form>");
        arr.add(@"<input>");
        arr.add(@"<button>").add(@"</button>");
        arr.add(@"<select>").add(@"</select>");
        arr.add(@"<option>").add(@"</option>");
        arr.add(@"<textarea>").add(@"</textarea>");
        arr.add(@"<link>");
        arr.add(@"<meta>");
        arr.add(@"<script>").add(@"</script>");
        arr.add(@"<style>").add(@"</style>");
        arr.add(@"<header>").add(@"</header>");
        arr.add(@"<footer>").add(@"</footer>");
        arr.add(@"<nav>").add(@"</nav>");
        arr.add(@"<section>").add(@"</section>");
        arr.add(@"<article>").add(@"</article>");
        arr.add(@"<aside>").add(@"</aside>");
        arr.add(@"<main>").add(@"</main>");
        arr.add(@"<figure>").add(@"</figure>");
        arr.add(@"<figcaption>").add(@"</figcaption>");
        arr.add(@"<blockquote>").add(@"</blockquote>");
        arr.add(@"<code>").add(@"</code>");
        arr.add(@"<pre>").add(@"</pre>");
        arr.add(@"<iframe>").add(@"</iframe>");
        arr.add(@"<strong>").add(@"</strong>");
        arr.add(@"<em>").add(@"</em>");
        arr.add(@"<br>");
        arr.add(@"<hr>");
    });
}
/// 一个常规的WebView
-(JobsReturnWKWebViewByViewModelBlock _Nonnull)makeNormaleWebViewByViewModel{
    @jobs_weakify(self)
    return ^__kindof WKWebView *_Nullable(__kindof UIViewModel *_Nullable viewModel){
        @jobs_strongify(self)
        WKWebView *webView = WKWebView.initBy(jobsMakeWebViewConfiguration(^(__kindof WKWebViewConfiguration * _Nullable config) {
            config.userContentController = jobsMakeUserContentController(^(__kindof WKUserContentController * _Nullable data) {
                [data addScriptMessageHandler:self name:viewModel.handlerName]; // handler 名字
            });
        }));
        webView.url = viewModel.url;
        webView.navigationDelegate = self; // 设置代理监听网页加载状态
        /// 从 Objective-C 调用 JavaScript 方法
        [webView evaluateJavaScript:viewModel.evaluateJavaScript
                  completionHandler:viewModel.completionHandlerBlock];
        return webView;
    };
}
#pragma mark —— WKScriptMessageHandler
-(void)userContentController:(WKUserContentController *)userContentController
     didReceiveScriptMessage:(WKScriptMessage *)message{
    
}

@end
