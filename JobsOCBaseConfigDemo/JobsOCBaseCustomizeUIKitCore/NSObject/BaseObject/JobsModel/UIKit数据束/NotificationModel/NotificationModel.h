//
//  NotificationModel.h
//  FM
//
//  Created by User on 10/4/24.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NotificationModel : BaseModel

@property(nonatomic,copy)NSString *notificationName;
@property(nonatomic,strong)NSDictionary *userInfo;
@property(nonatomic,strong)id anObject;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof NotificationModel *_Nonnull jobsMakeNotificationModel(jobsByNotificationModelBlock _Nonnull block){
    NotificationModel *data = NotificationModel.alloc.init;
    if (block) block(data);
    return data;
}
