//
//  NSDate+Extra.h
//  FM
//
//  Created by User on 9/13/24.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+Extra.h"
#import "MacroDef_String.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Extra)
#pragma mark —— 创建 Date 对象
/// 创建一个基于 1970年1月1日00:00:00 UTC 时间 的 NSDate 对象
/// 基准时间点：1970 年 1 月 1 日 00:00
/// 入参data：秒数，计算距离 1970 的偏移量
+(JobsReturnDateByTimeIntervalBlock _Nonnull)initDateBy;
/// 创建一个基于 当前时间 的 NSDate 对象。
/// 基准时间点：当前时间
/// 入参data：秒数，计算距离当前时间的偏移量
+(JobsReturnDateByTimeIntervalBlock _Nonnull)dateSince;
/// 对系统方法 dateByAddingTimeInterval 的二次封装
-(JobsReturnDateByTimeIntervalBlock _Nonnull)byAddingTimeInterval API_AVAILABLE(macos(10.6), ios(2.0), watchos(2.0), tvos(9.0));
/// 对系统方法 timeIntervalSinceDate 的二次封装
-(JobsReturnTimeIntervalByDateBlock _Nonnull)timeIntervalSinceDate;
#pragma mark —— Date 对象的转化
/// 将NSDate（通过NSDateFormatter）转化为可视化的时间字符串（年/月/日）
-(JobsReturnStringByDateFormatterBlock _Nonnull)toReadableTime;
/// 将NSDate（通过NSString）转化为可视化的时间字符串（年/月/日）
-(JobsReturnStringByStringBlock _Nonnull)toReadableTimeBy;

@end

NS_ASSUME_NONNULL_END
