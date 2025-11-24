//
//  JobsTimeModel.h
//  JobsIM
//
//  Created by Jobs on 2020/11/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefineAllEnumHeader.h"            // 此文件用来存储记录全局的一些枚举
#import "DefineProperty.h"
#import "NSTimeZone+Extra.h"
#import "NSString+Conversion.h"

NS_ASSUME_NONNULL_BEGIN
/// 为了防止溢出，基本上时间戳传给后台或者后台返回给我们的都是字符串类型的。
/// 时间戳定义：从1970年1月1日开始计时到现在所经过的时间
@interface JobsTimeModel : NSObject
#pragma mark —— 当前时间：来源iOS系统Api
Prop_assign()CGFloat currentDateOffsetSec;/// 距离当前时间的秒数 【正数为未来、负数为过去】
Prop_strong()NSDate *currentOffsetDate;/// 与currentDateOffsetSec发生作用，表示据当前时间的一个偏差时间的时间
Prop_copy()NSString *currentTimestampStr;/// 获取当前iOS时间戳（字符串格式）
Prop_assign()NSTimeInterval currentTimestampOffsetSec;/// 取当前时间sec秒后的时间戳秒数
Prop_assign()NSTimeInterval currentTimestampSec;/// 获取当前时间的时间戳秒数
Prop_assign()NSTimeInterval currentTimestampOffsetMilliSec;/// 获取当前时间sec秒后的时间戳毫秒数
Prop_assign()NSTimeInterval currentTimestampMilliSec;/// 获取当前时间的时间戳毫秒数
Prop_assign()NSInteger currentEra;/// 当前年代
Prop_assign()NSInteger currentYear;/// 当前年份
Prop_assign()NSInteger currentMonth;/// 当前月份
Prop_assign()NSInteger currentDay;/// 当前日
Prop_assign()NSInteger currentHour;/// 当前小时
Prop_assign()NSInteger currentMin;/// 当前分
Prop_assign()NSInteger currentSec;/// 当前秒
Prop_assign()NSInteger currentNanoSec;/// 当前纳秒
Prop_assign()NSInteger currentWeekday;/// 当前星期几 表示周里面的天 1代表周日 2代表周一 7代表周六
Prop_assign()NSInteger currentWeekdayOrdinal;///
Prop_assign()NSInteger currentQuarter;///
Prop_assign()NSInteger currentWeekOfMonth;/// 该月份的第几周
Prop_assign()NSInteger currentWeekOfYear;/// 该年份的第几周
Prop_assign()NSInteger currentYearForWeekOfYear;///
#pragma mark —— 自定义某一个时间：来源比如说是服务器时间
Prop_strong()NSDate *customDate;
Prop_copy()NSString *customTimestampStr;/// 自定义某一个时间的时间戳（字符串格式）
Prop_assign()NSTimeInterval customTimestampSec;/// 自定义某一个时间的时间戳秒数
Prop_assign()NSTimeInterval customTimestampMilliSec;/// 自定义某一个时间的时间戳毫秒数
Prop_assign()NSInteger customEra;/// 当前年代
Prop_assign()NSInteger customYear;/// 当前年份
Prop_assign()NSInteger customMonth;/// 当前月份
Prop_assign()NSInteger customDay;/// 当前日
Prop_assign()NSInteger customHour;/// 当前小时
Prop_assign()NSInteger customMin;/// 当前分
Prop_assign()NSInteger customSec;/// 当前秒
Prop_assign()NSInteger customNanoSec;/// 当前纳秒
Prop_assign()NSInteger customWeekday;/// 当前星期几 表示周里面的天 1代表周日 2代表周一 7代表周六
Prop_assign()NSInteger customWeekdayOrdinal;///
Prop_assign()NSInteger customQuarter;///
Prop_assign()NSInteger customWeekOfMonth;/// 该月份的第几周
Prop_assign()NSInteger customWeekOfYear;/// 该年份的第几周
Prop_assign()NSInteger customYearForWeekOfYear;///
#pragma mark —— 时区
Prop_strong()NSTimeZone *localTimeZone;/// 手机当前时区
Prop_copy()NSString *customTimeZoneStr;/// 自定义时区名【默认北京时区】
Prop_strong()NSTimeZone *customTimeZone;/// 自定义时区
#pragma mark —— 时间格式化
Prop_copy()NSString *dateFormatterStr;
Prop_strong()NSDateFormatter *dateFormatter;
#pragma mark —— 结论部分  外层怎么用自己去拼接 内核只做重要工作
// 特殊标注：星期是以周日开始的,1代表周日、2代表周一...7代表周六
Prop_assign()NSInteger timeOffset;/// 当前时区与格林威治时间的时间差
Prop_assign()NSInteger customTimeOffset;/// 自定义时区与格林威治时间的时间差
#pragma mark —— 时间之间的分隔形式。可以是中文、也可以多语言化
Prop_copy()NSString *year;
Prop_copy()NSString *month;
Prop_copy()NSString *day;
Prop_copy()NSString *hour;
Prop_copy()NSString *minute;
Prop_copy()NSString *second;
#pragma mark —— 以应对同一时间不同格式的需求
Prop_strong()NSDate *date;
Prop_copy()NSString *dateStr;
Prop_copy()NSString *dateReadableStr;
Prop_assign()NSTimeInterval intervalBySec;/// 单位：秒
Prop_assign()NSTimeInterval intervalByMilliSec;/// 单位：毫秒
#pragma mark —— 关于NSDate
Prop_strong(null_resettable)NSTimeZone *timeZone;
Prop_assign()NSTimeInterval timeInterval;

-(NSString *_Nonnull)formatTimeWithYear:(NSString *_Nullable)year
                                  month:(NSString *_Nullable)month
                                    day:(NSString *_Nullable)day
                                   hour:(NSString *_Nullable)hour
                                 minute:(NSString *_Nullable)minute
                                 second:(NSString *_Nullable)second;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsTimeModel *_Nonnull jobsMakeTimeModel(jobsByTimeModelBlock _Nonnull block){
    JobsTimeModel *data = JobsTimeModel.alloc.init;
    if (block) block(data);
    return data;
}
