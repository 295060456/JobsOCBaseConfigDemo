//
//  JobsWebViewController.h
//  FM
//
//  Created by Admin on 18/11/2024.
//

#import <WebKit/WebKit.h>
#import "BaseViewController.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsWebViewController : BaseViewController

+(JobsReturnVCByWebViewBlock _Nonnull)initByWebView;

@end

NS_ASSUME_NONNULL_END
