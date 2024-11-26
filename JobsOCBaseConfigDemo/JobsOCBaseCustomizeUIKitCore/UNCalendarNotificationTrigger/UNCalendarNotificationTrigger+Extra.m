//
//  UNCalendarNotificationTrigger+Extra.m
//  FM
//
//  Created by Admin on 26/11/2024.
//

#import "UNCalendarNotificationTrigger+Extra.h"

@implementation UNCalendarNotificationTrigger (Extra)
/// 创建一个不重复触发的日历通知触发器
+(JobsReturnCalendarNotificationTriggerByComponentsBlock _Nonnull)initByNORepeats{
    return ^__kindof UNCalendarNotificationTrigger *_Nullable(NSDateComponents *_Nullable data){
        return [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:data repeats:NO];
    };
}
/// 创建一个重复触发的日历通知触发器
+(JobsReturnCalendarNotificationTriggerByComponentsBlock _Nonnull)initByRepeats{
    return ^__kindof UNCalendarNotificationTrigger *_Nullable(NSDateComponents *_Nullable data){
        return [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:data repeats:YES];
    };
}

@end
