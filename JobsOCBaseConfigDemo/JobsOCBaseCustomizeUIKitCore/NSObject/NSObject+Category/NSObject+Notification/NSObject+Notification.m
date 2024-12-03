//
//  NSObject+Notification.m
//  Casino
//
//  Created by Jobs on 2021/12/7.
//

#import "NSObject+Notification.h"

@implementation NSObject (Notification)
/// 在主线程上带参发通知
-(jobsByKey_ValueBlock _Nonnull)JobsPost{
    return ^(NSString *_Nonnull key,id _Nullable value){
        dispatch_async(dispatch_get_main_queue(), ^{
            key.postNotificationBy(value);
        });
    };
}
/// 在主线程上带参发通知
-(jobsByKeyValueModelBlock _Nonnull)JobsPostBy{
    return ^(JobsKeyValueModel *_Nullable data){
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *key = (NSString *)data.key;
            key.postNotificationBy(data.value);
        });
    };
}
/// 在主线程上不带参发通知
-(jobsByStringBlock _Nonnull)jobsPost{
    return ^(NSString *_Nonnull key){
        dispatch_async(dispatch_get_main_queue(), ^{
            key.postNotificationBy(nil);
        });
    };
}
/// 接收通知
-(void)addNotificationName:(NSString *_Nonnull)notificationName
                     block:(JobsSelectorBlock _Nullable)block{
    @jobs_weakify(self)
    [JobsNotificationCenter addObserver:self
                               selector:selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                                     id _Nullable arg) {
        @jobs_strongify(self)
        if (block) block(self, arg);
        return nil;
    }, MethodName(self), self) name:notificationName object:nil];
}
/// RAC接收通知
-(void)addNotificationName:(NSString *_Nonnull)notificationName
         notificationBlock:(jobsByNotificationBlock _Nullable)block{
    [[JobsNotificationCenter rac_addObserverForName:notificationName object:nil]
     subscribeNext:^(NSNotification *_Nullable x) {
        if (block) block(x);
    }];
}
///【监听所有通知】用 selector
-(void)monitorNotification:(nonnull NSString *)notificationName
              withSelector:(nonnull SEL)selector{
    if (isNull(notificationName)) return;
    JobsAddNotification(self,
                    @selector(selector),
                    notificationName,
                    nil);
}
///【监听所有通知】用 Block
-(void)monitorNotification:(nonnull NSString *)notificationName
                 withBlock:(nonnull JobsReturnIDBySelectorBlock)actionBlock{
    if (isNull(notificationName)) return;
    [self addNotificationName:notificationName
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        NSNotification *notification = (NSNotification *)arg;
        NSLog(@"通知传递过来的 = %@",notification.object);
        if(actionBlock) actionBlock(weakSelf,arg);
    }];
}
///【监听通知】设置App语言环境
-(void)monitorAppLanguage{
    [self monitorNotification:语言切换
                    withBlock:^id _Nullable(id  _Nullable weakSelf,
                                            id  _Nullable arg) {
        return nil;
    }];
}
///【发通知】设置App语言环境
-(void)setAppLanguageAtAppLanguage:(AppLanguage)appLanguage{
    [JobsLanguageManager setLanguage:appLanguage];
    /// 发通知，通知需要更改的地方进行修改
    JobsPostNotificationOnMainThread(语言切换,
                                     @(appLanguage),
                                     nil);
}

@end
