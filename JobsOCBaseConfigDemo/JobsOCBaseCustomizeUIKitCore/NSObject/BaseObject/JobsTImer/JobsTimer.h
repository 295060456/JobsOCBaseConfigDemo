//
//  JobsTimer.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/11/19.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "JobsBlock.h"
#import "TimerProtocol.h"
#import "DefineConstString.h"

NS_ASSUME_NONNULL_BEGIN
/// 统一的 OC 版计时器实现：基于 TimerProtocol，只额外提供进度语义
@interface JobsTimer : NSObject<TimerProtocol>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsTimer *_Nonnull
jobsMakeTimer(JobsTimerBlock _Nonnull block){
    JobsTimer *data = JobsTimer.alloc.init;
    if (block) block(data);
    return data;
}

//-(JobsTimer *)timerManager{
//    if (!_timerManager) {
//        @jobs_weakify(self)
//        _timerManager = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
//            timer.timerType                = JobsTimerTypeDispatchAfter;
//            timer.timerStyle               = TimerStyle_anticlockwise; // 倒计时模式
//            timer.timeInterval             = 1;                        // 语义字段
//            timer.timeSecIntervalSinceDate = 0;                        // 真正控制 dispatch_after 的延迟
//            timer.repeats                  = NO;
//            timer.queue                    = dispatch_get_main_queue();
//            timer.timerState               = JobsTimerStateIdle;
//
//            timer.startTime                = self.count;               // ✅ 总时长
//            timer.time                     = 0;                        // ✅ 当前剩余时间（初始 = 总时长）
//
//            timer.onTicker                 = ^(JobsTimer *_Nullable timer){
//                @jobs_strongify(self)
//                JobsLog(@"正在倒计时...");
//                if (self.objBlock) self.objBlock(timer);
//            };
//            timer.onFinisher               = ^(JobsTimer *_Nullable timer){
//                @jobs_strongify(self)
//                JobsLog(@"倒计时结束...");
//                if (self.objBlock) self.objBlock(timer);
//            };
//
//            timer.accumulatedElapsed       = 0;
//            timer.lastStartDate            = nil;
//        });
//    }return _timerManager;
//}
