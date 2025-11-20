//
//  NSObject+RACTimer.h
//  FM
//
//  Created by Admin on 6/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "DefineProperty.h"
#import "RACModel.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (RACTimer)
Prop_strong(nonnull)RACModel *racModel;
#pragma mark —— RACTimer 的创建(创建即开始)
/// 适用于普通的对计时精度要求不高的应用场景
-(RACModel *_Nonnull)startRACTimer:(NSTimeInterval)heartbeat
                           byBlock:(jobsByVoidBlock _Nonnull)doBlock;
/// 适用于对计时精度较高的应用场景
-(RACModel *_Nonnull)startDisposableTimer:(NSTimeInterval)heartbeat
                                  byBlock:(jobsByVoidBlock _Nonnull)doBlock;
/// RAC + GCD
-(RACModel *_Nonnull)createSignalTimerByBlock:(jobsByVoidBlock _Nullable)doBlock;
#pragma mark —— 延迟执行
/// 延迟delay秒以后执行任务
-(RACModel *_Nonnull)delay:(NSTimeInterval)delay
                   doBlock:(jobsByVoidBlock _Nullable)doBlock;
/// 延迟delay秒以后，以heartbeat的频率，执行任务
-(RACModel *_Nonnull)delay:(NSTimeInterval)delay
                 heartbeat:(NSTimeInterval)heartbeat
                   doBlock:(jobsByVoidBlock _Nullable)doBlock;
/// 先执行一次任务再根据 heartbeat 的频率执行
-(RACModel *_Nonnull)delay:(NSTimeInterval)delay
               byHeartbeat:(NSTimeInterval)heartbeat
                   doBlock:(jobsByVoidBlock _Nullable)doBlock;
#pragma mark —— 停止/暂停/重启 定时器
/// 停止定时器
-(jobsByRACDisposableBlock _Nonnull)stopRACTimer;
/// 暂停定时器
-(jobsByRACDisposableBlock _Nonnull)pauseRACTimer;
/// 重启定时器
-(jobsByRACModelBlock _Nonnull)resumeRACTimerBy;

@end

NS_ASSUME_NONNULL_END
