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
#endif /* JobsTimeInterval */
/// 一天的秒数
#ifndef 一天的秒数
#define 一天的秒数 (24.f * 60.f * 60.f)
#endif /* 一天的秒数 */
/// 平年一年的秒数
#ifndef 平年一年的秒数
#define 平年一年的秒数 (365 * 一天的秒数)
#endif /* 平年一年的秒数 */
/// 闰年一年的秒数
#ifndef 闰年一年的秒数
#define 闰年一年的秒数 (366 * 一天的秒数)
#endif /* 闰年一年的秒数 */
/// 秒数
#ifndef JobsSeconds
#define JobsSeconds(Days) (一天的秒数 * (Days))
#endif /* JobsSeconds */
/// 一天的毫秒数
#ifndef 一天的毫秒数
#define 一天的毫秒数 (一天的秒数 * 1000.f)
#endif /* 一天的毫秒数 */
/// 毫秒数
#ifndef JobsMilliSecs
#define JobsMilliSecs(Days) (一天的毫秒数 * (Days))
#endif /* JobsMilliSecs */

#endif /* MacroDef_Time_h */
