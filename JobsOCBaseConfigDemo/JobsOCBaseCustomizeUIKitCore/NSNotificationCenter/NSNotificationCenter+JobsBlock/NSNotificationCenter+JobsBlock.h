//
//  NSNotificationCenter+JobsBlock.h
//  JobsOCBaseConfig
//
//  Created by Jobs Hi on 9/24/23.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "MacroDef_Notification.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (JobsBlock)

@property(nonatomic,copy)jobsByNotificationBlock jobsNotificationBlock;

-(jobsByIDBlock)remove;
-(jobsByKey_ValueBlock)Remove;

@end

NS_ASSUME_NONNULL_END
/**
 使用方法 1：
 [JobsNotificationCenter addObserverForName:GSUploadAndDownloadNetworkSpeedNotificationKey
                               object:nil
                               queue:nil
                            usingBlock:^(NSNotification * _Nonnull notification) {
     NSString *d = notification.name;
     NSLog(@"");
 }];
 =================================================================================================
 或者，使用方法 2：
 JobsNotificationCenter.jobsNotificationBlock = ^(NSNotification * _Nonnull notification) {
     NSString *d = notification.name;
     NSLog(@"");
 };

 // 添加观察者监听通知
 [JobsNotificationCenter addObserverForName:GSUploadAndDownloadNetworkSpeedNotificationKey
                               object:nil
                               queue:nil
                            usingBlock:JobsNotificationCenter.jobsNotificationBlock];
 =================================================================================================
 或者，使用方法 3：
 [JobsNotificationCenter addObserver:self
                       selector:[self selectorBlocks:^id _Nullable(id _Nullable weakSelf, id _Nullable arg) {
     /// upload
     NSLog(@"");
     return nil;
 } selectorName:nil target:self]
                         name:GSUploadNetworkSpeedNotificationKey
                         object:nil];
 
 */
