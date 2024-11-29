//
//  NSObject+RACTimer.h
//  FM
//
//  Created by Admin on 6/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (RACTimer)
#pragma mark —— RACTimer 的创建
/// 适用于普通的对计时精度要求不高的应用场景
-(RACDisposable *_Nonnull)startRACTimer:(NSTimeInterval)heartbeat
                                byBlock:(jobsByVoidBlock _Nonnull)doBlock;
/// 适用于对计时精度较高的应用场景
-(RACDisposable *_Nonnull)startDisposableTimer:(NSTimeInterval)heartbeat
                                       byBlock:(jobsByVoidBlock _Nonnull)doBlock;
/// RAC + GCD
-(RACDisposable *_Nonnull)createSignalTimerByBlock:(jobsByVoidBlock _Nullable)doBlock;
#pragma mark —— 延迟执行
/// 延迟delay秒以后执行任务
-(RACDisposable *_Nonnull)delay:(NSTimeInterval)delay doBlock:(jobsByVoidBlock _Nullable)doBlock;
/// 延迟delay秒以后，以heartbeat的频率，执行任务
-(RACDisposable *_Nonnull)delay:(NSTimeInterval)delay
                      heartbeat:(NSTimeInterval)heartbeat
                        doBlock:(jobsByVoidBlock _Nullable)doBlock;
#pragma mark —— 停止定时器
-(jobsByRACDisposableBlock _Nonnull)stopRACTimer;

@end

NS_ASSUME_NONNULL_END
