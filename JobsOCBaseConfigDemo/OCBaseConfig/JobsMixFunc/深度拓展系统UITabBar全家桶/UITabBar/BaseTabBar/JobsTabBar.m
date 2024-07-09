//
//  CustomTabBar.m
//  HitTesting
//
//  Created by mac on 2017/5/19.
//  Copyright © 2017年 flowyears. All rights reserved.
//

#import "JobsTabBar.h"

@interface JobsTabBar ()

@end

@implementation JobsTabBar
UITabbarConfigProtocol_synthesize
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = NO;//超出视图部分显示
        self.barStyle = UIBarStyleBlack;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    NSMutableArray <UIView *>*tabBarButtons = NSMutableArray.array;
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            subview.backgroundColor = JobsRandomColor;
            [tabBarButtons addObject:subview];
        }
    }
    CGFloat s = 0.f;
    for (int t = 0; t < self.tabBarControllerConfigMutArr.count ; t++) {
        JobsTabBarControllerConfig *tabBarControllerConfig = self.tabBarControllerConfigMutArr[t];
        UIView *tabBarButton = tabBarButtons[t];
        s += tabBarControllerConfig.xOffset;
        tabBarButton.resetOriginX(s + tabBarControllerConfig.xOffset + tabBarControllerConfig.tabBarItemWidth);
        
        if (t) {
            tabBarButton.resetOriginX(s + tabBarControllerConfig.tabBarItemWidth);
        }else{
            tabBarButton.resetOriginX(s);
        }
        
        tabBarButton.resetWidth(tabBarControllerConfig.tabBarItemWidth);
    }
}
///【覆写父类方法】自定义 TabBar 的高度
- (CGSize)sizeThatFits:(CGSize)size {
    return [self checkScreenOrientation_UIInterfaceOrientationMask:^CGSize(UIInterfaceOrientationMask data) {
        switch (data) {
            case UIInterfaceOrientationMaskPortrait:///【界面】竖屏方向
            case UIInterfaceOrientationMaskLandscapeLeft:{///【界面】倒竖屏方向
                return [super sizeThatFits:size];
            }break;
            case UIInterfaceOrientationMaskLandscapeRight:///【界面】左横屏方向
            case UIInterfaceOrientationMaskPortraitUpsideDown:{///【界面】右横屏方向
                CGSize newSize = [super sizeThatFits:size];
                newSize.height = JobsWidth(120); /// 设定你想要的高度
                return newSize;
            }default:{
//                return [super sizeThatFits:size];
                CGSize newSize = [super sizeThatFits:size];
                newSize.height = JobsWidth(120); /// 设定你想要的高度
                return newSize;
            }break;
        }
    }];
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    if (self.viewModel) {
        self.barTintColor = self.viewModel.bgCor;
        self.translucent = self.viewModel.isTranslucent;// 取消tabBar的透明效果
        // 有设定背景图片值优先走背景图片设定，背景颜色自动忽略
        if (self.viewModel.bgImage) {
            //self.viewModel.bgImage;//用系统的backgroundImage属性失灵
            self.backgroundImageView.image = self.viewModel.bgImage;
            return;
        }
        
        if (self.viewModel.bgCor) {
            self.backgroundColor = self.viewModel.bgCor;
        }
    }
}

-(CGFloat)customTabBarOffsetHeight{
    return self.viewModel.offsetHeight ? self.viewModel.offsetHeight : 0.f;
}

//-(UIView *)hitTest:(CGPoint)point
//         withEvent:(UIEvent *)event{
//
//}
#pragma mark —— LazyLoad

@end
