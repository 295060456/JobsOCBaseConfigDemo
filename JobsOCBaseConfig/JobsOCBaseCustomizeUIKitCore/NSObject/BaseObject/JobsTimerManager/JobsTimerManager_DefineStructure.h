//
//  JobsTimerManager_DefineStructure.h
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#ifndef JobsTimerManager_DefineStructure_h
#define JobsTimerManager_DefineStructure_h

typedef enum : NSUInteger {
    /// 顺时针模式
    TimerStyle_clockwise = 0,
    /// 逆时针模式（倒计时模式）
    TimerStyle_anticlockwise
} TimerStyle;

// 用哪一种模式进行初始化NSTimer定时器
typedef enum : NSUInteger {
    /// scheduledTimerWithTimeInterval/repeats/block
    ScheduledTimerType_0 = 0,
    /// scheduledTimerWithTimeInterval/invocation/repeats
    ScheduledTimerType_1,
    /// scheduledTimerWithTimeInterval/target/selector/userInfo/repeats
    ScheduledTimerType_2
} ScheduledTimerType;
// NSTimer定时器当前状态
typedef enum : NSUInteger {
    /// 定时器未知状态
    NSTimerCurrentStatusUnknow = 0,
    /// 定时器正在运行
    NSTimerCurrentStatusRun = 1,
    /// 定时器停止
    NSTimerCurrentStatusStop = 2,
    /// 定时器暂停
    NSTimerCurrentStatusPause = 3,
    /// 定时器销毁
    NSTimerCurrentStatusDestroy = 4
} NSTimerCurrentStatus;

#endif /* JobsTimerManager_DefineStructure_h */
