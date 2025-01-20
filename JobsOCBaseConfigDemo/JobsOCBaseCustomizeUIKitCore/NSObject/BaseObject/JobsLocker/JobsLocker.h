//
//  JobsLocker.h
//  FM
//
//  Created by Admin on 20/1/2025.
//

#import <Foundation/Foundation.h>
#import <pthread.h>
#import <os/lock.h>

#import "JobsBlock.h"
#import "BaseProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsLocker : NSObject<BaseProtocol>

/// pthread_mutex 是 POSIX 线程库提供的低级锁，性能很高，但使用起来稍显复杂
-(void)pthreadLockByBlock:(jobsByVoidBlock _Nonnull)block;
/// NSLock 是一个 Foundation 框架提供的互斥锁。更灵活，性能比 @synchronized 高。
-(void)nsLockByBlock:(jobsByVoidBlock _Nonnull)block;
/// NSRecursiveLock 是一种递归锁，同一线程可以多次获得锁而不会导致死锁。适合递归场景。
-(void)recursiveLockBlock:(jobsByVoidBlock _Nonnull)block;
/// os_unfair_lock 是 Apple 推荐的轻量级锁，性能极高。
-(void)osUnfairLockByBlock:(jobsByVoidBlock _Nonnull)block;
/// 灵活，可以控制资源的并发访问。信号量可以在多线程场景中用作锁来保护临界区
-(void)dispatchLockByBlock:(jobsByVoidBlock _Nonnull)block;

@end

NS_ASSUME_NONNULL_END
/**
 
 锁的基础概念
 互斥锁（Mutex, Mutual Exclusion Lock）：

 互斥锁是一种基本的锁，用于确保一次只有一个线程可以访问某资源。
 如果一个线程获得了锁，其他线程必须等待锁被释放。
 读写锁（Read-Write Lock）：

 读写锁允许多个线程同时读取，但写操作是排他的，即在写操作进行时，其他读线程或写线程都要等待。
 递归锁（Recursive Lock）：

 允许同一线程多次加锁，而不会导致死锁。
 递归锁对某些场景很有用，比如在递归函数中使用锁。
 自旋锁（Spin Lock）：

 自旋锁是轻量级锁，如果锁被占用，线程不会立即挂起，而是会不断尝试获取锁。
 自旋锁适合加锁时间非常短的场景，因为线程在等待时不会切换上下文，效率更高。
 
 */

/**
 
 在 iOS 和 Objective-C 中，原子属性（atomic property） 是 @property 的一种属性修饰符，它决定了属性的线程安全性。如果声明为 atomic，编译器会为这个属性的 getter 和 setter 方法生成某种程度的线程安全代码，确保在多线程访问时，属性的值总是返回一个完整的对象。

 原子属性的特点
 默认行为：

 如果你不显式声明 nonatomic，@property 默认是 atomic。
 线程安全：

 对于 atomic 的属性，编译器在生成的 getter 和 setter 方法中会使用锁（类似自旋锁或其他锁机制）来确保值的完整性。
 例如，在 getter 方法中，即使有其他线程正在修改属性值，也不会返回一个“半成品”对象。
 影响性能：

 因为 atomic 属性需要加锁和解锁操作，所以性能比 nonatomic 稍差。尤其是在频繁访问属性时，可能会成为性能瓶颈。
 保证的是“值完整性”，而不是“业务逻辑完整性”：

 atomic 只保证 getter 和 setter 的操作是线程安全的，但不保证多线程间的操作逻辑是安全的。例如，多个线程同时修改属性值时，仍可能产生竞争条件。

 */

/**
 
 为什么实际开发中常用 nonatomic？
 性能需求：

 在大多数应用场景下，性能优先于线程安全，尤其是在频繁访问的属性上。相比之下，nonatomic 不会进行加锁操作，性能更高。
 线程安全通常由其他机制保证：

 应用通常通过更高级的同步机制（如 GCD、锁）来保证线程安全，而不是依赖于属性的 atomic。
 atomic 不完全保证线程安全：

 即使使用 atomic，多线程操作仍然可能引发逻辑问题，例如读写操作之间的竞态条件。所以需要额外的同步控制。
 
 总结
 atomic 属性是线程安全的，但在实际开发中很少使用，因为其性能开销较高，而且它并不能解决所有线程安全问题。
 开发中推荐使用 nonatomic，同时通过其他手段（如 GCD 或 NSLock）来实现真正的线程安全。
 */

/**
 低地址
 +------------------+
 | 代码段 (Text)    |
 +------------------+
 | 数据段 (Data)    |
 +------------------+
 | BSS 段           |
 +------------------+
 | 堆 (Heap)        |  <-- 向高地址增长
 |                  |
 +------------------+
 | 栈 (Stack)       |  <-- 向低地址增长
 +------------------+
 高地址
 */
