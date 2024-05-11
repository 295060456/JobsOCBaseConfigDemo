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
    return [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@",year,self.year,month,self.month,day,self.day,hour,self.hour,minute,self.minute,second,self.second];
}
#pragma mark —— lazyLoad
-(NSString *)year{
    if (!_year) {
        _year = Internationalization(@"year");
    }return _year;
}

-(NSString *)month{
    if (!_month) {
        _month = Internationalization(@"month");
    }return _month;
}

-(NSString *)day{
    if (!_day) {
        _day = Internationalization(@"day");
    }return _day;
}

-(NSString *)hour{
    if (!_hour) {
        _hour = Internationalization(@"hour");
    }return _hour;
}

-(NSString *)minute{
    if (!_minute) {
        _minute = Internationalization(@"minute");
    }return _minute;
}

-(NSString *)second{
    if (!_second) {
        _second = Internationalization(@"second");
    }return _second;
}

@end
