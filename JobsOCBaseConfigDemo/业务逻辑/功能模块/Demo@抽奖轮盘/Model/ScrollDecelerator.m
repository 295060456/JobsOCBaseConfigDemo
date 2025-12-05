//
//  ScrollDecelerator.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 12/5/25.
//

#import "ScrollDecelerator.h"

@implementation ScrollDecelerator

- (instancetype)initWithVelocity:(CGFloat)velocity
                decelerationRate:(CGFloat)decelerationRate {
    if (self = [super init]) {
        _velocity = velocity;
        _decelerationRate = decelerationRate;
    }return self;
}

- (CGFloat)stepWithDt:(CGFloat)dt {
    if (dt <= 0) return 0;
    // 每毫秒乘一次 rate -> dt 秒乘 pow(rate, dt * 1000)
    CGFloat factor = pow(self.decelerationRate, dt * 1000.0);
    CGFloat v0 = self.velocity;
    CGFloat v1 = v0 * factor;  // 衰减后的速度
    // 位移 ≈ (v0 + v1) / 2 * dt （匀变速近似）
    CGFloat displacement = (v0 + v1) * 0.5 * dt;
    self.velocity = v1;
    return displacement;
}

- (BOOL)isStoppedWithThreshold:(CGFloat)threshold {
    return fabs(self.velocity) < threshold;
}

@end
