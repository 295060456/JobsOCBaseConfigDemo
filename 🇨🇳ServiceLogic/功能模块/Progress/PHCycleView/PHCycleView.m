//
//  PHCycleView.m
//  mtc_kwm
//
//  Created by 1 on 2020/11/13.
//  Copyright © 2020 yzl. All rights reserved.
//

#import "PHCycleView.h"

#define kBorderWith 10
#define center CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0)

@interface PHCycleView()

@property(nonatomic,strong)CAShapeLayer *outLayer;
@property(nonatomic,strong)CAShapeLayer *progressLayer;
@property(nonatomic,strong)UILabel *progressLabel;
@property(nonatomic,strong)UILabel *describeLabel;
@property(nonatomic,strong)UIBezierPath *outsidePath;
@property(nonatomic,strong)UIBezierPath *insidePath;
@property(nonatomic,strong)CAShapeLayer *insideLayer;

@end

@implementation PHCycleView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self drawProgress];
    }return self;
}
//核心代码
-(CALayer*)_createLinesLayerWithFrame:(CGRect)frame
                             preAngle:(CGFloat)angle
                             lineSize:(CGSize)size
                                color:(UIColor *)color{
    CALayer *linesLayer = CALayer.layer;
    linesLayer.frame = frame;
    for (int i = 0; i < (int)(360 / angle); i++) {
        CGFloat curAngle = i * angle;
        if (curAngle > 225 && curAngle < 315) {
            continue;
        }
        UIBezierPath *path = UIBezierPath.bezierPath;
        CGPoint layerCenter = CGPointMake(frame.size.width * 0.5, frame.size.height * 0.5);
        CGPoint start = [self _calcCircleCoordinateWithCenter:layerCenter
                                                        angle:i * angle
                                                       radius:layerCenter.x];
        CGPoint end = [self _calcCircleCoordinateWithCenter:layerCenter
                                                      angle:i * angle
                                                     radius:layerCenter.x - size.height];
        [path moveToPoint:start];
        [path addLineToPoint:end];
        CAShapeLayer *lineLayer = CAShapeLayer.layer;
        lineLayer.strokeColor = color.CGColor;
        lineLayer.lineWidth = size.width;
        lineLayer.path = path.CGPath;
        lineLayer.lineCap = kCALineCapRound;
        [linesLayer addSublayer:lineLayer];
    }return linesLayer;
}

-(CGPoint)_calcCircleCoordinateWithCenter:(CGPoint)ct
                                    angle:(CGFloat)angle
                                   radius:(CGFloat)radius{
    CGFloat x2 = radius * cosf(angle * M_PI / 180);
    CGFloat y2 = radius * sinf(angle * M_PI / 180);
    return CGPointMake(ct.x + x2, ct.y - y2);
}
//外界调用
-(void)updateProgress:(CGFloat)progress{
    [CATransaction begin];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:0.5];
    self.progressLayer.strokeEnd =  (progress + 13) / 100.0;
    [CATransaction commit];
    self.progressLabel.text = [NSString stringWithFormat:@"%.0f",progress];
}
//外界调用
-(void)setLinePreAngle:(CGFloat)preAngle
              lineSize:(CGSize)size
                 color:(UIColor *)color{
    CALayer* linesLayer = [self _createLinesLayerWithFrame:self.bounds
                                                  preAngle:preAngle
                                                  lineSize:size
                                                     color:color];
    linesLayer.transform = CATransform3DRotate(linesLayer.transform,
                                               M_PI / 0.8,
                                               0,
                                               0,
                                               1);
    [self.layer addSublayer:linesLayer];
}
#pragma mark —— set方法
- (void)setProgressColor:(UIColor *)progressColor{
    self.progressLayer.strokeColor = progressColor.CGColor;
}

- (void)setProgressFont:(UIFont *)progressFont{
    self.progressLabel.font = progressFont;
}

-(void)setDescribeStr:(NSString *)describeStr{
    _describeStr = describeStr;
    self.describeLabel.text = describeStr;
}

-(void)setDescribeFont:(UIFont *)describeFont{
    _describeFont = describeFont;
    self.describeLabel.font = describeFont;
}

-(void)setProgressTextColor:(UIColor *)progressTextColor{
    _progressTextColor = progressTextColor;
    self.progressLabel.textColor = progressTextColor;
}

-(void)setDescribeTextColor:(UIColor *)describeTextColor{
    _describeTextColor = describeTextColor;
    self.describeLabel.textColor = describeTextColor;
}

-(void)setOutLayerColor:(UIColor *)outLayerColor{
    _outLayerColor = outLayerColor;
    self.outLayer.strokeColor = outLayerColor.CGColor;
}
#pragma mark —— lazyLoad
- (UIBezierPath *)outsidePath{
    if (!_outsidePath) {
        _outsidePath = [UIBezierPath bezierPathWithArcCenter:center
                                                      radius:(self.bounds.size.width - 5)/ 2.0 + 8
                                                  startAngle:-M_PI_2
                                                    endAngle:M_PI * 3.0 / 2.0
                                                   clockwise:YES];
    }return _outsidePath;
}

-(UIBezierPath *)insidePath{
    if (!_insidePath) {
        _insidePath = [UIBezierPath bezierPathWithArcCenter:center
                                                     radius:(self.bounds.size.width - 30)/ 2.0
                                                 startAngle:-M_PI_2
                                                   endAngle:M_PI * 3.0 / 2.0
                                                  clockwise:YES];
    }return _insidePath;
}

-(CAShapeLayer *)insideLayer{
    if (!_insideLayer) {
        _insideLayer = CAShapeLayer.layer;
        _insideLayer.strokeColor = [UIColor clearColor].CGColor;
        _insideLayer.lineWidth = kBorderWith;
        _insideLayer.fillColor =  [UIColor colorWithWhite:1 alpha:0.5].CGColor;
        _insideLayer.path = self.insidePath.CGPath;
        [self.layer addSublayer:_insideLayer];
    }return _insideLayer;
}
//外圈
-(CAShapeLayer *)outLayer{
    if (!_outLayer) {
        _outLayer = CAShapeLayer.layer;
        _outLayer.lineWidth = 3;
        _outLayer.strokeColor = [UIColor colorWithRed:0
                                                    green:0
                                                     blue:255
                                                    alpha:0.3].CGColor;
        _outLayer.fillColor =  [UIColor clearColor].CGColor;
        _outLayer.path = self.outsidePath.CGPath;
        _outLayer.strokeStart = M_PI / 12;
        _outLayer.strokeEnd = 1;
        [self.layer addSublayer:_outLayer];
    }return _outLayer;
}
// 进度条
-(CAShapeLayer *)progressLayer{
    if (!_progressLayer) {
        _progressLayer = CAShapeLayer.layer;
        _progressLayer.fillColor = [UIColor clearColor].CGColor;
        _progressLayer.lineWidth = 3;
        _progressLayer.strokeStart = M_PI/12;
        _progressLayer.path = self.outsidePath.CGPath;
        [self.layer addSublayer:_progressLayer];
    }return _progressLayer;
}
// 进度Label
-(UILabel *)progressLabel{
    if (!_progressLabel) {
        _progressLabel = UILabel.new;
        _progressLabel.transform = CGAffineTransformMakeRotation(M_PI / 0.8);
        _progressLabel.frame = CGRectMake(10,55,self.frame.size.width - 100 ,40);
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_progressLabel];
    }return _progressLabel;
}
//描述Label
-(UILabel *)describeLabel{
    if (!_describeLabel) {
        _describeLabel = UILabel.new;
        _describeLabel.transform = CGAffineTransformMakeRotation(M_PI / 0.8);
        _describeLabel.frame = CGRectMake(30, 40, self.frame.size.width - 100, 30);
        _describeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_describeLabel];
    }return _describeLabel;
}

-(void)drawProgress{
    self.transform = CGAffineTransformMakeRotation(-M_PI/0.8);
    self.insideLayer.opaque = 1;
    self.outLayer.opaque = 1;
    self.progressLayer.opaque = 1;
    self.progressLabel.alpha = 1;
    self.describeLabel.alpha = 1;
}

@end
