//
//  JobsClockView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/29/25.
//

#import <UIKit/UIKit.h>
#import "JobsTimer.h"
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN
/// 模拟时钟：表盘 + 1～12 数字 + 时针 / 分针 / 秒针
@interface JobsClockView : UIView
/// 开始走表（默认 GCD 内核，1s 一跳）
-(void)start;
/// 指定底层计时器内核（NSTimer / GCD / CADisplayLink）
-(jobsByNSUIntegerBlock _Nonnull)startByTimerType;
/// 停止走表
-(void)stop;

@end

NS_ASSUME_NONNULL_END
