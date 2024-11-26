//
//  UNCalendarNotificationTrigger+Extra.h
//  FM
//
//  Created by Admin on 26/11/2024.
//

#import <UserNotifications/UserNotifications.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UNCalendarNotificationTrigger (Extra)
/// 创建一个不重复触发的日历通知触发器
+(JobsReturnCalendarNotificationTriggerByComponentsBlock _Nonnull)initByNORepeats;
/// 创建一个重复触发的日历通知触发器
+(JobsReturnCalendarNotificationTriggerByComponentsBlock _Nonnull)initByRepeats;

@end

NS_ASSUME_NONNULL_END
