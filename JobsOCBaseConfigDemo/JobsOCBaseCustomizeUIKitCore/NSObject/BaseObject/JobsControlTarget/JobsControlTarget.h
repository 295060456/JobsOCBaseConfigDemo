//
//  _JobsControlTarget.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "DefineProperty.h"
#import "JobsBlock.h"

typedef NS_ENUM(NSInteger, _JobsInvokePolicy) {
    _JobsInvokePolicyNone = 0,      // 普通：直接执行
    _JobsInvokePolicyThrottle,      // 节流：间隔内只执行一次（leading）
    _JobsInvokePolicyDebounce,      // 防抖：静默期后执行（trailing）
    _JobsInvokePolicyOnce,          // 一次性：触发后解绑
};

NS_ASSUME_NONNULL_BEGIN
/// 内部 Target 容器
@interface JobsControlTarget : NSObject

Prop_copy(nullable)jobsByCtrlBlock block;
Prop_assign()_JobsInvokePolicy policy;
Prop_assign()NSTimeInterval interval;   // for throttle/debounce
Prop_assign()NSTimeInterval lastFire;   // for throttle
Prop_assign()uint64_t debounceGen;      // for debounce
Prop_weak()UIControl *boundControl;
Prop_assign()UIControlEvents event;     // 单一事件

-(void)invoke:(__kindof UIControl *)sender;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsControlTarget *_Nonnull jobsMakeControlTarget(jobsByControlTargeBlock _Nonnull block){
    JobsControlTarget *data = JobsControlTarget.alloc.init;
    if (block) block(data);
    return data;
}
