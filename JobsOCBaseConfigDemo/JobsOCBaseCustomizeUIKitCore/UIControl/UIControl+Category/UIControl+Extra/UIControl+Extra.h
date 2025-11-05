//
//  UIControl+Extra.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/26.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsControlTarget.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (Extra)
/// 基础：为一个或多个事件绑定回调（同一事件再次绑定会覆盖旧回调）
-(instancetype)jobs_on:(UIControlEvents)events
                 block:(jobsByControlBlock _Nonnull)block;
/// 节流：间隔 seconds 内只执行一次（适合重复点击/拖动频繁场景）
-(instancetype)jobs_on:(UIControlEvents)events
              throttle:(NSTimeInterval)seconds
                 block:(jobsByControlBlock _Nonnull)block;
/// 防抖：停止触发后等待 seconds 再执行（适合搜索框等输入联想）
-(instancetype)jobs_on:(UIControlEvents)events
              debounce:(NSTimeInterval)seconds
                 block:(jobsByControlBlock _Nonnull)block;
/// 只执行一次：触发后即自动解绑
-(instancetype)jobs_once:(UIControlEvents)events
                   block:(jobsByControlBlock _Nonnull)block;
/// 便捷：点击（.touchUpInside）
-(instancetype)jobs_onTap:(jobsByControlBlock _Nonnull)block;
/// 便捷：值变化（.valueChanged）
-(instancetype)jobs_onChange:(jobsByControlBlock _Nonnull)block;
/// 触发事件（等价于 sendActionsForControlEvents:）
-(void)jobs_fire:(UIControlEvents)events;
/// 移除指定事件的回调（支持复合事件位掩码）
-(void)jobs_removeHandlersFor:(UIControlEvents)events;
/// 移除全部回调
-(void)jobs_removeAllHandlers;

@end

NS_ASSUME_NONNULL_END
