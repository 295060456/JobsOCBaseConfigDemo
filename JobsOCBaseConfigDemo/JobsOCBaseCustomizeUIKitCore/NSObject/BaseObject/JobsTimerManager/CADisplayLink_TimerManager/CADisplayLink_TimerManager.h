//
//  CADisplayLink_TimerManager.h
//  Timer
//
//  Created by Jobs on 2020/9/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobsTimerManager_DefineStructure.h"
#import "JobsBlock.h"
#import "NSObject+DynamicInvoke.h"

//此类虽然为工具类，但是不允许用单例，因为timer需要被释放
NS_ASSUME_NONNULL_BEGIN

@interface CADisplayLink_TimerManager : NSObject

@property(nonatomic,strong)CADisplayLink *displayLink;
@property(nonatomic,copy)jobsByIDBlock CADisplayLinkTimerManagerBlock;

@end

NS_ASSUME_NONNULL_END
/**
 【优势】
 同屏幕刷新同步： CADisplayLink 会在每次屏幕刷新之前调用指定的方法，确保动画更新与屏幕刷新同步，从而实现流畅的动画效果。
 精确的时间控制： CADisplayLink 提供了精确的时间控制，可以设置动画的帧率和持续时间，以实现各种类型的动画效果。
 简单易用： CADisplayLink 的使用非常简单，只需创建一个实例并指定一个目标方法，然后将其添加到主运行循环中即可。
 自动管理： CADisplayLink 会自动根据屏幕的刷新频率调整动画的帧率，确保动画效果在不同设备上表现一致。
 
 【劣势】
 主线程阻塞： 使用 CADisplayLink 进行动画更新时，相关的方法会在主线程中执行，如果动画逻辑复杂或者处理时间过长，可能会导致主线程阻塞，影响应用的响应性能。
 不适合所有场景： CADisplayLink 适用于实现基于帧率的动画效果，但并不适用于所有类型的动画，例如复杂的过渡效果或基于物理引擎的动画。
 需谨慎管理： 使用 CADisplayLink 进行动画更新时，需要谨慎管理内存和资源，避免出现内存泄漏或性能问题。
 */
