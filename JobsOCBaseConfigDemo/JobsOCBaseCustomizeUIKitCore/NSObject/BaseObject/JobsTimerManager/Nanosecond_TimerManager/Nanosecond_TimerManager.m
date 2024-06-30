//
//  Nanosecond_TimerManager.m
//  Timer
//
//  Created by Jobs on 2020/9/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "Nanosecond_TimerManager.h"

@implementation Nanosecond_TimerManager

-(void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
}
/**
    1000ULL 中的 ULL 是一种整数字面量后缀，它表示这个整数是无符号长长整型(unsigned long long)。
    在 C/C++ 中，这种后缀用于确保整数字面量被解释为无符号长长整型。
    U 表示无符号整数，即整数没有符号位，表示非负数。
    LL 表示长长整型(long long)，即一个长整型的修饰符，通常用于确保整数占用的位数足够大以存储较大的整数。
    所以，1000ULL 表示一个无符号长长整数，其值为 1000。
 */
/// 定义了每微秒的纳秒数。
static const uint64_t NANOS_PER_USEC = 1000ULL;
/// 定义了每毫秒的纳秒数，即每微秒乘以 1000
static const uint64_t NANOS_PER_MILLISEC = 1000ULL * NANOS_PER_USEC;
/// 定义了每秒的纳秒数，即每毫秒乘以 1000
static const uint64_t NANOS_PER_SEC = 1000ULL * NANOS_PER_MILLISEC;
/// 定义了一个结构体变量 timebase_info，用于存储时间基准信息
static mach_timebase_info_data_t timebase_info;
/// 定义了一个函数 nanos_to_abs，用于将纳秒转换为绝对时间。
static uint64_t nanos_to_abs(uint64_t nanos) {
    return nanos * timebase_info.denom / timebase_info.numer;
}
/// 一个等待指定秒数的函数
void waitSeconds(int seconds) {
    /// 获取时间基准信息
    mach_timebase_info(&timebase_info);
    /// 计算要等待的绝对时间，即将输入的秒数乘以每秒的纳秒数，并转换为绝对时间
    uint64_t time_to_wait = nanos_to_abs(seconds * NANOS_PER_SEC);
    /// 获取当前的绝对时间
    uint64_t now = mach_absolute_time();
    /// 等待直到当前时间加上要等待的时间
    /// mach_wait_until 会阻塞当前线程，直到指定的绝对时间
    mach_wait_until(now + time_to_wait);
}

@end
