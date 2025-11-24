//
//  JobsNetWorkTools.h
//  JobsBaseConfig
//
//  Created by Jobs on 2025/11/19.
//

#import <ifaddrs.h>
#import <net/if.h>
#import <net/if_var.h>
#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "DefineProperty.h"
#import "JobsTimer.h"
#import "BaseProtocol.h"
#import "JobsDefineAllEnumHeader.h"     // 此文件用来存储记录全局的一些枚举
#import "JobsDefineAllStructHeader.h"   // 此文件用来存储记录全局的一些结构体

#import "JobsBitsMonitorSuspendLab.h"
/// 网络数据来源
#ifndef JOBS_NETWORK_SOURCE_TYPE_DEFINED
#define JOBS_NETWORK_SOURCE_TYPE_DEFINED
typedef NS_ENUM(NSUInteger, JobsNetworkSourceType) {
    JobsNetworkSourceTypeUnknown = 0,
    JobsNetworkSourceTypeWiFi,
    JobsNetworkSourceTypeCellular
};
#endif /* JOBS_NETWORK_SOURCE_TYPE_DEFINED */

#ifndef JOBS_NETWORK_BYTES_DEFINED
#define JOBS_NETWORK_BYTES_DEFINED
typedef struct {
    uint64_t download;   // 下行总字节
    uint64_t upload;     // 上行总字节
} JobsNetworkBytes;
#endif /* JOBS_NETWORK_BYTES_DEFINED */

static inline JobsNetworkBytes JobsNetworkBytesMake(uint64_t download, uint64_t upload) {
    JobsNetworkBytes b;
    b.download = download;
    b.upload   = upload;
    return b;
}
/// 读取当前所有 UP 状态网卡的总上下行字节（Wi-Fi + 蜂窝 + 其他）
static JobsNetworkBytes JobsCurrentNetworkBytes(void) {
    struct ifaddrs *addrs = NULL;
    JobsNetworkBytes result = JobsNetworkBytesMake(0, 0);
    if (getifaddrs(&addrs) != 0 || !addrs) return result;
    for (struct ifaddrs *ifa = addrs; ifa != NULL; ifa = ifa->ifa_next) {
        if (!ifa->ifa_data) {
            continue;
        }
        // 只算 UP 接口
        if (!(ifa->ifa_flags & IFF_UP)) {
            continue;
        }

        struct if_data *data = (struct if_data *)ifa->ifa_data;
        if (!data) continue;

        uint64_t inBytes  = (uint64_t)data->ifi_ibytes;
        uint64_t outBytes = (uint64_t)data->ifi_obytes;

        // 这里我们不区分 en / pdp_ip / 其他，直接全加，总效果等于 Swift 里的 wifi+cellular+other.total
        result.download += inBytes;
        result.upload   += outBytes;
    }

    freeifaddrs(addrs);
    return result;
}

@interface JobsNetworkSource : NSObject<BaseProtocol>

Prop_assign()JobsNetworkSourceType type;
Prop_copy(nullable)NSString *displayName;

@end

@interface JobsNetworkTrafficMonitor : NSObject
/// 可销毁单例
+(instancetype _Nonnull)shared;
+(void)destroyShared;
/// 链式设置回调
-(JobsRetTNetworkTrafficMonitorByUpdateBlock _Nonnull)onUpdateBy;
/// 启动监控（内部用 JobsTimer 按 interval 采样）
-(jobsByDoubleBlock _Nonnull)byStartWithInterval;
/// 停止监控
-(jobsByVoidBlock _Nonnull)byStop;

@end

NS_INLINE __kindof JobsNetworkSource *_Nonnull
jobsMakeNetworkSource(jobsByNetworkSourceBlock _Nonnull block){
    JobsNetworkSource *data = JobsNetworkSource.alloc.init;
    if (block) block(data);
    return data;
}
