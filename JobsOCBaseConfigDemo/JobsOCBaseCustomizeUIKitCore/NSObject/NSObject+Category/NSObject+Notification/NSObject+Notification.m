//
//  NSObject+Notification.m
//  Casino
//
//  Created by Jobs on 2021/12/7.
//

#import "NSObject+Notification.h"

@implementation NSObject (Notification)
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
    @jobs_weakify(self)
    [self addNotificationName:notificationName
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        @jobs_strongify(self)
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
