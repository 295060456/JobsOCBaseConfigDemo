//
//  NSTimeZone+Extra.h
//  FM
//
//  Created by Admin on 5/12/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSTimeZone (Extra)
/// 对系统方法 timeZoneWithName 的二次封装
+(JobsRetTimeZoneByStringBlock _Nonnull)initByName;
/// 对系统方法 timeZoneWithAbbreviation 的二次封装
+(JobsRetTimeZoneByStringBlock _Nonnull)initByAbbreviation;
/// 对系统方法 timeZoneForSecondsFromGMT 的二次封装
+(JobsRetTimeZoneByIntegerBlock _Nonnull)initByGMTSecs;
/// 对系统方法 secondsFromGMTForDate 的二次封装
-(JobsRetIntegerByDateBlock _Nonnull)GMTDateSecs;

@end

NS_ASSUME_NONNULL_END
