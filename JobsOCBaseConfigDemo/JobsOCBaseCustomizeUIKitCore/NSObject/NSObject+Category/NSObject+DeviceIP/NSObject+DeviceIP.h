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

#import "JobsNetworkingHeader.h" /// Api

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<AFNetworking/AFURLRequestSerialization.h>)
#import <AFNetworking/AFURLRequestSerialization.h>
#else
#import "AFURLRequestSerialization.h"
#endif

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

#import "Ipify_api.h" /// 简单可靠，只返回设备的公网 IP 地址【GET】
#import "IP_api.h" /// 提供丰富的地理位置信息【GET】
#import "Ipinfo_api.h" /// 提供详细的 IP 信息【GET】
#import "Ipdata_api.h"/// 提供免费和付费选项的地理位置和 IP 查询服务【GET】

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DeviceIP)
/// 获取ip地址
-(NSString *)getIPaddress;
/// 获取设备当前本地IP地址
-(JobsRetStrByBOOLBlock _Nonnull)getLocalIPAddressBy;
/// 是否是有效的IP
-(JobsRetBOOLByStrBlock _Nonnull)isValidatIP;
/// 用于获取设备的所有 IP 地址（包括 IPv4 和 IPv6 地址），并以字典形式返回。通过查询网络接口获取这些信息。
-(NSDictionary *)getIPAddresses;
/// 简单可靠，只返回设备的公网 IP 地址【GET】
/// https://api.ipify.org?format=json
-(void)getIpify:(jobsByIpifyModelBlock _Nullable)successBlock;
/// 提供丰富的地理位置信息【GET】
/// http://ip-api.com/json/
-(void)getIP:(jobsByIPApiModelBlock _Nullable)successBlock;
/// 提供详细的 IP 信息【GET】
/// https://ipinfo.io/json
-(void)getIPInfo:(jobsByIpinfoModelBlock _Nullable)successBlock;
/// 提供免费和付费选项的地理位置和 IP 查询服务【GET】
/// https://api.ipdata.co/?api-key=YOUR_API_KEY
-(void)getIPDataByKey:(NSString *)key
         successBlock:(jobsByIDBlock _Nullable)successBlock;

@end

NS_ASSUME_NONNULL_END
