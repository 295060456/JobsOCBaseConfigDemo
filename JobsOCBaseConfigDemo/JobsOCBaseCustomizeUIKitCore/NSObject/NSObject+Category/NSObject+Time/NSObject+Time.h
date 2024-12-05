//
//  NSObject+Time.h
//  Feidegou
//
//  Created by Kite on 2019/12/9.
//  Copyright © 2019 朝花夕拾. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "MacroDef_SysWarning.h"
#import "NSObject+Time.h"
#import "NSUserDefaults+Manager.h"
#import "NSString+Conversion.h"
#import "NSMutableArray+Extra.h"
#import "JobsTimeModel.h"
#import "DefineConstString.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Time)
/// 获取当前时间
-(NSDate *)currentDate;
/// 获取当日零点的时间戳（秒级）
-(NSTimeInterval)todayZeroTime;
/// 获取某天前零点的时间戳（秒级）
-(JobsReturnDoubleByNSIntegerBlock _Nonnull)zeroTimeByDaysBefore;
/// 返回的是（Double）时间戳
-(NSTimeInterval)currentUnixTimeStamp;
/// 返回的是（uint64_t）时间戳
-(uint64_t)currentUnixTimeStampInMilliseconds;
/// 返回带时间格式的当前时间字符串
-(JobsReturnStringByStringBlock _Nonnull)currentTimestampString;
/// 获取某天前的时间。默认时间格式 yyyy-MM-dd HH:mm:ss
-(NSString *)timeAgo:(NSInteger)timeAgo dateFormat:(NSString *_Nullable)dateFormat;
/// 获取某天前的时间。时间格式 yyyy-MM-dd HH:mm:ss
-(JobsReturnStringByIntegersBlock _Nonnull)daysAgoBy;
/// 将时间戳按照 yyyy-MM-dd HH:mm:ss 的格式转化为人类可读的时间
/// 入参不能是毫秒级的时间戳
-(JobsReturnStringByTimeIntervalsBlock _Nonnull)readableTimeByStyle1;
#pragma mark —— 时间格式转换
/// 字符串转时间格式
-(JobsReturnDateFormatterByStringBlock _Nonnull)dateFormatterBy;
/// 接受一个秒数，对这个秒数进行解析出：时、分、秒，存入JobsTimeModel，外层再对这个JobsTimeModel进行取值，对数据进行拼装
-(JobsReturnTimeModelByIntegerBlock _Nonnull)HHMMSS;
/// 将某个（NSDate *）时间 转换格式
/// @param date 一个指定的时间，若未指定则为当前时间
/// @param timeFormatStr 时间格式 缺省值 @"MMM dd,yyyy HH:mm tt"
-(JobsTimeModel *)timeFormatterWithDate:(NSDate *_Nullable)date
                          timeFormatStr:(NSString *_Nullable)timeFormatStr;
/// NSDate * ---> NSString *   (NSDate*)时间 转 (NSString*)时间戳（毫秒级）
/// @param date 不传值则为当前时间
-(NSString *)dateConversionTimeStamp:(NSDate *_Nullable)date
                       intervalStyle:(IntervalStyle)intervalStyle;
/// NSTimeInterval ---> NSString *
-(JobsReturnStringByTimeIntervalBlock _Nonnull)timeIntervalByInterval;
/// NSString * ---> NSString *   格式转换为   小时：分钟：秒
/// @param totalTime 传入 秒
-(NSString *)getHHMMSSFromStr:(NSString *_Nonnull)totalTime
                   formatTime:(JobsTimeModel *_Nullable)formatTime;
/// NSString * ---> NSString * 格式转换为  分钟：秒
/// @param totalTime 传入 秒
-(NSString *)getMMSSFromStr:(NSString *_Nonnull)totalTime
                 formatTime:(JobsTimeModel *_Nullable)formatTime;
/// 要完全支持所有时区，可以参考完整的 IANA 时区数据库 来添加所有可能的时区。
/// 由于时区信息和名称可能会根据地区变化和政策更新，因此在实际项目中应根据需求动态获取时区数据，或者使用系统 API 自动处理时区。
-(JobsReturnTimeZoneByTypeBlock _Nonnull)timeZone;
/// NSDate * ---> NSTimeInterval
-(JobsReturnTimeIntervalByDateBlock _Nonnull)timeIntervalByDate;
/// NSString * ---> NSTimeInterval
-(NSTimeInterval)timeIntervalByDateStr:(NSString *_Nullable)dateStr
                         timeFormatter:(NSString *_Nullable)timeFormatter
                         intervalStyle:(IntervalStyle)intervalStyle;
/// NSTimeInterval ---> NSDate *
-(JobsReturnDateByTimeIntervalBlock _Nonnull)dateByTimeInterval;
/// NSString * ---> NSDate *  (NSString *)时间 转 (NSDate *时间)
-(NSDate *)strByDate:(NSString *_Nonnull)dateStr
       timeFormatter:(NSString *_Nullable)timeFormatter;
#pragma mark —— 功能性的
/// 各个具体时间的拆解
-(JobsTimeModel *)makeSpecificTime;
/// 获得当前时间
-(JobsTimeModel *)currentTime;
/// 获得今天的时间：年/月/日
-(JobsReturnTimeModelByStringBlock _Nonnull)getToday;
/// 可以获得两个日期之间的时间间隔
/// @param startTime （给定） 开始时间【字符串格式】
/// @param endTime （可以不用给定）结束时间【字符串格式】
/// @param timeFormatter 时间格式：缺省值@"yyyy-MM-dd HH:mm:ss"
-(NSTimeInterval)timeIntervalstartDate:(NSString *_Nonnull)startTime
                               endDate:(NSString *_Nullable)endTime
                         timeFormatter:(NSString *_Nullable)timeFormatter;
/**
    iOS 获取 加上多少时间以后的时间A (NSDate *) = 基础时间（NSDate *） +  时间间隔（NSInteger）
    参考资料：
    https://www.jianshu.com/p/5f4e7fabcc02
    https://blog.csdn.net/weixin_34055787/article/details/91893379
 */
-(NSDate *)getDate:(NSDate *_Nonnull)date
  afterIntegerTime:(NSInteger)afterIntegerTime;
/// 以当前时间为基准，加上某个时间间隔（NSTimeInterval类型）以后的NSData值
-(JobsReturnDateByTimeIntervalBlock _Nonnull)getDateFromCurrentAfterTimeInterval;
/// 计算两字符串时间的差值【方法一】
-(NSTimeInterval)intervalDifferenceBetweenStarTime:(NSString *)starTime
                                         toEndTime:(NSString *)endTime
                                   byDateFormatter:(NSDateFormatter *)dateFormatter;
/// 计算两字符串时间的差值【方法二】
-(NSDateComponents *)dateComponentsDiffBetweenStarTime:(NSString *)starTime
                                             toEndTime:(NSString *)endTime
                                       byDateFormatter:(NSDateFormatter *)dateFormatter;
/**
 在当前日期时间加上 某个时间段(传负数即返回当前时间之前x月x日的时间)
 @param year 当前时间若干年后 （传负数为当前时间若干年前）
 @param month 当前时间若干月后  （传0即与当前时间一样）
 @param day 当前时间若干天后
 @param hour 当前时间若干小时后
 @param minute 当前时间若干分钟后
 @param second 当前时间若干秒后
 参考资料：https://blog.csdn.net/autom_lishun/article/details/79094241
 */
-(NSArray <NSString *>*)dateStringAfterlocalDateForYear:(NSInteger)year
                                                  month:(NSInteger)month
                                                    day:(NSInteger)day
                                                   hour:(NSInteger)hour
                                                 minute:(NSInteger)minute
                                                 second:(NSInteger)second
                                          timeFormatter:(NSString *_Nullable)timeFormatter;
/// 判断是否当日第一次启动App
-(BOOL)isFirstLaunchApp;
/// 判断某个时间是否为  今天（系统时区）
/// 对比格式：yyyy-MM-dd
-(JobsReturnBOOLByDateBlock _Nonnull)isToday;
/// 将NSTimeInterval类型的时间戳翻译成人类能看懂的文字
-(JobsReturnStringByTimeIntervalBlock _Nonnull)toReadableTimeBy;

@end

NS_ASSUME_NONNULL_END
/**
 时间为2024-12-05 15:30:00（北京时间，UTC+8）。
 秒级时间戳：1701761400
 毫秒级别时间戳：1701761400000
 其对应的 NSTimeInterval timeInterval : 1701761400.0
 
 无论是秒级还是毫秒级时间戳，经过必要的处理后，最终的 NSTimeInterval 都是相同的
 
 ❤️字符串时间戳转化为可读❤️
 @"1701761400000".readableTimeByFormatter(@"yyyy-MM-dd");
 @"1701761400".readableTimeByFormatter(@"yyyy-MM-dd");
 ❤️NSDate 类型的时间转化为可读❤️
 NSDate.date.toReadableTime(jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter) {
               data.dateFormat = @"yyyy"
                   .add(@"-")
                   .add(@"MM");
           }));

 NSDate.date.toReadableTimeBy(@"yyyy".add(@"-").add(@"MM"));
 ❤️NSTimeInterval 类型的时间转化为可读❤️
 self.toReadableTimeBy(timeInterval);
 或者:
 self.dateByTimeInterval(111).toReadableTime(nil);
 */
