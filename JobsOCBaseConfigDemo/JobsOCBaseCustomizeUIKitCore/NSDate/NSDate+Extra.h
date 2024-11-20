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
/// 创建 Date 对象
+(JobsReturnDateByTimeIntervalBlock _Nonnull)dateBy;
/// 将NSDate转化为可视化的时间字符串（年/月/日）
-(JobsReturnStringByDateFormatterBlock _Nonnull)toVisualTime;

@end

NS_ASSUME_NONNULL_END
