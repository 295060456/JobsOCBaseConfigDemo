//
//  NSObject+UNUserNotificationCenterDelegate.m
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import "NSObject+UNUserNotificationCenterDelegate.h"

@implementation NSObject (UNUserNotificationCenterDelegate)
#pragma mark —— 一些私有方法
-(jobsByNotificationResponseBlock _Nonnull)handleCalendarCategoryAction{
    return ^(UNNotificationResponse *_Nullable response){
        if (response.actionIdentifier.isEqualToString(@"markAsCompleted")) {
            return;
        } else if (response.actionIdentifier.isEqualToString(@"remindMeIn1Minute")) {
            // 1 Minute
            NSDate *newDate = [NSDate dateWithTimeIntervalSinceNow:60];
            self.scheduleNotificationAt(newDate);
            NSLog(@"1 Minute");
        } else if (response.actionIdentifier.isEqualToString(@"remindMeIn5Minutes")) {
            NSDate *newDate = [NSDate.alloc initWithTimeIntervalSinceNow:60 * 5];
            self.scheduleNotificationAt(newDate);
            NSLog(@"5 Minutes");
        }
    };
}

-(jobsByNotificationResponseBlock _Nonnull)handleCustomUICategory{
    return ^(UNNotificationResponse *_Nullable response){
        if (response.actionIdentifier.isEqualToString(@"stop")){
            return;
        } else if (response.actionIdentifier.isEqualToString(@"comment")){
            NSString *text = ((UNTextInputNotificationResponse *)response).userText;
            if (isValue(text)) {
                MainWindow.rootViewController.comingToPresentVC(self.makeAlertControllerByAlertModel(jobsMakeAlertModel(^(JobsAlertModel * _Nullable data) {
                    data.alertControllerTitle = JobsInternationalization(@"Comment");
                    data.message = JobsInternationalization(@"You just said")
                        .add(@":")
                        .add(JobsInternationalization(text));
                    data.preferredStyle = UIAlertControllerStyleAlert;
                    data.alertActionTitle = JobsInternationalization(@"OK");
                    data.alertActionStyle = UIAlertActionStyleDefault;
                    data.alertActionBlock = ^(__kindof UIAlertAction * _Nullable action) {
                        NSLog(@"OK");
                    };
            //        data.cancelAlertActionTitle = @"取消";
            //        data.cancelAlertActionStyle = UIAlertActionStyleCancel;
            //        data.cancelAlertActionBlock = ^(__kindof UIAlertAction * _Nullable action) {
            //            NSLog(@"Cancel");
            //        };
                })));
            }
        }else{}
    };
}

-(jobsByDateBlock _Nonnull)scheduleNotificationAt{
    return ^(NSDate *_Nullable date){
        NSCalendar *calendar = NSCalendar.initBy(NSCalendarIdentifierChinese);
        NSDateComponents *components = [calendar componentsInTimeZone:NSTimeZone.localTimeZone
                                                             fromDate:date];
        UNNotificationRequest.initBy(jobsMakeUNNotificationRequestModel(^(UNNotificationRequestModel * _Nullable data) {
            data.identifier = @"calendar";
            data.content = jobsMakeUNMutableNotificationContent(^(__kindof UNMutableNotificationContent * _Nullable content) {
                content.title = JobsInternationalization(@"Calendar Reminder");
                content.body = @"github.com/pro648";
                content.sound = UNNotificationSound.defaultSound;
                content.categoryIdentifier = JobsInternationalization(@"calendarCategory");
            });
            data.trigger = UNCalendarNotificationTrigger.initByNORepeats(jobsMakeDateComponents(^(NSDateComponents * _Nullable dateComponents) {
                dateComponents.calendar = calendar;
                dateComponents.timeZone = NSTimeZone.localTimeZone;
                dateComponents.month = components.month;
                dateComponents.day = components.day;
                dateComponents.hour = components.hour;
                dateComponents.minute = components.minute;
            }));
        })).notificationRequestCompletionHandlerBy(^(NSError * _Nullable error){
            if (error) {
                NSLog(@"Failed to add request to notification center. error:\(error)");
            }
        });
    };
}
#pragma mark —— UNUserNotificationCenterDelegate
// If your app is in the foreground when a notification arrives, the shared user notification center calls this method to deliver the notificaiton directly to your app.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(jobsByUNNotificationPresentationOptionsBlock)completionHandler {
    if (notification.request.identifier.isEqualToString(@"calendar")) {
        completionHandler(UNNotificationPresentationOptionNone);
    } else {
        completionHandler(UNNotificationPresentationOptionSound |
                          UNNotificationPresentationOptionList |
                          UNNotificationPresentationOptionBanner);
    }
}
// Use this method to process the user's response to a notification.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(jobsByVoidBlock)completionHandler {
    if (response.actionIdentifier.isEqualToString(UNNotificationDefaultActionIdentifier)) {
        NSLog(@"Default Action");
    } else if (response.actionIdentifier.isEqualToString(UNNotificationDismissActionIdentifier)) {
        NSLog(@"Dismiss Action");
    } else if (response.notification.request.content.categoryIdentifier.isEqualToString(@"calendarCategory")) {
        self.handleCalendarCategoryAction(response);
    } else if (response.notification.request.content.categoryIdentifier.isEqualToString(@"customUICategory")) {
        self.handleCustomUICategory(response);
    }else{}
    UIApplication.sharedApplication.applicationIconBadgeNumber = 0;
    if(completionHandler) completionHandler();
}

@end
