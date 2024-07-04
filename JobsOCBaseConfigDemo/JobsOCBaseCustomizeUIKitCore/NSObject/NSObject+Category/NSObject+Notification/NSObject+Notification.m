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
    if ([NSString isNullString:notificationName]) {
        return;
    }
    JobsAddNotification(self,
                    @selector(selector),
                    notificationName,
                    nil);
}
///【监听所有通知】用 Block
-(void)monitorNotification:(nonnull NSString *)notificationName
                 withBlock:(nonnull JobsReturnIDBySelectorBlock)actionBlock{
    if ([NSString isNullString:notificationName]) {
        return;
    }
    @jobs_weakify(self)
    JobsAddNotification(self,
                    selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                              id _Nullable arg){
        NSNotification *notification = (NSNotification *)arg;
        @jobs_strongify(self)
        NSLog(@"通知传递过来的 = %@",notification.object);
        if(actionBlock){
            actionBlock(weakSelf,arg);
        }return nil;
    },nil, self),notificationName,nil);
}
///【监听通知】设置App语言环境
-(void)monitorAppLanguage{
    [self monitorNotification:LanguageSwitchNotification
                    withBlock:^id _Nullable(id  _Nullable weakSelf,
                                            id  _Nullable arg) {
        return nil;
    }];
}
///【发通知】设置App语言环境
-(void)setAppLanguageAtIndex:(NSInteger)index
          byNotificationName:(nullable NSString *)NotificationName{
    [self setAppLanguageAtAppLanguage:index
                   byNotificationName:NotificationName];
    /// 发通知，通知需要更改的地方进行修改
    JobsPostNotificationOnMainThread(LanguageSwitchNotification,
                                     @(CLLanguageManager.appLanguage),
                                     nil);
}
///【发通知】设置App语言环境
-(void)setAppLanguageAtAppLanguage:(AppLanguage)appLanguage
          byNotificationName:(nullable NSString *)NotificationName{
    switch (appLanguage) {
        case AppLanguageBySys:{
            [CLLanguageManager resetSystemLanguage];
        }break;
        case AppLanguageChineseSimplified:{
            [CLLanguageManager setAppLanguage:AppLanguageChineseSimplified];
        }break;
        case AppLanguageChineseTraditional:{
            [CLLanguageManager setAppLanguage:AppLanguageChineseTraditional];
        }break;
        case AppLanguageEnglish:{
            [CLLanguageManager setAppLanguage:AppLanguageEnglish];
        }break;
        case AppLanguageTagalog:{
            [CLLanguageManager setAppLanguage:AppLanguageTagalog];
        }break;
            
        default:
            break;
    }
    /// 发通知，通知需要更改的地方进行修改
    JobsPostNotificationOnMainThread(LanguageSwitchNotification,
                                     @(CLLanguageManager.appLanguage),
                                     nil);
}

@end
