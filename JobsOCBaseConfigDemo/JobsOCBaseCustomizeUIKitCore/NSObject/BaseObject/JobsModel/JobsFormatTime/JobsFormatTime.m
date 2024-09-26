//
//  FormatTime.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/2/8.
//

#import "JobsFormatTime.h"

@implementation JobsFormatTime

-(NSString *_Nonnull)formatTimeWithYear:(NSString * _Nullable)year
                                  month:(NSString * _Nullable)month
                                    day:(NSString * _Nullable)day
                                   hour:(NSString * _Nullable)hour
                                 minute:(NSString * _Nullable)minute
                                 second:(NSString * _Nullable)second{
    if (!year) year = @"";
    if (!month) month = @"";
    if (!day) day = @"";
    if (!hour) hour = @"";
    if (!minute) minute = @"";
    if (!second) second = @"";
    return year
        .add(self.year)
        .add(month)
        .add(self.month)
        .add(day)
        .add(self.day)
        .add(hour)
        .add(self.hour)
        .add(minute)
        .add(self.minute)
        .add(second)
        .add(self.second);
}
#pragma mark —— lazyLoad
-(NSString *)year{
    if (!_year) {
        _year = JobsInternationalization(@"year");
    }return _year;
}

-(NSString *)month{
    if (!_month) {
        _month = JobsInternationalization(@"month");
    }return _month;
}

-(NSString *)day{
    if (!_day) {
        _day = JobsInternationalization(@"day");
    }return _day;
}

-(NSString *)hour{
    if (!_hour) {
        _hour = JobsInternationalization(@"hour");
    }return _hour;
}

-(NSString *)minute{
    if (!_minute) {
        _minute = JobsInternationalization(@"minute");
    }return _minute;
}

-(NSString *)second{
    if (!_second) {
        _second = JobsInternationalization(@"second");
    }return _second;
}

@end
