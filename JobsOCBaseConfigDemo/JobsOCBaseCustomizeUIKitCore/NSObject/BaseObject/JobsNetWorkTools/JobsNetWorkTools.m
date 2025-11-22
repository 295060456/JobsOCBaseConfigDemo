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
Prop_assign()NSTimeInterval interval;

@end

@implementation JobsNetworkTrafficMonitor
/// 可销毁单例
static JobsNetworkTrafficMonitor *_sharedInstance = nil;
+(instancetype _Nonnull)shared{
    @synchronized(self) {
        if (!_sharedInstance) {
            _sharedInstance = [self.alloc init];
        }return _sharedInstance;
    }
}

+(void)destroyShared{
    @synchronized(self) {
        if (_sharedInstance) {
            _sharedInstance.byStop();
            _sharedInstance = nil;
        }
    }
}

-(JobsRetTNetworkTrafficMonitorByUpdateBlock _Nonnull)onUpdateBy{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkTrafficMonitor *_Nullable(JobsNetworkUpdateBlock _Nullable block){
        @jobs_strongify(self)
        self.onUpdate = block;
        return self;
    };
}

-(jobsByDoubleBlock _Nonnull)byStartWithInterval{
    @jobs_weakify(self)
    return ^(NSTimeInterval interval){
        @jobs_strongify(self)
        self.interval = interval;
        [self.timer start];
    };
}

-(jobsByVoidBlock _Nonnull)byStop{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.timer stop];
        self.timer = nil;
    };
}

-(JobsTimer *)timer{
    if(!_timer){
        @jobs_weakify(self)
        _timer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            timer.timerType                = JobsTimerTypeNSTimer;
            timer.timerStyle               = TimerStyle_clockwise;     // 倒计时模式
            timer.timeInterval             = 1;                        // 语义字段
            timer.timeSecIntervalSinceDate = 0;                        // 真正控制 dispatch_after 的延迟
            timer.repeats                  = NO;
            timer.queue                    = dispatch_get_main_queue();
            timer.timerState               = JobsTimerStateIdle;

            timer.startTime                = 0;               // ✅ 总时长
            timer.time                     = 0;                        // ✅ 当前剩余时间（初始 = 总时长）

            timer.onTicker                 = ^(JobsTimer *_Nullable timer){
                @jobs_strongify(self)
                // ========= 统计当前总字节 & 计算网速 =========
                // 用静态变量在多次 tick 之间记住上一次的取样
                static BOOL     s_hasLastSample   = NO;
                static uint64_t s_lastDownload    = 0;
                static uint64_t s_lastUpload      = 0;

                JobsNetworkBytes now = JobsCurrentNetworkBytes();

                if (!s_hasLastSample) {
                    // 第一次取样，只记录基准值，不回调网速（否则第一下是乱的）
                    s_lastDownload  = now.download;
                    s_lastUpload    = now.upload;
                    s_hasLastSample = YES;
                    return;
                }

                // 处理可能的计数回绕，防止出现负数
                uint64_t deltaDown = 0;
                uint64_t deltaUp   = 0;

                if (now.download >= s_lastDownload) {
                    deltaDown = now.download - s_lastDownload;
                } else {
                    // 计数回绕，直接视为 0，避免乱跳
                    deltaDown = 0;
                }

                if (now.upload >= s_lastUpload) {
                    deltaUp = now.upload - s_lastUpload;
                } else {
                    deltaUp = 0;
                }

                // 更新基准值，留给下一次 tick 用
                s_lastDownload = now.download;
                s_lastUpload   = now.upload;

                // 按 interval 换算成 Bytes/s
                uint64_t downloadBps = (uint64_t)((double)deltaDown / self.interval);
                uint64_t uploadBps   = (uint64_t)((double)deltaUp   / self.interval);

                // ========= 构造 source & 回调 =========
                JobsNetworkSource *source = [[JobsNetworkSource alloc] init];
                // 这里你后面可以用 NWPathMonitor / Reachability 等来判断当前主线路再填：
                source.type        = JobsNetworkSourceTypeWiFi;  // TODO: 根据实际网络类型改
                source.displayName = @"Wi-Fi";                   // 或 @"蜂窝数据" 等

                if (self.onUpdate) self.onUpdate(source, uploadBps, downloadBps);
            };
            timer.onFinisher               = ^(JobsTimer *_Nullable timer){
                @jobs_strongify(self)
                JobsLog(@"倒计时结束...");
                if (self.objBlock) self.objBlock(timer);
            };

            timer.accumulatedElapsed       = 0;
            timer.lastStartDate            = nil;
        });
    }return _timer;
}

@end

@implementation JobsNetworkSource
@end
