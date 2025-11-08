//
//  CAShapeLayer+Extra.m
//  FMNormal
//
//  Created by Jobs on 2025/5/9.
//

#import "CAShapeLayer+Extra.h"

@implementation CAShapeLayer (Extra)
#pragma mark —— 迎合链式语法而做的封装
-(JobsRetCAShapeLayerByCGFloatBlock _Nonnull)lineWidthBy{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.lineWidth = data;
        return self;
    };
}

-(JobsRetCAShapeLayerByCorBlock _Nonnull)strokeColorBy{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.strokeColor = data.CGColor;
        return self;
    };
}

-(JobsRetCAShapeLayerByCGCorRefBlock _Nonnull)strokeColorByCGColorRef{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CGColorRef data){
        @jobs_strongify(self)
        self.strokeColor = data;
        return self;
    };
}

-(JobsRetCAShapeLayerByBezierPathBlock _Nonnull)pathByBezierPath{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(UIBezierPath *_Nullable data){
        @jobs_strongify(self)
        self.path = data.CGPath;
        return self;
    };
}

-(JobsRetCAShapeLayerByCGPathRefBlock _Nonnull)pathByPathRef{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CGPathRef data){
        @jobs_strongify(self)
        self.path = data;
        return self;
    };
}

-(JobsRetCAShapeLayerByCorBlock _Nonnull)fillColorBy{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.fillColor = data.CGColor;
        return self;
    };
}

-(JobsRetCAShapeLayerByCGCorRefBlock _Nonnull)fillColorByGColorRef{
    @jobs_weakify(self)
    return ^__kindof CAShapeLayer *_Nullable(CGColorRef data){
        @jobs_strongify(self)
        self.fillColor = data;
        return self;
    };
}

@end
