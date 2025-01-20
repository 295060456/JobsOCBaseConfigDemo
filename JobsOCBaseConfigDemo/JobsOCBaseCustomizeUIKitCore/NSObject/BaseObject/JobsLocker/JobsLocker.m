//
//  JobsLocker.m
//  FM
//
//  Created by Admin on 20/1/2025.
//

#import "JobsLocker.h"

@interface JobsLocker (){
    pthread_mutex_t _mutex;/// 高性能。更适合需要精细控制的场景。
}

Prop_strong()dispatch_semaphore_t semaphore_lock;

@end

@implementation JobsLocker
BaseProtocol_synthesize_lock
- (void)dealloc {
    pthread_mutex_destroy(&_mutex); /// 销毁锁
}

- (instancetype)init {
    if (self = [super init]) {
        pthread_mutex_init(&_mutex, NULL); /// 初始化锁
        _os_lock = OS_UNFAIR_LOCK_INIT; /// os_unfair_lock 初始化
        self.semaphore_lock = dispatch_semaphore_create(1);
        self.lock = jobsMakeLock(nil);
    }return self;
}
/// pthread_mutex 是 POSIX 线程库提供的低级锁，性能很高，但使用起来稍显复杂
-(void)pthreadLockByBlock:(jobsByVoidBlock _Nonnull)block{
    if(block){
        pthread_mutex_lock(&_mutex); /// 加锁
        block();
        pthread_mutex_unlock(&_mutex); /// 解锁
    }
}
/// NSLock 是一个 Foundation 框架提供的互斥锁。更灵活，性能比 @synchronized 高。
-(void)nsLockByBlock:(jobsByVoidBlock _Nonnull)block{
    if(block){
        [self.lock lock];
        block();
        [self.lock unlock];
    }
}
/// NSRecursiveLock 是一种递归锁，同一线程可以多次获得锁而不会导致死锁。适合递归场景。
-(void)recursiveLockBlock:(jobsByVoidBlock _Nonnull)block{
    if(block){
        [self.recursiveLock lock];
        block();
        [self.recursiveLock unlock];
    }
}
/// os_unfair_lock 是 Apple 推荐的轻量级锁，性能极高。
-(void)osUnfairLockByBlock:(jobsByVoidBlock _Nonnull)block{
    if(block){
        os_unfair_lock_lock(&_os_lock); // 加锁
        block();
        os_unfair_lock_unlock(&_os_lock); // 解锁
    }
}
/// 灵活，可以控制资源的并发访问。信号量可以在多线程场景中用作锁来保护临界区
-(void)dispatchLockByBlock:(jobsByVoidBlock _Nonnull)block{
    if(block){
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER); /// 等待信号
        block();
        dispatch_semaphore_signal(self.semaphore); /// 发送信号
    }
}

@end
