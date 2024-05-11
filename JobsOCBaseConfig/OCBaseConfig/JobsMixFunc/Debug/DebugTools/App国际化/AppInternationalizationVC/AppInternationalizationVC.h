//
//  AppInternationalizationVC.h
//  Casino
//
//  Created by Jobs on 2021/11/19.
//

#import "AppDelegate.h"
#import "BaseViewController.h"
#import "MacroDef_Func.h"
#import "MacroDef_Notification.h"
#import "JobsOCBaseConfigNotificationManager.h"
#import "NSObject+AppTools.h"
#import "UIViewController+BackBtn.h"
#import "UITableViewCell+UITableViewCellProtocol.h"
#import "UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.h"

//#if __has_include(<XYColorOC/XYColorOC.h>)
//#import <XYColorOC/XYColorOC.h>
//#else
//#import "XYColorOC.h"
//#endif

#import "XYColorOC-umbrella.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppInternationalizationVC : BaseViewController
<
UITableViewDelegate
,UITableViewDataSource
>

@end

NS_ASSUME_NONNULL_END
