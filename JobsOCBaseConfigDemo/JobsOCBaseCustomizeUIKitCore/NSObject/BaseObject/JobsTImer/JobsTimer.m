//
//  JobsTimer.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/11/19.
//

#import "JobsTimer.h"

@interface JobsTimer ()

Prop_assign(readwrite)JobsTimerType type;
Prop_assign(readwrite)JobsTimerState state;
Prop_assign(readwrite)NSTimeInterval interval;
Prop_assign(readwrite)BOOL repeats;
Prop_assign()BOOL dispatchAfterPending;// dispatch_after 用的标记（无法真正 pause/resume，只能 cancel）
Prop_strong(readwrite,nullable)dispatch_queue_t queue;
Prop_strong(nullable)NSTimer *nsTimer;
Prop_strong(nullable)dispatch_source_t gcdTimer;
Prop_strong(nullable)CADisplayLink *displayLink;

@end

@implementation JobsTimer

- (void)dealloc {
    [self _invalidateInternal:YES];
}
#pragma mark - 公共工厂方法
+(instancetype)timerWithInterval:(NSTimeInterval)interval
                         repeats:(BOOL)repeats
                       tickBlock:(nullable JobsTimerTickBlock)tickBlock {
    return [self timerWithInterval:interval
                           repeats:repeats
                              type:JobsTimerTypeGCD
                             queue:NULL
                          tickBlock:tickBlock
                    completionBlock:NULL];
}

+(instancetype)timerWithInterval:(NSTimeInterval)interval
                         repeats:(BOOL)repeats
                            type:(JobsTimerType)type
                           queue:(dispatch_queue_t)queue
                       tickBlock:(nullable JobsTimerTickBlock)tickBlock
                 completionBlock:(nullable JobsTimerCompletionBlock)completionBlock {
    return jobsMakeTimer(^(JobsTimer * _Nullable timer) {
        timer->_type = type;
        timer->_interval = interval;
        timer->_repeats = repeats;
        timer->_tickBlock = [tickBlock copy];
        timer->_completionBlock = [completionBlock copy];
        timer->_queue = queue;
        timer->_state = JobsTimerStateIdle;
    });
}

+(instancetype)after:(NSTimeInterval)delay
               queue:(dispatch_queue_t)queue
          completion:(nullable JobsTimerCompletionBlock)completion {
    return jobsMakeTimer(^(JobsTimer * _Nullable timer) {
        timer->_type = JobsTimerTypeDispatchAfter;
        timer->_interval = delay;
        timer->_repeats = NO;
        timer->_completionBlock = [completion copy];
        timer->_queue = queue;
        timer->_state = JobsTimerStateIdle;
    });
}
#pragma mark - 状态语义糖
- (BOOL)isRunning {
    return self.state == JobsTimerStateRunning;
}

- (BOOL)isPaused {
    return self.state == JobsTimerStatePaused;
}
#pragma mark - 生命周期
- (void)start {
    // 重复调用 start 的时候：先清理旧的
    [self _invalidateInternal:NO];

    switch (self.type) {
        case JobsTimerTypeNSTimer:
            [self startNSTimer];
            break;
        case JobsTimerTypeGCD:
            [self startGCDTimer];
            break;
        case JobsTimerTypeDisplayLink:
            [self startDisplayLink];
            break;
        case JobsTimerTypeDispatchAfter:
            [self startDispatchAfter];
            break;
    }
}

- (void)pause {
    if (self.state != JobsTimerStateRunning) return;

    switch (self.type) {
        case JobsTimerTypeNSTimer:
            [self.nsTimer setFireDate:[NSDate distantFuture]];
            break;
        case JobsTimerTypeGCD:
            if (self.gcdTimer) {
                dispatch_suspend(self.gcdTimer);
            }
            break;
        case JobsTimerTypeDisplayLink:
            self.displayLink.paused = YES;
            break;
        case JobsTimerTypeDispatchAfter:
            // dispatch_after 本身无法暂停，只能用 Canceled 来表达
            // 调用 pause 直接当作取消
            [self invalidate];
            return;
    }
    self.state = JobsTimerStatePaused;
}

- (void)resume {
    if (self.state != JobsTimerStatePaused) return;

    switch (self.type) {
        case JobsTimerTypeNSTimer:
            [self.nsTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:self.interval]];
            break;
        case JobsTimerTypeGCD:
            if (self.gcdTimer) {
                dispatch_resume(self.gcdTimer);
            }
            break;
        case JobsTimerTypeDisplayLink:
            self.displayLink.paused = NO;
            break;
        case JobsTimerTypeDispatchAfter:
            // dispatch_after 无法恢复，忽略
            return;
    }
    self.state = JobsTimerStateRunning;
}

- (void)invalidate {
    [self _invalidateInternal:YES];
}
#pragma mark - 内部销毁逻辑
- (void)_invalidateInternal:(BOOL)markCanceled {
    // NSTimer
    if (self.nsTimer) {
        [self.nsTimer invalidate];
        self.nsTimer = nil;
    }
    // GCD timer
    if (self.gcdTimer) {
        dispatch_source_t source = self.gcdTimer;
        self.gcdTimer = nil;
        // 如果处于暂停状态被 cancel，需要先 resume 一下，否则会 crash
        // 这里简化：尝试 resume，再 cancel
        @try {
            dispatch_resume(source);
        } @catch (__unused NSException *exception) {
            // 已经是 resume 状态，忽略
        }
        dispatch_source_cancel(source);
    }
    // DisplayLink
    if (self.displayLink) {
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
    // dispatch_after：只用 flag 来判断是否有效
    self.dispatchAfterPending = NO;

    if (markCanceled) {
        // 只有外部主动调用 invalidate 才标记为 Canceled
        self.state = JobsTimerStateCanceled;
    } else {
        // 内部重启 / 重新 start 的清理，不改变状态
        if (self.state == JobsTimerStateRunning ||
            self.state == JobsTimerStatePaused) {
            self.state = JobsTimerStateIdle;
        }
    }
}
#pragma mark - NSTimer
-(void)startNSTimer{
    if (self.interval <= 0) self.interval = 1.0;
    self.nsTimer = [NSTimer scheduledTimerWithTimeInterval:self.interval
                                                    target:self
                                                  selector:@selector(handleTick)
                                                  userInfo:nil
                                                   repeats:self.repeats];
    // 默认加到当前 RunLoop 的 common modes
    [NSRunLoop.currentRunLoop addTimer:self.nsTimer forMode:NSRunLoopCommonModes];

    self.state = JobsTimerStateRunning;
}
#pragma mark - GCD timer
-(void)startGCDTimer{
    if (self.interval <= 0) self.interval = 1.0;

    dispatch_queue_t queue = self.queue;
    if (!queue) {
        queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }

    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    self.gcdTimer = timer;

    uint64_t intervalNSEC = (uint64_t)(self.interval * NSEC_PER_SEC);
    dispatch_source_set_timer(timer,
                              dispatch_time(DISPATCH_TIME_NOW, intervalNSEC),
                              intervalNSEC,
                              (uint64_t)(0.1 * NSEC_PER_SEC));

    __weak typeof(self) weakSelf = self;
    dispatch_source_set_event_handler(timer, ^{
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) return;
        [strongSelf handleTickOnQueue];
    });

    dispatch_resume(timer);
    self.state = JobsTimerStateRunning;
}
/// 在 GCD 队列上触发
-(void)handleTickOnQueue{
    if (self.tickBlock) {
        self.tickBlock(self);
    }

    if (!self.repeats) {
        // 非重复：触发一次后标记 Finished，并执行 completion
        [self _invalidateInternal:NO];
        self.state = JobsTimerStateFinished;
        JobsTimerCompletionBlock completion = self.completionBlock;
        if (completion) completion(self);
    }
}
#pragma mark - CADisplayLink
- (void)startDisplayLink {
    // interval 对 DisplayLink 来说不是特别精确，这里只用作语义字段
    self.displayLink = [CADisplayLink displayLinkWithTarget:self
                                                   selector:@selector(handleTick)];
    // 如果希望近似 interval，可以换算为 frameRate 再设置 preferredFramesPerSecond
    // 这里简单处理：使用默认刷新频率
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop]
                           forMode:NSRunLoopCommonModes];
    self.state = JobsTimerStateRunning;
}
#pragma mark - dispatch_after
-(void)startDispatchAfter{
    if (self.interval <= 0) self.interval = 0.0;

    dispatch_queue_t queue = self.queue;
    if (!queue) queue = dispatch_get_main_queue();

    self.dispatchAfterPending = YES;
    self.state = JobsTimerStateRunning;

    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                 (int64_t)(self.interval * NSEC_PER_SEC)),
                   queue, ^{
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) return;
        if (!strongSelf.dispatchAfterPending) return; // 已经被取消

        strongSelf.dispatchAfterPending = NO;
        strongSelf.state = JobsTimerStateFinished;

        if (strongSelf.tickBlock) strongSelf.tickBlock(strongSelf);
        if (strongSelf.completionBlock) strongSelf.completionBlock(strongSelf);
    });
}
#pragma mark - 统一 Tick 入口（主线程）
-(void)handleTick {
    if (self.tickBlock) self.tickBlock(self);
    if (!self.repeats) {
        [self _invalidateInternal:NO];
        self.state = JobsTimerStateFinished;
        JobsTimerCompletionBlock completion = self.completionBlock;
        if (completion) {
            completion(self);
        }
    }
}

@end
