//
//  JobsNetWorkTools.m
//  JobsBaseConfig
//
//  Created by Jobs on 2025/11/19.
//

#import "JobsNetWorkTools.h"

@interface JobsNetworkTrafficMonitor ()

Prop_copy()JobsNetworkUpdateBlock onUpdate;
Prop_strong()JobsTimer *timer;

@end

@implementation JobsNetworkTrafficMonitor

+(instancetype)shared {
    static JobsNetworkTrafficMonitor *ins;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ins = JobsNetworkTrafficMonitor.alloc.init;
    });return ins;
}

-(instancetype)byOnUpdate:(JobsNetworkUpdateBlock)block {
    self.onUpdate = block;
    return self;
}

-(jobsByDoubleBlock _Nonnull)byStartWithInterval{
    @jobs_weakify(self)
    return ^(NSTimeInterval interval){
        self.timer = [JobsTimer timerWithInterval:interval
                                          repeats:YES
                                             type:JobsTimerTypeGCD
                                            queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
                                         tickBlock:^(JobsTimer * _Nonnull timer) {
            @jobs_strongify(self)
            // 1️⃣ 这里写你原来那套逻辑：统计每个网卡的 upload / download 总字节数
            //    然后算出“每秒增量”，就是当前的上下行速度。
            //
            //    假装我们已经算出来：
            uint64_t uploadBps   = /* strongSelf.currentUploadSpeedBytesPerSec */ 0;
            uint64_t downloadBps = /* strongSelf.currentDownloadSpeedBytesPerSec */ 0;

            JobsNetworkSource *source = [[JobsNetworkSource alloc] init];
            source.type        = JobsNetworkSourceTypeWiFi;    // 根据当前接口类型判断
            source.displayName = @"Wi-Fi";                    // 或 “蜂窝数据”等
            // 2️⃣ 回调给外面
            JobsNetworkUpdateBlock block = self.onUpdate;
            if (block) {
                block(source, uploadBps, downloadBps);
            }
        } completionBlock:^(JobsTimer * _Nullable timer) {

        }];

        [self.timer start];
    };
}

-(jobsByVoidBlock _Nonnull)byStop{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.timer invalidate];
        self.timer = nil;
    };
}

@end

@implementation JobsNetworkSource
@end
