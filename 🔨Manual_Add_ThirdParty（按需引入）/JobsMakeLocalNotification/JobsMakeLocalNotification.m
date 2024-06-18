//
//  JobsMakeLocalNotification.m
//  JobsOCBaseConfig
//
//  Created by admin on 5/26/24.
//

#import "JobsMakeLocalNotification.h"

@interface JobsMakeLocalNotification ()

@end

@implementation JobsMakeLocalNotification

- (void)triggerLocalNotification:(JobsLocalNotificationModel *)localNotificationModel{
    UNUserNotificationCenter *center = UNUserNotificationCenter.currentNotificationCenter;
    UNMutableNotificationContent *content = UNMutableNotificationContent.new;
    content.title = localNotificationModel.title;
    content.body = localNotificationModel.body;
    content.sound = localNotificationModel.sound;
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:localNotificationModel.triggerWithTimeInterval
                                                                                                    repeats:localNotificationModel.repeats];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:localNotificationModel.identifier
                                                                          content:content
                                                                          trigger:trigger];
    [center addNotificationRequest:request
             withCompletionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error adding notification: %@", error);
        } else {
            NSLog(@"Notification scheduled.");
        }
    }];
}

@end

@implementation JobsLocalNotificationModel

-(NSString *)identifier{
    if (!_identifier) {
        _identifier = @"DemoNotification";
    }return _identifier;
}

-(NSString *)title{
    if (!_title) {
        _title = JobsInternationalization(@"本地通知");
    }return _title;
}

-(NSString *)body{
    if (!_body) {
        _body = JobsInternationalization(@"这是一个示例本地通知");
    }return _body;
}

-(UNNotificationSound *)sound{
    if (!_sound) {
        _sound = UNNotificationSound.defaultSound;
    }return _sound;
}

-(NSTimeInterval)triggerWithTimeInterval{
    if (_triggerWithTimeInterval <= 0) {
        _triggerWithTimeInterval = 1;
    }return _triggerWithTimeInterval;
}

@end
