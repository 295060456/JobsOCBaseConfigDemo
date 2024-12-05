//
//  NSString+Time.m
//  FM
//
//  Created by User on 9/3/24.
//

#import "NSString+Time.h"

@implementation NSString (Time)
/// 格式化为中国时间
-(JobsReturnStringByStringBlock _Nonnull)chinaTime{
    @jobs_weakify(self)
    return ^NSString *_Nullable(NSString *_Nullable timeFormatter){
        @jobs_strongify(self)
        return [self timeStampByTimeFormatter:timeFormatter
                                 timeZoneType:TimeZoneTypeCSTChina
                                intervalStyle:intervalByMilliSec];
    };
}
/// （字符串）时间戳 转换为可读时间（系统默认时区）
-(JobsReturnStringByStringBlock _Nonnull)readableTimeByFormatter{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSString *_Nullable timeFormat){
        @jobs_strongify(self)
        if(isNull(timeFormat)) timeFormat = @"yyyy-MM-dd HH:mm:ss";
        double sec;
        if(self.length == 10){
            sec = self.doubleValue;/// 秒级时间戳（10位）
        }else if (self.length == 13){
            sec = self.doubleValue / 1000.0;/// 毫秒级时间戳（13位）
        }else{
            NSLog(@"不是正确的时间戳，请检查");
            toast(JobsInternationalization(@"不是正确的时间戳，请检查"));
            return nil;
        }return jobsMakeDateFormatter(^(__kindof NSDateFormatter *_Nullable dateFormatter) {
            dateFormatter.dateFormat = timeFormat;
        }).stringByDate(NSDate.initDateBy(sec));
    };
}
///（字符串）时间戳依据某一规范，格式化为能一目了然的时间（字符串）
/// - Parameters:
///   - timeFormatter: timeFormatter
///   - timeZoneType: 时区
///   - intervalStyle: IntervalStyle
-(NSString *)timeStampByTimeFormatter:(NSString *_Nullable)timeFormatter
                         timeZoneType:(TimeZoneType)timeZoneType
                        intervalStyle:(IntervalStyle)intervalStyle{
    @jobs_weakify(self)
    NSDate *date = nil;
    if (intervalStyle == intervalBySec) {/// 秒级时间戳（10位）
        date = NSDate.initDateBy(self.doubleValue);
    }else if(intervalStyle == intervalByMilliSec){/// 毫秒级时间戳（13位）
        date = NSDate.initDateBy(self.doubleValue / 1000.0);
    }return jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable data) {
        @jobs_strongify(self)
        data.dateFormat = isNull(timeFormatter) ? @"yyyy-MM-dd HH:mm:ss" : timeFormatter;
        data.timeZone = self.timeZone(timeZoneType);
    }).date(date);
}
/// 当前时间戳较之当前时间是否已过期【过期返回YES】
-(JobsReturnBOOLByVoidBlock _Nonnull)isExpired{
    @jobs_weakify(self)
    return ^BOOL(){
        @jobs_strongify(self)
#ifdef DEBUG
        NSLog(@"当前时间为:%@, Token过期时间为:%@", NSDate.date, self.chinaTime(nil));
        toast(JobsFormattedString(@"Token过期时间为:%@", self.chinaTime(nil)));
#endif
        /// 将时间戳字符串转换为 double 类型的时间戳
        double timeStamp = self.doubleValue;
        /// 创建 NSDate 对象
        NSDate *dateFromTimeStamp;
        if (self.length) {
            /// 假设时间戳是以秒为单位
            dateFromTimeStamp = NSDate.initDateBy(timeStamp);
        }else return NO; /// 时间戳为空，返回 NO
        /// 比较当前时间和时间戳所代表的时间
        NSComparisonResult result = [NSDate.date compare:dateFromTimeStamp];
        /// 如果当前时间晚于时间戳所代表的时间，返回 YES
        return (result == NSOrderedDescending);
    };
}

@end
