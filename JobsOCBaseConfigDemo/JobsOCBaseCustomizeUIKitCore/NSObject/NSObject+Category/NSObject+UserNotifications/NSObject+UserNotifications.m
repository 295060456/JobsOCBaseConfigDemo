//
//  NSObject+UserNotifications.m
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import "NSObject+UserNotifications.h"
/**
 1、无论设备处于锁定状态还是使用中，都可以使用通知提供及时、重要的信息。
    1.1、无论app处于foreground、background或suspended状态，都可以使用通知发送信息
 2、iOS 10 以前通知相关API在UIApplication或UIApplicationDelegate中。
    2.1、app在前台时，远程推送无法直接显示，需要先捕获远程通知，然后再发起一个本地通知才能完成显示。
    2.2、除此之外，app运行时和非运行时捕获通知的路径不同。
 3、iOS 10 将通知集中到UserNotifications.framework框架，绝大部分之前通知相关API都已被标记为弃用(deprecated)。
 4、系统会按照app指定的触发条件（如时间、位置）来传递通知。
    4.1、如果发送通知时，app处于background或suspend，系统会代替app与用户交互；
    4.2、如果app处于foreground，系统会将通知递交至app进行处理。
 5、可以从应用程序本地生成通知，也可以从服务器远程生成通知。
    5.1、对于本地通知，app会创建通知内容，并指定触发通知条件，如日期、倒计时或位置变化。
    5.2、远程通知(remote notifications，也称为推送通知push notifications)需要服务器生成，由Apple Push Notification service (简称APNs)发送到用户设备。
 6、远程通知的格式：
 {
    "aps":{
    "alert"："{
            "title":"I am title",
            "subtitle":"I am subtitle",
            "body":"I am body"
           },
    "sound":"default",
    "badge":1
        }
 }
 */
@implementation NSObject (UserNotifications)
/// 用户通知请求授权
-(UNUserNotificationCenter *)notificationCenter{
    UNUserNotificationCenter *userNotificationCenter = UNUserNotificationCenter.currentNotificationCenter;
    userNotificationCenter.delegate = self;
    // 请求授权
    /*
    UNAuthorizationOptionBadge   = (1 << 0),
    UNAuthorizationOptionSound   = (1 << 1),
    UNAuthorizationOptionAlert   = (1 << 2),
    UNAuthorizationOptionCarPlay = (1 << 3),
    */
    @jobs_weakify(self)
    [userNotificationCenter requestAuthorizationWithOptions:(UNAuthorizationOptionAlert +
                                                            UNAuthorizationOptionSound +
                                                            UNAuthorizationOptionBadge)
                                         completionHandler:^(BOOL granted,
                                                             NSError * _Nullable error) {
        @jobs_strongify(self)
        NSLog(@"granted = %d,error = %@",granted,error);
        [self registerForRemoteNotifications];
    }];

    [self registerNotificationCategory];
    // 获取通知授权和设置
    [self userNotificationCenter:userNotificationCenter authorizationStatusBlock:nil];
    return userNotificationCenter;
}
/// 获取通知授权和设置
-(void)userNotificationCenter:(UNUserNotificationCenter *_Nonnull)userNotificationCenter
     authorizationStatusBlock:(jobsByIDBlock _Nullable)authorizationStatusBlock{
    if (!userNotificationCenter) {
        userNotificationCenter = self.notificationCenter;
    }
    [userNotificationCenter getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        NSLog(@"settings = %@",settings);
        /*
        UNAuthorizationStatusNotDetermined : 没有做出选择
        UNAuthorizationStatusDenied : 用户未授权
        UNAuthorizationStatusAuthorized ：用户已授权
        */
        if (settings.authorizationStatus == UNAuthorizationStatusNotDetermined){
            NSLog(@"未选择");
        }else if (settings.authorizationStatus == UNAuthorizationStatusDenied){
            NSLog(@"未授权");
        }else if (settings.authorizationStatus == UNAuthorizationStatusAuthorized){
            NSLog(@"已授权");
        }else if (settings.authorizationStatus == UNAuthorizationStatusProvisional){
            NSLog(@"???");
        }else if (settings.authorizationStatus == UNAuthorizationStatusEphemeral){
            NSLog(@"???");
        }else{}
        if (authorizationStatusBlock) authorizationStatusBlock(@(settings.authorizationStatus));
    }];
}
/// Register for push notification.
-(void)registerForRemoteNotifications{
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIApplication.sharedApplication registerForRemoteNotifications];
    });
}
/// 初始化一个本地通知
-(UNMutableNotificationContent *)userNotificationInit{
    // 创建一个距离现在时间 多久之后的触发的本地通知
    UNMutableNotificationContent *notificationContent = UNMutableNotificationContent.new;
    // 主标题
    notificationContent.title = [NSString localizedUserNotificationStringForKey:@"Jobs" arguments:nil];
    // 副标题
    notificationContent.subtitle = [NSString localizedUserNotificationStringForKey:@"很优秀" arguments:nil];
    notificationContent.badge = [NSNumber numberWithInteger:2];
    notificationContent.body = [NSString localizedUserNotificationStringForKey:@"那是非常OK" arguments:nil];
    notificationContent.sound = UNNotificationSound.defaultSound;
    // 设置通知附件内容
//    notificationContent.attachments = @[[self notificationAttachmentInitByPath:@"这里写路径地址"]];
    notificationContent.launchImageName = @"大雨";
    return notificationContent;
}
/// 设置通知附件内容
/// 注意：URL必须是一个有效的文件路径，不然会报错
-(UNNotificationAttachment *)notificationAttachmentInitByPath:(NSString *)path{
    NSError *error = nil;
    UNNotificationAttachment *notificationAttachment = [UNNotificationAttachment attachmentWithIdentifier:@"att1"
                                                                                                      URL:path.jobsUrl
                                                                                                  options:@{@"UNNotificationAttachmentOptionsTypeHintKey":UTTypeImage}
                                                                                                    error:&error];
    if (error) {
        NSLog(@"attachment error %@", error);
    }return notificationAttachment;
}
/// 触发模式
-(UNTimeIntervalNotificationTrigger *)notificationTriggerWithTimeInterval:(NSTimeInterval)timeInterval
                                                                  repeats:(BOOL)repeats{
    /**
        UNNotificationTrigger的子类👇🏻
        UNPushNotificationTrigger : （远程通知触发）一般我们不会使用的
        UNTimeIntervalNotificationTrigger ：一定时间后触发
        UNCalendarNotificationTrigger ： 在某月某日某时触发
        UNLocationNotificationTrigger ： 在用户进入或是离开某个区域时触发
     
        【 iOS 10之前 】的重复设置是repeatInterval 属性,可以按年、月、日、星期等规律设置重复时间，例如：
        NSCalendarUnitWeekday
        NSCalendarUnitWeekOfMonth
        NSCalendarUnitDay
        NSCalendarUnitMonth

        【 iOS 10之后 】repeatInterval设置，例如：
        triggerWithRegion:repeats:
        triggerWithTimeInterval:repeats:
        triggerWithDateMatchingComponents:repeats:
     */
    UNTimeIntervalNotificationTrigger *notificationTrigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:timeInterval ? : 10 // 设置触发时间
                                                                                                                repeats:repeats]; // 是否重复
    return notificationTrigger;
}
/// 创建一个发送请求
-(UNNotificationRequest *)notificationRequestInitWithIdentifier:(NSString *_Nullable)identifier
                                                        content:(UNMutableNotificationContent *_Nullable)notificationContent
                                                        trigger:(UNTimeIntervalNotificationTrigger *_Nullable)notificationTrigger{
    if (!notificationTrigger) {
        notificationTrigger = [self notificationTriggerWithTimeInterval:10 repeats:NO];
    }
    
    if ([NSString isNullString:identifier]) {
        identifier = @"my_notification";
    }
    
    if (!notificationContent) {
        notificationContent = self.userNotificationInit;
    }
    
    UNNotificationRequest *notificationRequest = [UNNotificationRequest requestWithIdentifier:identifier
                                                                                      content:notificationContent
                                                                                      trigger:notificationTrigger];
    return notificationRequest;
}
/// 将通知请求添加到通知中心
-(void)notificationCenter:(UNUserNotificationCenter *_Nullable)notificationCenter
   addNotificationRequest:(UNNotificationRequest *_Nullable)notificationRequest
           withIdentifier:(NSString *_Nullable)identifier{

    if (!notificationCenter) {
        notificationCenter = self.notificationCenter;
    }
    
    if ([NSString isNullString:identifier]) {
        identifier = @"my_notification";
    }
    
    if (!notificationRequest) {
        notificationRequest = [self notificationRequestInitWithIdentifier:identifier
                                                                  content:self.userNotificationInit
                                                                  trigger:[self notificationTriggerWithTimeInterval:3 repeats:NO]];
    }
    
    [notificationCenter addNotificationRequest:notificationRequest
                         withCompletionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"error = %@",error.description);
        }
    }];
}

- (void)registerNotificationCategory {
    // calendarCategory
    UNNotificationAction *completeAction = [UNNotificationAction actionWithIdentifier:@"markAsCompleted"
                                                                                title:JobsInternationalization(@"Mark as Completed")
                                                                              options:UNNotificationActionOptionNone];
    UNNotificationAction *remindMeIn1MinuteAction = [UNNotificationAction actionWithIdentifier:@"remindMeIn1Minute"
                                                                                         title:JobsInternationalization(@"Remind me in 1 Minute")
                                                                                       options:UNNotificationActionOptionNone];
    UNNotificationAction *remindMeIn5MinuteAction = [UNNotificationAction actionWithIdentifier:@"remindMeIn5Minute"
                                                                                         title:JobsInternationalization(@"Remind me in 5 Minutes")
                                                                                       options:UNNotificationActionOptionNone];
    UNNotificationCategory *calendarCategory = [UNNotificationCategory categoryWithIdentifier:@"calendarCategory"
                                                                                      actions:@[completeAction, remindMeIn1MinuteAction, remindMeIn5MinuteAction]
                                                                            intentIdentifiers:@[]
                                                                                      options:UNNotificationCategoryOptionCustomDismissAction];
    
    // customUICategory
    UNNotificationAction *nextAction = [UNNotificationAction actionWithIdentifier:@"stop"
                                                                            title:JobsInternationalization(@"Stop")
                                                                          options:UNNotificationActionOptionForeground];
    UNNotificationAction *commentAction = [UNTextInputNotificationAction actionWithIdentifier:@"comment"
                                                                                        title:JobsInternationalization(@"Comment")
                                                                                      options:UNNotificationActionOptionForeground
                                                                         textInputButtonTitle:JobsInternationalization(@"Send")
                                                                         textInputPlaceholder:JobsInternationalization(@"Say something")];
    UNNotificationCategory *customUICategory = [UNNotificationCategory categoryWithIdentifier:@"customUICategory"
                                                                                      actions:@[nextAction, commentAction]
                                                                            intentIdentifiers:@[]
                                                                                      options:UNNotificationCategoryOptionCustomDismissAction];
    
    [UNUserNotificationCenter.currentNotificationCenter setNotificationCategories:[NSSet setWithObjects:calendarCategory, customUICategory, nil]];
}
/// 本地通知的相关管理
-(void)userNotificationManager:(UNUserNotificationCenter *_Nullable)userNotificationCenter{
//    - 移除还未展示的通知
//       [userNotificationCenter removePendingNotificationRequestsWithIdentifiers: @[@“my_notification”
//   ]];
//       [userNotificationCenter removeAllPendingNotificationRequests]; //  - (void)cancelAllLocalNotifications；
//    - 移除已经展示过的通知
//       [userNotificationCenter removeDeliveredNotificationsWithIdentifiers:@[@“my_notification”
//   ]];
//       [userNotificationCenter removeAllDeliveredNotifications];
//       - 获取未展示的通知
//   [userNotificationCenter getPendingNotificationRequestsWithCompletionHandler:^(NSArray<UNNotificationRequest *> * _Nonnull requests) {
//           NSLog(@"%@",requests);
//   }];
//    - 获取展示过的通知
//   [userNotificationCenter getDeliveredNotificationsWithCompletionHandler:^(NSArray<UNNotification *> * _Nonnull notifications) {
//          NSLog(@"%@",notifications);
//       }];
}

@end
