//
//  NSObject+DeviceIP.m
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#import "NSObject+DeviceIP.h"

@implementation NSObject (DeviceIP)
/// 获取ip地址
-(NSString *)getIPaddress{
    NSString *address = @"error";
    struct ifaddrs *ifaddress = NULL;
    struct ifaddrs *temp_address = NULL;
    int success = 0;
    success = getifaddrs(&ifaddress);/// 系统函数，用于获取当前设备的所有网络接口信息。
    if(success == 0) {
        temp_address = ifaddress;
        while(temp_address) {
            if(temp_address->ifa_addr->sa_family == AF_INET) {
                if([StringWithUTF8String(temp_address->ifa_name) isEqualToString:@"en0"]) {
                    address = StringWithUTF8String(inet_ntoa(((struct sockaddr_in *)temp_address->ifa_addr)->sin_addr));
                }
            }temp_address = temp_address->ifa_next;
        }
    }JobsLog(@"获取到的IP地址为：%@",address);
    return address;
}
/// 获取设备当前本地IP地址
-(JobsReturnStringByBOOLBlock _Nonnull)getLocalIPAddressBy{
    @jobs_weakify(self)
    __block NSString *address;
    return ^ __kindof NSString *_Nullable(BOOL preferIPv4){
        NSArray *searchArray = preferIPv4 ?
        @[ IOS_VPN @"/" IP_ADDR_IPv4,
           IOS_VPN @"/" IP_ADDR_IPv6,
           IOS_WIFI @"/" IP_ADDR_IPv4,
           IOS_WIFI @"/" IP_ADDR_IPv6,
           IOS_CELLULAR @"/" IP_ADDR_IPv4,
           IOS_CELLULAR @"/" IP_ADDR_IPv6 ] :
        @[ IOS_VPN @"/" IP_ADDR_IPv6,
           IOS_VPN @"/" IP_ADDR_IPv4,
           IOS_WIFI @"/" IP_ADDR_IPv6,
           IOS_WIFI @"/" IP_ADDR_IPv4,
           IOS_CELLULAR @"/" IP_ADDR_IPv6,
           IOS_CELLULAR @"/" IP_ADDR_IPv4];
        NSDictionary *addresses = self.getIPAddresses;
        JobsLog(@"addresses: %@", addresses);
        [searchArray enumerateObjectsUsingBlock:^(NSString *key,
                                                  NSUInteger idx,
                                                  BOOL *stop) {
            @jobs_strongify(self)
            address = addresses[key];
            if(self.isValidatIP(address)) *stop = YES;/// 筛选出IP地址格式
         }];return address ? address : @"0.0.0.0";
    };
}
/// 是否是有效的IP
-(JobsReturnBOOLByStringBlock _Nonnull)isValidatIP{
    return ^BOOL(NSString *_Nullable ipAddress){
        if (ipAddress.length == 0) return NO;
        NSString *urlRegEx = @"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
        "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
        "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
        "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
        NSRegularExpression *regex = NSRegularExpression.byString(urlRegEx);
        if (regex) {
            NSTextCheckingResult *firstMatch = [regex firstMatchInString:ipAddress
                                                                 options:0
                                                                   range:NSMakeRange(0, ipAddress.length)];
            if (firstMatch) {
                NSRange resultRange = firstMatch.rangeAtIndex(0);
                NSString *result = ipAddress.substringWithRange(resultRange);
                JobsLog(@"%@",result);
                return YES;
            }
        }return NO;
    };
}
/// 用于获取设备的所有 IP 地址（包括 IPv4 和 IPv6 地址），并以字典形式返回。通过查询网络接口获取这些信息。
-(NSDictionary *)getIPAddresses{
    // 创建一个可变字典，用于存储网络接口的 IP 地址信息
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    struct ifaddrs *interfaces; // 定义一个指针，用于存储获取到的网络接口信息
    // 调用系统函数获取当前设备的所有网络接口信息，返回值为 0 表示成功
    if(!getifaddrs(&interfaces)) {
        struct ifaddrs *interface; // 遍历链表的指针
        // 遍历获取到的网络接口链表
        for(interface = interfaces; interface; interface = interface->ifa_next) {
            // 如果接口未激活（IFF_UP 未设置），跳过该接口
            if(!(interface->ifa_flags & IFF_UP)) {
                continue;
            }
            // 获取接口的地址信息
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN)]; // 定义缓冲区，用于存储 IP 地址字符串
            // 判断地址类型是否为 IPv4 或 IPv6
            if(addr && (addr->sin_family == AF_INET || addr->sin_family == AF_INET6)) {
                // 获取接口名称
                NSString *name = StringWithUTF8String(interface->ifa_name);
                NSString *type; // 用于标识 IP 地址类型
                // 如果是 IPv4 地址
                if(addr->sin_family == AF_INET) {
                    // 将网络字节序地址转换为字符串
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {// 如果是 IPv6 地址
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    // 将网络字节序地址转换为字符串
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                // 如果 IP 地址类型存在，则将接口名称和地址存入字典
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = StringWithUTF8String(addrBuf);
                }
            }
        }freeifaddrs(interfaces); // 释放分配的内存
    }return [addresses count] ? addresses : nil;// 如果字典中有数据，返回字典；否则返回 nil
}
#pragma mark —— 简单可靠，只返回设备的公网 IP 地址【GET】
/// https://api.ipify.org?format=json
-(void)getIpify:(jobsByIpifyModelBlock _Nullable)successBlock{
    Ipify_api *api = Ipify_api
        .ByURLParameters(nil) /// 添加URL参数
        .byBodyParameters(nil) /// 添加Body参数
        .byHeaderParameters(nil); /// 添加Header参数
    self.handleErr(api);
    // self.tipsByApi(self);
    @jobs_weakify(self)
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        if(successBlock) successBlock(IpifyModel.byData(request.responseObject));
    } failure:^(YTKBaseRequest *request) {
        @jobs_strongify(self)
        if(self) self.jobsHandelFailure(request);
    }];
}
#pragma mark —— 提供丰富的地理位置信息【GET】
/// http://ip-api.com/json/
-(void)getIP:(jobsByIPApiModelBlock _Nullable)successBlock{
    IP_api *api = IP_api
        .ByURLParameters(nil) /// 添加URL参数
        .byBodyParameters(nil) /// 添加Body参数
        .byHeaderParameters(nil); /// 添加Header参数
    self.handleErr(api);
    // self.tipsByApi(self);
    @jobs_weakify(self)
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        if(successBlock) successBlock(IPApiModel.byData(request.responseObject));
    } failure:^(YTKBaseRequest *request) {
        @jobs_strongify(self)
        if(self) self.jobsHandelFailure(request);
    }];
}
#pragma mark —— 提供详细的 IP 信息【GET】
/// https://ipinfo.io/json
-(void)getIPInfo:(jobsByIpinfoModelBlock _Nullable)successBlock{
    Ipinfo_api *api = Ipinfo_api
        .ByURLParameters(nil) /// 添加URL参数
        .byBodyParameters(nil) /// 添加Body参数
        .byHeaderParameters(nil); /// 添加Header参数
    self.handleErr(api);
    // self.tipsByApi(self);
    @jobs_weakify(self)
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        if(successBlock) successBlock(IpinfoModel.byData(request.responseObject));
    } failure:^(YTKBaseRequest *request) {
        @jobs_strongify(self)
        if(self) self.jobsHandelFailure(request);
    }];
}
#pragma mark —— 提供免费和付费选项的地理位置和 IP 查询服务【GET】
/// https://api.ipdata.co/?api-key=YOUR_API_KEY
-(void)getIPDataByKey:(NSString *)key
         successBlock:(jobsByIDBlock _Nullable)successBlock{
    Ipdata_api *api = Ipdata_api
        .ByURLParameters(key) /// 添加URL参数
        .byBodyParameters(nil) /// 添加Body参数
        .byHeaderParameters(nil); /// 添加Header参数
    self.handleErr(api);
    // self.tipsByApi(self);
    @jobs_weakify(self)
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        @jobs_strongify(self)
        if(successBlock) successBlock(IpinfoModel.byData(request.responseObject));
    } failure:^(YTKBaseRequest *request) {
        @jobs_strongify(self)
        if(self) self.jobsHandelFailure(request);
    }];
}

@end
