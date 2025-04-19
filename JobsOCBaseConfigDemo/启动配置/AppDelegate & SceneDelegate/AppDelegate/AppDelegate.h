//
//  AppDelegate.h
//  Casino
//
//  Created by Jobs on 2021/11/16.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "BaseProtocol.h"

#import "JobsTabBarVC.h"
#import "JobsCustomTabBarConfig.h"
#import "LZTabBarController.h"

#import "Other.h"
@import UserNotifications;/// 配置本地通知

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
/// 一个iOS应用程序App的生命周期里面，只有一个AppDelegate实例存在
/// 但是可能有多个SceneDelegate实例存在
@interface AppDelegate : UIResponder
<
UIApplicationDelegate,
UNUserNotificationCenterDelegate,
BaseProtocol
>
/// UI
Prop_strong()UIWindow *window;/// 仅仅为了iOS 13 版本向下兼容而存在
/// Data
@property(readonly,strong)NSPersistentCloudKitContainer *persistentContainer;
Prop_assign()BOOL allowOrentitaionRotation;

-(void)saveContext;

@end

#pragma clang diagnostic pop
