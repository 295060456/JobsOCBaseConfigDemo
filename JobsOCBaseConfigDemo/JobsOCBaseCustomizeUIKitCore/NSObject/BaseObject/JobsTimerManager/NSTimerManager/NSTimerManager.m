//
//  NSTimerManager.m
//  Timer
//
//  Created by Jobs on 2020/9/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "NSTimerManager.h"

@interface NSTimerManager ()
/// Data
@property(nonatomic,strong)NSDate *date;
@property(nonatomic,assign)NSTimerCurrentStatus timerCurrentStatus;// 定时器当前状态

@end

@implementation NSTimerManager
BaseProtocol_synthesize_timer
-(void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    if (_timer) self.nsTimeDestroy();
}

- (instancetype)init{
    if (self = [super init]) {
        
    }return self;
}
#pragma mark —— 一些私有化方法
-(jobsByVoidBlock _Nonnull)callBackRunning{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.timerProcessType = TimerProcessType_Running;
        if (self.objectBlock) self.objectBlock(self);
    };
}

-(jobsByVoidBlock _Nonnull)callBackEnd{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.timerProcessType = TimerProcessType_Stop;
        if (self.objectBlock) self.objectBlock(self);
    };
}
/// 定时器启动：newTimer + 系统自动添加到RunLoop
-(JobsReturnTimerByVoidBlock _Nonnull)nsTimeStartSysAutoInRunLoop{
    @jobs_weakify(self)
    return ^NSTimer *_Nullable() {
        @jobs_strongify(self)
        switch (self.timerType) {
            case ScheduledTimerType_0:{
                @jobs_weakify(self)
                if (!self->_timer) {
                    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval
                                                                 repeats:self.repeats
                                                                   block:^(NSTimer * _Nonnull timer) {//在block里面进行内循环
                        @jobs_strongify(self)
                        // 时间处理完再回调出去
                        switch (self.timerStyle) {
                            case TimerStyle_clockwise:{//顺时针模式
                                self.anticlockwiseTime += self.timeInterval;
                                self.callBackRunning();
                            }break;
                            case TimerStyle_anticlockwise:{//逆时针模式（倒计时）
                                self.anticlockwiseTime -= self.timeInterval;
                                if (self.anticlockwiseTime >= 1) {
                                    self.callBackRunning();
                                }else{
                                    if (weak_self.timer) {
                                        weak_self.nsTimeDestroy();
                                        self.callBackEnd();
                                    }
                                }
                            }break;
                                
                            default:
                                break;
                        }
                    }];self.timerCurrentStatus = NSTimerCurrentStatusRun;
                }
            }break;
            case ScheduledTimerType_1:{
                if (!self->_timer) {
                    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval
                                                              invocation:self.invocation
                                                                 repeats:self.repeats];
                    self.timerCurrentStatus = NSTimerCurrentStatusRun;
                }
            }break;
            case ScheduledTimerType_2:{
                if (!self->_timer) {
                    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval
                                                                  target:self.weak_target
                                                                selector:self.selector
                                                                userInfo:self.userInfo
                                                                 repeats:self.repeats];
                    self.timerCurrentStatus = NSTimerCurrentStatusRun;
                }
            }break;

            default:{
                self.timer = nil;
            }break;
        }return self.timer;
    };
}
/// 定时器启动 手动添加定时器到RunLoop
-(jobsByRunLoopBlock _Nonnull)nsTimeStartWithRunLoop{
    @jobs_weakify(self)
    return ^(NSRunLoop *runLoop) {
        @jobs_strongify(self)
        if (!runLoop) runLoop = NSRunLoop.mainRunLoop;
        runLoop.commonModesByTimer(self.timer);
    };
}
/// 定时器暂停
-(jobsByVoidBlock _Nonnull)nsTimePause{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        if (self->_timer) {
            self->_timer.fireDate = NSDate.distantFuture;
            self.timerCurrentStatus = NSTimerCurrentStatusPause;
        }
    };
}
/// 定时器继续
-(jobsByVoidBlock _Nonnull)nsTimecontinue{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        if (self->_timer) {
            self->_timer.fireDate = NSDate.distantPast;
            self.timerCurrentStatus = NSTimerCurrentStatusRun;
        }
    };
}
/// 销毁定时器
-(jobsByVoidBlock _Nonnull)nsTimeDestroy{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        if (self->_timer) {
            [self->_timer invalidate];//这个是唯一一个可以将计时器从runloop中移出的方法
            self->_timer = nil;
            self.timerCurrentStatus = NSTimerCurrentStatusDestroy;
        }
    };
}
#pragma mark —— lazyLoad
//@synthesize target = _target;
//-(id)target{
//    @jobs_weakify(self)
//    if (!_target) {
//        _target = weak_self;
//    }return _target;
//}

-(NSTimer *)timer{
    if (!_timer) {
        @jobs_weakify(self)
        _timer = [NSTimer.alloc initWithFireDate:self.date
                                        interval:self.timeInterval
                                         repeats:self.repeats
                                           block:^(NSTimer * _Nonnull timer) {
            @jobs_strongify(self)
            switch (self.timerStyle) {
                case TimerStyle_clockwise:{//顺时针模式
                    self.callBackRunning();
                }break;
                case TimerStyle_anticlockwise:{//逆时针模式（倒计时）
                    if (self.anticlockwiseTime >= 1) {
                        self.callBackRunning();
                        self.anticlockwiseTime -= self.timeInterval;
                    }else{
                        self.nsTimeDestroy();
                        self.callBackEnd();
                    }
                }break;
                    
                default:
                    break;
            }
        }];self.timerCurrentStatus = NSTimerCurrentStatusRun;
    }return _timer;
}

-(NSDate *)date{
    if (!_date) {
        _date = self.getDateFromCurrentAfterTimeInterval(self.timeSecIntervalSinceDate);
    }return _date;
}

-(NSTimeInterval)timeInterval{
    if (_timeInterval == 0) {
        _timeInterval = 1.0f;
    }return _timeInterval;
}

-(BOOL)repeats{
    if (!_repeats) {
        _repeats = YES;
    }return _repeats;
}

-(NSInvocation *)invocation{
    if (!_invocation) {
        /// TODO
    }return _invocation;
}

-(TimerStyle)timerStyle{
    if (_timerStyle == TimerStyle_anticlockwise) {
        self.repeats = YES;
    }return _timerStyle;
}

@end

#pragma mark —— 系统Api暴露出来的未被废弃的 NSTimer 的初始化方法有如下几种:

//+(NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
//                                invocation:(NSInvocation *)invocation
//                                   repeats:(BOOL)yesOrNo;
//+(NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
//                                    target:(id)aTarget
//                                  selector:(SEL)aSelector
//                                  userInfo:(nullable id)userInfo//????
//                                   repeats:(BOOL)yesOrNo;
//+(NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
//                                   repeats:(BOOL)repeats
//                                     block:(void (^)(NSTimer *timer))block;

/*
*   scheduledTimerWithTimeInterval相比它的小伙伴们不仅仅是创建了NSTimer对象,
*   还把该对象加入到了当前的runloop中
*   runloop的模式为默认模式（NSRunLoopCommonModes）!
*   NSTimer只有被加入到runloop, 才会生效, 即NSTimer才会被真正执行
*/

//+(NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti
//                       invocation:(NSInvocation *)invocation
//                          repeats:(BOOL)yesOrNo;

//+(NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti
//                           target:(id)aTarget
//                         selector:(SEL)aSelector
//                         userInfo:(nullable id)userInfo//????
//                          repeats:(BOOL)yesOrNo;

//+(NSTimer *)timerWithTimeInterval:(NSTimeInterval)interval
//                          repeats:(BOOL)repeats
//                            block:(void (^)(NSTimer *timer))block;

//-(instancetype)initWithFireDate:(NSDate *)date
//                       interval:(NSTimeInterval)interval
//                        repeats:(BOOL)repeats
//                          block:(void (^)(NSTimer *timer))block;
