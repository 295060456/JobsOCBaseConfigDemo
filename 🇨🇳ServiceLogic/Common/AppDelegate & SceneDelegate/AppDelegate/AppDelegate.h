//
//  AppDelegate.h
//  Casino
//
//  Created by Jobs on 2021/11/16.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "JobsTabbarVC.h"
#import "Other.h"
@import UserNotifications;/// 配置本地通知

#define RootViewController appDelegate.tabBarVC

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

-(NSMutableArray <JobsTabBarControllerConfig *>*)makeConfigMutArr;
-(void)saveContext;

@end

#pragma clang diagnostic pop
