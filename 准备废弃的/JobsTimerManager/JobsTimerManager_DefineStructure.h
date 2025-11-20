//
//  JobsTimerManager_DefineStructure.h
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#ifndef JobsTimerManager_DefineStructure_h
#define JobsTimerManager_DefineStructure_h
/// 倒计时模式
#ifndef TimerStyle_h
#define TimerStyle_h
typedef NS_ENUM(NSUInteger, TimerStyle) {
    TimerStyle_clockwise = 0,/// 顺时针模式
    TimerStyle_anticlockwise/// 逆时针模式（倒计时模式）
};
#endif /* TimerStyle_h */
/// 用哪一种模式进行初始化NSTimer定时器
#ifndef ScheduledTimerType_h
#define ScheduledTimerType_h
typedef NS_ENUM(NSUInteger, ScheduledTimerType) {
    ScheduledTimerType_0 = 0,/// scheduledTimerWithTimeInterval/repeats/block
    ScheduledTimerType_1,/// scheduledTimerWithTimeInterval/invocation/repeats
    ScheduledTimerType_2/// scheduledTimerWithTimeInterval/target/selector/userInfo/repeats
};
#endif /* ScheduledTimerType_h */
/// NSTimer定时器当前状态
#ifndef NSTimerCurrentStatus_h
#define NSTimerCurrentStatus_h
typedef NS_ENUM(NSUInteger, NSTimerCurrentStatus) {
    NSTimerCurrentStatusUnknow = 0, /// 定时器未知状态
    NSTimerCurrentStatusRun, /// 定时器正在运行
    NSTimerCurrentStatusStop, /// 定时器停止
    NSTimerCurrentStatusPause, /// 定时器暂停
    NSTimerCurrentStatusDestroy/// 定时器销毁
};
#endif /* NSTimerCurrentStatus_h */

#endif /* JobsTimerManager_DefineStructure_h */
