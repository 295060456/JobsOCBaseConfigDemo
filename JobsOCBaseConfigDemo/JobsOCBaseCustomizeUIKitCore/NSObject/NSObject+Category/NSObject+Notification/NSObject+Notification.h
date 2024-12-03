//
//  NSObject+Notification.h
//  Casino
//
//  Created by Jobs on 2021/12/7.
//

#import <Foundation/Foundation.h>
#import "JobsLanguageManager.h"
#import "BaseProtocol.h"
#import "JobsBlock.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 一些需要全局化的通知
@interface NSObject (Notification)<BaseProtocol>
/// 在主线程上带参发通知
-(jobsByKey_ValueBlock _Nonnull)JobsPost;
/// 在主线程上带参发通知
-(jobsByKeyValueModelBlock _Nonnull)JobsPostBy;
/// 在主线程上不带参发通知
-(jobsByStringBlock _Nonnull)jobsPost;
/// 接收通知
-(void)addNotificationName:(NSString *_Nonnull)notificationName
                     block:(JobsSelectorBlock _Nullable)block;
/// RAC接收通知
-(void)addNotificationName:(NSString *_Nonnull)notificationName
         notificationBlock:(jobsByNotificationBlock _Nullable)block;

@end

NS_ASSUME_NONNULL_END
