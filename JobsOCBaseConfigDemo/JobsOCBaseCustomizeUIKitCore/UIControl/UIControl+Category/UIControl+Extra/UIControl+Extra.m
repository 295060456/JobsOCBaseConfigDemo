//
//  UIControl+Extra.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/26.
//

#import "UIControl+Extra.h"
/// 存储 & 绑定工具
static const void *kJobsTargetsMapKey = &kJobsTargetsMapKey;
/// 控件级别的“事件 -> target”映射
static inline NSMutableDictionary<NSNumber *, JobsControlTarget *> *_jobs_targetsMap(UIControl *ctl, BOOL createIfMissing) {
    NSMutableDictionary *map = objc_getAssociatedObject(ctl, kJobsTargetsMapKey);
    if (!map && createIfMissing) {
        map = NSMutableDictionary.dictionary;
        objc_setAssociatedObject(ctl, kJobsTargetsMapKey, map, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }return map;
}
/// 将位掩码拆成“单事件”数组（特殊处理 AllEvents：保持为一个整体）
static inline NSArray<NSNumber *> *jobs_splitEvents(UIControlEvents events) {
    if (events == UIControlEventAllEvents) {
        return @[ @(UIControlEventAllEvents) ];
    }
    NSMutableArray<NSNumber *> *arr = [NSMutableArray array];
    // 遍历 64 位足够覆盖
    for (NSUInteger bit = 0; bit < sizeof(UIControlEvents) * 8; bit++) {
        UIControlEvents mask = ((UIControlEvents)1) << bit;
        if (events & mask) [arr addObject:@(mask)];
    }return arr;
}
/// 绑定（先移除旧 target，再绑定新 target）
static inline JobsControlTarget *
_jobs_bind(UIControl *ctl, UIControlEvents singleEvent,
           _JobsInvokePolicy policy, NSTimeInterval interval, jobsByControlBlock block) {
    NSMutableDictionary *map = _jobs_targetsMap(ctl, YES);
    JobsControlTarget *old = map[@(singleEvent)];
    if (old) {
        [ctl removeTarget:old action:@selector(invoke:) forControlEvents:singleEvent];
        [map removeObjectForKey:@(singleEvent)];
    }

    JobsControlTarget *t = jobsMakeControlTarget(^(JobsControlTarget * _Nullable t) {
        t.block = [block copy];
        t.policy = policy;
        t.interval = interval;
        t.lastFire = 0;
        t.debounceGen = 0;
        t.boundControl = ctl;
        t.event = singleEvent;
    });

    [ctl addTarget:t action:@selector(invoke:) forControlEvents:singleEvent];
    map[@(singleEvent)] = t;
    return t;
}

@implementation UIControl (Extra)
/// 基础：为一个或多个事件绑定回调（同一事件再次绑定会覆盖旧回调）
-(instancetype)jobs_on:(UIControlEvents)events
                 block:(jobsByControlBlock _Nonnull)block{
    for (NSNumber *n in jobs_splitEvents(events)) {
        _jobs_bind(self, n.unsignedIntegerValue, _JobsInvokePolicyNone, 0, block);
    }
    return self;
}
/// 节流：间隔 seconds 内只执行一次（适合重复点击/拖动频繁场景）
-(instancetype)jobs_on:(UIControlEvents)events
              throttle:(NSTimeInterval)seconds
                 block:(jobsByControlBlock _Nonnull)block{
    for (NSNumber *n in jobs_splitEvents(events)) {
        _jobs_bind(self, n.unsignedIntegerValue, _JobsInvokePolicyThrottle, seconds, block);
    }
    return self;
}
/// 防抖：停止触发后等待 seconds 再执行（适合搜索框等输入联想）
-(instancetype)jobs_on:(UIControlEvents)events
              debounce:(NSTimeInterval)seconds
                 block:(jobsByControlBlock _Nonnull)block{
    for (NSNumber *n in jobs_splitEvents(events)) {
        _jobs_bind(self, n.unsignedIntegerValue, _JobsInvokePolicyDebounce, seconds, block);
    }
    return self;
}
/// 只执行一次：触发后即自动解绑
-(instancetype)jobs_once:(UIControlEvents)events
                   block:(jobsByControlBlock _Nonnull)block{
    for (NSNumber *n in jobs_splitEvents(events)) {
        _jobs_bind(self, n.unsignedIntegerValue, _JobsInvokePolicyOnce, 0, block);
    }
    return self;
}
/// 便捷：点击（.touchUpInside）
-(instancetype)jobs_onTap:(jobsByControlBlock _Nonnull)block{
    return [self jobs_on:UIControlEventTouchUpInside block:block];
}
/// 便捷：值变化（.valueChanged）
-(instancetype)jobs_onChange:(jobsByControlBlock _Nonnull)block{
    return [self jobs_on:UIControlEventValueChanged block:block];
}
/// 触发事件（等价于 sendActionsForControlEvents:）
-(void)jobs_fire:(UIControlEvents)events{
    [self sendActionsForControlEvents:events];
}
/// 移除指定事件的回调（支持复合事件位掩码）
-(void)jobs_removeHandlersFor:(UIControlEvents)events{
    NSMutableDictionary *map = _jobs_targetsMap(self, NO);
    if (!map) return;

    // AllEvents：直接针对该键移除
    if (events == UIControlEventAllEvents) {
        JobsControlTarget *t = map[@(UIControlEventAllEvents)];
        if (t) {
            [self removeTarget:t action:@selector(invoke:) forControlEvents:UIControlEventAllEvents];
            [map removeObjectForKey:@(UIControlEventAllEvents)];
        }
        return;
    }

    for (NSNumber *n in jobs_splitEvents(events)) {
        UIControlEvents ev = n.unsignedIntegerValue;
        JobsControlTarget *t = map[n];
        if (t) {
            [self removeTarget:t action:@selector(invoke:) forControlEvents:ev];
            [map removeObjectForKey:n];
        }
    }
}
/// 移除全部回调
-(void)jobs_removeAllHandlers{
    NSMutableDictionary *map = _jobs_targetsMap(self, NO);
    if (!map) return;
    [map enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, JobsControlTarget *obj, BOOL *stop) {
        [self removeTarget:obj action:@selector(invoke:) forControlEvents:key.unsignedIntegerValue];
    }];
    [map removeAllObjects];
}

@end
