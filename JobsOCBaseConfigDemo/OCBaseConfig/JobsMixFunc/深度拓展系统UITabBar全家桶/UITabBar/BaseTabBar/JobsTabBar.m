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

- (void)layoutSubviews {
    [super layoutSubviews];
    NSMutableArray<UIView *> *tabBarButtons = NSMutableArray.array;
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            subview.backgroundColor = JobsRandomColor;
            [tabBarButtons addObject:subview];
            UILabel *label = nil; /// TabBar的文字
            UIImageView *imageView = nil; /// TabBar的图片
            for (UIView *subSubview in subview.subviews) {
                if ([subSubview isKindOfClass:[UILabel class]]) {
                    label = (UILabel *)subSubview;
//                    label.backgroundColor = JobsRedColor;
                    [label sizeToFit];
                }
                if ([subSubview isKindOfClass:[UIImageView class]]) {
                    imageView = (UIImageView *)subSubview;
                }
            }
            [self layoutIfNeeded];
            if (label && imageView) {
                JobsTabBarCtrlConfig *tabBarControllerConfig = self.tabBarControllerConfigMutArr[tabBarButtons.count - 1];
                [self alignLabel:label
                       imageView:imageView
                  inTabBarButton:subview
                         spacing:tabBarControllerConfig.spacing];
            }
        }
    }   
    CGFloat s = 0.f;
    for (int t = 0; t < self.tabBarControllerConfigMutArr.count ; t++) {
        JobsTabBarCtrlConfig *tabBarControllerConfig = self.tabBarControllerConfigMutArr[t];
        UIView *tabBarButton = tabBarButtons[t];
        
        if(tabBarControllerConfig.xOffset){
            if (t) {
                tabBarButton.resetOriginX(s + tabBarControllerConfig.xOffset);
            }else{
                tabBarButton.resetOriginX(tabBarControllerConfig.xOffset);
            }
            s += (tabBarControllerConfig.xOffset + tabBarControllerConfig.tabBarItemWidth);
        }
        
        if(tabBarControllerConfig.tabBarItemWidth){
            tabBarButton.resetWidth(tabBarControllerConfig.tabBarItemWidth);
        }
    }
}
///【覆写父类方法】自定义 TabBar 的高度
- (CGSize)sizeThatFits:(CGSize)size {
    return [self checkScreenOrientation_UIInterfaceOrientation:^CGSize(UIInterfaceOrientation data) {
        switch (data) {
            case UIInterfaceOrientationPortraitUpsideDown:/// 倒竖屏方向
            case UIInterfaceOrientationPortrait:{ /// 竖屏方向
                return [super sizeThatFits:size];
            }break;
            case UIInterfaceOrientationLandscapeLeft:/// 左横屏方向
            case UIInterfaceOrientationLandscapeRight:{ /// 右横屏方向
                CGSize newSize = [super sizeThatFits:size];
                newSize.height = JobsWidth(80); /// 设定你想要的高度
                return newSize;
            }
            default:
                return [super sizeThatFits:size];
                break;
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
#pragma mark —— 一些公共方法
-(CGFloat)customTabBarOffsetHeight{
    return self.viewModel.offsetHeight ? self.viewModel.offsetHeight : 0.f;
}
#pragma mark —— 一些私有方法
- (void)alignLabel:(UILabel *)label
         imageView:(UIImageView *)imageView
    inTabBarButton:(UIView *)tabBarButton
           spacing:(CGFloat)spacing{
    CGFloat totalWidth = tabBarButton.bounds.size.width;
    CGFloat totalHeight = tabBarButton.bounds.size.height;
    
    CGFloat labelWidth = label.bounds.size.width;
    CGFloat labelHeight = label.bounds.size.height;
    
    CGFloat imageWidth = imageView.bounds.size.width;
    CGFloat imageHeight = imageView.bounds.size.height;
    
    switch (self.alignmentType) {
        case ImageLeftTitleRight: {
            CGFloat totalContentWidth = imageWidth + spacing + labelWidth;
            CGFloat startingX = (totalWidth - totalContentWidth) / 2.0;
            CGFloat centerY = totalHeight / 2.0;
            
            imageView.frame = CGRectMake(startingX,
                                         centerY - imageHeight / 2.0,
                                         imageWidth,
                                         imageHeight);
            label.frame = CGRectMake(CGRectGetMaxX(imageView.frame) + spacing,
                                     centerY - labelHeight / 2.0,
                                     labelWidth,
                                     labelHeight);
            label.textAlignment = NSTextAlignmentLeft;
            break;
        }
        case ImageRightTitleLeft: {
            CGFloat totalContentWidth = labelWidth + spacing + imageWidth;
            CGFloat startingX = (totalWidth - totalContentWidth) / 2.0;
            label.frame = CGRectMake(startingX,
                                     (totalHeight - labelHeight) / 2.0,
                                     labelWidth,
                                     labelHeight);
            imageView.frame = CGRectMake(CGRectGetMaxX(label.frame) + spacing,
                                         (totalHeight - imageHeight) / 2.0,
                                         imageWidth,
                                         imageHeight);
            label.textAlignment = NSTextAlignmentRight;
            break;
        }
        case ImageTopTitleBottom: {
            CGFloat totalContentHeight = imageHeight + spacing + labelHeight;
            CGFloat startingY = (totalHeight - totalContentHeight) / 2.0;
            imageView.frame = CGRectMake((totalWidth - imageWidth) / 2.0,
                                         startingY,
                                         imageWidth,
                                         imageHeight);
            label.frame = CGRectMake((totalWidth - labelWidth) / 2.0,
                                     CGRectGetMaxY(imageView.frame) + spacing,
                                     labelWidth,
                                     labelHeight);
            if(labelHeight >= labelWidth){
                label.resetWidth(labelHeight);
                label.resetHeight(labelWidth);
            }
//            label.jobsLogFrame(@"打印的时候额外添加的标识字符.Frame");
//            label.jobsLogPoint(@"打印的时候额外添加的标识字符.Point");
            label.jobsLogSize(@"打印的时候额外添加的标识字符.Size");
            label.textAlignment = NSTextAlignmentCenter;
            break;
        }
        case ImageBottomTitleTop: {
            CGFloat totalContentHeight = labelHeight + spacing + imageHeight;
            CGFloat startingY = (totalHeight - totalContentHeight) / 2.0;
            label.frame = CGRectMake((totalWidth - labelWidth) / 2.0,
                                     startingY,
                                     labelWidth,
                                     labelHeight);
            imageView.frame = CGRectMake((totalWidth - imageWidth) / 2.0,
                                         CGRectGetMaxY(label.frame) + spacing,
                                         imageWidth,
                                         imageHeight);
            label.textAlignment = NSTextAlignmentCenter;
            break;
        }
    }
}

//-(UIView *)hitTest:(CGPoint)point
//         withEvent:(UIEvent *)event{
//
//}
#pragma mark —— LazyLoad

@end
