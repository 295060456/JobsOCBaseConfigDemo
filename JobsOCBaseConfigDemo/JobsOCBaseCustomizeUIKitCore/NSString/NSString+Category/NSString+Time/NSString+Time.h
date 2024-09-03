//
//  NSString+Time.h
//  FM
//
//  Created by User on 9/3/24.
//

#import <Foundation/Foundation.h>
#import "NSString+Judgment.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Time)

-(JobsReturnStringByStringBlock)jobsTime;
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
