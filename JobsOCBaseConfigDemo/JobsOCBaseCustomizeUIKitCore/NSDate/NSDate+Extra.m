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
+(JobsReturnDateByTimeIntervalBlock _Nonnull)dateBy{
    return ^NSDate *_Nullable(NSTimeInterval data){
        return [NSDate dateWithTimeIntervalSince1970:data];
    };
}
/// 创建一个基于 当前时间 的 NSDate 对象。
/// 基准时间点：当前时间
/// 入参data：秒数，计算距离当前时间的偏移量
+(JobsReturnDateByTimeIntervalBlock _Nonnull)dateSince{
    /// data 表示从当前时间开始的时间间隔（单位为秒，正值表示未来时间，负值表示过去时间）
    return ^NSDate *_Nullable(NSTimeInterval data){
        return [NSDate dateWithTimeIntervalSinceNow:data];
    };
}
#pragma mark —— Date 对象的转化
/// 将NSDate转化为可视化的时间字符串（年/月/日）
-(JobsReturnStringByDateFormatterBlock _Nonnull)toVisualTime{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSDateFormatter *_Nullable data){
        @jobs_strongify(self)
        if(!data){
            data = jobsMakeDateFormatter(^(__kindof NSDateFormatter *_Nullable data) {
                data.dateFormat = @"yyyy"
                    .add(@"-")
                    .add(@"MM")
                    .add(@"-")
                    .add(@"dd");
            });
        }return [data stringFromDate:self];
    };
}

@end
