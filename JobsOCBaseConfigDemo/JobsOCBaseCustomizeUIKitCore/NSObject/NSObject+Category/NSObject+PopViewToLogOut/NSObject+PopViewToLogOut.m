//
//  NSObject+PopViewToLogOut.m
//  Casino
//
//  Created by Jobs on 2022/1/1.
//

#import "NSObject+PopViewToLogOut.h"

@implementation NSObject (PopViewToLogOut)
#pragma mark —— @property(nonatomic,strong)UIViewModel *logOutPopupVM;
JobsKey(_logOutPopupVM)
@dynamic logOutPopupVM;
-(UIViewModel *)logOutPopupVM{
    UIViewModel *LogOutPopupVM = Jobs_getAssociatedObject(_logOutPopupVM);
    if (!LogOutPopupVM) {
        LogOutPopupVM = UIViewModel.new;
        LogOutPopupVM.textModel.text = JobsInternationalization(@"Confirm to exit ?");
        LogOutPopupVM.textModel.font = UIFontWeightRegularSize(14);
        LogOutPopupVM.textModel.textAlignment = NSTextAlignmentCenter;
        LogOutPopupVM.subTextModel.text = JobsInternationalization(@"");
        LogOutPopupVM.bgCor = UIColor.whiteColor;
        Jobs_setAssociatedRETAIN_NONATOMIC(_logOutPopupVM, LogOutPopupVM)
    }return LogOutPopupVM;
}

-(void)setLogOutPopupVM:(UIViewModel *)logOutPopupVM{
    Jobs_setAssociatedRETAIN_NONATOMIC(_logOutPopupVM, logOutPopupVM)
}
#pragma mark —— @property(nonatomic,strong)JobsBasePopupView *logOutPopupView;
JobsKey(_logOutPopupView)
@dynamic logOutPopupView;
-(JobsBasePopupView *)logOutPopupView{
    JobsBasePopupView *LogOutPopupView = Jobs_getAssociatedObject(_logOutPopupView);
    if (!LogOutPopupView) {
        LogOutPopupView = JobsBasePopupView.new;
        LogOutPopupView.size = [JobsBasePopupView viewSizeWithModel:nil];
        [LogOutPopupView richElementsInViewWithModel:self.logOutPopupVM];
        @jobs_weakify(self)
        [LogOutPopupView actionObjectBlock:^(UIButton *data) {
            @jobs_strongify(self)
            if (data.tag == 666) {// 取消
                NSLog(@"手滑了");
            }else if (data.tag == 999){// 确定退出
                [self logOut];
                [WHToast jobsToastSuccessMsg:JobsInternationalization(@"Logout succeeded")];
                extern BOOL ISLogin;
                ISLogin = NO;
                JobsPostNotification(退出登录, @(NO));
            }
            [LogOutPopupView tf_hide];
        }];
        Jobs_setAssociatedRETAIN_NONATOMIC(_logOutPopupView, LogOutPopupView)
    }return LogOutPopupView;
}

-(void)setLogOutPopupView:(JobsBasePopupView *)logOutPopupView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_logOutPopupView, logOutPopupView)
}

@end
