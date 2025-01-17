//
//  DispatchTimerManager.h
//  SelectorBlock
//
//  Created by Jobs on 2021/4/16.
//

#import <Foundation/Foundation.h>
#import "BaseProtocol.h"
#import "MacroDef_Func.h"
#import "JobsDefineAllEnumHeader.h"

#ifndef LOCK_MACRO_DEFINED
#define LOCK_MACRO_DEFINED
#define lock(...) \
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER); \
    __VA_ARGS__; \
    dispatch_semaphore_signal(self.semaphore);

#endif /* LOCK_MACRO_DEFINED */

NS_ASSUME_NONNULL_BEGIN
/**
    前言：
    Dispatch Source Timer 是一种与 Dispatch Queue 结合使用的定时器。
    当需要在后台 queue 中定期执行任务的时候，使用 Dispatch Source Timer 要比使用 NSTimer 更加自然，也更加高效（无需在 main queue 和后台 queue 之前切换）。
    dispatch timer中用到的时间都是纳秒，即NSEC_PER_SEC
 
    优点：
    计时准确
    可以使用子线程，解决定时间跑在主线程上卡UI问题
 */
@interface DispatchTimerManager : NSObject <BaseProtocol>
/// 同下面的方法，不过自动开始执行
+(DispatchTimerManager *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                                 target:(id)aTarget
                                               selector:(SEL)aSelector
                                               userInfo:(nullable id)userInfo
                                                repeats:(BOOL)repeats;
/// 扩充block
+(DispatchTimerManager *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                                repeats:(BOOL)repeats
                                                  block:(void (^)(DispatchTimerManager *timer))block;
/// 创建一个定时器并返回，但是并不会自动执行，需要手动调用resume方法
/// @param start 定时器启动时间
/// @param interval   间隔多久开始执行selector
/// @param target 作用域
/// @param selector 执行的任务
/// @param userInfo 绑定信息
/// @param repeats 是否重复
-(instancetype)initWithTimeInterval:(NSTimeInterval)start
                           interval:(NSTimeInterval)interval
                             target:(id)target
                           selector:(SEL)selector
                           userInfo:(nullable id)userInfo
                            repeats:(BOOL)repeats;
-(void)createDispatchTimer;
/// 启动
-(void)resume;
/// 暂停
-(void)suspend;
/// 关闭
-(void)invalidate;

@end

NS_ASSUME_NONNULL_END
/**
 【优势】
  简单易用： GCD 提供了简单易用的 API，使得在应用程序中执行并发任务变得非常容易。你只需使用几行代码就可以实现任务的并行执行。
  性能优化： GCD 使用底层系统资源来管理任务的执行，可以根据系统的资源状况来动态调整任务的执行顺序和优先级，从而优化应用程序的性能。
  多核支持： GCD 可以利用多核处理器来并行执行任务，从而提高应用程序的性能和响应速度。
  自动管理： GCD 可以自动管理线程的生命周期和资源，你不需要手动创建和管理线程，从而减少了代码的复杂性和出错的可能性。
  灵活性： GCD 提供了多种不同类型的队列和调度方式，可以满足不同类型任务的需求，例如串行队列、并行队列、同步执行、异步执行等。
     
 【劣势】
  学习曲线： 对于初学者来说，GCD 的概念可能比较抽象，需要一定的学习成本才能掌握其使用方法和最佳实践。
  调试困难： 由于 GCD 是基于异步执行的，并且任务的执行顺序和时间不确定，因此在调试时可能会遇到一些困难，特别是涉及到多个并发任务时。
  竞争条件： 如果不正确地使用 GCD，可能会导致竞争条件和死锁等并发问题，因此在编写并发代码时需要特别小心。
  不适合所有场景： 虽然 GCD 可以满足大多数应用程序的并发需求，但并不适用于所有类型的并发任务，特别是涉及到复杂的同步和通信问题时可能需要使用其他并发技术。
 */

/* 使用示例：
     {
         self.dispatchTimer = [DispatchTimerManager scheduledTimerWithTimeInterval:.5f
                                                                           repeats:YES
                                                                             block:^(DispatchTimerManager * _Nonnull timer) {
             JobsLog(@"sde");
         }];
     }
     // 或者
     {
         self.dispatchTimer = [[DispatchTimerManager alloc] initWithTimeInterval:3
                                                                        interval:1
                                                                          target:self
                                                                        selector:@selector(demo1:)
                                                                        userInfo:nil
                                                                         repeats:YES];
         [self.dispatchTimer resume];
     }
     // 亦或者
     {
         self.dispatchTimer = DispatchTimerManager.new;
         self.dispatchTimer.start = 3;
         self.dispatchTimer.timeInterval = 1;
         self.dispatchTimer.weak_target = self;
         self.dispatchTimer.selector = @selector(demo1:);
         self.dispatchTimer.repeats = YES;

         [self.dispatchTimer createDispatchTimer];
         [self.dispatchTimer resume];
     }
 **/
