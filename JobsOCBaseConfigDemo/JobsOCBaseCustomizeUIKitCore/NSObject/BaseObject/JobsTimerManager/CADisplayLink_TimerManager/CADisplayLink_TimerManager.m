//
//  CADisplayLink_TimerManager.m
//  Timer
//
//  Created by Jobs on 2020/9/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "CADisplayLink_TimerManager.h"

@interface CADisplayLink_TimerManager ()

@end

@implementation CADisplayLink_TimerManager

-(void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
}
/// 需要定时器做的事情，回调
-(void)actionCADisplayLinkTimerManagerBlock:(jobsByIDBlock _Nullable)CADisplayLinkTimerManagerBlock{
    self.CADisplayLinkTimerManagerBlock = CADisplayLinkTimerManagerBlock;
}
#pragma mark —— lazyLoad
//CAD 目前有且仅有这一个初始化方法
-(CADisplayLink *)displayLink{
    if (!_displayLink) {
        @jobs_weakify(self)
        _displayLink = [CADisplayLink displayLinkWithTarget:self
                                                   selector:selectorBlocks(^id _Nullable(id _Nullable weakSelf,id _Nullable arg) {
            @jobs_strongify(self)
            if (self.CADisplayLinkTimerManagerBlock) self.CADisplayLinkTimerManagerBlock(self.displayLink);
            return nil;
        }, MethodName(self), self)];
    }return _displayLink;
}

@end
