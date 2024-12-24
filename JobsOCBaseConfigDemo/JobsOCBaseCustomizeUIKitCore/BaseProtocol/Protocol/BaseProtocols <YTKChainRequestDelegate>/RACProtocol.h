//
//  RACProtocol.h
//  FM
//
//  Created by Admin on 24/12/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "DefineProperty.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// RAC
@protocol RACProtocol <NSObject>
@optional
/// 用于释放资源
Prop_strong(nullable)RACDisposable *racDisposable;
/// 用于手动控制发送事件
Prop_strong(nonnull)RACSubject *racSubject;
/// 信号通常是持久存在的
Prop_strong(nullable)RACSignal *reqSignal;
/// 通常绑定到按钮操作或用户输入
Prop_strong(nullable)RACCommand *actionCommand;
/// 适用于处理集合数据
Prop_strong(nullable)RACSequence *dataSequence;
/// 用于控制信号的多订阅行为
Prop_strong(nullable)RACMulticastConnection *dataConnection;
/// 管理信号的调度线程
Prop_strong(nonnull)RACScheduler *mainScheduler;
Prop_strong(nonnull)RACScheduler *backgroundScheduler;
/// 传递多个值
Prop_strong(nullable)RACTuple *dataTuple;
/// 信号和订阅的映射关系
Prop_strong(nullable)NSMutableDictionary<__kindof RACDisposable *, __kindof RACSignal *> *signalDisposableMap;
/// 定时器所执行的任务
Prop_copy(nullable)jobsByIDBlock doSthByIDBlock;
Prop_copy(nullable)jobsByVoidBlock doSthBlock;

@end

NS_ASSUME_NONNULL_END

#ifndef RACProtocol_synthesize
#define RACProtocol_synthesize \
\
@synthesize racDisposable = _racDisposable;\
@synthesize racSubject = _racSubject;\
@synthesize reqSignal = _reqSignal;\
@synthesize actionCommand = _actionCommand;\
@synthesize dataSequence = _dataSequence;\
@synthesize dataConnection = _dataConnection;\
@synthesize mainScheduler = _mainScheduler;\
@synthesize backgroundScheduler = _backgroundScheduler;\
@synthesize dataTuple = _dataTuple;\
@synthesize signalDisposableMap = _signalDisposableMap;\
@synthesize doSthByIDBlock = _doSthByIDBlock;\
@synthesize doSthBlock = _doSthBlock;\

#endif /* RACProtocol_synthesize */

#ifndef RACProtocol_dynamic
#define RACProtocol_dynamic \
\
@dynamic racDisposable;\
@dynamic racSubject;\
@dynamic reqSignal;\
@dynamic actionCommand;\
@dynamic dataSequence;\
@dynamic dataConnection;\
@dynamic mainScheduler;\
@dynamic backgroundScheduler;\
@dynamic dataTuple;\
@dynamic signalDisposableMap;\
@dynamic doSthByIDBlock;\
@dynamic doSthBlock;\

#endif /* RACProtocol_dynamic */
