//
//  NSObject+DefConfig.m
//  DouDong-II
//
//  Created by Jobs on 2021/3/24.
//

#import "NSObject+DefConfig.h"

@implementation NSObject (DefConfig)
/// 回到主线程
-(void)getMainQueue:(jobsByVoidBlock _Nullable)block{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (block) block();
    });
}
/// 开启一个子线程
-(void)getGlobalQueue:(jobsByVoidBlock _Nullable)block{
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        if (block) block();
    });
}
/// 从现在开始，等待一段时间，去做一件事情
/// @param delay 从现在开始，等待的时间
/// @param doSthBlock 去做的一件事情
-(void)delay:(CGFloat)delay
       doSth:(jobsByIDBlock _Nullable)doSthBlock{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                 (int64_t)(delay * NSEC_PER_SEC)),
                   dispatch_get_main_queue(),^{
        if (doSthBlock) doSthBlock(@1);
     });
}

@end
