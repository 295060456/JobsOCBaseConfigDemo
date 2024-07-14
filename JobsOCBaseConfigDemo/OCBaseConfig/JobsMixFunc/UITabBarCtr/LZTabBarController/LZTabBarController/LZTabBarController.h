//
//  LZTabBarController.h
//  LZTabBarController
//
//  Created by Artron_LQQ on 2016/12/12.
//  Copyright © 2016年 Artup. All rights reserved.
//
/*
 底部tabBar自定义的tabBarController
 只需调用给出的类方法, 配置相关参数即可创建tabBarController实例对象
 
 */

#import <UIKit/UIKit.h>
#import "LZTabBarConfig.h"
#import "LZTabBar.h"

typedef LZTabBarConfig*(^tabBarBlock)(LZTabBarConfig *config);

@interface LZTabBarController : UITabBarController<LZTabBarDelegate>
/// 是否可用自动旋转屏幕
@property (nonatomic, assign)BOOL isAutoRotation;
/// 创建tabBarController
+(instancetype)createTabBarController:(tabBarBlock)block;
/// 获取当前的tabBarController实例, 实例创建后可通过此方法获取当前实例
+(instancetype)defaultTabBarController;
/// 隐藏底部tabBar的方法
-(void)hiddenTabBarWithAnimation:(BOOL)isAnimation;
/// 显示底部tabBar的方法
-(void)showTabBarWithAnimation:(BOOL)isAnimation;

@end




