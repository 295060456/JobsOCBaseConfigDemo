//
//  UIViewController+SuspendBtn.m
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import "UIViewController+SuspendBtn.h"

@implementation UIViewController (SuspendBtn)
#pragma mark —— @property(nonatomic,strong)JobsSuspendBtn *suspendBtn;
JobsKey(_suspendBtn)
@dynamic suspendBtn;
-(JobsSuspendBtn *)suspendBtn{
    JobsSuspendBtn *SuspendBtn = Jobs_getAssociatedObject(_suspendBtn);
    if (!SuspendBtn) {
        SuspendBtn = JobsSuspendBtn.new;
        SuspendBtn.normalImage = JobsIMG(@"旋转");
        SuspendBtn.isAllowDrag = YES;//悬浮效果必须要的参数
        @jobs_weakify(self)
        [SuspendBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            NSLog(@"%@",x.selected ? JobsInternationalization(@"开始旋转") : JobsInternationalization(@"停止旋转"));
//            [x rotateAnimation:x.selected];
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        self.view.vc = weak_self;
        [self.view addSubview:SuspendBtn];

        SuspendBtn.frame = CGRectMake(JobsMainScreen_WIDTH(nil) - JobsWidth(50) - JobsWidth(5),
                                      JobsMainScreen_HEIGHT(nil) - JobsTabBarHeightByBottomSafeArea(nil) - JobsWidth(100),
                                      JobsWidth(50),
                                      JobsWidth(50));
        [SuspendBtn cornerCutToCircleWithCornerRadius:SuspendBtn.width / 2];
        Jobs_setAssociatedRETAIN_NONATOMIC(_suspendBtn, SuspendBtn)
    }return SuspendBtn;
}

-(void)setSuspendBtn:(JobsSuspendBtn *)suspendBtn{
    Jobs_setAssociatedRETAIN_NONATOMIC(_suspendBtn, suspendBtn)
}

@end
