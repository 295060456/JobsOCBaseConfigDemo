//
//  JobsBitsMonitorCore.h
//  JobsBitsMonitor
//
//  Created by Jobs on 2020/12/13.
//

#import <Foundation/Foundation.h>
#include <arpa/inet.h>                            /// 提供与网络地址相关的函数，例如 IP 地址的转换（从字符串到二进制格式，反之亦然）。
#include <ifaddrs.h>                              /// 提供用于获取网络接口地址的信息的接口，例如获取设备所有网络接口的 IP 地址。
#include <net/if.h>                               /// 定义网络接口的常量和结构体，用于处理网络接口的配置。
#include <net/if_dl.h>                            /// 提供网络接口的链路层地址信息，例如 MAC 地址。

#import "BaseProtocol.h"
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举
#import "MacroDef_Notification.h"
#import "DefineConstString.h"
#import "NSTimerManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsBitsMonitorCore : NSObject<BaseProtocol>

@property(nonatomic,copy,readonly)NSString *downloadNetworkSpeed;
@property(nonatomic,copy,readonly)NSString *uploadNetworkSpeed;
@property(nonatomic,strong)NSTimerManager *nsTimerManager;
@property(nonatomic,assign)BitsMonitorRunMode bitsMonitorRunMode;/// 默认自启动模式

-(void)start;///【手动】开始监听
-(void)stop;///【手动】停止监听
-(void)pause;///【手动】暂停监听
-(void)continues;///【手动】暂停以后继续监听

@end

NS_ASSUME_NONNULL_END
