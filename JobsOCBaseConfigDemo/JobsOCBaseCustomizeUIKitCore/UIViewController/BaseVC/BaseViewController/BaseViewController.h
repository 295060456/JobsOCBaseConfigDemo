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
#import "DefineConstString.h" /// 常亮字符串的定义
#import "MacroDef_Notification.h"
#import "MacroDef_Log.h"
#import "MacroDef_String.h"
#import "MacroDef_Func.h"

#import "UIView+Category.h"
#import "JobsBasePopupView.h"
#import "JobsMenuView.h"

#import "JobsTabBarSettingVC.h"

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
/*
/// 在具体的子类去实现，以覆盖父类的方法实现
@synthesize backBtnModel = _backBtnModel;
-(UIButtonModel *)backBtnModel{
    if(!_backBtnModel){
        @jobs_weakify(self)
        _backBtnModel = self.makeBackBtnModel;
        _backBtnModel.titleFont = bayonRegular(JobsWidth(18));
        _backBtnModel.titleCor = JobsWhiteColor;
        _backBtnModel.selected_titleCor = JobsWhiteColor;
        _backBtnModel.longPressGestureEventBlock = ^id(__kindof UIButton *x) {
            JobsLog(@"按钮的长按事件触发");
            return nil;
        };
        _backBtnModel.clickEventBlock = ^id(BaseButton *x){
            @jobs_strongify(self)
            self.jobsBackBtnClickEvent(x);
            self.popToRootVCBy(YES);
            return nil;
        };
    }return _backBtnModel;
}
*/
