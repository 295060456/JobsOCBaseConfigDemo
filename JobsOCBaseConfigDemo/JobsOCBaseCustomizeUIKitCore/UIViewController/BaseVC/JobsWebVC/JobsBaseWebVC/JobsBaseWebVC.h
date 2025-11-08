//
//  JobsWebVC.h
//  FMNormal
//
//  Created by Jobs on 2025/5/9.
//

#import "BaseViewController.h"
#import <WebKit/WebKit.h>
#import "BaseViewControllerProtocol.h"

NS_ASSUME_NONNULL_BEGIN
/// 平铺的WebView控制器
@interface JobsBaseWebVC : BaseViewController
<
WKNavigationDelegate
,WKScriptMessageHandler
>
/// makeNormaleWebView
/// self.webView.loadRequest(self.urlString.URLRequest);
+(JobsRetVCByWebViewBlock _Nonnull)initByWebView;

@end

NS_ASSUME_NONNULL_END
