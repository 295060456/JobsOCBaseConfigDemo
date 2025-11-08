//
//  NSDate+Extra.m
//  FM
//
//  Created by User on 9/13/24.
//

#import "NSDate+Extra.h"

@implementation NSDate (Extra)
#pragma mark —— 创建 Date 对象
/// 创建一个基于 1970年1月1日00:00:00 UTC 时间 的 NSDate 对象
/// 基准时间点：1970 年 1 月 1 日 00:00
/// 入参data：秒数，计算距离 1970 的偏移量
+(JobsRetDateByTimeIntervalBlock _Nonnull)initDateBy{
    return ^NSDate *_Nullable(NSTimeInterval data){
        return [NSDate dateWithTimeIntervalSince1970:data];
    };
}
/// 创建一个基于 当前时间 的 NSDate 对象。
/// 基准时间点：当前时间
/// 入参data：秒数，计算距离当前时间的偏移量
+(JobsRetDateByTimeIntervalBlock _Nonnull)dateSince{
    /// data 表示从当前时间开始的时间间隔（单位为秒，正值表示未来时间，负值表示过去时间）
    return ^NSDate *_Nullable(NSTimeInterval data){
        return [NSDate dateWithTimeIntervalSinceNow:data];
    };
}
/// 对系统方法 dateByAddingTimeInterval 的二次封装
-(JobsRetDateByTimeIntervalBlock _Nonnull)byAddingTimeInterval API_AVAILABLE(macos(10.6), ios(2.0), watchos(2.0), tvos(9.0)){
    @jobs_weakify(self)
    return ^__kindof NSDate *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        return [self dateByAddingTimeInterval:data];
    };
}
/// 对系统方法 timeIntervalSinceDate 的二次封装
-(JobsRetTimeIntervalByDateBlock _Nonnull)timeIntervalSinceDate{
    @jobs_weakify(self)
    return ^NSTimeInterval(NSDate *_Nullable data){
        @jobs_strongify(self)
        return [self timeIntervalSinceDate:data];
    };
}
#pragma mark —— Date 对象的转化
/// 将NSDate *转化为可视化的时间字符串
/// 入参：日期格式化标准（NSDateFormatter *）缺省标准：年/月/日
-(JobsRetStrByDateFormatterBlock _Nonnull)toReadableTime{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSDateFormatter *_Nullable data){
        @jobs_strongify(self)
        if(!data){
            data = jobsMakeDateFormatter(^(__kindof NSDateFormatter *_Nullable data) {
                data.dateFormat = @"yyyy-MM-dd";
            });
        }return data.stringByDate(self);
    };
}
/// 将NSDate *转化为可视化的时间字符串
/// 入参：日期格式化标准（NSString *）缺省标准：年/月/日
-(JobsRetStrByStrBlock _Nonnull)toReadableTimeBy{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        if(isNull(data)) data = @"yyyy-MM-dd";
        return jobsMakeDateFormatter(^(__kindof NSDateFormatter *_Nullable dateFormatter) {
            dateFormatter.dateFormat = data;
        }).stringByDate(self);
    };
}
/// 将 NSDate  *转换输出成人类可读的（年\月\日）时间（字符串）
-(NSString *_Nullable)readableDayTime{
    return jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter) {
        dateFormatter.timeZone = self.timeZone(TimeZoneTypeCSTChina);
        dateFormatter.dateFormat = @"yyyy-MM-dd"; /// 格式化为日期字符串
    }).stringByDate(self);
}
/// 将 NSDate  *转换输出成人类可读的（年\月\日\时\分\秒）时间（字符串）
-(NSString *_Nullable)readableTime{
    return jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter) {
        dateFormatter.timeZone = self.timeZone(TimeZoneTypeCSTChina);
        dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss"; /// 格式化为日期字符串
    }).stringByDate(self);
}

@end
