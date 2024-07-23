//
//  suspendBtn.h
//  Search
//
//  Created by Jobs on 2020/8/13.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SuspendView.h"
#import "UIView+Extras.h"
#import "MacroDef_Cor.h"
#import "JobsBlock.h"
#import "BaseViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSuspendBtn : UIButton<BaseViewProtocol>

@end

NS_ASSUME_NONNULL_END
/**
使用方法：
 # 如果是View：在需要作用的UIView的子类
 @property(nonatomic,weak)UIViewController *vcer;//这个属性掌管悬浮效果，具体实现见  @interface UIView (SuspendView)
 -(void)drawRect:(CGRect)rect{
     [super drawRect:rect];
     if (self.isSuspend) {
         //开启悬浮效果
         self.vc = self.vcer;//外界传进来的，父承接的VC
         self.panRcognize.enabled = YES;
     }else{
         self.vc = nil;
     }
 }
 
 # 如果是ViewController
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
         SuspendBtn.frame = CGRectMake(JobsMainScreen_WIDTH() - JobsWidth(50) - JobsWidth(5),
                                       JobsMainScreen_HEIGHT() - JobsTabBarHeightByBottomSafeArea(nil) - JobsWidth(100),
                                       JobsWidth(50),
                                       JobsWidth(50));
         SuspendBtn.cornerCutToCircleWithCornerRadius(SuspendBtn.width / 2));
         Jobs_setAssociatedRETAIN_NONATOMIC(_suspendBtn, SuspendBtn)
     }return SuspendBtn;
 }
 
 -(void)setSuspendBtn:(JobsSuspendBtn *)suspendBtn{
     Jobs_setAssociatedRETAIN_NONATOMIC(_suspendBtn, suspendBtn)
 }

*/
