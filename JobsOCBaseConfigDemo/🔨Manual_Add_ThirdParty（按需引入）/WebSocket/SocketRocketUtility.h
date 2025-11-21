//
//  SocketRocketUtility.h
//  SUN
//
//  Created by 孙俊 on 17/2/16.
//  Copyright © 2017年 SUN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MacroDef_Notification.h"
#import "JobsBlock.h"
#import "NSString+Others.h"
#import "DefineConstString.h" /// 常量字符串的定义
#import "JobsTimer.h"
#import "BaseProtocol.h"
#import "DefineProperty.h"
#import "NSString+Conversion.h"

#if __has_include(<SocketRocket/SocketRocket.h>)
#import <SocketRocket/SocketRocket.h>
#else
#import "SocketRocket.h"
#endif

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

@interface SocketRocketUtility : NSObject<SRWebSocketDelegate,BaseProtocol>
/// 获取连接状态
Prop_assign(readonly)SRReadyState socketReadyState;

+(SocketRocketUtility *_Nullable)instance;
/// 开始连接
-(jobsByStrBlock _Nonnull)SRWebSocketOpenWithURLString;
/// 关闭连接
-(void)SRWebSocketClose;
/// 发送数据
-(jobsByIDBlock _Nonnull)sendData;

@end
