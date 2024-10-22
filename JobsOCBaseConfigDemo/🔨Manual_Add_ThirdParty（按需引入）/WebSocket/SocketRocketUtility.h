//
//  SocketRocketUtility.h
//  SUN
//
//  Created by 孙俊 on 17/2/16.
//  Copyright © 2017年 SUN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SocketRocket.h>
#import "MacroDef_Notification.h"
#import "NSString+Others.h"

#define dispatch_main_async_safe(block)\
if (NSThread.isMainThread) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

extern NSString * const kNeedPayOrderNote;
extern NSString * const kWebSocketDidOpenNote;
extern NSString * const kWebSocketDidCloseNote;
extern NSString * const kWebSocketdidReceiveMessageNote;

@interface SocketRocketUtility : NSObject<SRWebSocketDelegate>
/** 获取连接状态 */
@property(nonatomic,assign,readonly)SRReadyState socketReadyState;
/** 开始连接 */
-(void)SRWebSocketOpenWithURLString:(NSString *)urlString;
/** 关闭连接 */
-(void)SRWebSocketClose;
/** 发送数据 */
-(void)sendData:(id)data;

+(SocketRocketUtility *)instance;

@end
