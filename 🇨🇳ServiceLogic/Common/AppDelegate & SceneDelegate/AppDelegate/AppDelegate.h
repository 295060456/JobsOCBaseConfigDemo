//
//  AppDelegate.h
//  Casino
//
//  Created by Jobs on 2021/11/16.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "JobsTabbarVC.h"
#import "JobsCustomTabBarConfig.h"
#import "Other.h"
@import UserNotifications;/// 配置本地通知

#ifndef ROOT_VIEW_CONTROLLER_H
#define ROOT_VIEW_CONTROLLER_H
//#define RootViewController appDelegate.tabBarVC
#define RootViewController appDelegate.customTabBarVC
#endif // ROOT_VIEW_CONTROLLER_H

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
/// AppDelegate *appDelegate = (AppDelegate *)getSysAppDelegate();
@interface AppDelegate : UIResponder
<
UIApplicationDelegate
,UNUserNotificationCenterDelegate
>
/// UI
@property(nonatomic,strong)UIWindow *window;/// 仅仅为了iOS 13 版本向下兼容而存在
/// Data
@property(readonly,strong)NSPersistentCloudKitContainer *persistentContainer;
@property(nonatomic,assign)BOOL allowOrentitaionRotation;

#pragma mark —— 配置数据源
+(NSMutableArray <UIButton *>*)makeTabBarItems;
+(JobsCustomTabBarConfig *)makeJobsCustomTabBarConfig;
+(NSMutableArray <UIViewController *>*)makeViewControllerMutArr;
+(NSMutableArray <NSString *>*)makeTabBarItemTitleMutArr;
+(NSMutableArray <UIImage *>*)makeImageSelectedMutArr;
+(NSMutableArray <UIImage *>*)makeImageUnselectedMutArr;
+(NSMutableArray <UIViewController *>*)makeUIViewControllerMutArr;
+(NSMutableArray <JobsTabBarCtrlConfig *>*)makeConfigMutArr;

-(void)saveContext;

@end

#pragma clang diagnostic pop
