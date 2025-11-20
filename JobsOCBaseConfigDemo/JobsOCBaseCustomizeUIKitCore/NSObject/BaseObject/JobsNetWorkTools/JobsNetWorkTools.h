//
//  JobsNetWorkTools.h
//  JobsBaseConfig
//
//  Created by Jobs on 2025/11/19.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "DefineProperty.h"
#import "JobsTimer.h"
#import "UIView+JobsNetworkListener.h"
#import "JobsBitsMonitorSuspendLab.h"


typedef NS_ENUM(NSUInteger, JobsNetworkSourceType) {
    JobsNetworkSourceTypeUnknown = 0,
    JobsNetworkSourceTypeWiFi,
    JobsNetworkSourceTypeCellular
};

@interface JobsNetworkSource : NSObject

Prop_assign()JobsNetworkSourceType type;
Prop_copy(nullable)NSString *displayName;

@end

@class JobsNetworkSource;
typedef void(^JobsNetworkUpdateBlock)(JobsNetworkSource *source,
                                      uint64_t uploadBytesPerSec,
                                      uint64_t downloadBytesPerSec);



@interface JobsNetworkTrafficMonitor : NSObject

+(instancetype)shared;
/// 链式设置回调
-(instancetype)byOnUpdate:(JobsNetworkUpdateBlock _Nullable)block;
/// 启动监控（内部用 JobsTimer 按 interval 采样）
-(jobsByDoubleBlock _Nonnull)byStartWithInterval;
/// 停止监控
-(jobsByVoidBlock _Nonnull)byStop;

@end
