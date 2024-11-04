//
//  NSTimerManager.h
//  Timer
//
//  Created by Jobs on 2020/9/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsTimerManager_DefineStructure.h"
#import "JobsTimeModel.h"
#import "NSObject+Time.h"
#import "MacroDef_Func.h"

@class NSTimerManager;
/**
 *  此类虽然为工具类，但是不允许用单例，因为timer需要被释放

 *  NSTimer只有被加入到runloop, 才会生效, 即NSTimer才会被真正执行
 *  scheduledTimerWithTimeInterval相比它的小伙伴们不仅仅是创建了NSTimer对象, 还把该对象加入到了当前的runloop中，runloop的模式为默认模式（NSDefaultRunLoopMode）!
 */
NS_ASSUME_NONNULL_BEGIN

@interface NSTimerManager : NSObject

@property(nonatomic,strong)NSInvocation *invocation;
@property(nonatomic,strong,nullable)id target;
@property(nonatomic,assign,nullable)SEL selector;
@property(nonatomic,strong,nullable)id userInfo;
@property(nonatomic,assign)ScheduledTimerType timerType;
@property(nonatomic,assign)TimerStyle timerStyle;/// 逆时针模式?顺时针模式？
@property(nonatomic,assign)CGFloat anticlockwiseTime;/// ❤️【逆时针模式：到这个时间点结束】、【顺时针模式：从这个时间点开始】
@property(nonatomic,assign,readonly)NSTimerCurrentStatus timerCurrentStatus;// 定时器当前状态

@property(nonatomic,strong)UIButtonModel *timerProcessModel;
@property(nonatomic,assign)NSTimeInterval timeSecIntervalSinceDate;/// 推移时间，秒数
@property(nonatomic,assign)NSTimeInterval timeInterval;/// 时间间距
@property(nonatomic,assign)BOOL repeats;
@property(nonatomic,strong,nullable)NSTimer *__block nsTimer;
/// 定时器启动 手动添加定时器到RunLoop
-(jobsByRunLoopBlock _Nonnull)nsTimeStartWithRunLoop;/// currentRunLoop可调用子线程；mainrunloop主线程
/// 定时器启动：newTimer + 系统自动添加到RunLoop
-(JobsReturnTimerByVoidBlock _Nonnull)nsTimeStartSysAutoInRunLoop;
/// 定时器暂停
-(jobsByVoidBlock _Nonnull)nsTimePause;
/// 定时器继续
-(jobsByVoidBlock _Nonnull)nsTimecontinue;
/// 销毁定时器
-(jobsByVoidBlock _Nonnull)nsTimeDestroy;

@end

NS_ASSUME_NONNULL_END

NS_INLINE NSTimerManager *_Nonnull jobsMakeTimerManager(jobsByTimerManagerBlock _Nonnull block){
    NSTimerManager *model = NSTimerManager.alloc.init;
    if (block) block(model);
    return model;
}
/**
 【优势】
 简单易用： NSTimer 的使用非常简单，只需创建一个实例并指定一个目标方法和触发时间间隔，然后将其添加到运行循环中即可。
 灵活性： NSTimer 可以用于执行一次性任务或周期性任务，你可以根据需要设置重复次数或无限重复。
 线程安全： NSTimer 是线程安全的，可以在主线程或其他线程中使用，而不必担心线程同步的问题。
 精确度： NSTimer 提供了相对较高的精确度，可以满足大多数应用场景的需求。
 
 【劣势】
 不准确： NSTimer 并不是实时触发的，它依赖于运行循环和系统资源的可用性，因此在某些情况下可能会出现延迟或不准确的情况。
 运行循环依赖： NSTimer 是依赖于运行循环的，如果运行循环被阻塞或者停止了，NSTimer 的触发也会受到影响。
 内存管理： 如果 NSTimer 持有它的目标对象，而目标对象又持有 NSTimer，可能会导致循环引用和内存泄漏的问题，因此在使用时需要小心管理内存。
 不适合高频率任务： 如果需要执行高频率的任务，例如每秒钟执行多次，使用 NSTimer 可能会影响性能，因为 NSTimer 的触发时间间隔是相对较长的。
 */

/*  关于 - (void)fire; 方法
 *  其实他并不是真的启动一个定时器，从之前的初始化方法中我们也可以看到，建立的时候，在适当的时间，定时器就会自动启动，也即NSTimer是不准时的
 *  即  fire  方法只是提前出发定时器的执行，但不影响定时器的设定时间。
 */

/**
 
 调用示例：
 
 -(NSTimerManager *)nsTimerManager{
     if (!_nsTimerManager) {
         _nsTimerManager = NSTimerManager.new;
         /// 以下2种模式任选一种
         {/// 顺时针模式
             _nsTimerManager.timerStyle = TimerStyle_clockwise;
         }
         
 //        {/// 逆时针模式
 //            _nsTimerManager.timerStyle = TimerStyle_anticlockwise;
 //            _nsTimerManager.anticlockwiseTime = 100;
 //        }
         
         _nsTimerManager.timeInterval = .5f;
         @jobs_weakify(self)
         [_nsTimerManager actionObjectBlock:^(id data) {
             @jobs_strongify(self)
             if ([data isKindOfClass:UIButtonModel.class]) {
                 UIButtonModel *model = (UIButtonModel *)data;
                 NSLog(@"❤️❤️❤️❤️❤️%f",model.data.anticlockwiseTime);
                 self.valueLab.text = [NSString stringWithFormat:@"%.2f",model.data.anticlockwiseTime];
             }
         }];
     }return _nsTimerManager;
 }

 */
