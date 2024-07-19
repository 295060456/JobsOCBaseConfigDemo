//
//  JobsAppTools.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JobsBlock.h"
/// 单例工具箱
#ifndef JobsAppTool
#define JobsAppTool JobsAppTools.sharedManager
#endif /* JobsAppTool */
/// 屏幕方向
#ifndef DeviceOrientation_typedef
#define DeviceOrientation_typedef
typedef NS_ENUM(NSInteger, DeviceOrientation) {
  DeviceOrientationUnknown, /// 未知方向
  DeviceOrientationPortrait,/// 竖屏
  DeviceOrientationLandscape /// 横屏
};
#endif /* DeviceOrientation_typedef */
/// 根控制器
#ifndef ROOT_VIEW_CONTROLLER_H
#define ROOT_VIEW_CONTROLLER_H
//#define RootViewController AppDelegate.tabBarNavCtrl
//#define RootViewController AppDelegate.tabBarVC
//
#define RootViewController AppDelegate.jobsCustomTabBarNavCtrl
//#define RootViewController AppDelegate.jobsCustomTabBarVC
//
//#define RootViewController AppDelegate.lZTabBarNavCtrl
//#define RootViewController AppDelegate.lZTabBarCtrl
#endif // ROOT_VIEW_CONTROLLER_H

NS_ASSUME_NONNULL_BEGIN
/// 本类结合 NSObject+AppTools 是对整个App作用于全局的工具箱🧰
@interface JobsAppTools : NSObject
#pragma mark —— 屏幕方向
#warning 以下属性，如果用分类集成，即写在NSObject层，可能出现存取值异常
@property(nonatomic,assign)UIInterfaceOrientationMask currentInterfaceOrientationMask;/// 定义应用程序支持的方向
@property(nonatomic,assign)UIInterfaceOrientation currentInterfaceOrientation;/// 描述界面当前的方向，用于确定应用界面是如何显示的
@property(nonatomic,assign)UIDeviceOrientation currentDeviceOrientation;/// 描述设备本身的物理方向，即设备如何被用户持握
@property(nonatomic,assign)DeviceOrientation jobsDeviceOrientation;/// 自定义枚举，直接输出横竖屏判定

+ (instancetype)sharedManager;
+ (void)destroyInstance;
/// 仅仅为了iOS 13 版本向下兼容而存在
-(UIWindow *)makeAppDelegateWindow;
-(UIWindow *)makeSceneDelegateWindow;
-(void)appDelegateWindowBlock:(jobsByWindowBlock _Nullable)appDelegateWindowBlock
     sceneDelegateWindowBlock:(jobsByWindowBlock _Nullable)sceneDelegateWindowBlock;

@end

NS_ASSUME_NONNULL_END
