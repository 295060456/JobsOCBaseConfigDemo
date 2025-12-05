//
//  ScrollDecelerator.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 12/5/25.
//

#import <Foundation/Foundation.h>
#import <math.h>

NS_ASSUME_NONNULL_BEGIN
/// 模拟 UIScrollView 的减速曲线：
/// velocity：当前速度（可以是角速度）
/// decelerationRate：例如 UIScrollViewDecelerationRateNormal
@interface ScrollDecelerator : NSObject
/// 当前速度（比如角速度）
@property (nonatomic, assign) CGFloat velocity;
/// 衰减系数（0~1，越接近 1 减速越慢）
@property (nonatomic, assign) CGFloat decelerationRate;

- (instancetype)initWithVelocity:(CGFloat)velocity
                decelerationRate:(CGFloat)decelerationRate;
/// 每过 dt 秒，更新一次速度，并返回这一小段的“位移”（Δangle）
- (CGFloat)stepWithDt:(CGFloat)dt;
/// 是否已经“几乎停了”
- (BOOL)isStoppedWithThreshold:(CGFloat)threshold;

@end

NS_ASSUME_NONNULL_END
