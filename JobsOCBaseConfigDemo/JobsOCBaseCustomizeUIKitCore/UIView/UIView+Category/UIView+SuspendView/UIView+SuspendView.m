//
//  UIView+SuspendView.m
//  Search
//
//  Created by Jobs on 2020/8/13.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "UIView+SuspendView.h"

@implementation UIView (SuspendView)
#pragma mark —— 一些私有方法
-(void)handlePanGesture:(UIPanGestureRecognizer *)recognizer{
    //移动状态
    UIGestureRecognizerState recState = recognizer.state;
    switch (recState) {
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateChanged:{
            CGPoint translation = [recognizer translationInView:self.vc.navigationController.view];
            recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                                 recognizer.view.center.y + translation.y);
        }
            break;
        case UIGestureRecognizerStateEnded:{
            CGPoint stopPoint = CGPointMake(0, JobsMainScreen_HEIGHT(nil) / 2.0);
            if (recognizer.view.center.x < JobsMainScreen_WIDTH(nil) / 2.0) {
                if (recognizer.view.center.y <= JobsMainScreen_HEIGHT(nil)/2.0) {
                    //左上
                    if (recognizer.view.center.x  >= recognizer.view.center.y) {
                        stopPoint = CGPointMake(recognizer.view.center.x,
                                                self.width/2.0);
                    }else{
                        stopPoint = CGPointMake(self.width/2.0,
                                                recognizer.view.center.y);
                    }
                }else{
                    //左下
                    if (recognizer.view.center.x  >= JobsMainScreen_HEIGHT(nil) - recognizer.view.center.y) {
                        stopPoint = CGPointMake(recognizer.view.center.x,
                                                JobsMainScreen_HEIGHT(nil) - self.width/2.0);
                    }else{
                        stopPoint = CGPointMake(self.width / 2.0,
                                                recognizer.view.center.y);
                    }
                }
            }else{
                if (recognizer.view.center.y <= JobsMainScreen_HEIGHT(nil)/2.0) {
                    //右上
                    if (JobsMainScreen_WIDTH(nil) - recognizer.view.center.x  >= recognizer.view.center.y) {
                        stopPoint = CGPointMake(recognizer.view.center.x,
                                                self.width/2.0);
                    }else{
                        stopPoint = CGPointMake(JobsMainScreen_WIDTH(nil) - self.width/2.0,
                                                recognizer.view.center.y);
                    }
                }else{
                    //右下
                    if (JobsMainScreen_WIDTH(nil) - recognizer.view.center.x  >= JobsMainScreen_HEIGHT(nil) - recognizer.view.center.y) {
                        stopPoint = CGPointMake(recognizer.view.center.x,
                                                JobsMainScreen_HEIGHT(nil) - self.width/2.0);
                    }else{
                        stopPoint = CGPointMake(JobsMainScreen_WIDTH(nil) - self.width/2.0,
                                                recognizer.view.center.y);
                    }
                }
            }
            //如果按钮超出屏幕边缘
            if (stopPoint.y + self.width + 40 >= JobsMainScreen_HEIGHT(nil)) {
                stopPoint = CGPointMake(stopPoint.x, JobsMainScreen_HEIGHT(nil) - self.width / 2.0 - 49);
                NSLog(@"超出屏幕下方了！！"); //这里注意iphoneX的适配。。X的SCREEN高度算法有变化。
            }
            if (stopPoint.x - self.width / 2.0 <= 0) {
                stopPoint = CGPointMake(self.width / 2.0, stopPoint.y);
            }
            if (stopPoint.x + self.width / 2.0 >= JobsMainScreen_WIDTH(nil)) {
                stopPoint = CGPointMake(JobsMainScreen_WIDTH(nil) - self.width/2.0, stopPoint.y);
            }
            if (stopPoint.y - self.width / 2.0 <= 0) {
                stopPoint = CGPointMake(stopPoint.x, self.width/2.0);
            }
  
            [UIView animateWithDuration:0.5 animations:^{
                recognizer.view.center = stopPoint;
            }];
        }
            break;
        default:
            break;
    }
    [recognizer setTranslation:CGPointMake(0, 0)
                        inView:self.vc.view];
}
#pragma mark —— @property(nonatomic,weak)UIViewController *vc;
JobsKey(_vc)
@dynamic vc;
-(UIViewController *)vc{
    UIViewController *VC = Jobs_getAssociatedObject(_vc);
    if (!VC) {
        NSLog(@"VC 不能为空");
    }return VC;
}

-(void)setVc:(UIViewController *)vc{
    Jobs_setAssociatedRETAIN_NONATOMIC(_vc, vc)
}
#pragma mark —— @property(nonatomic,strong)UIPanGestureRecognizer *panRcognize;
JobsKey(_panRcognize)
@dynamic panRcognize;
-(UIPanGestureRecognizer *)panRcognize{
    UIPanGestureRecognizer *PanRcognize = Jobs_getAssociatedObject(_panRcognize);
    if (!PanRcognize) {
        self.panGR.enabled = YES;
        self.panGR.minimumNumberOfTouches = 1;
        self.panGR.delaysTouchesEnded = YES;
        self.panGR.cancelsTouchesInView = YES;
        self.target = self;/// ⚠️注意：任何手势这一句都要写
        @jobs_weakify(self)
        self.panGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable target,
                                                                           UIPanGestureRecognizer *_Nullable arg) {
            @jobs_strongify(self)
            [self handlePanGesture:arg];
            return nil;
        }];
        Jobs_setAssociatedRETAIN_NONATOMIC(_panRcognize, self.panGR)
    }return PanRcognize;
}

-(void)setPanRcognize:(UIPanGestureRecognizer *)panRcognize{
    Jobs_setAssociatedRETAIN_NONATOMIC(_panRcognize, panRcognize)
}

@end
