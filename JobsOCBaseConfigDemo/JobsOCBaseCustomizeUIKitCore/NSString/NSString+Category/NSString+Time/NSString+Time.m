//
//  NSString+Time.m
//  FM
//
//  Created by User on 9/3/24.
//

#import "NSString+Time.h"

@implementation NSString (Time)

-(JobsReturnStringByStringBlock)jobsTime{
    return ^NSString *_Nullable(NSString *_Nullable data){
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

@end
