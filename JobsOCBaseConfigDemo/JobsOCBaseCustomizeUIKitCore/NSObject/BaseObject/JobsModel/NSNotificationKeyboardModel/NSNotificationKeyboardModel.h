//
//  NSNotificationKeyboardModel.h
//  FM
//
//  Created by User on 9/21/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationKeyboardModel : NSObject

@property(nonatomic,strong,nullable)NSDictionary *userInfo;
@property(nonatomic,assign)CGRect beginFrame;
@property(nonatomic,assign)CGRect endFrame;
@property(nonatomic,assign)CGFloat keyboardOffsetY;
@property(nonatomic,strong,nonnull)NSString *notificationName;

@end

NS_ASSUME_NONNULL_END
