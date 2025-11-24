//
//  TimerProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/20/25.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "DefineProperty.h"
#import "JobsDefineAllEnumHeader.h"            // 此文件用来存储记录全局的一些枚举
NS_ASSUME_NONNULL_BEGIN
/// iOS系统基本的3大定时器类型@其他类型的定时器均由此二次封装而成（NSTimer / GCD / CADisplayLink）
#ifndef JOBS_TIMER_TYPE_ENUM_DEFINED
#define JOBS_TIMER_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, JobsTimerType) {
    JobsTimerTypeNSTimer = 0,        // RunLoop 驱动
    JobsTimerTypeGCD,                // dispatch_source_t 定时器
    JobsTimerTypeDisplayLink         // CADisplayLink（帧驱动）
};
#endif /* JOBS_TIMER_TYPE_ENUM_DEFINED */
/// 定时器@当前状态
#ifndef JOBS_TIMER_STATE_ENUM_DEFINED
#define JOBS_TIMER_STATE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, JobsTimerState) {
    JobsTimerStateIdle = 0,          // 初始
    JobsTimerStateRunning,           // 运行中
    JobsTimerStatePaused,            // 暂停
    JobsTimerStateResume,            // 恢复运行状态
    JobsTimerStateFinished,          // 正常结束（非重复模式）
    JobsTimerStateCanceled           // 手动取消或者结束
};
#endif /* JOBS_TIMER_STATE_ENUM_DEFINED */
/// 定时器@模式
#ifndef JOBS_TIMER_STYLE_ENUM_DEFINED
#define JOBS_TIMER_STYLE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, TimerStyle) {
    TimerStyle_clockwise = 0,        /// 顺时针模式
    TimerStyle_anticlockwise         /// 逆时针模式（倒计时模式）
};
#endif /* JOBS_TIMER_STYLE_ENUM_DEFINED */
/// 时间@显示风格
#ifndef SHOW_TIME_TYPE_ENUM_DEFINED
#define SHOW_TIME_TYPE_ENUM_DEFINED
typedef enum : NSUInteger {
    ShowTimeType_SS = 0, // 秒
    ShowTimeType_MMSS,   // 分秒
    ShowTimeType_HHMMSS, // 时分秒
} ShowTimeType;
#endif /* SHOW_TIME_TYPE_ENUM_DEFINED */
/// 计时器协议：只关心“状态 + 控制 + 回调”
@protocol TimerProtocol <NSObject>
@optional
#pragma mark —— 定时器配置
/// 定时器@当前（倒计时模式是剩余）时间
Prop_assign()CGFloat time;
/// 定时器@起始时间：逆时针模式（0⬅startTime）顺时针模式（startTime⮕正无穷）
Prop_assign()NSTimeInterval startTime;
/// 推移时间（秒数）以后执行定时器
Prop_assign()NSTimeInterval timeSecIntervalSinceDate;
/// 跳动步长（频率间距）
Prop_assign()NSTimeInterval timeInterval;
/// 是否重复？
Prop_assign()BOOL repeats;                     // for NSTimer
Prop_strong(nullable)NSInvocation *invocation; // for NSTimer
Prop_assign()NSRunLoopMode runLoopMode;
Prop_strong(nullable)id userInfo;
Prop_assign()ShowTimeType showTimeType;
/// 倒计时进度（0~100%。未启用倒计时模式时为 0）
/// - 倒计时模式：countdownTimerProgress = (startTime - time) / startTime
/// - 普通模式：startTime <= 0 时 progress 固定为 0
Prop_assign(readonly)double countdownTimerProgress;
/// 定时器方向@逆时针？顺时针？
Prop_assign()TimerStyle timerStyle;
/// iOS系统基本的4大定时器类型@其他类型的定时器均由此二次封装而成（NSTimer / GCD / CADisplayLink / dispatch_after）
Prop_assign()JobsTimerType timerType;
/// 已经流逝的时间（总 elapsed，单位秒）
Prop_assign()NSTimeInterval accumulatedElapsed;
/// 最近一次 start/resume 的时间点（支持 pause/resume）
Prop_strong(nullable)NSDate *lastStartDate;
#pragma mark —— 定时器类型
Prop_retain(nullable)NSTimer *nsTimer;           // NSTimer
Prop_retain(nullable)dispatch_source_t gcdTimer; // GCD 定时器使用的队列（若为 nil，则默认 global queue）
Prop_retain(nullable)CADisplayLink *displayLink; // CADisplayLink
/// 如果用于：UI刷新（高频需求）👉 dispatch_get_main_queue();
/// 如果用于：重计算 / IO 👉 dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
Prop_retain(nullable)dispatch_queue_t queue;     //
#pragma mark —— 定时器状态
/// 定时器@当前状态
Prop_assign()JobsTimerState timerState;
/// 当前是否正在运行（包括重启的运行➕新建的运行）
Prop_assign(getter=isRunning)BOOL running;
/// 当前是否处于暂停（可恢复）
Prop_assign(getter=isPaused)BOOL paused;
/// 当前是否处于停止（不可恢复）
Prop_assign(getter=isStop)BOOL stop;
#pragma mark —— 定时器方法
/// 启动计时器（自动启动无非是找准一个时机进行启动）
-(void)start;
/// 暂停计时器
-(void)pause;
/// 恢复计时器
-(void)resume;
/// 停止计时器（销毁@有回调）
-(void)fireOnce;
/// 停止计时器（销毁@无回调）
-(void)stop;
#pragma mark —— 定时器回调
/// 注册回调（每 tick 执行一次）
Prop_copy(nullable)jobsByCGFloatBlock onTick;
/// 注册完成回调（用于一次性定时器或倒计时）
Prop_copy(nullable)JobsTimerBlock onFinish;

-(JobsRetBtnByCGFloatBlocks)byOnTick;
-(JobsRetBtnByJTimerBlocks)byOnFinish;

@end

NS_ASSUME_NONNULL_END

#ifndef TimerProtocol_synthesize_lock
#define TimerProtocol_synthesize_lock \
\
/* ===== 定时器配置 ===== */ \
@synthesize time = _time; \
@synthesize startTime = _startTime; \
@synthesize timeSecIntervalSinceDate = _timeSecIntervalSinceDate; \
@synthesize timeInterval = _timeInterval; \
@synthesize repeats = _repeats; \
@synthesize invocation = _invocation; \
@synthesize runLoopMode = _runLoopMode; \
@synthesize userInfo = _userInfo; \
@synthesize countdownTimerProgress = _countdownTimerProgress; \
@synthesize timerStyle = _timerStyle; \
@synthesize timerType = _timerType; \
@synthesize accumulatedElapsed = _accumulatedElapsed; \
@synthesize lastStartDate = _lastStartDate; \
/* ===== 定时器类型 ===== */ \
@synthesize nsTimer = _nsTimer; \
@synthesize gcdTimer = _gcdTimer; \
@synthesize displayLink = _displayLink; \
@synthesize queue = _queue; \
/* ===== 定时器状态 ===== */ \
@synthesize timerState = _timerState; \
@synthesize running = _running; \
@synthesize paused = _paused; \
@synthesize stop = _stop; \
@synthesize onTick = _onTick; \
@synthesize onFinish = _onFinish; \

#endif /* TimerProtocol_synthesize_lock */

#ifndef TimerProtocol_dynamic
#define TimerProtocol_dynamic \
\
/* ===== 定时器配置 ===== */ \
@dynamic time; \
@dynamic startTime; \
@dynamic timeSecIntervalSinceDate; \
@dynamic timeInterval; \
@dynamic repeats; \
@dynamic invocation; \
@dynamic runLoopMode; \
@dynamic userInfo; \
@dynamic countdownTimerProgress; \
@dynamic timerStyle; \
@dynamic timerType; \
@dynamic accumulatedElapsed; \
@dynamic lastStartDate; \
/* ===== 定时器类型 ===== */ \
@dynamic nsTimer; \
@dynamic gcdTimer; \
@dynamic displayLink; \
@dynamic queue; \
/* ===== 定时器状态 ===== */ \
@dynamic timerState; \
@dynamic running; \
@dynamic paused; \
@dynamic stop; \
@dynamic onTick; \
@dynamic onFinish; \

#endif /* TimerProtocol_dynamic */
