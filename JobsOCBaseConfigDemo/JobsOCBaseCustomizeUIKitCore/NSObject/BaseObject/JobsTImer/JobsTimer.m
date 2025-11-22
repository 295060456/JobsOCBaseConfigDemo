//
//  JobsTimer.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/11/19.
//

#import "JobsTimer.h"

@interface JobsTimer ()
/// YES  = 已经 suspend 了
/// NO   = 正在运行 / 已经 resume
Prop_assign()BOOL gcdTimerSuspended;

@end

@implementation JobsTimer
TimerProtocol_synthesize_lock
-(void)dealloc {
    // 统一走内部销毁逻辑，标记为 Canceled
    self.invalidateInternal(YES);
}
#pragma mark —— TimerProtocol 状态语义
/// 定时器@当前状态
-(void)setTimerState:(JobsTimerState)timerState{
    _timerState = timerState;
    // 同步派生状态
    _running = (timerState == JobsTimerStateRunning);
    _paused  = (timerState == JobsTimerStatePaused);
    _stop    = (timerState == JobsTimerStateFinished ||
                timerState == JobsTimerStateCanceled);
}

-(BOOL)isRunning{ return _running;}
-(BOOL)isPaused{ return _paused;}
-(BOOL)isStop{ return _stop;}

#pragma mark —— TimerProtocol
/// 启动计时器
-(void)start{
    // 重复调用 start：先清理旧的底层定时器
    self.invalidateInternal(NO);

    self.accumulatedElapsed = 0; // 已经流逝的时间（总 elapsed，单位秒）
    self.lastStartDate      = NSDate.date;

    // 倒计时模式：startTime > 0 时，time 表示剩余时间，初始化为 startTime
    if (self.startTime > 0) {
        self.time = self.startTime;
    } else {
        // 非倒计时模式：time 表示已流逝时间
        self.time = 0;
    }
    @jobs_weakify(self)
    [self delayByMainQueue:self.timeSecIntervalSinceDate block:^(uint64_t data) {
        @jobs_strongify(self)
        switch (self.timerType) {
            case JobsTimerTypeNSTimer:      [self startNSTimer];      break;
            case JobsTimerTypeGCD:          [self startGCDTimer];     break;
            case JobsTimerTypeDisplayLink:  [self startDisplayLink];  break;
        }
    }];
}
/// 暂停计时器
-(void)pause{
    if (!self.isRunning) return;
    // 更新一次时间，并冻结基准时间
    [self updateElapsedAndMaybeRemaining];
    self.lastStartDate = nil;

    switch (self.timerType) {
        case JobsTimerTypeNSTimer:
            self.nsTimer.fireDate = NSDate.distantFuture;
            break;
        case JobsTimerTypeGCD:
            if (self.gcdTimer && !self.gcdTimerSuspended) {
                dispatch_suspend(self.gcdTimer);
                self.gcdTimerSuspended = YES;
            }
            break;
        case JobsTimerTypeDisplayLink:
            self.displayLink.paused = YES;
            break;
    }
    self.timerState = JobsTimerStatePaused;
}
/// 恢复计时器
-(void)resume{
    if (!self.isPaused) return;
    // 恢复时间基准：倒计时模式 & 剩余时间 > 0，或者普通模式
    if (!self.lastStartDate &&
        (self.startTime <= 0 || self.time > 0)) {
        self.lastStartDate = NSDate.date;
    }

    switch (self.timerType) {
        case JobsTimerTypeNSTimer:
            self.nsTimer.fireDate = [NSDate dateWithTimeIntervalSinceNow:self.timeInterval];
            break;
        case JobsTimerTypeGCD:
            if (self.gcdTimer && self.gcdTimerSuspended) {
                dispatch_resume(self.gcdTimer);
                self.gcdTimerSuspended = NO;
            }
            break;
        case JobsTimerTypeDisplayLink:
            self.displayLink.paused = NO;
            break;
    }
    self.timerState = JobsTimerStateRunning;
}
/// 停止计时器（销毁@有回调）
-(void)fireOnce{
    [self handleTick];
}
/// 停止计时器（销毁@无回调）
-(void)stop{
    // 对外统一销毁入口（TimerProtocol 的 stop）
    self.invalidateInternal(YES);
}
#pragma mark —— 时间推进 & 倒计时辅助
/// 根据当前时间推进一次 elapsed，并根据模式更新 time：
/// - 倒计时模式：startTime > 0、time = 剩余时间
/// - 普通模式：   startTime = 0、time = 已流逝时间
-(void)updateElapsedAndMaybeRemaining{
    if (!self.lastStartDate) return;

    NSDate *now = NSDate.date;
    NSTimeInterval delta = [now timeIntervalSinceDate:self.lastStartDate];
    if (delta < 0) delta = 0;

    self.lastStartDate      = now;
    self.accumulatedElapsed += delta;

    if (self.startTime > 0) {
        // 倒计时模式：time 表示剩余时间
        NSTimeInterval remaining = self.startTime - self.accumulatedElapsed;
        if (remaining < 0) remaining = 0;
        self.time = remaining;
    } else {
        // 普通模式：time 表示已流逝时间
        self.time = self.accumulatedElapsed;
    }
}
/// 在每次 tick 时更新倒计时剩余时间，返回 YES 表示已经归零，应结束
-(BOOL)updateCountdownOnTickIfNeeded{
    // 推进一次时间
    [self updateElapsedAndMaybeRemaining];
    // 非倒计时模式
    if (self.startTime <= 0) return NO;
    return self.time <= 0;
}

-(double)countdownTimerProgress{
    // 只有倒计时模式才有 progress 语义
    if (self.startTime <= 0) return 0;

    double remaining = self.time;
    if (remaining < 0) remaining = 0;
    if (remaining > self.startTime) remaining = self.startTime;

    double done = self.startTime - remaining; // 已完成时长
    return self.startTime > 0 ? (done / self.startTime) : 0;
}
#pragma mark —— 内部销毁逻辑
/// 这里不用弱化self，因为是销毁阶段，不存在循环引用
- (jobsByBOOLBlock _Nonnull)invalidateInternal {
    return ^(BOOL markCanceled){
        // NSTimer
        if (self->_nsTimer) {
            [self->_nsTimer invalidate];
            self->_nsTimer = nil;
        }
        // GCD timer
        if (self->_gcdTimer) {
            dispatch_source_t source = self.gcdTimer;
            self->_gcdTimer = nil;
            // 如果处于暂停状态被 cancel，需要先 resume，否则会 crash
            @try {
                if (self.gcdTimerSuspended) {
                    dispatch_resume(source);
                    self.gcdTimerSuspended = NO;
                }
                dispatch_source_cancel(source);
            } @catch (__unused NSException *exception) {
                NSLog(@"JobsTimer GCD cancel exception = %@", exception);
            }
        }
        // DisplayLink
        if (self->_displayLink) {
            [self->_displayLink invalidate];
            self->_displayLink = nil;
        }
        // 内部时间清理
        self.lastStartDate      = nil;
        self.accumulatedElapsed = 0;
        self.time               = 0;   // 剩余/已用时间清零；startTime 保留作为“配置”

        if (markCanceled) {
            // 只有外部主动调用 stop / invalidate 才标记为 Canceled
            self.timerState = JobsTimerStateCanceled;
        } else {
            // 内部为了重启做的清理，回到 Idle
            if (self.timerState == JobsTimerStateRunning ||
                self.timerState == JobsTimerStatePaused) {
                self.timerState = JobsTimerStateIdle;
            }
        }
    };
}
#pragma mark —— NSTimer
-(void)startNSTimer{
    // 默认加到当前 RunLoop 的 common modes
    [NSRunLoop.currentRunLoop addTimer:self.nsTimer forMode:self.runLoopMode];
    self.timerState = JobsTimerStateRunning;
}
#pragma mark —— GCD timer
- (void)startGCDTimer {
    if (self.timeInterval <= 0) self.timeInterval = 1.0;
    uint64_t intervalNSEC = (uint64_t)(self.timeInterval * NSEC_PER_SEC);
    if (!self.queue) self.queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_set_timer(self.gcdTimer,
                              dispatch_time(DISPATCH_TIME_NOW, intervalNSEC),
                              intervalNSEC,
                              (uint64_t)(0.1 * NSEC_PER_SEC));

    @jobs_weakify(self)
    dispatch_source_set_event_handler(self.gcdTimer, ^{
        @jobs_strongify(self)
        BOOL countdownFinished = [self updateCountdownOnTickIfNeeded];
        if (self.onTicker) self.onTicker(self);
        if (countdownFinished) {
            self.invalidateInternal(NO);
            self.timerState = JobsTimerStateFinished;
            if (self.onFinisher) self.onFinisher(self);
        }
    });
    dispatch_resume(self.gcdTimer);
    self.gcdTimerSuspended = NO;
    self.timerState = JobsTimerStateRunning;
}
#pragma mark —— CADisplayLink
-(void)startDisplayLink{
    [self.displayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:self.runLoopMode];
    self.timerState = JobsTimerStateRunning;
}
#pragma mark —— LazyLoad
-(NSTimer *)nsTimer{
    if(!_nsTimer){
        _nsTimer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval
                                                    target:self
                                                  selector:@selector(handleTick)
                                                  userInfo:nil
                                                   repeats:self.repeats];
    }return _nsTimer;
}

-(dispatch_source_t)gcdTimer{
    if(!_gcdTimer){
        _gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, self.queue);
    }return _gcdTimer;
}

-(CADisplayLink *)displayLink{
    if(!_displayLink){
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleTick)];
    }return _displayLink;
}

-(NSRunLoopMode)runLoopMode{
    if(!_runLoopMode){
        _runLoopMode = NSRunLoopCommonModes;
    }return _runLoopMode;
}

-(NSTimeInterval)timeInterval{
    if(_timeInterval <= 0){
        _timeInterval = 1.0;
    }return _timeInterval;
}
/// 如果用于：UI刷新（高频需求）👉 dispatch_get_main_queue();
/// 如果用于：重计算 / IO 👉 dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
-(dispatch_queue_t)queue{
    if(!_queue){
        _queue = dispatch_get_main_queue();
    }return _queue;
}

-(BOOL)repeats{
    return YES;
}
#pragma mark —— 统一 Tick 入口
-(void)handleTick{
    BOOL countdownFinished = [self updateCountdownOnTickIfNeeded];// 在每次 tick 时更新倒计时剩余时间，返回 YES 表示已经归零，应结束
    if (self.onTicker) self.onTicker(self);
    if (countdownFinished) {
        self.invalidateInternal(NO);
        self.timerState = JobsTimerStateFinished;
        if (self.onFinisher) self.onFinisher(self);
    }
}
#pragma mark —— TimerProtocol
JobsKey(_onTicker)
@dynamic onTicker;
-(JobsTimerBlock)onTicker{
    return Jobs_getAssociatedObject(_onTicker);
}

-(void)setOnTicker:(JobsTimerBlock)onTicker{
    Jobs_setAssociatedCOPY_NONATOMIC(_onTicker, onTicker)
}

JobsKey(_onFinisher)
@dynamic onFinisher;
-(JobsTimerBlock)onFinisher{
    return Jobs_getAssociatedObject(_onFinisher);
}

-(void)setOnFinisher:(JobsTimerBlock)onFinisher{
    Jobs_setAssociatedCOPY_NONATOMIC(_onFinisher, onFinisher)
}
#pragma mark —— DSL 配置链式语法
-(JobsRetTimerByType _Nonnull)timerTypeBy{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(JobsTimerType timerType){
        @jobs_strongify(self)
        self.timerType = timerType;
        return self;
    };
}

-(JobsRetTimerByTimerStyle _Nonnull)timerStyleBy{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(TimerStyle style){
        @jobs_strongify(self)
        self.timerStyle = style;
        return self;
    };
}

-(JobsRetTimerByTimeInterval _Nonnull)timeIntervalBy{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSTimeInterval interval){
        @jobs_strongify(self)
        self.timeInterval = interval;
        return self;
    };
}

-(JobsRetTimerByStartTime _Nonnull)startTimeBy{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSTimeInterval startTime){
        @jobs_strongify(self)
        self.startTime = startTime;
        return self;
    };
}

-(JobsRetTimerByTime _Nonnull)timeBy{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(CGFloat time){
        @jobs_strongify(self)
        self.time = time;
        return self;
    };
}

-(JobsRetTimerByDelay _Nonnull)timeSecIntervalSinceDateBy{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSTimeInterval delay){
        @jobs_strongify(self)
        self.timeSecIntervalSinceDate = delay;
        return self;
    };
}

-(JobsRetTimerByRunLoopMode _Nonnull)runLoopModeBy{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSRunLoopMode mode){
        @jobs_strongify(self)
        self.runLoopMode = mode;
        return self;
    };
}

-(JobsRetTimerByUserInfo _Nonnull)userInfoBy{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(id userInfo){
        @jobs_strongify(self)
        self.userInfo = userInfo;
        return self;
    };
}

-(JobsRetTimerByQueue _Nonnull)queueBy{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(dispatch_queue_t queue){
        @jobs_strongify(self)
        self.queue = queue;
        return self;
    };
}

-(JobsRetTimerByTimerState _Nonnull)timerStateBy{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(JobsTimerState state){
        @jobs_strongify(self)
        self.timerState = state;
        return self;
    };
}

-(JobsRetTimerByOnTicker _Nonnull)onTickerBy{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(JobsTimerBlock block){
        @jobs_strongify(self)
        self.onTicker = block;
        return self;
    };
}

-(JobsRetTimerByOnFinisher _Nonnull)onFinisherBy{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(JobsTimerBlock block){
        @jobs_strongify(self)
        self.onFinisher = block;
        return self;
    };
}

-(JobsRetTimerByOnTick _Nonnull)onTickBy{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(JobsRetTimerProtocolIDByTimerBlocks block){
        @jobs_strongify(self)
        self.onTick = block;
        return self;
    };
}

-(JobsRetTimerByOnFinish _Nonnull)onFinishBy{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(JobsRetTimerProtocolIDByTimerBlocks block){
        @jobs_strongify(self)
        self.onFinish = block;
        return self;
    };
}

@end
