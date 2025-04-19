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

Prop_copy()jobsByNotificationBlock jobsNotificationBlock;

-(jobsByIDBlock _Nonnull)remove;
-(jobsByKey_ValueBlock _Nonnull)Remove;

@end

NS_ASSUME_NONNULL_END
/**
 使用方法 1：
 [JobsNotificationCenter addObserverForName:GSUploadAndDownloadNetworkSpeedNotificationKey
                                     object:nil
                                      queue:nil
                                 usingBlock:^(NSNotification * _Nonnull notification) {
        NSString *d = notification.name;
        JobsLog(@"");
 }];
 =================================================================================================
 或者，使用方法 2：
 JobsNotificationCenter.jobsNotificationBlock = ^(NSNotification * _Nonnull notification) {
     NSString *d = notification.name;
     JobsLog(@"");
 };

 // 添加观察者监听通知
 [JobsNotificationCenter addObserverForName:GSUploadAndDownloadNetworkSpeedNotificationKey
                                     object:nil
                                      queue:nil
                                 usingBlock:JobsNotificationCenter.jobsNotificationBlock];
 =================================================================================================
 或者，使用方法 3：
 [JobsNotificationCenter addObserver:self
                            selector:selectorBlocks(^id _Nullable(id  _Nullable weakSelf,
                                                             id  _Nullable arg) {
        JobsLog(@"SSSS加载新的数据，参数: %@", arg);
        /// 在需要结束刷新的时候调用（只能调用一次）
        /// _collectionView.endRefreshing(YES);
        return nil;
    }, MethodName(self), self)
                                name:GSUploadNetworkSpeedNotificationKey
                              object:nil];
 
 */
