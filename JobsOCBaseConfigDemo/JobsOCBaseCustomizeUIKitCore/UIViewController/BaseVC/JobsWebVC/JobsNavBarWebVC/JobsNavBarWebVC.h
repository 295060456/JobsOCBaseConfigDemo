//
//  JobsNavBarWebVC.h
//  FMOnlyH5
//
//  Created by Admin on 8/4/2025.
//

#import "JobsBaseWebVC.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/// 带导航栏的WebView控制器
@interface JobsNavBarWebVC : JobsBaseWebVC
<
WKNavigationDelegate
,WKScriptMessageHandler
>

@end

NS_ASSUME_NONNULL_END
