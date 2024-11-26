//
//  UNNotificationRequest+Extra.h
//  FM
//
//  Created by Admin on 26/11/2024.
//

#import <UserNotifications/UserNotifications.h>
#import "JobsBlock.h"
@class UNNotificationRequestModel;

NS_ASSUME_NONNULL_BEGIN

@interface UNNotificationRequest (Extra)

+(JobsReturnUNNotificationRequestByModelBlock)initBy;
-(jobsByErrBlock _Nonnull)notificationRequestCompletionHandlerBy;

@end

NS_ASSUME_NONNULL_END
