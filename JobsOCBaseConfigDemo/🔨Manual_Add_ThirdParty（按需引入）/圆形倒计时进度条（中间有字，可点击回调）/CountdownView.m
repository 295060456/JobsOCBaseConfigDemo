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
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                       action:@selector(tapAction)]];
    @jobs_weakify(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                 (int64_t)(self.time * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        [self animationFinished];
    });
}
#pragma mark —— 点击事件
- (void)tapAction{//主动点击
    if (self.blockTapAction) {
        self.blockTapAction();
    }
}

- (void)animationFinished{//动画结束
    if (self.blockAnimationFinishedAction) {
        self.blockAnimationFinishedAction();
    }
}

-(void)setTime:(NSInteger)time{
    if (time) {
        _time = time;
    }else{
        _time = 3;
    }
}

-(void)setStr:(NSString *)str{
    if (str) {
        self.label.text = str;
    }else{
        self.label.text = @"跳过";
    }
    [self.label sizeToFit];//刷新视图，否则label.frame为0
}

-(void)setFont:(UIFont *)font{
    if (font) {
        self.label.font = font;
    }else{
        self.label.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    }
}

-(void)setTextColor:(UIColor *)textColor{
    if (textColor) {
        self.label.textColor = textColor;
    }else{
        self.label.textColor = [UIColor colorWithRed:0.27f
                                               green:0.27f
                                                blue:0.27f
                                               alpha:1.00f];
    }
}
#pragma mark —— lazyLoad
-(CAShapeLayer *)shapeLayer{
    if (!_shapeLayer) {
        _shapeLayer = CAShapeLayer.layer;
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _shapeLayer.strokeColor = [UIColor colorWithRed:0.02f
                                                  green:0.69f
                                                   blue:1.00f
                                                  alpha:1.00f].CGColor;
        _shapeLayer.lineWidth = 1.0f;

        CGFloat w = CGRectGetWidth(self.frame);
        CGFloat h = CGRectGetHeight(self.frame);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(w/2, h/2)
                                                            radius:MIN(w, h)/2
                                                        startAngle:-M_PI_2
                                                          endAngle:3 * M_PI_2
                                                         clockwise:YES];
        _shapeLayer.path = path.CGPath;
        [_shapeLayer addAnimation:self.animation
                                forKey:nil];
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
        _label = UILabel.new;
        _label.text = self.str;
        _label.font = self.font;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = self.textColor;
        [self addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _label;
}

@end
