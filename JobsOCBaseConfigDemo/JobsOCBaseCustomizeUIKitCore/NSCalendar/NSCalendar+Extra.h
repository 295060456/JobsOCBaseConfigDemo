//
//  NSCalendar+Extra.h
//  FM
//
//  Created by Admin on 26/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSCalendar (Extra)
/// 对系统方法 calendarWithIdentifier 的二次封装
+(JobsReturnCalendarByCalendarIdentifierBlock _Nonnull)initBy;
/// 对系统方法 dateFromComponents 的二次封装
-(JobsReturnDateByDateComponentsBlock _Nonnull)dateByComponents;
/// 对系统方法 initWithCalendarIdentifier 的二次封装
+(JobsReturnCalendarByCalendarIdentifierBlock _Nonnull)initByCalendarIdentifier;

@end

NS_ASSUME_NONNULL_END
