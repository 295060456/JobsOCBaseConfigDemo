//
//  TDDrawingNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/5/25.
//

#import "TDDrawingNode.h"

#pragma mark - 自定义异步绘制节点
@interface TDDrawingNode ()

@end

@implementation TDDrawingNode

- (instancetype)init {
    if (self = [super init]) {
        self.displaysAsynchronously = YES;                       // 开启异步绘制
        self.opaque = YES;                                       // 不透明更高效
        self.backgroundColor = UIColor.secondarySystemBackgroundColor;
        self.cornerRadius = 0;
    }return self;
}
/// 传递绘制所需的不可变参数（在主线程调用）
- (id<NSObject>)drawParametersForAsyncLayer:(_ASDisplayLayer *)layer {
    // 这里不再传 w/h，直接使用 drawRect: 的 bounds 即可；保留行数参数示例
    return @{ @"lineCount": @(8) };
}
/// 真正的绘制（可能在后台线程调用，必须线程安全）
+ (void)drawRect:(CGRect)bounds
  withParameters:(id)parameters
    isCancelled:(asdisplaynode_iscancelled_block_t)isCancelled
  isRasterizing:(BOOL)isRasterizing{
    if (isCancelled()) return;
    // 背景块
    UIBezierPath *bg = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(bounds, 8, 8) cornerRadius:12];
    [UIColor.systemTealColor setFill];
    [bg fill];
    if (isCancelled()) return;
    // 画 N 条横线
    [UIColor.whiteColor setStroke];
    for (NSInteger i = 0; i < [parameters[@"lineCount"] integerValue]; i++) {
        if (isCancelled()) return;
        CGFloat y = 15 + i * 12;
        jobsMakeBezierPath(^(__kindof UIBezierPath * _Nullable line) {
            [line moveToPoint:CGPointMake(12, y)];
            [line addLineToPoint:CGPointMake(CGRectGetWidth(bounds) - 12, y)];
            line.lineWidth = 1.0;
            [line stroke];
        });
    }
}

@end
