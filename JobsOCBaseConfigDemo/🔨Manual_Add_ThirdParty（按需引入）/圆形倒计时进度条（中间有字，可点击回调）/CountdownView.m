//
//  CountdownView.m
//  GuideViewDemo
//
//  Created by 天蓝 on 2016/12/2.
//  Copyright © 2016年 PT. All rights reserved.
//

#import "CountdownView.h"

@interface CountdownView ()

@property(nonatomic,strong)CAShapeLayer *shapeLayer;
@property(nonatomic,strong)CABasicAnimation *animation;
@property(nonatomic,strong)UILabel *label;

@end

@implementation CountdownView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.time = 3;// 倒计时的时间
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [self.layer addSublayer:self.shapeLayer];
    self.label.alpha = 1;
    
    self.addGesture([jobsMakeTapGesture(^(UITapGestureRecognizer * _Nullable gesture) {
        ///  这里写手势的配置
    }) gestureActionBy:^{
        /// 这里写手势的触发
        if (self.blockTapAction) self.blockTapAction();
    }]);
     
    @jobs_weakify(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                 (int64_t)(self.time * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        if (self.blockAnimationFinishedAction) self.blockAnimationFinishedAction();
    });
}

-(void)setTime:(NSInteger)time{
    if (time) {
        _time = time;
    }else _time = 3;
}
#pragma mark —— SET 方法
-(void)setStr:(NSString *)str{
    self.label.text = str ? : JobsInternationalization(@"跳过");
    [self.label sizeToFit];//刷新视图，否则label.frame为0
}

-(void)setFont:(UIFont *)font{
    self.label.font = font ? : UIFontWeightRegularSize(JobsWidth(12));
}

-(void)setTextColor:(UIColor *)textColor{
    self.label.textColor = textColor ? : [UIColor colorWithRed:0.27f
                                                         green:0.27f
                                                          blue:0.27f
                                                         alpha:1.00f];
}
#pragma mark —— lazyLoad
-(CAShapeLayer *)shapeLayer{
    if (!_shapeLayer) {
        @jobs_weakify(self)
        _shapeLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable data) {
            @jobs_strongify(self)
            data.fillColor = JobsClearColor.CGColor;
            data.strokeColor = jobsMakeCor(^(__kindof JobsCorModel * _Nullable data) {
                data.red = 0.02f;
                data.green = 0.69f;
                data.blue = 1.00f;
                data.alpha = 1.00f;
            }).CGColor;
            data.lineWidth = 1.0f;
            CGFloat w = CGRectGetWidth(self.frame);
            CGFloat h = CGRectGetHeight(self.frame);
            data.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(w/2, h/2)
                                                       radius:MIN(w, h)/2
                                                   startAngle:-M_PI_2
                                                     endAngle:3 * M_PI_2
                                                    clockwise:YES].CGPath;
            [data addAnimation:self.animation forKey:nil];
        });
    }return _shapeLayer;
}

-(CABasicAnimation *)animation{
    if (!_animation) {
        _animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
        _animation.duration = self.time;
        _animation.fromValue = @(0.f);
        _animation.toValue = @(1.f);
        _animation.removedOnCompletion = NO;
        _animation.fillMode = kCAFillModeBoth;
    }return _animation;
}

-(UILabel *)label{
    if (!_label) {
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = self.str;
            label.font = self.font;
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = self.textColor;
            [self addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
        });
    }return _label;
}

@end
