//
//  NSObject+Time.m
//  Feidegou
//
//  Created by Kite on 2019/12/9.
//  Copyright © 2019 朝花夕拾. All rights reserved.
//

#import "NSObject+Time.h"

@implementation NSObject (Time)
/// 获取当日零点的时间戳（秒级）
-(NSTimeInterval)todayZeroTime{
    /// 获取今天零点的时间戳（秒级）
    NSTimeInterval midnightTimestamp = self._zeroTime.timeIntervalSince1970;
    /// 打印零点时间戳
    NSLog(@"今天零点的时间戳（秒级）：%.0f", midnightTimestamp);
    return midnightTimestamp;
}
/// 获取某天前零点的时间戳（秒级）
-(JobsReturnDoubleByNSIntegerBlock _Nonnull)zeroTimeByDaysBefore{
    @jobs_weakify(self)
    return ^NSTimeInterval(NSInteger days){
        @jobs_strongify(self)
        /// 计算24小时前的零点
        NSDate *dayBeforeMidnight = [self._zeroTime dateByAddingTimeInterval:-(days * 24 * 60 * 60)];
        /// 获取24小时前零点的时间戳（秒级）
        NSTimeInterval dayBeforeMidnightTimestamp = dayBeforeMidnight.timeIntervalSince1970;
        /// 打印24小时前的零点时间戳
        NSLog(@"24小时前零点的时间戳（秒级）：%.0f", dayBeforeMidnightTimestamp);
        return dayBeforeMidnightTimestamp;
    };
}
/// 返回的是（Double）时间戳
-(NSTimeInterval)currentUnixTimeStamp{
    return NSDate.date.timeIntervalSince1970;/// 获取 Unix 时间戳 ：1970 到 当前日期和时间
}
/// 返回的是（uint64_t）时间戳
-(uint64_t)currentUnixTimeStampInMilliseconds{
    return NSDate.date.timeIntervalSince1970 * 1000;/// 获取 Unix 时间戳 ：1970 到 当前日期和时间。将秒数转换为毫秒数
}
/// 返回带时间格式的当前时间字符串
-(NSString *)currentTimestampString{
    return self.dateFormatterBy(nil).date(NSDate.date);
}
/// 获取某天前的时间。默认时间格式 yyyy-MM-dd HH:mm:ss
-(NSString *)timeAgo:(NSInteger)timeAgo
          dateFormat:(NSString *_Nullable)dateFormat{
    return [self.dateFormatterBy(dateFormat) stringFromDate:[NSCalendar.currentCalendar dateByAddingComponents:jobsMakeDateComponents(^(NSDateComponents * _Nullable dateComponents) {
        dateComponents.day = -timeAgo; // 设置为timeAgo天前
    }) toDate:NSDate.date options:0]];
}
/// 获取某天前的时间。时间格式 yyyy-MM-dd HH:mm:ss
-(JobsReturnStringByIntegerBlock _Nonnull)daysAgoBy{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSInteger timeAgo){
        @jobs_strongify(self)
        return [self timeAgo:timeAgo dateFormat:nil];
    };
}
/// 将时间戳按照 yyyy-MM-dd HH:mm:ss 的格式转化为人类可读的时间
/// 入参不能是毫秒级的时间戳
-(JobsReturnStringByTimeIntervalBlock _Nonnull)readableTimeByStyle1{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        return [self.dateFormatterBy(nil) stringFromDate:NSDate.dateBy(data)];
    };
}
#pragma mark —— 时间格式转换
/// 字符串转时间格式
-(JobsReturnDateFormatterByStringBlock _Nonnull)dateFormatterBy{
    return ^NSDateFormatter *_Nullable(NSString *_Nullable dateFormat){
        if(isNull(dateFormat)) dateFormat = @"yyyy-MM-dd HH:mm:ss";
        return jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable data) {
            data.dateFormat = dateFormat;/// 设置时间格式
            data.timeZone = NSTimeZone.localTimeZone;/// 使用本地时区
            data.locale = NSLocale.currentLocale;
        });
    };
}
///接受一个秒数，对这个秒数进行解析出：时、分、秒，存入JobsTimeModel，外层再对这个JobsTimeModel进行取值，对数据进行拼装
-(JobsReturnTimeModelByIntegerBlock _Nonnull)HHMMSS{
    return ^JobsTimeModel *(NSInteger TimeSec){
        return jobsMakeTimeModel(^(__kindof JobsTimeModel *_Nullable data) {
            data.customHour = toStringByFloatDecimalPlaces(TimeSec / 3600, 2).integerValue;
            data.customMin = toStringByFloatDecimalPlaces((TimeSec % 3600) / 60, 2).integerValue;
            data.customSec = toStringByFloatDecimalPlaces(TimeSec % 60, 2).integerValue;
        });
    };
}
/// 将某个（NSDate *）时间 转换格式
/// @param date 一个指定的时间，若未指定则为当前时间
/// @param timeFormatStr 时间格式 缺省值 @"MMM dd,yyyy HH:mm tt"
-(JobsTimeFormatterModel *)timeFormatterWithDate:(NSDate *_Nullable)date
                                   timeFormatStr:(NSString *_Nullable)timeFormatStr{
    if(!date) date = NSDate.date;
    return jobsMakeTimeFormatterModel(^(__kindof JobsTimeFormatterModel *_Nullable timeModel) {
        timeModel.date = date;/// 时间字符串NSDate
        timeModel.dateStr = self.dateFormatterBy(timeFormatStr).date(date);/// NSDate转时间字符串
        timeModel.intervalBySec = date.timeIntervalSince1970;/// (NSDate *)时间转时间戳 单位：秒
        timeModel.intervalByMilliSec = intervalBySec * 1000;/// (NSDate *)时间转时间戳 单位：毫秒
    });
}
/// NSDate * ---> NSString *   (NSDate*)时间 转 (NSString*)时间戳（毫秒级）
/// @param date 不传值则为当前时间
-(NSString *)dateConversionTimeStamp:(NSDate *_Nullable)date
                       intervalStyle:(IntervalStyle)intervalStyle{
    if (!date) date = NSDate.date;
    NSString *timeSp = nil;
    if (intervalStyle == intervalBySec) {
        timeSp = toStringByLongLong(date.timeIntervalSince1970);
    }else if(intervalStyle == intervalByMilliSec){
        timeSp = toStringByLongLong(date.timeIntervalSince1970 * 1000);
    }return timeSp;
}
/// NSTimeInterval ---> NSString *
-(JobsReturnStringByTimeIntervalBlock _Nonnull)timeIntervalByInterval{
    @jobs_weakify(self)
    return ^NSString *_Nullable(NSTimeInterval interval){
        @jobs_strongify(self)
        return [self dateConversionTimeStamp:self.dateByTimeInterval(interval) intervalStyle:intervalBySec];
    };
}
/// NSString * ---> NSString *   格式转换为   小时：分钟：秒
/// @param totalTime 传入 秒
-(NSString *)getHHMMSSFromStr:(NSString *_Nonnull)totalTime
                   formatTime:(JobsFormatTime *_Nullable)formatTime{
    if (!formatTime) {
        formatTime = jobsMakeFormatTime(^(__kindof JobsFormatTime * _Nullable data) {
            data.year =
            data.month =
            data.day =
            data.hour =
            data.minute =
            data.second = @":";
        });
    }return [formatTime formatTimeWithYear:nil
                                     month:nil
                                       day:nil
                                      hour:toStringByFloatDecimalPlaces(totalTime.integerValue / 3600, 2)
                                    minute:toStringByFloatDecimalPlaces((totalTime.integerValue % 3600) / 60, 2)
                                    second:toStringByFloatDecimalPlaces(totalTime.integerValue % 60, 2)];
}
/// NSString * ---> NSString * 格式转换为  分钟：秒
/// @param totalTime 传入 秒
-(NSString *)getMMSSFromStr:(NSString *_Nonnull)totalTime
                 formatTime:(JobsFormatTime *_Nullable)formatTime{
    if (!formatTime) {
        formatTime = jobsMakeFormatTime(^(__kindof JobsFormatTime * _Nullable data) {
            data.year =
            data.month =
            data.day =
            data.hour =
            data.minute =
            data.second = @":";
        });
    }return [formatTime formatTimeWithYear:nil
                                     month:nil
                                       day:nil
                                      hour:nil
                                    minute:toStringByFloatDecimalPlaces(totalTime.integerValue / 60, 0)
                                    second:toStringByFloatDecimalPlaces(totalTime.integerValue % 60, 0)];
}
/// 要完全支持所有时区，可以参考完整的 IANA 时区数据库 来添加所有可能的时区。
/// 由于时区信息和名称可能会根据地区变化和政策更新，因此在实际项目中应根据需求动态获取时区数据，或者使用系统 API 自动处理时区。
-(JobsReturnTimeZoneByTypeBlock)timeZone{
    return ^NSTimeZone *_Nullable(TimeZoneType timeZoneType) {
        switch (timeZoneType) {
            case TimeZoneTypeUTC:
                return [NSTimeZone timeZoneWithAbbreviation:@"UTC"]; /// 协调世界时
            case TimeZoneTypeGMT:
                return [NSTimeZone timeZoneWithAbbreviation:@"GMT"]; /// 格林尼治标准时间
            case TimeZoneTypePST:
                return [NSTimeZone timeZoneWithAbbreviation:@"PST"]; /// 太平洋标准时间 (美国和加拿大)
            case TimeZoneTypeEST:
                return [NSTimeZone timeZoneWithAbbreviation:@"EST"]; /// 东部标准时间 (美国和加拿大)
            case TimeZoneTypeCST:
                return [NSTimeZone timeZoneWithAbbreviation:@"CST"]; /// 中部标准时间 (美国和加拿大)
            case TimeZoneTypeMST:
                return [NSTimeZone timeZoneWithAbbreviation:@"MST"]; /// 山地标准时间 (美国和加拿大)
            case TimeZoneTypeCSTChina:
                return [NSTimeZone timeZoneWithName:@"Asia/Shanghai"]; /// 中国标准时间
            case TimeZoneTypeJST:
                return [NSTimeZone timeZoneWithName:@"Asia/Tokyo"]; /// 日本标准时间
            case TimeZoneTypeBST:
                return [NSTimeZone timeZoneWithAbbreviation:@"BST"]; /// 英国夏令时
            case TimeZoneTypeAEST:
                return [NSTimeZone timeZoneWithName:@"Australia/Sydney"]; /// 澳大利亚东部标准时间
            case TimeZoneTypeAWST:
                return [NSTimeZone timeZoneWithName:@"Australia/Perth"]; /// 澳大利亚西部标准时间
            case TimeZoneTypeCET:
                return [NSTimeZone timeZoneWithAbbreviation:@"CET"]; /// 欧洲中部时间
            case TimeZoneTypeMSK:
                return [NSTimeZone timeZoneWithName:@"Europe/Moscow"]; /// 莫斯科标准时间
            case TimeZoneTypeIST:
                return [NSTimeZone timeZoneWithName:@"Asia/Kolkata"]; /// 印度标准时间
            case TimeZoneTypeBRT:
                return [NSTimeZone timeZoneWithName:@"America/Sao_Paulo"]; /// 巴西利亚时间
            case TimeZoneTypeCSTMexico:
                return [NSTimeZone timeZoneWithName:@"America/Mexico_City"]; /// 墨西哥城时间
            case TimeZoneTypeART:
                return [NSTimeZone timeZoneWithName:@"America/Argentina/Buenos_Aires"]; /// 阿根廷时间
            case TimeZoneTypeHST:
                return [NSTimeZone timeZoneWithAbbreviation:@"HST"]; /// 夏威夷标准时间
            case TimeZoneTypeAKST:
                return [NSTimeZone timeZoneWithAbbreviation:@"AKST"]; /// 阿拉斯加标准时间
            case TimeZoneTypeCEST:
                return [NSTimeZone timeZoneWithAbbreviation:@"CEST"]; /// 中欧夏令时
            case TimeZoneTypeEET:
                return [NSTimeZone timeZoneWithAbbreviation:@"EET"]; /// 欧洲东部时间
            case TimeZoneTypeWET:
                return [NSTimeZone timeZoneWithAbbreviation:@"WET"]; /// 欧洲西部时间
            case TimeZoneTypeNST:
                return [NSTimeZone timeZoneWithAbbreviation:@"NST"]; /// 纽芬兰标准时间
            case TimeZoneTypeAST:
                return [NSTimeZone timeZoneWithAbbreviation:@"AST"]; /// 大西洋标准时间
            case TimeZoneTypePDT:
                return [NSTimeZone timeZoneWithAbbreviation:@"PDT"]; /// 太平洋夏令时
            case TimeZoneTypeMDT:
                return [NSTimeZone timeZoneWithAbbreviation:@"MDT"]; /// 山地夏令时
            case TimeZoneTypeCDT:
                return [NSTimeZone timeZoneWithAbbreviation:@"CDT"]; /// 中部夏令时
            case TimeZoneTypeEDT:
                return [NSTimeZone timeZoneWithAbbreviation:@"EDT"]; /// 东部夏令时
            case TimeZoneTypeNZST:
                return [NSTimeZone timeZoneWithName:@"Pacific/Auckland"]; /// 新西兰标准时间
            case TimeZoneTypeHKT:
                return [NSTimeZone timeZoneWithName:@"Asia/Hong_Kong"]; /// 香港时间
            case TimeZoneTypeSGT:
                return [NSTimeZone timeZoneWithName:@"Asia/Singapore"]; /// 新加坡时间
            case TimeZoneTypeMYT:
                return [NSTimeZone timeZoneWithName:@"Asia/Kuala_Lumpur"]; /// 马来西亚时间
            case TimeZoneTypeKST:
                return [NSTimeZone timeZoneWithName:@"Asia/Seoul"]; /// 韩国标准时间
            // 更多时区可以继续添加...
            default:
                return NSTimeZone.defaultTimeZone; // 默认返回系统时区
        }
    };
}
/// 以当前手机系统时间（包含了时区）为基准，给定一个日期偏移值（正值代表未来，负值代表过去，0代表现在），返回字符串特定格式的“星期几”
-(JobsReturnStringByIntegerBlock)whatDayOfWeekDistanceNow{
    return ^NSString *_Nullable(NSInteger offsetDay){
        JobsTimeModel *timeModel = JobsTimeModel.makeSpecificTime;
        NSInteger currentWeekday = timeModel.currentWeekday;//当前时间是周几？1代表周日 2代表周一 7代表周六
        NSInteger offsetResDay = currentWeekday + offsetDay;//偏移量以后的值，对这个值进行分析和讨论
        NSInteger resResWeekDay = 0;//处理的结果落在0~6
        
        if (offsetDay > 0) {//未来
            resResWeekDay = offsetResDay % 7;
        }else if (offsetDay < 0){//昨天
            if (offsetResDay > 0) {
                resResWeekDay = offsetResDay % 7;
            }else if (offsetResDay < 0){
                resResWeekDay = (7 + offsetResDay % 7) % 7;//核心算法
            }else{// offsetResDay == 0
                resResWeekDay = currentWeekday;
            }
        }else{// offsetDay == 0 现在
            resResWeekDay = currentWeekday;
        }

        switch (resResWeekDay) {
            case 0:{
                return JobsInternationalization(@"星期六");
            }break;
            case 1:{
                return JobsInternationalization(@"星期日");
            }break;
            case 2:{
                return JobsInternationalization(@"星期一");
            }break;
            case 3:{
                return JobsInternationalization(@"星期二");
            }break;
            case 4:{
                return JobsInternationalization(@"星期三");
            }break;
            case 5:{
                return JobsInternationalization(@"星期四");
            }break;
            case 6:{
                return JobsInternationalization(@"星期五");
            }break;
                
            default:
                return JobsInternationalization(@"异常数据");
                break;
        }
    };
}
/// 获取一个格式化的字符串时间
/// @param date 传空则是当前iOS系统时间
/// @param dateFormatStr 传空则格式是@"yyyy-MM-dd HH:mm:ss zzz"
-(NSString *)getDayWithDate:(NSDate *_Nullable)date
              dateFormatStr:(NSString *_Nullable)dateFormatStr{
    if (!date) date = JobsTimeModel.new.currentDate;
    NSDateFormatter *dateFormatter = nil;
    if (isNull(dateFormatStr)) {
        dateFormatter = JobsTimeModel.new.dateFormatter;
    }else{
        dateFormatter = NSDateFormatter.new;
        dateFormatter.dateFormat = dateFormatStr;
    }return dateFormatter.date(date);
}
/// NSDate 和 NSString相互转换
-(NSString *)dateString:(NSDate *)date
       dateFormatterStr:(NSString *)dateFormatterStr{
    JobsTimeModel *timeModel = jobsMakeTimeModel(^(__kindof JobsTimeModel * _Nullable data) {
        data.customDate = date;
        data.dateFormatterStr = dateFormatterStr;
    });
    /// NSDate 转 NSString
    NSString *dateString = @"";
    dateString = timeModel.dateFormatter.date(timeModel.customDate ? timeModel.customDate : timeModel.currentDate);
    return dateString;
}
/// NSDate * ---> NSTimeInterval
-(JobsReturnTimeIntervalByDateBlock)timeIntervalByDate{
    return ^NSTimeInterval(NSDate *_Nullable date){
        if(!date) date = NSDate.date;
        NSTimeInterval interval = date.timeIntervalSince1970;
        return interval;
    };
}
/// NSString * ---> NSTimeInterval
-(NSTimeInterval)timeIntervalByDateStr:(NSString *_Nullable)dateStr
                         timeFormatter:(NSString *_Nullable)timeFormatter
                         intervalStyle:(IntervalStyle)intervalStyle{
    NSTimeInterval interval = 0;
    if (intervalStyle == intervalBySec) {
        interval = [self strByDate:dateStr timeFormatter:timeFormatter].timeIntervalSince1970;
    }else if (intervalStyle == intervalByMilliSec){
        interval = [self strByDate:dateStr timeFormatter:timeFormatter].timeIntervalSince1970 * 1000;
    }else{}return interval;
}
/// NSTimeInterval ---> NSDate *
-(JobsReturnDateByTimeIntervalBlock _Nonnull)dateByTimeInterval{
    return ^NSDate *_Nullable(NSTimeInterval interval){
        NSDate *date = nil;
        if(interval)date = NSDate.dateBy(interval);
        else date = NSDate.date;
        return date;
    };
}
/// NSString * ---> NSDate *  (NSString *)时间 转 (NSDate *时间)
-(NSDate *)strByDate:(NSString *_Nonnull)dateStr
       timeFormatter:(NSString *_Nullable)timeFormatter{
    return dateStr.dataByDateFormatter(self.dateFormatterBy(timeFormatter));
}
#pragma mark —— 功能性的
/// 各个具体时间的拆解
-(JobsTimeModel *)makeSpecificTime{
    NSCalendar *calendar = NSCalendar.currentCalendar;
    NSUInteger unitFlags;
    
    if (@available(iOS 8.0, *)) {
        unitFlags = NSCalendarUnitEra |
        NSCalendarUnitYear |
        NSCalendarUnitMonth |
        NSCalendarUnitDay |
        NSCalendarUnitHour |
        NSCalendarUnitMinute |
        NSCalendarUnitSecond |
        NSCalendarUnitWeekday |
        NSCalendarUnitWeekdayOrdinal |
        NSCalendarUnitQuarter |
        NSCalendarUnitWeekOfMonth |
        NSCalendarUnitWeekOfYear |
        NSCalendarUnitYearForWeekOfYear |
        NSCalendarUnitNanosecond |
        NSCalendarUnitCalendar |
        NSCalendarUnitTimeZone;
    }else{
        SuppressWdeprecatedDeclarationsWarning(unitFlags = NSEraCalendarUnit |
                                               NSYearCalendarUnit |
                                               NSMonthCalendarUnit |
                                               NSDayCalendarUnit |
                                               NSHourCalendarUnit |
                                               NSMinuteCalendarUnit |
                                               NSSecondCalendarUnit |
                                               NSWeekCalendarUnit |
                                               NSWeekdayCalendarUnit |
                                               NSWeekdayOrdinalCalendarUnit |
                                               NSQuarterCalendarUnit |
                                               NSWeekOfMonthCalendarUnit |
                                               NSWeekOfYearCalendarUnit |
                                               NSYearForWeekOfYearCalendarUnit |
                                               NSCalendarCalendarUnit |
                                               NSTimeZoneCalendarUnit);
    }return jobsMakeTimeModel(^(__kindof JobsTimeModel * _Nullable timeModel) {
        NSDateComponents *dateComponent = [calendar components:unitFlags
                                                      fromDate:timeModel.currentDate];
        timeModel.currentEra = dateComponent.era;
        timeModel.currentYear = dateComponent.year;
        timeModel.currentMonth = dateComponent.month;
        timeModel.currentDay = dateComponent.day;
        timeModel.currentHour = dateComponent.hour;
        timeModel.currentMin = dateComponent.minute;
        timeModel.currentSec = dateComponent.second;
        timeModel.currentNanoSec = dateComponent.nanosecond;//API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0))
        timeModel.currentWeekday = dateComponent.weekday;//表示周里面的天 1代表周日 2代表周一 7代表周六
        timeModel.currentWeekdayOrdinal = dateComponent.weekdayOrdinal;
        timeModel.currentQuarter = dateComponent.quarter;//API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
        timeModel.currentWeekOfMonth = dateComponent.weekOfMonth;//API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0))
        timeModel.currentWeekOfYear = dateComponent.weekOfYear;//API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0));
        timeModel.currentYearForWeekOfYear = dateComponent.yearForWeekOfYear;//API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0));
    });
}
/// 获得当前时间
-(JobsTimeFormatterModel *)currentTime{
    NSDate *date = NSDate.date;
    NSTimeZone *zone = NSTimeZone.systemTimeZone; /// 系统时区
    return jobsMakeTimeFormatterModel(^(__kindof JobsTimeFormatterModel * _Nullable data) {
        data.date = [date dateByAddingTimeInterval:data.intervalBySec];
        data.dateStr = [NSObject dateConversionTimeStamp:data.date intervalStyle:intervalBySec];
        data.intervalBySec = [zone secondsFromGMTForDate:date];
    });
}
/// 获得今天的时间：年/月/日
-(JobsReturnTimeFormatterModelByStringBlock _Nonnull)getToday{
    return ^JobsTimeFormatterModel *_Nullable(NSString *_Nullable dateFormat){
        NSDateFormatter *formatter = self.dateFormatterBy(dateFormat);
        NSString *dateTime_Str = formatter.date(NSDate.date); /// 今天
        NSDate *dateTime_Date = dateTime_Str.dataByDateFormatter(formatter);
        NSTimeInterval interval = [NSTimeZone.systemTimeZone secondsFromGMTForDate:NSDate.date];/// 系统时区
        return jobsMakeTimeFormatterModel(^(__kindof JobsTimeFormatterModel * _Nullable data) {
            data.dateStr = dateTime_Str;
            data.date = dateTime_Date;
            data.intervalBySec = interval;
            data.intervalByMilliSec = data.intervalBySec * 1000;
        });
    };
}
/// 可以获得两个日期之间的时间间隔
/// @param startTime （给定） 开始时间【字符串格式】
/// @param endTime （可以不用给定）结束时间【字符串格式】
/// @param timeFormatter 时间格式：缺省值@"yyyy-MM-dd HH:mm:ss"
-(NSTimeInterval)timeIntervalstartDate:(NSString *_Nonnull)startTime
                               endDate:(NSString *_Nullable)endTime
                         timeFormatter:(NSString *_Nullable)timeFormatter{
    /// 创建日期格式化器
    NSDateFormatter *dateFormatter = self.dateFormatterBy(nil);
    /// 将 startTime 转换为 NSDate
    NSDate *startDate = [dateFormatter dateFromString:startTime];
    if (!startDate) {
        NSLog(@"开始时间格式不正确");
        return 0;
    }
    /// 如果 endTime 未提供，则使用当前时间
    NSDate *endDate = endTime ? [dateFormatter dateFromString:endTime] : NSDate.date;
    if (!endDate) {
        NSLog(@"结束时间格式不正确");
        return 0;
    }
    /// 计算两个日期之间的时间间隔
    NSTimeInterval interval = [endDate timeIntervalSinceDate:startDate];
    return interval;
}
/**
    iOS 获取 加上多少时间以后的时间A (NSDate *) = 基础时间（NSDate *） +  时间间隔（NSInteger）
    参考资料：
    https://www.jianshu.com/p/5f4e7fabcc02
    https://blog.csdn.net/weixin_34055787/article/details/91893379
 */
-(NSDate *)getDate:(NSDate *_Nonnull)date
  afterIntegerTime:(NSInteger)afterIntegerTime{
    return [[NSCalendar.alloc initWithCalendarIdentifier:NSCalendarIdentifierGregorian] dateByAddingComponents:jobsMakeDateComponents(^(NSDateComponents * _Nullable dateComponents) {
        dateComponents.hour = afterIntegerTime;
    })toDate:date options:0];
}
/// 以当前时间为基准，加上某个时间间隔（NSTimeInterval类型）以后的NSData值
-(JobsReturnDateByTimeIntervalBlock _Nonnull)getDateFromCurrentAfterTimeInterval{
    return ^NSDate *_Nullable(NSTimeInterval timeInterval){
        return [NSDate.alloc initWithTimeIntervalSinceNow:timeInterval];
    };
}
/// 计算两字符串时间的差值【方法一】
-(NSTimeInterval)intervalDifferenceBetweenStarTime:(NSString *)starTime
                                         toEndTime:(NSString *)endTime
                                   byDateFormatter:(NSDateFormatter *)dateFormatter{
    if (!dateFormatter) dateFormatter = self.dateFormatterBy(@"HH:mm:ss");
    NSDate *startDate = starTime.dataByDateFormatter(dateFormatter);
    NSDate *endDate = endTime.dataByDateFormatter(dateFormatter);
    NSTimeInterval time = [endDate timeIntervalSinceDate:startDate];
    return time;
}
/// 计算两字符串时间的差值【方法二】
-(NSDateComponents *)dateComponentsDiffBetweenStarTime:(NSString *)starTime
                                             toEndTime:(NSString *)endTime
                                       byDateFormatter:(NSDateFormatter *)dateFormatter{
    if (!dateFormatter) dateFormatter = self.dateFormatterBy(@"HH:mm:ss");
    NSDate *date1 = [dateFormatter dateFromString:starTime];
    NSDate *date2 = [dateFormatter dateFromString:endTime];
    // 1.创建日历
    NSCalendar *calendar = NSCalendar.currentCalendar;
    
    NSCalendarUnit type =
    NSCalendarUnitYear |
    NSCalendarUnitMonth |
    NSCalendarUnitDay |
    NSCalendarUnitHour |
    NSCalendarUnitMinute |
    NSCalendarUnitSecond;
    // 2.利用日历对象比较两个时间的差值
    NSDateComponents *cmps = [calendar components:type
                                         fromDate:date1
                                           toDate:date2
                                          options:0];
    // 3.输出结果
    NSLog(@"两个时间相差%ld年%ld月%ld日%ld小时%ld分钟%ld秒",
          (long)cmps.year,
          (long)cmps.month,
          (long)cmps.day,
          (long)cmps.hour,
          (long)cmps.minute,
          (long)cmps.second);
    return cmps;
}
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
                                          timeFormatter:(NSString *_Nullable)timeFormatter{
    NSCalendar *calender = [NSCalendar.alloc initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *minDate = [calender dateByAddingComponents:jobsMakeDateComponents(^(NSDateComponents * _Nullable dateComponents) {
        dateComponents.year = year;
        dateComponents.month = month;
        dateComponents.day = day;
        dateComponents.hour = hour;
        dateComponents.minute = minute;
        dateComponents.second = second;
    })toDate:NSDate.date options:0];
    NSDateComponents *components = [calender components:NSCalendarUnitYear |
                                    NSCalendarUnitMonth |
                                    NSCalendarUnitDay |
                                    NSCalendarUnitHour
                                               fromDate:minDate];
    return jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable arr) {
        arr.add(toStringByLong(components.year));
        arr.add(toStringByLong(components.month));
        arr.add(toStringByLong(components.day));
        arr.add(toStringByLong(components.hour));
    });
}
/// 判断是否当日第一次启动App
-(BOOL)isFirstLaunchApp{
    BOOL flag;
    NSDate *oldDate = (NSDate *)NSUserDefaults.readWithKey(App当日首次进入);
    if (oldDate) {
        flag = !self.isToday(oldDate);
    }else{
        NSLog(@"未启动过，今日第一次启动");
        flag = YES;
    }
    // 保存启动时间
    NSUserDefaults.updateWithModel(jobsMakeUserDefaultModel(^(UserDefaultModel * _Nonnull data) {
        data.key = App当日首次进入;
        data.obj = NSDate.date;
    }));return flag;
}
/// 判断某个时间是否为  今天（系统时区）
/// 对比格式：yyyy-MM-dd
-(JobsReturnBOOLByDateBlock _Nonnull)isToday{
    return ^BOOL(NSDate *_Nullable date){
        NSDateFormatter *fmt = jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable data) {
            data.timeZone = NSTimeZone.systemTimeZone; // 系统时区
            data.dateStyle = NSDateFormatterMediumStyle;
            data.timeStyle = NSDateFormatterShortStyle;
            data.dateFormat = @"yyyy-MM-dd";
        });
        NSString *dateStr = fmt.date(date);
        NSString *nowStr = fmt.date(JobsTimeModel.new.currentDate);// Now
        return dateStr.isEqualToString(nowStr);
    };
}
/// 将NSTimeInterval类型的时间戳翻译成人类能看懂的文字
-(JobsReturnStringByTimeIntervalBlock _Nonnull)toReadableTimeBy{
    return ^__kindof NSString *_Nullable(NSTimeInterval timeInterval){
        /// 获取当前日历
        NSCalendar *calendar = NSCalendar.currentCalendar;
        /// 创建时间
        NSDate *date = NSDate.dateBy(timeInterval);
        /// 获取年、月、日、时、分、秒等信息
        NSDateComponents *components = [calendar components:(NSCalendarUnitYear |
                                                             NSCalendarUnitMonth |
                                                             NSCalendarUnitDay |
                                                             NSCalendarUnitHour |
                                                             NSCalendarUnitMinute |
                                                             NSCalendarUnitSecond)
                                                   fromDate:date];
        /// 拼接字符串，格式化为可读的时间
        return [NSString stringWithFormat:@"%ld年%ld月%ld日 %02ld:%02ld:%02ld",
                (long)components.year,
                (long)components.month,
                (long)components.day,
                (long)components.hour,
                (long)components.minute,
                (long)components.second];
    };
}
#pragma mark —— 一些私有方法
-(NSDate *)_zeroTime{
    /// 获取当前日历
    NSCalendar *calendar = NSCalendar.currentCalendar;
    /// 提取当前日期的年、月、日部分
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear |
                                                         NSCalendarUnitMonth |
                                                         NSCalendarUnitDay)
                                               fromDate:NSDate.date];
    /// 设置时间为今天的零点
    return [calendar dateFromComponents:components];
}

@end
