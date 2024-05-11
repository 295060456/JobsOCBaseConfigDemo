//
//  AppDelegate+Func.h
//  UBallLive
//
//  Created by Jobs on 2020/10/11.
//

#import "AppDelegate.h"
#import "SceneDelegate.h"
#import "MacroDef_Func.h"
#import "NSObject+UserInfo.h"

#if __has_include(<Reachability/Reachability.h>)
#import <Reachability/Reachability.h>
#else
#import "Reachability.h"//检查联网情况
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

#if __has_include(<TFPopup/TFPopup.h>)
#import <TFPopup/TFPopup.h>
#else
#import "TFPopup.h"
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

#pragma mark —— 启动调用功能
+(void)launchFunc1;
-(void)launchFunc2;
#pragma mark —— 欢迎引导页面
-(void)guide;
#pragma mark —— 存取用户信息Demo
-(void)saveAndReadUserInfoDemo;
#pragma mark —— 读取Plist配置文件
-(void)readPlistConfig;
#pragma mark —— 全局配置 TABAnimated
-(void)makeTABAnimatedConfigure;
#pragma mark —— 全局配置键盘
-(void)makeIQKeyboardManagerConfigure;
#pragma mark —— 全局配置GKNavigationBar
-(void)makeGKNavigationBarConfigure;
#pragma mark —— 网络环境监测
-(void)makeReachabilityConfigure;
#pragma mark —— 开屏广告
-(void)makeXHLaunchAdConfigure;

@end

NS_ASSUME_NONNULL_END
