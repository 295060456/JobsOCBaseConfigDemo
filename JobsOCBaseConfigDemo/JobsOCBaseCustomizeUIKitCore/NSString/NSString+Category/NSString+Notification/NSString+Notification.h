//
//  NSString+Notification.h
//  FM
//
//  Created by User on 10/4/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Notification)

-(jobsByIDBlock _Nonnull)postNotificationBy;
-(jobsByNotificationModelBlock _Nonnull)postNotificationByModel;

@end

NS_ASSUME_NONNULL_END
