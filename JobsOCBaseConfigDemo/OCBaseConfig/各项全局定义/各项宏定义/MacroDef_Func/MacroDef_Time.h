//
//  MacroDef_Time.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#ifndef MacroDef_Time_h
#define MacroDef_Time_h
#pragma mark —— 时间相关
/// 时间间隔
#ifndef JobsTimeInterval
#define JobsTimeInterval (1.f)
#endif
/// 一天的秒数
#ifndef JobsDayBySecs
#define JobsDayBySecs (24.f * 60.f * 60.f)
#endif
/// 秒数
#ifndef JobsSeconds
#define JobsSeconds(Days) (24.f * 60.f * 60.f * (Days))
#endif
/// 一天的毫秒数
#ifndef JobsDayByMilliSecs
#define JobsDayByMilliSecs (24.f * 60.f * 60.f * 1000.f)
#endif
/// 毫秒数
#ifndef JobsMilliSecs
#define JobsMilliSecs(Days) (24.f * 60.f * 60.f * 1000.f * (Days))
#endif

#endif /* MacroDef_Time_h */
