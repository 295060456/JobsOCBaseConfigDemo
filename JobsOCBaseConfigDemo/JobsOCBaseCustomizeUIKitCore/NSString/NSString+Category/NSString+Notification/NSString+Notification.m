//
//  NSString+Notification.m
//  FM
//
//  Created by User on 10/4/24.
//

#import "NSString+Notification.h"

@implementation NSString (Notification)

-(jobsByIDBlock _Nonnull)postNotificationBy{
    @jobs_weakify(self)
    return ^(id _Nullable data){
        @jobs_strongify(self)
        [JobsNotificationCenter postNotificationName:self object:data];
    };
}

-(jobsByNotificationModelBlock _Nonnull)postNotificationByModel{
    @jobs_weakify(self)
    return ^(NotificationModel *_Nullable data){
        @jobs_strongify(self)
        [JobsNotificationCenter postNotificationName:self
                                              object:data.anObject
                                            userInfo:data.userInfo];
    };
}

@end
