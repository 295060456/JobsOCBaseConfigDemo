//
//  GDFadeView.m
//  FadeView
//
//  Created by xiaoyu on 15/11/13.
//  Copyright © 2015年 guoda. All rights reserved.
//

#import "GDFadeView.h"
@interface GDFadeView (){
    
}

@property(nonatomic,strong)UILabel *backLabel;
@property(nonatomic,strong)UILabel *frontLabel;
@property(nonatomic,strong)CAGradientLayer *cagradientLayer;

@end

@implementation GDFadeView

-(instancetype)init{
    if (self = [super init]) {

    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backLabel.alpha = 1;
        self.frontLabel.alpha = 1;
        [self createMask];
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
}

- (void)createMask{
    self.cagradientLayer.frame = self.bounds;
    self.cagradientLayer.colors = @[(id)[UIColor clearColor].CGColor,
                                    (id)[UIColor redColor].CGColor,
                                    (id)[UIColor clearColor].CGColor];
    self.cagradientLayer.locations = @[@(0.25),
                                       @(0.5),
                                       @(0.75)];
    self.cagradientLayer.startPoint = CGPointMake(0, 0);
    self.cagradientLayer.endPoint = CGPointMake(1, 0);
    _frontLabel.layer.mask = self.cagradientLayer;
    self.cagradientLayer.position = CGPointMake(-self.bounds.size.width/4.0,
                                                self.bounds.size.height/2.0);
}

- (void)iPhoneFadeWithDuration:(NSTimeInterval)duration{
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"transform.translation.x";
    basicAnimation.fromValue = @(0);
    basicAnimation.toValue = @(self.bounds.size.width+self.bounds.size.width/2.0);
    basicAnimation.duration = duration;
    basicAnimation.repeatCount = MAXFLOAT;//LONG_MAX
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.fillMode = kCAFillModeForwards;
    [_frontLabel.layer.mask addAnimation:basicAnimation forKey:nil];
}

-(void)setBackColor:(UIColor *)backColor{
    _backColor = backColor;
    _backLabel.textColor = backColor;
}

-(void)setForeColor:(UIColor *)foreColor{
    _foreColor = foreColor;
    _frontLabel.textColor = foreColor;
}

-(void)setFont:(UIFont *)font{
    _font = font;
    _backLabel.font = font;
    _frontLabel.font = font;
}

-(void)setAlignment:(NSTextAlignment)alignment{
    _alignment = alignment;
    _backLabel.textAlignment = alignment;
    _frontLabel.textAlignment = alignment;
}

- (void)setText:(NSString *)text{
    _text = text;
    _backLabel.text = text;
    _frontLabel.text = text;
}
#pragma mark —— lazyLoad
-(UILabel *)backLabel{
    if (!_backLabel) {
        _backLabel = UILabel.new;
        _backLabel.frame = self.bounds;
        [self addSubview:_backLabel];
    }return _backLabel;
}

-(UILabel *)frontLabel{
    if (!_frontLabel) {
        _frontLabel = UILabel.new;
        _frontLabel.frame = self.bounds;
        [self addSubview:_frontLabel];
    }return _frontLabel;
}

-(CAGradientLayer *)cagradientLayer{
    if (!_cagradientLayer) {
        _cagradientLayer = CAGradientLayer.layer;
    }return _cagradientLayer;
}


@end
