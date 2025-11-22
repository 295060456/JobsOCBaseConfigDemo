//
//  NSObject+Queue.h
//  DouDong-II
//
//  Created by Jobs on 2021/3/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "NSString+Others.h"
/// 永远异步丢到主线程（GCD）
#ifndef JobsMainQueue
#define JobsMainQueue(block) \
    dispatch_async(dispatch_get_main_queue(), block)
#endif
/// 永远丢到主线程（NSOperationQueue）
#ifndef JobsMainOperationQueue
#define JobsMainOperationQueue(block)                          \
    do {                                                       \
        [NSOperationQueue.mainQueue addOperationWithBlock:block]; \
    } while (0)
#endif

NS_ASSUME_NONNULL_BEGIN
// https://www.jianshu.com/p/564b5da57ea1
@interface NSObject (Queue)
/// 用于：UI刷新（高频需求）
-(void)delayByMainQueue:(int64_t)time block:(jobsByVoidBlock)block;
/// 用于：重计算 / IO
-(void)delayByGlobalQueue:(int64_t)time block:(jobsByVoidBlock)block;

@end

NS_ASSUME_NONNULL_END
