//
//  NSString+Time.m
//  FM
//
//  Created by User on 9/3/24.
//

#import "NSString+Time.h"

@implementation NSString (Time)
/// 格式化为中国时间
-(JobsReturnStringByVoidBlock)jobsTime{
    return ^NSString *_Nullable(){
        return [self timeStampByTimeFormatter:nil
                                 timeZoneType:TimeZoneTypeCSTChina
                                intervalStyle:intervalByMilliSec];
    };
}
/// 时间戳（字符串）依据某一规范，格式化为能一目了然的时间（字符串）
/// - Parameters:
///   - timeFormatter: timeFormatter
///   - timeZoneType: 时区
///   - intervalStyle: IntervalStyle
-(NSString *)timeStampByTimeFormatter:(NSString *_Nullable)timeFormatter
                         timeZoneType:(TimeZoneType)timeZoneType
                        intervalStyle:(IntervalStyle)intervalStyle{
    NSDate *date = nil;
    if (intervalStyle == intervalBySec) {
        date = [NSDate dateWithTimeIntervalSince1970:self.doubleValue];
    }else if(intervalStyle == intervalByMilliSec){
        date = [NSDate dateWithTimeIntervalSince1970:self.doubleValue / 1000.0];
    }
    NSDateFormatter *formatter = NSDateFormatter.new;
    
    if (isNull(timeFormatter)) {
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    }else{
        formatter.dateFormat = timeFormatter;
    }
    formatter.timeZone = self.timeZone(timeZoneType);
    NSString *dateStr = formatter.date(date);
    return dateStr;
}
/// 当前时间戳较之当前时间是否已过期
-(JobsReturnBOOLByVoidBlock)isExpired{
    return ^BOOL(){
        /// 将时间戳字符串转换为 double 类型的时间戳
        double timeStamp = self.doubleValue;
        /// 创建 NSDate 对象
        NSDate *dateFromTimeStamp;
        if (self.length > 0) {
            // 假设时间戳是以秒为单位
            dateFromTimeStamp = [NSDate dateWithTimeIntervalSince1970:timeStamp];
        }else return NO;/// 时间戳为空，返回 NO
        /// 获取当前时间
        NSDate *currentDate = NSDate.date;
        /// 比较当前时间和时间戳所代表的时间
        NSComparisonResult result = [currentDate compare:dateFromTimeStamp];
        /// 如果当前时间晚于时间戳所代表的时间，返回 YES
        return (result == NSOrderedDescending);
    };
}

@end
