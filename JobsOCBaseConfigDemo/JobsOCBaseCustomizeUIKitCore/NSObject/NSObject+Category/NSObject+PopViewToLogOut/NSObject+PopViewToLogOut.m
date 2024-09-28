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
        LogOutPopupVM = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.textModel.text = JobsInternationalization(@"Confirm to exit ?");
            data.textModel.font = UIFontWeightRegularSize(14);
            data.textModel.textAlignment = NSTextAlignmentCenter;
            data.subTextModel.text = JobsInternationalization(@"");
            data.bgCor = JobsWhiteColor;
        });Jobs_setAssociatedRETAIN_NONATOMIC(_logOutPopupVM, LogOutPopupVM)
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
        LogOutPopupView.Size = JobsBasePopupView.viewSizeByModel(nil);
        LogOutPopupView.jobsRichViewByModel(self.logOutPopupVM);
        @jobs_weakify(self)
        [LogOutPopupView actionObjectBlock:^(UIButton *data) {
            @jobs_strongify(self)
            if (data.tag == 666) {// 取消
                NSLog(@"手滑了");
            }else if (data.tag == 999){// 确定退出
                [self logOut];
                self.jobsToastSuccessMsg(JobsInternationalization(@"Logout succeeded"));
                extern BOOL ISLogin;
                ISLogin = NO;
                JobsPostNotification(退出登录成功, @(NO));
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
