//
//  NSMutableSet+Extra.h
//  FM
//
//  Created by User on 8/6/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
/// 可变数组的方便调用
static inline __kindof NSSet *_Nonnull jobsMakeMutSet(jobsBySetBlock _Nonnull block){
    NSMutableSet *data = NSMutableSet.set;
    if (block) block(data);
    return data;
}

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableSet (Extra)
/// 阻止向可变集合添加空元素
-(JobsReturnIDByIDBlock _Nonnull)add;

@end

NS_ASSUME_NONNULL_END
