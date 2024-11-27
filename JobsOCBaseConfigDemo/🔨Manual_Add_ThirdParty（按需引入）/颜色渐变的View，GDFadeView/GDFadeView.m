//
//  GDFadeView.m
//  FadeView
//
//  Created by xiaoyu on 15/11/13.
//  Copyright © 2015年 guoda. All rights reserved.
//

#import "GDFadeView.h"

@interface GDFadeView ()

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
        self.createMask();
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)createMask{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.cagradientLayer.frame = self.bounds;
        self.cagradientLayer.colors = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            data.add((id)JobsClearColor.CGColor);
            data.add((id)JobsRedColor.CGColor);
            data.add((id)JobsClearColor.CGColor);
        });
        self.cagradientLayer.locations = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            data.add(@(0.25));
            data.add(@(0.5));
            data.add(@(0.75));
        });
        self.cagradientLayer.startPoint = CGPointMake(0, 0);
        self.cagradientLayer.endPoint = CGPointMake(1, 0);
        self.frontLabel.layer.mask = self.cagradientLayer;
        self.cagradientLayer.position = CGPointMake(-self.bounds.size.width/4.0,
                                                    self.bounds.size.height/2.0);
    };
}

-(jobsByTimeIntervalBlock _Nonnull)iPhoneFadeWithDuration{
    @jobs_weakify(self)
    return ^(NSTimeInterval duration){
        @jobs_strongify(self)
        [self.frontLabel.layer.mask addAnimation:jobsMakeCABasicAnimation(^(__kindof CABasicAnimation * _Nullable animation) {
            @jobs_strongify(self)
            animation.keyPath = @"transform.translation.x";
            animation.fromValue = @(0);
            animation.toValue = @(self.bounds.size.width + self.bounds.size.width / 2.0);
            animation.duration = duration;
            animation.repeatCount = MAXFLOAT;//LONG_MAX
            animation.removedOnCompletion = NO;
            animation.fillMode = kCAFillModeForwards;
        }) forKey:nil];
    };
}
#pragma mark —— Set方法
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

-(void)setText:(NSString *)text{
    _text = text;
    _backLabel.text = text;
    _frontLabel.text = text;
}
#pragma mark —— lazyLoad
-(UILabel *)backLabel{
    if (!_backLabel) {
        @jobs_weakify(self)
        _backLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.frame = self.bounds;
            self.addSubview(label);
        });
    }return _backLabel;
}

-(UILabel *)frontLabel{
    if (!_frontLabel) {
        @jobs_weakify(self)
        _frontLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.frame = self.bounds;
            self.addSubview(label);
        });
    }return _frontLabel;
}

-(CAGradientLayer *)cagradientLayer{
    if (!_cagradientLayer) {
        _cagradientLayer = jobsMakeCAGradientLayer(^(__kindof CALayer * _Nullable layer) {
            
        });
    }return _cagradientLayer;
}

@end
