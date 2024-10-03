//
//  NSString+Time.m
//  FM
//
//  Created by User on 9/3/24.
//

#import "NSString+Time.h"

@implementation NSString (Time)
/// 格式化为中国时间
-(JobsReturnStringByVoidBlock _Nonnull)jobsTime{
    @jobs_weakify(self)
    return ^NSString *_Nullable(){
        @jobs_strongify(self)
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
    @jobs_weakify(self)
    NSDate *date = nil;
    if (intervalStyle == intervalBySec) {
        date = [NSDate dateWithTimeIntervalSince1970:self.doubleValue];
    }else if(intervalStyle == intervalByMilliSec){
        date = [NSDate dateWithTimeIntervalSince1970:self.doubleValue / 1000.0];
    }return jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable data) {
        @jobs_strongify(self)
        if (isNull(timeFormatter)) {
            data.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        }else{
            data.dateFormat = timeFormatter;
        }data.timeZone = self.timeZone(timeZoneType);
    }).date(date);
}
/// 当前时间戳较之当前时间是否已过期
-(JobsReturnBOOLByVoidBlock _Nonnull)isExpired{
    @jobs_weakify(self)
    return ^BOOL(){
        @jobs_strongify(self)
        /// 将时间戳字符串转换为 double 类型的时间戳
        double timeStamp = self.doubleValue;
        /// 创建 NSDate 对象
        NSDate *dateFromTimeStamp;
        if (self.length > 0) {
            // 假设时间戳是以秒为单位
            dateFromTimeStamp = [NSDate dateWithTimeIntervalSince1970:timeStamp];
        }else return NO;/// 时间戳为空，返回 NO
        /// 比较当前时间和时间戳所代表的时间
        NSComparisonResult result = [NSDate.date compare:dateFromTimeStamp];
        /// 如果当前时间晚于时间戳所代表的时间，返回 YES
        return (result == NSOrderedDescending);
    };
}

@end
