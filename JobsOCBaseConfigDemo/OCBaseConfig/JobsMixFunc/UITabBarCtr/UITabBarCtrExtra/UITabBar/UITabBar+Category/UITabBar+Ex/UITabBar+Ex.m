//
//  UITabBar+Ex.m
//  TabbarItemLottie
//
//  Created by 叶晓倩 on 2017/9/29.
//  Copyright © 2017年 xa. All rights reserved.
//

#import "UITabBar+Ex.h"

@implementation UITabBar (Ex)
/// 移除系统的 UITabBarButton
-(void)deleteUITabBarButton{
    for (UIView *childView in self.subviews) {
        if ([childView isKindOfClass:UIControl.class]) {//UITabBarButton
            [childView removeFromSuperview];
        }
    }
}

-(LOTAnimationView *_Nullable)addLottieImage:(NSUInteger)index
                                  lottieName:(NSString *_Nullable)lottieName{
    // lottieName 存在才对LOTAnimationView及其相关控件进行创建
    LOTAnimationView *lottieView = nil;
    if (isValue(lottieName) && lottieName) {
        lottieView = [LOTAnimationView animationNamed:lottieName];
        [self addSubview:lottieView];
        lottieView.userInteractionEnabled = NO;
        lottieView.contentMode = UIViewContentModeScaleAspectFit;
        lottieView.tag = 888 + index;
        lottieView.backgroundColor = JobsYellowColor;
    }return lottieView;
}

-(void)animationLottieImage:(NSInteger)index{
    [self stopAnimationAllLottieView];
    LOTAnimationView *lottieView = [self viewWithTag:888 + index];
    if (lottieView && [lottieView isKindOfClass:LOTAnimationView.class]) {
        lottieView.animationProgress = 0;
        [lottieView play];
    }
}

-(void)stopAnimationAllLottieView {
    for (int i = 0; i < self.items.count; i++) {
        LOTAnimationView *lottieView = [self viewWithTag:888 + i];
        if (lottieView && [lottieView isKindOfClass:LOTAnimationView.class]) {
            [lottieView stop];
        }
    }
}

@end
