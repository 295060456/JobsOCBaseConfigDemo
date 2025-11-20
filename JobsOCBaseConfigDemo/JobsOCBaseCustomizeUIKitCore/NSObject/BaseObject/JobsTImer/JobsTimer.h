//
//  JobsTimer.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/11/19.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "JobsBlock.h"
#import "DefineConstString.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JobsTimerType) {
    JobsTimerTypeNSTimer = 0,        // RunLoop 驱动
    JobsTimerTypeGCD,                // dispatch_source_t 定时器
    JobsTimerTypeDisplayLink,        // CADisplayLink（帧驱动）
    JobsTimerTypeDispatchAfter       // dispatch_after 一次性延迟
};

typedef NS_ENUM(NSUInteger, JobsTimerState) {
    JobsTimerStateIdle = 0,          // 初始 / 已释放
    JobsTimerStateRunning,           // 运行中
    JobsTimerStatePaused,            // 暂停
    JobsTimerStateFinished,          // 正常结束（非重复模式）
    JobsTimerStateCanceled           // 手动取消
};

@interface JobsTimer : NSObject
/// 当前使用的定时器类型（NSTimer / GCD / CADisplayLink / dispatch_after）
Prop_assign(readonly)JobsTimerType type;
/// 当前状态（Idle / Running / Paused / Finished / Canceled）
Prop_assign(readonly)JobsTimerState state;
/// 间隔时间（对 DisplayLink 表示期望秒数）
Prop_assign(readonly)NSTimeInterval interval;
/// 是否重复
Prop_assign(readonly)BOOL repeats;
/// 当前是否正在运行（状态语义糖）
Prop_assign(readonly,getter=isRunning)BOOL running;
/// 当前是否处于暂停中
Prop_assign(readonly,getter=isPaused)BOOL paused;
/// 每次触发回调
Prop_copy(nullable)JobsTimerTickBlock tickBlock;
/// 非重复模式下，完成 / 结束回调
Prop_copy(nullable)JobsTimerCompletionBlock completionBlock;
/// GCD 定时器使用的队列（若为 nil，则默认 global queue）
Prop_strong(readonly,nullable)dispatch_queue_t queue;
/// MARK: - 工厂方法
/// 通用工厂（默认使用 GCD）
+(instancetype)timerWithInterval:(NSTimeInterval)interval
                         repeats:(BOOL)repeats
                       tickBlock:(nullable JobsTimerTickBlock)tickBlock;
/// 指定底层实现
+(instancetype)timerWithInterval:(NSTimeInterval)interval
                         repeats:(BOOL)repeats
                            type:(JobsTimerType)type
                           queue:(nullable dispatch_queue_t)queue
                       tickBlock:(nullable JobsTimerTickBlock)tickBlock
                 completionBlock:(nullable JobsTimerCompletionBlock)completionBlock;
/// 一次性延迟执行（内部用 dispatch_after，无法暂停/恢复，只能取消）
+(instancetype)after:(NSTimeInterval)delay
               queue:(nullable dispatch_queue_t)queue
          completion:(nullable JobsTimerCompletionBlock)completion;
/// MARK: - 状态控制
-(void)start;      /// 开始（或重新开始）
-(void)pause;      /// 暂停
-(void)resume;     /// 从暂停恢复
-(void)invalidate; /// 结束并释放（进入 Canceled 或 Finished）

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsTimer *_Nonnull
jobsMakeTimer(JobsTimerTickBlock _Nonnull block){
    JobsTimer *data = JobsTimer.alloc.init;
    if (block) block(data);
    return data;
}
