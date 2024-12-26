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

@property(nonatomic,assign)CGRect beginFrame;
@property(nonatomic,assign)CGRect endFrame;
@property(nonatomic,assign)CGFloat keyboardOffsetY;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof NSNotificationKeyboardModel *_Nonnull jobsMakeNotificationKeyboardModel(jobsByNSNotificationKeyboardModelBlock _Nonnull block){
    NSNotificationKeyboardModel *data = NSNotificationKeyboardModel.alloc.init;
    if (block) block(data);
    return data;
}
