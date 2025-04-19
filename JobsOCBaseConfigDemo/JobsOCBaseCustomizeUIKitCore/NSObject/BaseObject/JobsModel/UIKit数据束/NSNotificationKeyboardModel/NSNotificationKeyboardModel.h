//
//  NSNotificationKeyboardModel.h
//  FM
//
//  Created by User on 9/21/24.
//

#import <Foundation/Foundation.h>
#import "NotificationModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationKeyboardModel : NotificationModel

Prop_assign()CGRect beginFrame;
Prop_assign()CGRect endFrame;
Prop_assign()CGFloat keyboardOffsetY;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof NSNotificationKeyboardModel *_Nonnull jobsMakeNotificationKeyboardModel(jobsByNSNotificationKeyboardModelBlock _Nonnull block){
    NSNotificationKeyboardModel *data = NSNotificationKeyboardModel.alloc.init;
    if (block) block(data);
    return data;
}
