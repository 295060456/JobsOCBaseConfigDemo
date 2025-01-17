//
//  DispatchTimerManager.m
//  SelectorBlock
//
//  Created by Jobs on 2021/4/16.
//

#import "DispatchTimerManager.h"

@interface DispatchTimerManager ()

Prop_assign()BOOL valid;

@end

@implementation DispatchTimerManager
BaseProtocol_synthesize_timer
@synthesize target = _target;
-(void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
    /*
     dispatch_suspend 和 dispatch_resume 应该是成对出现的。
     两者分别会减少和增加 dispatch 对象的挂起计数
     但是没有 API 获取当前是挂起还是执行状态，所以需要自己记录
     
     ❤️暂停dispatch定时器计时【特别注意：dispatch_suspend 之后的 Timer，是不能被释放的，否则会引起崩溃】
     **/
    if (self.state == DispatchTimerState_init ||
        self.state == DispatchTimerState_suspend) {
        [self resume];
    }
    
    [self invalidate];
}

+(DispatchTimerManager *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                                 target:(id)target
                                               selector:(SEL)selector
                                               userInfo:(nullable id)userInfo
                                                repeats:(BOOL)repeats {
    DispatchTimerManager *timer = [DispatchTimerManager.alloc initWithTimeInterval:0
                                                                          interval:interval
                                                                            target:target
                                                                          selector:selector
                                                                          userInfo:userInfo
                                                                           repeats:repeats];
    [timer resume];
    return timer;
}

+(DispatchTimerManager *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                                repeats:(BOOL)repeats
                                                  block:(void (^)(DispatchTimerManager *timer))block {
    NSParameterAssert(block);
    DispatchTimerManager *timer = [DispatchTimerManager.alloc initWithTimeInterval:0
                                                                          interval:interval
                                                                            target:self
                                                                          selector:@selector(executeBlockFromTimer:)
                                                                          userInfo:[block copy]
                                                                           repeats:repeats];
    [timer resume];
    return timer;
}

-(instancetype)initWithTimeInterval:(NSTimeInterval)start
                           interval:(NSTimeInterval)interval
                             target:(id)target
                           selector:(SEL)selector
                           userInfo:(nullable id)userInfo
                            repeats:(BOOL)repeats {
    if (self = [super init]) {
        self.startTime = start;
        self.timeInterval = interval;
        self.repeats = repeats;
        self.weak_target = target;
        self.selector = selector;
        self.userInfo = userInfo;
        [self createDispatchTimer];
    }return self;
}

-(void)createDispatchTimer{
    self.state = DispatchTimerState_init;
    self.valid = YES;
    dispatch_source_set_timer(self.dispatchTimer,
                              dispatch_time(DISPATCH_TIME_NOW, self.startTime * NSEC_PER_SEC),
                              self.timeInterval * NSEC_PER_SEC,
                              0);
    @jobs_weakify(self)
    dispatch_source_set_event_handler(self.dispatchTimer, ^{
        @jobs_strongify(self)
        [self fire];
    });
}

- (void)fire {
    if (!_valid) {return;}
    if (!self.weak_target) {
        [self invalidate];
    } else {
        // 执行selector
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.weak_target performSelector:self.selector withObject:self];
#pragma clang diagnostic pop
        if (!self.repeats) {
            [self invalidate];
        }
    }
}
/// 启动
- (void)resume {
    if (self.running) return;
    self.state = DispatchTimerState_resume;
    dispatch_resume(self.dispatchTimer);// 恢复dispatch定时器计时
    self.running = YES;
}
/// 暂停
- (void)suspend {
    if (!self.running) return;
    self.state = DispatchTimerState_suspend;
    dispatch_suspend(self.dispatchTimer);// ❤️暂停dispatch定时器计时【特别注意：dispatch_suspend 之后的 Timer，是不能被释放的，否则会引起崩溃】
    self.running = NO;
}
/// 关闭
- (void)invalidate {
    lock(if (self.valid) {
        dispatch_source_cancel(self.dispatchTimer);// 真正意义上的停止dispatch定时器计时
        _dispatchTimer = NULL;
        _target = NULL;
        _userInfo = NULL;
        _valid = NO;
    })
}

+(void)executeBlockFromTimer:(DispatchTimerManager *)aTimer {
    void (^block)(DispatchTimerManager *) = aTimer.userInfo;
    if (block) block(aTimer);
}
// 后续添加queue支持
dispatch_source_t CreateDispatchTimer(uint64_t interval,
                                      uint64_t leeway,
                                      dispatch_queue_t queue,
                                      dispatch_block_t block){
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,
                                                     0,
                                                     0,
                                                     queue);
    if (timer){
        dispatch_source_set_timer(timer,
                                  /*
                                   1、使用 dispatch_time 或者 DISPATCH_TIME_NOW：系统会使用默认时钟来进行计时；然而当系统休眠的时候，默认时钟是不走的，也就会导致计时器停止
                                   2、使用 dispatch_walltime ：可以让计时器按照真实时间间隔进行计时
                                   **/
                                  dispatch_walltime(NULL, 0),
                                  interval,
                                  /*
                                      指的是一个期望的容忍时间。
                                      将它设置为 1 秒，意味着系统有可能在定时器时间到达的前 1 秒或者后 1 秒才真正触发定时器。
                                      在调用时推荐设置一个合理的 leeway 值。
                                      需要注意，就算指定 leeway 值为 0，系统也无法保证完全精确的触发时间，只是会尽可能满足这个需求。
                                   */
                                  leeway);
        dispatch_source_set_event_handler(timer, block);
        dispatch_resume(timer);// 恢复dispatch定时器计时
    }return timer;
}
#pragma mark —— lazyLoad
-(dispatch_semaphore_t)semaphore{
    if (!_semaphore) {
        _semaphore = dispatch_semaphore_create(1);
    }return _semaphore;
}

-(dispatch_source_t)dispatchTimer{
    if (!_dispatchTimer) {
        _dispatchTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,
                                                0,
                                                0,
                                                dispatch_get_main_queue());
    }return _dispatchTimer;
}

@end
