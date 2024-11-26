//
//  UNNotificationRequest+Extra.m
//  FM
//
//  Created by Admin on 26/11/2024.
//

#import "UNNotificationRequest+Extra.h"

@implementation UNNotificationRequest (Extra)

+(JobsReturnUNNotificationRequestByModelBlock)initBy{
    return ^__kindof UNNotificationRequest *_Nullable(UNNotificationRequestModel *_Nullable data){
        return [UNNotificationRequest requestWithIdentifier:data.identifier
                                                    content:data.content
                                                    trigger:data.trigger];
    };
}

-(jobsByErrBlock _Nonnull)notificationRequestCompletionHandlerBy{
    @jobs_weakify(self)
    return ^(jobsByErrorBlock _Nullable block){
        @jobs_strongify(self)
        [UNUserNotificationCenter.currentNotificationCenter addNotificationRequest:self
                                                             withCompletionHandler:block];
    };
}

@end
