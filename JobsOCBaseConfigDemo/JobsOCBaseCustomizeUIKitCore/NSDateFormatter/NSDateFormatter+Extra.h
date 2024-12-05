//
//  NSDateFormatter+Extra.h
//  FM
//
//  Created by Admin on 5/12/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSDateFormatter (Extra)
/// 对系统方法 stringFromDate 的二次封装
-(JobsReturnStringByDateBlock _Nonnull)stringByDate;
/// 对系统方法 dateFromString 的二次封装
-(JobsReturnDateByStringBlock _Nonnull)dateByString;

@end

NS_ASSUME_NONNULL_END

//NS_INLINE __kindof NSDateFormatter *_Nonnull jobsMakeDateFormatter(jobsByLabelBlock _Nonnull block){
//    NSDateFormatter *data = NSDateFormatter.alloc.init;
//    if (block) block(data);
//    return data;
//}
