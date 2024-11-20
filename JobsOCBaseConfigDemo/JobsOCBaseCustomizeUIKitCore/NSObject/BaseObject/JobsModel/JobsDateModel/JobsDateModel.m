//
//  JobsDateModel.m
//  FM
//
//  Created by Admin on 20/11/2024.
//

#import "JobsDateModel.h"

@implementation JobsDateModel

-(NSTimeZone *)timeZone{
    if(!_timeZone){
        _timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"]; // 设置为 UTC 时区
    }return _timeZone;
}

-(NSDateFormatter *)dateFormatter{
    if(!_dateFormatter){
        _dateFormatter = jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter) {
            dateFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"]; // 设置为 UTC 时区
            dateFormatter.dateFormat = @"yyyy-MM-dd"; // 格式化为日期字符串
        });
    }return _dateFormatter;
}

@end
