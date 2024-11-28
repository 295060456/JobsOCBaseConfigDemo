//
//  UILabel+Scroll.h
//  FM
//
//  Created by Admin on 28/11/2024.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsBlock.h"
#import "NSString+Others.h"
#import "NSMutableDictionary+Extra.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Scroll)

-(RACDisposable *)startRACTimerWithDuration:(NSTimeInterval)duration
                                    byBlock:(jobsByVoidBlock _Nonnull)doBlock;

@end

NS_ASSUME_NONNULL_END

/**
 // 启动滚动，设置每隔 0.1 秒滚动一次
 RACDisposable *timerDisposable = [scrollingLabel startRACTimerWithDuration:0.1 byBlock:^{
     // 可以在这里添加每次触发时需要执行的操作
     NSLog(@"Text has been scrolled.");
 }];
 
 // 当需要取消定时器时调用
 [timerDisposable dispose];
 
 */
