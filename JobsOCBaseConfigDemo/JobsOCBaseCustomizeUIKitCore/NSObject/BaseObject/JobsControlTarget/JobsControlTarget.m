//
//  _JobsControlTarget.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "JobsControlTarget.h"

@interface JobsControlTarget ()

@end

@implementation JobsControlTarget

static inline NSTimeInterval _jobs_now(void) {
    return CFAbsoluteTimeGetCurrent();
}

-(void)invoke:(__kindof UIControl *)sender {
    // 保险：强制回到主线程（UIControl 事件本就主线程，但防止外部 sendActions 异线程调用）
    if (![NSThread isMainThread]) {
        @jobs_weakify(self)
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            [self invoke:sender];
        });return;
    }

    switch (self.policy) {
        case _JobsInvokePolicyNone: {
            if (self.block) self.block(sender);
        } break;

        case _JobsInvokePolicyOnce: {
            if (!self.block) return;
            jobsByControlBlock blk = [self.block copy];
            // 触发后解绑自身
            [sender removeTarget:self action:@selector(invoke:) forControlEvents:self.event];
            self.block = nil;
            if (blk) blk(sender);
        } break;

        case _JobsInvokePolicyThrottle: {
            NSTimeInterval now = _jobs_now();
            if (now - self.lastFire >= MAX(self.interval, 0)) {
                self.lastFire = now;
                if (self.block) self.block(sender);
            }
        } break;

        case _JobsInvokePolicyDebounce: {
            self.debounceGen += 1;
            uint64_t currentGen = self.debounceGen;
            NSTimeInterval delay = MAX(self.interval, 0);
            @jobs_weakify(self)
            @jobs_weakify(sender)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                @jobs_strongify(sender)
                if (!self || !sender) return;
                if (currentGen == self.debounceGen && self.block) {
                    self.block(sender);
                }
            });
        } break;
    }
}

@end
