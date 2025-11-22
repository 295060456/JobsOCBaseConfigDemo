//
//  NSObject+Queue.m
//  DouDong-II
//
//  Created by Jobs on 2021/3/24.
//

#import "NSObject+Queue.h"

@implementation NSObject (Queue)
/// 用于：UI刷新（高频需求）
-(void)delayByMainQueue:(int64_t)time block:(jobsByVoidBlock)block{
    if(time < 0) time = 0;
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW,(int64_t)(time * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        if(block) block();
        if (JobsDebug) {
            [NSString stringWithFormat:@"%lld", time].add(@"秒到了，我被打印出来了！").toast();
            JobsLog(@"%@",JobsLocalFunc);
            PrintRetainCount(self)
        }
    });
}
/// 用于：重计算 / IO
-(void)delayByGlobalQueue:(int64_t)time block:(jobsByVoidBlock)block{
    if(time < 0) time = 0;
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW,(int64_t)(time * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if(block) block();
        NSLog(@"10 秒到了，我被打印出来了！");
    });
}

@end
