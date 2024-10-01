//
//  NSMutableArray+Extra.h
//  Casino
//
//  Created by Jobs on 2022/1/14.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

/// 可变数组的方便调用
NS_INLINE __kindof NSArray *_Nonnull jobsMakeMutArr(jobsByMutArrayBlock _Nonnull block){
    NSMutableArray *data = NSMutableArray.array;
    if (block) block(data);
    return data;
}

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (Extra)
+(JobsReturnArrayByArrayBlock _Nonnull)initBy;
/// 清除数组元素
-(jobsByVoidBlock _Nonnull)clean;
/// 数组取值（无法关联数组的泛型）
-(JobsReturnIDByUIntegerBlock _Nonnull)objectAt;
/// 数组取下标
-(JobsReturnNSUIntegerByIDBlock _Nonnull)indexBy;
/// 阻止向可变数组添加空元素
-(JobsReturnIDByIDBlock _Nonnull)add;
/// 阻止向可变数组添加空元素
-(JobsReturnIDByIDBlock _Nonnull)addBy;
/// 向数组加入一个从来没有没有过的元素，以保证数组元素的单一性
-(JobsReturnIDByIDBlock _Nonnull)jobsAddSoleObject;
/// 将数组里的某个元素移动到原数组的某个位
-(__kindof NSArray *_Nullable)moveElementFromIndex:(NSInteger)fromIndex
                                           toIndex:(NSInteger)toIndex;
/// 将数组里的元素复制times次
-(JobsReturnArrayByIntegerBlock _Nonnull)copyElementBytimes;

@end

NS_ASSUME_NONNULL_END
