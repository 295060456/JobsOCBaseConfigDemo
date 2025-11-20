//
//  Nanosecond_TimerManager.h
//  Timer
//
//  Created by Jobs on 2020/9/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <mach/mach.h>
#import <mach/mach_time.h>

//此类虽然为工具类，但是不允许用单例，因为timer需要被释放
NS_ASSUME_NONNULL_BEGIN
/// 理论上这是iPhone上最精准的定时器，可以达到纳秒级别的精度
@interface Nanosecond_TimerManager : NSObject
/// 一个等待指定秒数的函数
void waitSeconds(int seconds);

@end

NS_ASSUME_NONNULL_END
