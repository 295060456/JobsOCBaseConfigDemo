//
//  UNNotificationRequestModel.h
//  FM
//
//  Created by Admin on 26/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UNNotificationRequestModel : NSObject

@property(nonatomic,copy)NSString *identifier;
@property(nonatomic,strong)UNNotificationContent *content;
@property(nonatomic,strong)UNNotificationTrigger *trigger;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UNNotificationRequestModel *_Nonnull jobsMakeUNNotificationRequestModel(jobsByUNNotificationRequestModelBlock _Nonnull block){
    UNNotificationRequestModel *data = UNNotificationRequestModel.alloc.init;
    if (block) block(data);
    return data;
}
