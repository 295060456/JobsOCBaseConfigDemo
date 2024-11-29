//
//  NSObject+RACTimer.m
//  FM
//
//  Created by Admin on 6/11/2024.
//

#import "NSObject+RACTimer.h"

@implementation NSObject (RACTimer)
#pragma mark —— RACTimer 的创建
/// 适用于普通的对计时精度要求不高的应用场景
-(RACDisposable *_Nonnull)startRACTimer:(NSTimeInterval)heartbeat
                                byBlock:(jobsByVoidBlock _Nonnull)doBlock{
    /// 创建一个定时信号，每隔1秒发送一次
    /// 订阅定时信号
    return [[[RACSignal interval:heartbeat
                     onScheduler:RACScheduler.mainThreadScheduler]
             takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSDate *currentDate) {
        /// 在这里可以处理每次触发的操作
        NSLog(@"计时器触发时间: %@", currentDate);
        if (doBlock) doBlock();
    }];
}
/// 适用于对计时精度较高的应用场景
-(RACDisposable *_Nonnull)startDisposableTimer:(NSTimeInterval)heartbeat
                                       byBlock:(jobsByVoidBlock _Nonnull)doBlock{
    /// withLeeway 参数在计时器中用于控制任务的执行精度，主要是为了平衡节能与精确度
    /// withLeeway 是一个时间间隔，允许调度器在这个时间范围内延迟任务的执行，以便在可能的情况下减少 CPU 使用和电池消耗。
    /// 假设 heartbeat 设置为 5 秒，而 withLeeway 设置为 0.1 秒，则系统会尝试每 5 秒触发一次任务，但允许延迟最多 0.1 秒来优化资源使用。所以实际触发时间会在 5 秒到 5.1 秒之间。
    return [RACScheduler.mainThreadScheduler after:NSDate.date
                                    repeatingEvery:heartbeat
                                        withLeeway:0.1
                                          schedule:^{
        NSLog(@"计时器触发");
//        [disposable dispose];/// 停止定时器
        if (doBlock) doBlock();
    }];
}
/// RAC + GCD
-(RACDisposable *_Nonnull)createSignalTimerByBlock:(jobsByVoidBlock _Nullable)doBlock{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        __block BOOL isStopped = NO;
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(queue, ^{
            while (!isStopped) {
                [NSThread sleepForTimeInterval:1.0];
                if (!isStopped) {
                    /// 每隔1秒发送一次信号
                    [subscriber sendNext:NSDate.date];
                }
            }[subscriber sendCompleted];
        });return [RACDisposable disposableWithBlock:^{
            isStopped = YES;
        }];
    }] subscribeNext:^(NSDate *currentDate) {
        NSLog(@"自定义计时器触发时间: %@", currentDate);
        /// 计时器每次触发时要执行的任务
        if (doBlock) doBlock();
    }];
}
#pragma mark —— 延迟执行
/// 延迟delay秒以后执行任务
-(RACDisposable *_Nonnull)delay:(NSTimeInterval)delay doBlock:(jobsByVoidBlock _Nullable)doBlock{
    return [[[RACSignal return:@(YES)] delay:delay] subscribeNext:^(id x) {
        NSLog(@"延迟5秒后触发的任务");
        if(doBlock) doBlock();
    }];
}
/// 延迟delay秒以后，以heartbeat的频率，执行任务
-(RACDisposable *_Nonnull)delay:(NSTimeInterval)delay
                      heartbeat:(NSTimeInterval)heartbeat
                        doBlock:(jobsByVoidBlock _Nullable)doBlock{
    RACSignal *initialDelay = [[RACSignal return:@(YES)] delay:delay];
    RACSignal *intervalSignal = [RACSignal interval:heartbeat onScheduler:RACScheduler.mainThreadScheduler];
    RACSignal *combinedSignal = [[initialDelay concat:intervalSignal] takeUntil:self.rac_willDeallocSignal];
    return [combinedSignal subscribeNext:^(id x) {
        NSLog(@"分段式计时器触发");
        if(doBlock) doBlock();
    }];
}
#pragma mark —— 停止定时器
-(jobsByRACDisposableBlock _Nonnull)stopRACTimer{
    return ^(RACDisposable *_Nullable data){
        [data dispose];
    };
}

@end
