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

-(JobsRetTimerByNSUInteger _Nonnull)byTimerType;
-(JobsRetTimerByNSUInteger _Nonnull)byTimerStyle;
-(JobsRetTimerByDoubleBlock _Nonnull)byTimeInterval;
-(JobsRetTimerByDoubleBlock _Nonnull)byStartTime;
-(JobsRetTimerByCGFloatBlock _Nonnull)byTime;
-(JobsRetTimerByDoubleBlock _Nonnull)byTimeSecIntervalSinceDate;
-(JobsRetTimerByStringBlock _Nonnull)byRunLoopMode;
-(JobsRetTimerByUserInfo _Nonnull)byUserInfo;
-(JobsRetTimerByQueue _Nonnull)byQueue;
-(JobsRetTimerByNSUInteger _Nonnull)byTimerState;
/// 回调链式 DSL
-(JobsRetTimerByCGFloatBlocks _Nonnull)byOnTick;
-(JobsRetTimerByJTimerBlocks _Nonnull)byOnFinish;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsTimer *_Nonnull
jobsMakeTimer(JobsTimerBlock _Nonnull block){
    JobsTimer *data = JobsTimer.alloc.init;
    if (block) block(data);
    return data;
}

/**

 @synthesize timer = _timer;
 -(JobsTimer *)timer{
     if (!_timer) {
         @jobs_weakify(self)
         _timer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
             timer.byTimerType(JobsTimerTypeNSTimer)
             .byTimerStyle(TimerStyle_anticlockwise) // 倒计时模式
             .byTimeInterval(1)
             .byTimeSecIntervalSinceDate(0)
             .byQueue(dispatch_get_main_queue())
             .byTimerState(JobsTimerStateIdle)
             .byStartTime(10)
             .byTime(0)
             .byOnTick(^(CGFloat time){
                 @jobs_strongify(self)
                 JobsLog(@"正在倒计时...");
                 [self getCuntDown:timer.time];
                 if (self.objBlock) self.objBlock(timer);
             })
             .byOnFinish(^(JobsTimer *_Nullable timer){
                 @jobs_strongify(self)
                 JobsLog(@"倒计时结束...");
                 if (self.objBlock) self.objBlock(timer);
             });

             timer.accumulatedElapsed       = 0;
             timer.lastStartDate            = nil;
         });
     }return _timer;
 }
 */
