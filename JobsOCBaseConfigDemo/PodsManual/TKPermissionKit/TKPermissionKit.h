//
//  TKPermissionKit.h
//  TKPermissionKitDemo
//
//  Created by mac on 2019/10/12.
//  Copyright © 2019 mac. All rights reserved.
//
/// https://github.com/RANSAA/TKPermissionKit
/**
 AppleTV:
 NSVideoSubscriberAccountUsageDescription 需要您的同意，才能访问AppleTV
 */
//! Project version number for TKPermissionKit.
FOUNDATION_EXPORT double TKPermissionKitVersionNumber;
//! Project version string for TKPermissionKit.
FOUNDATION_EXPORT const unsigned char TKPermissionKitVersionString[];

#ifndef TKPermissionKit_h
#define TKPermissionKit_h

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_10_0
typedef UNAuthorizationOptions TKPermissionUNAuthorizationOptions;
#else
typedef UIUserNotificationType TKPermissionUNAuthorizationOptions;
#endif

typedef void(^JobsEKEventStoreRequestAccessCompletionHandler)(BOOL granted,
                                                              EKEventStore *_Nullable eventStore,
                                                              NSError * _Nullable error);
typedef NS_ENUM(NSInteger, TKPhotoAccessLevel){
    TKPhotoAccessLevelReadWrite = 0,    //获取全部的相册读写权限   -> PHAccessLevelReadWrite
    TKPhotoAccessLevelOnlyAdd           //只获取向相册中添加权限   -> PHAccessLevelAddOnly
};

typedef void(^TKPermissionBlock)(BOOL isAuth);/// block认证回调
typedef void(^TKPermissionCustomMsgBlock)(NSString *_Nullable title,
                                          NSString *_Nullable msg,
                                          NSString *_Nullable left,
                                          NSString *_Nullable right);/// block自定义提示消息

#import "TKPermissionPublic.h"
#import "TKPermissionPhoto.h"
#import "TKPermissionCamera.h"
#import "TKPermissionMedia.h"
#import "TKPermissionMicrophone.h"
#import "TKPermissionLocationAlways.h"
#import "TKPermissionLocationWhen.h"
#import "TKPermissionBluetooth.h"
#import "TKPermissionSpeech.h"
#import "TKPermissionCalendar.h"
#import "TKPermissionReminder.h"
#import "TKPermissionContacts.h"
#import "TKPermissionNetWork.h"
#import "TKPermissionHealth.h"
#import "TKPermissionHome.h"
#import "TKPermissionMotion.h"
#import "TKPermissionNotification.h"
#import "TKPermissionFolders.h"
#import "TKPermissionTracking.h"
#import "TKPermissionSiri.h"

#endif /* TKPermissionKit_h */
