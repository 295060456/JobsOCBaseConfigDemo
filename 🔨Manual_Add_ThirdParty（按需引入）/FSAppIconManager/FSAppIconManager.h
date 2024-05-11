//
//  FSAppIconManager.h
//  DynamicAppIconDemo
//
//  Created by zhangpeng on 2018/7/10.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSAppIconManager : NSObject

/**
 Returns the name of the icon currently in use.

 * If ``, the primary application icon is being used. Or the current system version is not supported.
 @return IconName
 */
+ (NSString *_Nullable)getCurrentAppIconName;

/**
 Check whether the current device supports changing icon

 @return result, YES or NO
 */
+ (BOOL)canChangeAppIcon;

/**
 Change the icon

 * Pass `nil` to use the primary application icon. The completion handler will be invoked asynchronously on an arbitrary background queue; be sure to dispatch back to the main queue before doing any further UI work.
 @param iconName iconName
 @param completionHandler error or nil
 */
+ (void)changeAppIconWithIconName:(NSString *_Nullable)iconName
                completionHandler:(nullable void (^)(NSError *_Nullable error))completionHandler NS_EXTENSION_UNAVAILABLE("Extensions may not have alternate icons");

@end

/* 用法
 
 - (IBAction)changeAppIcon:(id)sender {
     BOOL canChangeAppIcon = [FSAppIconManager canChangeAppIcon];
     NSLog(@"canChangeAppIcon value: %@", canChangeAppIcon?@"YES":@"NO");
     if (!canChangeAppIcon) {
         return;
     }
     [FSAppIconManager changeAppIconWithIconName:@"male" completionHandler:^(NSError * _Nullable error) {
         NSLog(@"error: %@", error);
     }];
 }

 
 */
