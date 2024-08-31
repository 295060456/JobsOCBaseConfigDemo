//
//  NSMutableArray+Extra.h
//  Casino
//
//  Created by Jobs on 2022/1/14.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (Extra)
/// 清除数组元素
-(jobsByVoidBlock _Nonnull)clean;
/// 阻止向可变数组添加空元素
-(JobsReturnIDByIDBlock _Nonnull)add;
/// 向数组加入一个从来没有没有过的元素，以保证数组元素的单一性
-(JobsReturnIDByIDBlock _Nonnull)jobsAddSoleObject;
/// 将数组里的某个元素移动到原数组的某个位
-(NSMutableArray *_Nullable)moveElementFromIndex:(NSInteger)fromIndex
                                         toIndex:(NSInteger)toIndex;
/// 将数组里的元素复制times次
-(JobsReturnMutableArrayByIntegerBlock)copyElementBytimes;

@end

NS_ASSUME_NONNULL_END
