//
//  LuckyWheelView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 12/5/25.
//

#import <UIKit/UIKit.h>
#import "LuckyWheelSegment.h"
#import "ScrollDecelerator.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, LuckyWheelPointerDirection) {
    LuckyWheelPointerDirectionUp,
    LuckyWheelPointerDirectionDown,
    LuckyWheelPointerDirectionLeft,
    LuckyWheelPointerDirectionRight
};

@interface LuckyWheelView : UIView
/// “指针”方向（默认正上方）
@property (nonatomic, assign) LuckyWheelPointerDirection pointerDirection;
/// 完整 Segment 模型（推荐使用）
@property (nonatomic, copy) NSArray<LuckyWheelSegment *> *segments;
/// 仅背景色（向下兼容）：设置 colors 会自动生成 segments
@property (nonatomic, copy) NSArray<UIColor *> *colors;
/// 旋转持续时间（秒，近似控制）
@property (nonatomic, assign) NSTimeInterval spinDuration;
/// 自定义初始角速度（rad/s）
/// - 如果不为 nil，则优先使用这个值，而不是通过 spinDuration 反推
/// - 数值越大，甩得越猛，转得越久
@property (nullable, nonatomic, strong) NSNumber *customInitialVelocity;
/// 是否允许手势拖动旋转（默认 YES）
@property (nonatomic, assign) BOOL panRotationEnabled;
/// 启动减速旋转（使用内部的配置）
- (void)startSpinWithScrollLikeDeceleration;
/// 指定初始角速度启动减速旋转
- (void)startSpinWithScrollLikeDecelerationWithInitialVelocity:(CGFloat)initialVelocity;
/// 停止旋转
- (void)stopSpin;

#pragma mark - 点语法 DSL（保持与你 Swift 版类似的调用习惯）

- (instancetype)byPointerDirection:(LuckyWheelPointerDirection)direction;
- (instancetype)byColors:(NSArray<UIColor *> *)colors;
- (instancetype)bySegments:(NSArray<LuckyWheelSegment *> *)segments;
- (instancetype)bySpinDuration:(NSTimeInterval)duration;
- (instancetype)byInitialVelocity:(CGFloat)velocity;
- (instancetype)byDecelerationRate:(CGFloat)rateRaw;      // 0~1
- (instancetype)byStopThreshold:(CGFloat)threshold;
- (instancetype)byPanRotationEnabled:(BOOL)enabled;

/// 配置扇形短按（停止）回调：返回命中的 LuckyWheelSegment
- (instancetype)onSegmentTap:(void (^)(LuckyWheelSegment *segment))handler;

/// 配置扇形长按回调：返回 LuckyWheelSegment + UILongPressGestureRecognizer
- (instancetype)onSegmentLongPress:(void (^)(LuckyWheelSegment *segment,
                                             UILongPressGestureRecognizer *gr))handler;

@end

NS_ASSUME_NONNULL_END
