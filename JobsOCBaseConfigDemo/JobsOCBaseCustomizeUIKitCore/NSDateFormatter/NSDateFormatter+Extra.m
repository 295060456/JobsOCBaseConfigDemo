//
//  NSDateFormatter+Extra.m
//  FM
//
//  Created by Admin on 5/12/2024.
//

#import "NSDateFormatter+Extra.h"

@implementation NSDateFormatter (Extra)
/// 对系统方法 stringFromDate 的二次封装
-(JobsReturnStringByDateBlock _Nonnull)stringByDate{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSDate *_Nullable date){
        @jobs_strongify(self)
        return [self stringFromDate:date];
    };
}
/// 对系统方法 dateFromString 的二次封装
-(JobsReturnDateByStringBlock _Nonnull)dateByString{
    @jobs_weakify(self)
    return ^NSDate *_Nullable(__kindof NSString *_Nullable date){
        @jobs_strongify(self)
        return [self dateFromString:date];
    };
}

@end
