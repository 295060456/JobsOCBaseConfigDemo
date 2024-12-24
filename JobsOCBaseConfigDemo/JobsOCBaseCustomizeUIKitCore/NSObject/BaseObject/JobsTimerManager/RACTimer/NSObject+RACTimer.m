//
//  NSObject+RACTimer.m
//  FM
//
//  Created by Admin on 6/11/2024.
//

#import "NSObject+RACTimer.h"

@implementation NSObject (RACTimer)
PROP_STRONG_OBJECT_TYPE(RACModel, racModel, RacModel)
#pragma mark —— RACTimer 的创建(创建即开始)
/// 适用于普通的对计时精度要求不高的应用场景
-(RACModel *_Nonnull)startRACTimer:(NSTimeInterval)heartbeat
                           byBlock:(jobsByVoidBlock _Nonnull)doBlock{
    /// 创建一个定时信号，每隔1秒发送一次
    @jobs_weakify(self)
    return jobsMakeRACModel(^(RACModel * _Nullable data) {
        @jobs_strongify(self)
        /// 订阅定时信号
        data.reqSignal = [[RACSignal interval:heartbeat
                                  onScheduler:RACScheduler.mainThreadScheduler] takeUntil:self.rac_willDeallocSignal];
        data.doSthByIDBlock = ^(NSDate *currentDate) {
            /// 在这里可以处理每次触发的操作
            if (doBlock) doBlock();JobsLog(@"计时器触发时间: %@", currentDate);
        };
        data.racDisposable = [data.reqSignal subscribeNext:data.doSthByIDBlock];
    });
}
/// 适用于对计时精度较高的应用场景【❤️没有 RAC 信号暴露❤️】
-(RACModel *_Nonnull)startDisposableTimer:(NSTimeInterval)heartbeat
                                  byBlock:(jobsByVoidBlock _Nonnull)doBlock{
    /// withLeeway 参数在计时器中用于控制任务的执行精度，主要是为了平衡节能与精确度
    /// withLeeway 是一个时间间隔，允许调度器在这个时间范围内延迟任务的执行，以便在可能的情况下减少 CPU 使用和电池消耗。
    /// 假设 heartbeat 设置为 5 秒，而 withLeeway 设置为 0.1 秒，则系统会尝试每 5 秒触发一次任务，但允许延迟最多 0.1 秒来优化资源使用。所以实际触发时间会在 5 秒到 5.1 秒之间。
    return jobsMakeRACModel(^(RACModel * _Nullable data) {
        data.mainScheduler = RACScheduler.mainThreadScheduler;
        data.doSthBlock = ^{
            if (doBlock) doBlock();JobsLog(@"计时器触发");
        };
        data.racDisposable = [data.mainScheduler after:NSDate.date
                                        repeatingEvery:heartbeat
                                            withLeeway:0.1
                                              schedule:data.doSthBlock];
    });
}
/// RAC + GCD
-(RACModel *_Nonnull)createSignalTimerByBlock:(jobsByVoidBlock _Nullable)doBlock{
    return jobsMakeRACModel(^(RACModel * _Nullable data) {
        __block BOOL isStopped = NO;
        data.reqSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                while (!isStopped) {
                    [NSThread sleepForTimeInterval:1.0];
                    if (!isStopped) [subscriber sendNext:NSDate.date];/// 每隔1秒发送一次信号
                }[subscriber sendCompleted];
            });return [RACDisposable disposableWithBlock:^{
                isStopped = YES;
            }];
        }];
        data.doSthByIDBlock = ^(NSDate *currentDate) {
            /// 计时器每次触发时要执行的任务
            if (doBlock) doBlock();JobsLog(@"自定义计时器触发时间: %@", currentDate);
        };
        data.racDisposable = [data.reqSignal subscribeNext:data.doSthByIDBlock];
    });
}
#pragma mark —— 延迟执行
/// 延迟delay秒以后执行任务
-(RACModel *_Nonnull)delay:(NSTimeInterval)delay
                   doBlock:(jobsByVoidBlock _Nullable)doBlock{
    return jobsMakeRACModel(^(RACModel * _Nullable data) {
        data.reqSignal = [[RACSignal return:@(YES)] delay:delay];
        data.doSthByIDBlock = ^(id x) {
            if(doBlock) doBlock();JobsLog(@"延迟5秒后触发的任务");
        };
        data.racDisposable = [data.reqSignal subscribeNext:data.doSthByIDBlock];
    });
}
/// 延迟delay秒以后，以heartbeat的频率，执行任务
-(RACModel *_Nonnull)delay:(NSTimeInterval)delay
                 heartbeat:(NSTimeInterval)heartbeat
                   doBlock:(jobsByVoidBlock _Nullable)doBlock{
    RACSignal *initialDelay = [[RACSignal return:@(YES)] delay:delay];/// 创建初次执行的信号
    RACSignal *intervalSignal = [RACSignal interval:heartbeat onScheduler:RACScheduler.mainThreadScheduler];/// 创建心跳间隔信号
    @jobs_weakify(self)
    return jobsMakeRACModel(^(RACModel * _Nullable data) {
        @jobs_strongify(self)
        data.reqSignal = [[initialDelay concat:intervalSignal] takeUntil:self.rac_willDeallocSignal];
        data.doSthByIDBlock = ^(id x) {
            if(doBlock) doBlock();JobsLog(@"延迟5秒后触发的任务");
        };
        data.racDisposable = [data.reqSignal subscribeNext:data.doSthByIDBlock];
    });
}
/// 先执行一次任务再根据 heartbeat 的频率执行
-(RACModel *_Nonnull)delay:(NSTimeInterval)delay
               byHeartbeat:(NSTimeInterval)heartbeat
                   doBlock:(jobsByVoidBlock _Nullable)doBlock{
    RACSignal *initialDelay = [[RACSignal return:@(YES)] delay:delay];/// 创建初次执行的信号
    RACSignal *intervalSignal = [RACSignal interval:heartbeat onScheduler:RACScheduler.mainThreadScheduler];/// 创建心跳间隔信号
    @jobs_weakify(self)
    return jobsMakeRACModel(^(RACModel * _Nullable data) {
        @jobs_strongify(self)
        data.reqSignal = [[[initialDelay concat:[RACSignal return:@(YES)]]
                           concat:intervalSignal] takeUntil:self.rac_willDeallocSignal];/// 合并信号，使得第一个信号执行一次任务;
        data.doSthByIDBlock = ^(id x) {
            if(doBlock) doBlock();JobsLog(@"延迟5秒后触发的任务");
        };
        data.racDisposable = [data.reqSignal subscribeNext:data.doSthByIDBlock];
    });
}
#pragma mark —— 停止/暂停/重启 定时器
/// 停止定时器
-(jobsByRACDisposableBlock _Nonnull)stopRACTimer{
    return ^(RACDisposable *_Nullable data){
        [data dispose];
        data = nil;
    };
}
/// 暂停定时器
-(jobsByRACDisposableBlock _Nonnull)pauseRACTimer{
    return ^(RACDisposable *_Nullable data){
        [data dispose];
    };
}
/// 重启定时器
-(jobsByRACModelBlock _Nonnull)resumeRACTimerBy{
    return ^(RACModel *_Nullable data){
        if (data.reqSignal) [data.reqSignal subscribeNext:data.doSthByIDBlock];
    };
}

@end
