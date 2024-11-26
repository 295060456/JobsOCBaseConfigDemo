//
//  JobsOnceExecutor.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/12/24.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "NSObject+Extras.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOnceExecutor : NSObject
/// 利用时间戳做key保证当前key的唯一性。整个App全局只执行一次的代码
+(void)executeOnceForObject:(id)object withBlock:(dispatch_block_t)block;
/// 利用时间戳做key保证当前key的唯一性。当前调用类只执行一次
-(void)executeOnceWithBlock:(dispatch_block_t)block;

@end

NS_ASSUME_NONNULL_END
