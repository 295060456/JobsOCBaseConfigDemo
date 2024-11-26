//
//  AppDelegate+Func.h
//  UBallLive
//
//  Created by Jobs on 2020/10/11.
//

#import "AppDelegate.h"
//#import "SceneDelegate.h"
#import "MacroDef_Func.h"
#import "NSObject+UserInfo.h"
#import "JobsBlock.h"
#import "JobsNavBarConfig.h"
#import "NSObject+UNUserNotificationCenterDelegate.h"
/// 检查联网情况
#if __has_include(<Reachability/Reachability.h>)
#import <Reachability/Reachability.h>
#else
#import "Reachability.h"
#endif

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
#endif

#if __has_include(<IQKeyboardManager/IQKeyboardManager.h>)
#import <IQKeyboardManager/IQKeyboardManager.h>
#else
#import "IQKeyboardManager.h"
#endif

#if __has_include(<TABAnimated/TABAnimated.h>)
#import <TABAnimated/TABAnimated.h>
#else
#import "TABAnimated.h"
#endif

#import "JobsWelcomeVC.h"

#if DEBUG

//#if __has_include(<DoraemonManager/DoraemonManager.h>)
//#import <DoraemonKit/DoraemonManager.h>
//#else
//#import "DoraemonManager.h"
//#endif

#endif

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (Func)
<
UNUserNotificationCenterDelegate
>
#pragma mark —— 启动调用功能
+(jobsByVoidBlock _Nonnull)launchFunc1;
-(jobsByVoidBlock _Nonnull)launchFunc2;
#pragma mark —— 开屏广告
-(jobsByVoidBlock _Nonnull)makeJobsLaunchAdConfig;
#pragma mark —— YTKNetworkConfig
-(jobsByVoidBlock _Nonnull)YTKNetworkConfig;
#pragma mark —— 欢迎引导页面
-(jobsByVoidBlock _Nonnull)guide;
#pragma mark —— 存取用户信息Demo
-(jobsByVoidBlock _Nonnull)saveAndReadUserInfoDemo;
#pragma mark —— 读取Plist配置文件
-(jobsByVoidBlock _Nonnull)readPlistConfig;
#pragma mark —— 全局配置 TABAnimated
-(jobsByVoidBlock _Nonnull)makeTABAnimatedConfig;
#pragma mark —— 全局配置键盘
-(jobsByVoidBlock _Nonnull)makeIQKeyboardManagerConfig;
#pragma mark —— 全局配置GKNavigationBar
-(jobsByVoidBlock _Nonnull)makeGKNavigationBarConfig;
#pragma mark —— 本地推送通知
-(jobsByVoidBlock _Nonnull)localNotifications;
#pragma mark —— 网络环境监测
-(jobsByVoidBlock _Nonnull)makeReachabilityConfig;

@end

NS_ASSUME_NONNULL_END
