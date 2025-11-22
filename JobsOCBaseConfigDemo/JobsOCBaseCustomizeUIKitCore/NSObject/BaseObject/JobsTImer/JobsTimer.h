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

-(JobsRetTimerByType _Nonnull)timerTypeBy;
-(JobsRetTimerByTimerStyle _Nonnull)timerStyleBy;
-(JobsRetTimerByTimeInterval _Nonnull)timeIntervalBy;
-(JobsRetTimerByStartTime _Nonnull)startTimeBy;
-(JobsRetTimerByTime _Nonnull)timeBy;
-(JobsRetTimerByDelay _Nonnull)timeSecIntervalSinceDateBy;
-(JobsRetTimerByRunLoopMode _Nonnull)runLoopModeBy;
-(JobsRetTimerByUserInfo _Nonnull)userInfoBy;
-(JobsRetTimerByQueue _Nonnull)queueBy;
-(JobsRetTimerByTimerState _Nonnull)timerStateBy;
/// 回调链式 DSL
-(JobsRetTimerByOnTicker _Nonnull)onTickerBy;
-(JobsRetTimerByOnFinisher _Nonnull)onFinisherBy;
-(JobsRetTimerByOnTick _Nonnull)onTickBy;
-(JobsRetTimerByOnFinish _Nonnull)onFinishBy;

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
             timer
             .timerTypeBy(JobsTimerTypeNSTimer)
             .timerStyleBy(TimerStyle_anticlockwise)      // 倒计时模式
             .timeIntervalBy(1)                           // 语义字段
             .timeSecIntervalSinceDateBy(0)               // dispatch_after 延迟（这里等价 0）
             .repeatsBy(YES)
             .queueBy(dispatch_get_main_queue())
             .timerStateBy(JobsTimerStateIdle)
             .startTimeBy(30 * 60)                        // ✅ 总时长
             .timeBy(0)                                   // ✅ 当前剩余时间（初始 = 总时长）
             .onTickerBy(^(__kindof JobsTimer * _Nullable t){
                 @jobs_strongify(self)
                 JobsLog(@"正在倒计时...");

                 NSLog(@"timer.timerType = %lu",(unsigned long)t.timerType);
                 NSLog(@"timer.timerStyle = %lu",(unsigned long)t.timerStyle);

                 NSArray *strArr1 = [[self getMMSSFromStr:[NSString stringWithFormat:@"%f",t.time]
                                                formatTime:self.formatTime]
                                     componentsSeparatedByString:JobsInternationalization(@"分")];
                 self.minutesStr = strArr1[0];

                 NSArray *strArr2 = [strArr1[1] componentsSeparatedByString:JobsInternationalization(@"秒")];
                 self.secondStr = strArr2[0];

                 self.countdownTimeLab.attributedText =
                 [self richTextWithDataConfigMutArr:self.richTextConfigMutArr
                                      paragraphStyle:self.paragraphStyle];

                 if (self.objBlock) self.objBlock(t);
             })
             .onFinisherBy(^(__kindof JobsTimer * _Nullable t){
                 @jobs_strongify(self)
                 JobsLog(@"倒计时结束...");
                 if (self.objBlock) self.objBlock(t);
             });

             // 这些是内部状态初始化，不暴露成 DSL 也可以
             timer.accumulatedElapsed = 0;
             timer.lastStartDate      = nil;
         });
     }
     return _timer;
 }

 */
