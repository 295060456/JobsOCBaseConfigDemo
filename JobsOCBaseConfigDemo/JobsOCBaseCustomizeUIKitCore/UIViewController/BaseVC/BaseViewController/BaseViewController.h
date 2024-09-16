//
//  BaseViewController.h
//  JobsSearch
//
//  Created by Jobs on 2020/12/1.
//

#import <UIKit/UIKit.h>
#import "UIViewModelProtocol.h"
#import "BaseViewControllerProtocol.h"
#import "JobsBlock.h"
#import "DefineConstString.h"
#import "MacroDef_Notification.h"
#import "MacroDef_Log.h"
#import "MacroDef_String.h"
#import "MacroDef_Func.h"

#import "UIView+Category.h"
#import "JobsBasePopupView.h"
#import "JobsMenuView.h"

#import "JobsViewController.h"

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#import "UIView+Refresh.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : JobsTabBarSettingVC <BaseViewControllerProtocol>

@end

NS_ASSUME_NONNULL_END

