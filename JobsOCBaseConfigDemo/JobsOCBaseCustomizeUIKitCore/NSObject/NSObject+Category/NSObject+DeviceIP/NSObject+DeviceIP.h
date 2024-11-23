//
//  NSObject+DeviceIP.h
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#import <Foundation/Foundation.h>

#import <ifaddrs.h> /// 提供网络接口的相关信息
#import <arpa/inet.h> /// 提供 IP 地址和网络字节序相关的工具函数
#import <net/if.h> /// 定义网络接口的标志和常量

#import "JobsBlock.h"

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DeviceIP)
/// 获取ip地址
-(NSString *)getIPaddress;
/// 获取设备当前网络IP地址：淘宝api
-(NSString *)getNetworkIPAddressByTaoBao;
/// 获取设备当前网络IP地址：新浪api
-(NSString *)getNetworkIPAddressBySina;
/// 获取设备当前本地IP地址
-(JobsReturnStringByBOOLBlock _Nonnull)getLocalIPAddressBy;
/// 是否是有效的IP
-(JobsReturnBOOLByStringBlock _Nonnull)isValidatIP;
/// 用于获取设备的所有 IP 地址（包括 IPv4 和 IPv6 地址），并以字典形式返回。通过查询网络接口获取这些信息。
-(NSDictionary *)getIPAddresses;

@end

NS_ASSUME_NONNULL_END
