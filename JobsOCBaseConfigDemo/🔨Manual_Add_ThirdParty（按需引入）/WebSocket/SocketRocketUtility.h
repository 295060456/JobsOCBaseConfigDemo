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
#import "NSObject+RACTimer.h"
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

@interface SocketRocketUtility : NSObject<SRWebSocketDelegate>
/// 获取连接状态
@property(nonatomic,assign,readonly)SRReadyState socketReadyState;

+(SocketRocketUtility *)instance;
/// 开始连接
-(jobsByStringBlock _Nonnull)SRWebSocketOpenWithURLString;
/// 关闭连接
-(void)SRWebSocketClose;
/// 发送数据
-(jobsByIDBlock _Nonnull)sendData;

@end
