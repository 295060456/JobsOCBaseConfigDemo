//
//  NSString+Time.h
//  FM
//
//  Created by User on 9/3/24.
//

#import <Foundation/Foundation.h>
#import "NSString+Check.h"
#import "JobsBlock.h"
#import "JobsTimeModel.h"

NS_ASSUME_NONNULL_BEGIN

NS_INLINE NSString *JobsFormattedString(NSString *format, ...) {
    va_list args;
    va_start(args, format);
    NSString *formattedString = [NSString.alloc initWithFormat:format arguments:args];
    va_end(args);
    return formattedString;
}

@interface NSString (Time)
/// 当前时间戳较之当前时间是否已过期【过期返回YES】
-(JobsReturnBOOLByVoidBlock _Nonnull)isExpired;
-(JobsReturnStringByStringBlock _Nonnull)chinaTime;
/// （字符串）时间戳 转换为可读时间（系统默认时区）
-(JobsReturnStringByStringBlock _Nonnull)readableTimeByFormatter;
/// 时间戳（字符串）依据某一规范，格式化为能一目了然的时间（字符串）
/// - Parameters:
///   - timeFormatter: timeFormatter
///   - timeZoneType: 时区
///   - intervalStyle: IntervalStyle
-(NSString *)timeStampByTimeFormatter:(NSString *_Nullable)timeFormatter
                         timeZoneType:(TimeZoneType)timeZoneType
                        intervalStyle:(IntervalStyle)intervalStyle;

@end

NS_ASSUME_NONNULL_END
