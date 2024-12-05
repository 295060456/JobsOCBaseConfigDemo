//
//  NSTimeZone+Extra.m
//  FM
//
//  Created by Admin on 5/12/2024.
//

#import "NSTimeZone+Extra.h"

@implementation NSTimeZone (Extra)
/// 对系统方法 timeZoneWithName 的二次封装
+(JobsReturnTimeZoneByStringBlock _Nonnull)initByName{
    return ^NSTimeZone *_Nullable(__kindof NSString *_Nullable data){
        return [NSTimeZone timeZoneWithName:data];
    };
}
/// 对系统方法 timeZoneWithAbbreviation 的二次封装
+(JobsReturnTimeZoneByStringBlock _Nonnull)initByAbbreviation{
    return ^NSTimeZone *_Nullable(__kindof NSString *_Nullable data){
        return [NSTimeZone timeZoneWithAbbreviation:data];
    };
}
/// 对系统方法 timeZoneForSecondsFromGMT 的二次封装
+(JobsReturnTimeZoneByIntegerBlock _Nonnull)initByGMTSecs{
    return ^NSTimeZone *_Nullable(NSInteger data){
        return [NSTimeZone timeZoneForSecondsFromGMT:data];
    };
}
/// 对系统方法 secondsFromGMTForDate 的二次封装
-(JobsReturnIntegerByDateBlock _Nonnull)GMTDateSecs{
    @jobs_weakify(self)
    return ^NSInteger (NSDate *_Nullable data){
        @jobs_strongify(self)
        return [self secondsFromGMTForDate:data];
    };
}

@end
