//
//  NSObject+Time.h
//  Feidegou
//
//  Created by Kite on 2019/12/9.
//  Copyright © 2019 朝花夕拾. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MacroDef_SysWarning.h"
#import "NSObject+Time.h"
#import "NSUserDefaults+Manager.h"
#import "NSString+Conversion.h"
#import "NSMutableArray+Extra.h"
#import "JobsTimeModel.h"
#import "JobsFormatTime.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
FOUNDATION_EXTERN NSString * _Nonnull const App当日首次进入;
@interface NSObject (Time)
/// 返回的是（Double）时间戳
-(NSTimeInterval)currentUnixTimeStamp;
/// 返回的是（uint64_t）时间戳
-(uint64_t)currentUnixTimeStampInMilliseconds;
/// 返回带时间格式的时间字符串
-(NSString *)currentTimestampString;
#pragma mark —— 时间格式转换
/// 时间格式
-(NSDateFormatter *)dateFormatter;
///接受一个秒数，对这个秒数进行解析出：时、分、秒，存入JobsTimeModel，外层再对这个JobsTimeModel进行取值，对数据进行拼装
-(JobsTimeModel *)HHMMSS:(NSInteger)TimeSec;
/// 将某个（NSDate *）时间 转换格式
/// @param date 一个指定的时间，若未指定则为当前时间
/// @param timeFormatStr 时间格式 缺省值 @"MMM dd,yyyy HH:mm tt"
-(JobsTimeFormatterModel *)timeFormatterWithDate:(NSDate *_Nullable)date
                                   timeFormatStr:(NSString *_Nullable)timeFormatStr;
/// NSDate * ---> NSString *   (NSDate*)时间 转 (NSString*)时间戳（毫秒级）
/// @param date 不传值则为当前时间
-(NSString *)dateConversionTimeStamp:(NSDate *_Nullable)date
                       timeFormatStr:(NSString *_Nullable)timeFormatStr
                       intervalStyle:(IntervalStyle)intervalStyle;
/// NSTimeInterval ---> NSString *
-(NSString *)timeIntervalByInterval:(NSTimeInterval)interval;
/// NSString * ---> NSString *   格式转换为   小时：分钟：秒
/// @param totalTime 传入 秒
-(NSString *)getHHMMSSFromStr:(NSString *_Nonnull)totalTime
                   formatTime:(JobsFormatTime *_Nullable)formatTime;
/// NSString * ---> NSString * 格式转换为  分钟：秒
/// @param totalTime 传入 秒
-(NSString *)getMMSSFromStr:(NSString *_Nonnull)totalTime
                 formatTime:(JobsFormatTime *_Nullable)formatTime;
/// 要完全支持所有时区，可以参考完整的 IANA 时区数据库 来添加所有可能的时区。
/// 由于时区信息和名称可能会根据地区变化和政策更新，因此在实际项目中应根据需求动态获取时区数据，或者使用系统 API 自动处理时区。
-(JobsReturnTimeZoneByTypeBlock)timeZone;
/// 以当前手机系统时间（包含了时区）为基准，给定一个日期偏移值（正值代表未来，负值代表过去，0代表现在），返回字符串特定格式的“星期几”
-(JobsReturnStringByIntegerBlock)whatDayOfWeekDistanceNow;
/// 获取一个格式化的字符串时间
/// @param date 传空则是当前iOS系统时间
/// @param dateFormatStr 传空则格式是@"yyyy-MM-dd HH:mm:ss zzz"
-(NSString *)getDayWithDate:(NSDate *_Nullable)date
              dateFormatStr:(NSString *_Nullable)dateFormatStr;
/// NSDate 和 NSString相互转换
-(NSString *)dateString:(NSDate *)date
       dateFormatterStr:(NSString *)dateFormatterStr;
/// NSDate * ---> NSTimeInterval
-(JobsReturnTimeIntervalByDateBlock)timeIntervalByDate;
/// NSString * ---> NSTimeInterval
-(NSTimeInterval)timeIntervalByDateStr:(NSString *_Nullable)dateStr
                         timeFormatter:(NSString *_Nullable)timeFormatter
                         intervalStyle:(IntervalStyle)intervalStyle;
/// NSTimeInterval ---> NSDate *
-(JobsReturnDateByTimeIntervalBlock)dateByTimeInterval;
/// NSString * ---> NSDate *  (NSString *)时间 转 (NSDate *时间)
-(NSDate *)strByDate:(NSString *_Nonnull)dateStr
       timeFormatter:(NSString *_Nullable)timeFormatter;
#pragma mark —— 功能性的
/// 各个具体时间的拆解
-(JobsTimeModel *)makeSpecificTime;
/// 获得当前时间
-(JobsTimeFormatterModel *)currentTime;
/// 获得今天的时间：年/月/日
-(JobsReturnTimeFormatterModelByStringBlock)getToday;
/// 可以获得两个日期之间的时间间隔
/// @param startTime （给定） 开始时间【字符串格式】
/// @param endTime （可以不用给定）结束时间【字符串格式】
/// @param timeFormatter 时间格式：缺省值@"yyyy-MM-dd HH:mm:ss"
-(JobsTimeFormatterModel *)timeIntervalstartDate:(NSString *_Nonnull)startTime
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
-(NSDate *)getDateFromCurrentAfterTimeInterval:(NSTimeInterval)timeInterval;
/// 通过一个（可为空的）NSDateFormatter，将NSTimeInterval转化为可视化时间字符串
-(JobsReturnStringByTimeIntervalAndDateFormatterBlock)strByTimeInterval;
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
-(NSArray *)dateStringAfterlocalDateForYear:(NSInteger)year
                                      Month:(NSInteger)month
                                        Day:(NSInteger)day
                                       Hour:(NSInteger)hour
                                     Minute:(NSInteger)minute
                                     Second:(NSInteger)second
                              timeFormatter:(NSString *_Nullable)timeFormatter;
/// 判断是否当日第一次启动App
-(BOOL)isFirstLaunchApp;
/// 判断某个时间是否为  今天（系统时区）
-(JobsReturnBOOLByDateBlock)isToday;

@end

NS_ASSUME_NONNULL_END
