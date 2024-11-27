//
//  PHCycleView.m
//  mtc_kwm
//
//  Created by 1 on 2020/11/13.
//  Copyright © 2020 yzl. All rights reserved.
//

#import "PHCycleView.h"

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
/// 核心代码
-(CALayer*)_createLinesLayerWithFrame:(CGRect)frame
                             preAngle:(CGFloat)angle
                             lineSize:(CGSize)size
                                color:(UIColor *)color{
    CALayer *linesLayer = CALayer.layer;
    linesLayer.frame = frame;
    for (int i = 0; i < (int)(360 / angle); i++) {
        CGFloat curAngle = i * angle;
        if (curAngle > 225 && curAngle < 315) continue;
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
    CALayer *linesLayer = [self _createLinesLayerWithFrame:self.bounds
                                                  preAngle:preAngle
                                                  lineSize:size
                                                     color:color];
    linesLayer.transform = CATransform3DRotate(linesLayer.transform,
                                               M_PI / 0.8,
                                               0,
                                               0,
                                               1);
    self.layer.add(linesLayer);
}

-(void)drawProgress{
    self.transform = CGAffineTransformMakeRotation(-M_PI/0.8);
    self.insideLayer.opaque = 1;
    self.outLayer.opaque = 1;
    self.progressLayer.opaque = 1;
    self.progressLabel.alpha = 1;
    self.describeLabel.alpha = 1;
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
        _outsidePath = [UIBezierPath bezierPathWithArcCenter:KCenter
                                                      radius:(self.bounds.size.width - 5)/ 2.0 + 8
                                                  startAngle:-M_PI_2
                                                    endAngle:M_PI * 3.0 / 2.0
                                                   clockwise:YES];
    }return _outsidePath;
}

-(UIBezierPath *)insidePath{
    if (!_insidePath) {
        _insidePath = [UIBezierPath bezierPathWithArcCenter:KCenter
                                                     radius:(self.bounds.size.width - 30)/ 2.0
                                                 startAngle:-M_PI_2
                                                   endAngle:M_PI * 3.0 / 2.0
                                                  clockwise:YES];
    }return _insidePath;
}

-(CAShapeLayer *)insideLayer{
    if (!_insideLayer) {
        @jobs_weakify(self)
        _insideLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            @jobs_strongify(self)
            layer.strokeColor = [UIColor clearColor].CGColor;
            layer.lineWidth = kBorderWith;
            layer.fillColor =  [UIColor colorWithWhite:1 alpha:0.5].CGColor;
            layer.path = self.insidePath.CGPath;
            self.layer.add(layer);
        });
    }return _insideLayer;
}
/// 外圈
-(CAShapeLayer *)outLayer{
    if (!_outLayer) {
        @jobs_weakify(self)
        _outLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            @jobs_strongify(self)
            layer.lineWidth = 3;
            layer.strokeColor = RGBA_COLOR(0, 0, 255, .3f).CGColor;
            layer.fillColor = JobsClearColor.CGColor;
            layer.path = self.outsidePath.CGPath;
            layer.strokeStart = M_PI / 12;
            layer.strokeEnd = 1;
            self.layer.add(layer);
        });
    }return _outLayer;
}
/// 进度条
-(CAShapeLayer *)progressLayer{
    if (!_progressLayer) {
        @jobs_weakify(self)
        _progressLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            @jobs_strongify(self)
            layer.fillColor = JobsClearColor.CGColor;
            layer.lineWidth = 3;
            layer.strokeStart = M_PI / 12;
            layer.path = self.outsidePath.CGPath;
            self.layer.add(layer);
        });
    }return _progressLayer;
}
/// 进度Label
-(UILabel *)progressLabel{
    if (!_progressLabel) {
        @jobs_weakify(self)
        _progressLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.transform = CGAffineTransformMakeRotation(M_PI / 0.8);
            label.frame = CGRectMake(10,55,self.frame.size.width - 100 ,40);
            label.textAlignment = NSTextAlignmentCenter;
            self.addSubview(label);
        });
    }return _progressLabel;
}
/// 描述Label
-(UILabel *)describeLabel{
    if (!_describeLabel) {
        @jobs_weakify(self)
        _describeLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.transform = CGAffineTransformMakeRotation(M_PI / 0.8);
            label.frame = CGRectMake(30, 40, self.frame.size.width - 100, 30);
            label.textAlignment = NSTextAlignmentCenter;
            self.addSubview(label);
        });
    }return _describeLabel;
}

@end
