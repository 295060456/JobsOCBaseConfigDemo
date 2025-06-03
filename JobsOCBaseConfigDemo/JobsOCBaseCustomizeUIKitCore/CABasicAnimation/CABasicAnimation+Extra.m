//
//  CABasicAnimation+Extra.m
//  FMNormal
//
//  Created by Jobs on 2025/6/3.
//

#import "CABasicAnimation+Extra.h"

@implementation CABasicAnimation (Extra)

+(JobsReturnCABasicAnimationByStringBlock _Nonnull)animationByKeyPath{
    return ^CABasicAnimation *_Nullable(NSString *_Nullable data){
        return [CABasicAnimation animationWithKeyPath:data];;
    };
}

-(JobsReturnCABasicAnimationByIDBlock _Nonnull)fromValueBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.fromValue = data;
        return self;
    };
}

-(JobsReturnCABasicAnimationByIDBlock _Nonnull)toValueBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.toValue = data;
        return self;
    };
}

-(JobsReturnCABasicAnimationByIDBlock _Nonnull)valueBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.byValue = data;
        return self;
    };
}

-(JobsReturnCABasicAnimationByCFTimeIntervalBlock _Nonnull)beginTimeBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.beginTime = data;
        return self;
    };
}

-(JobsReturnCABasicAnimationByCFTimeIntervalBlock _Nonnull)durationBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.duration = data;
        return self;
    };
}

-(JobsReturnCABasicAnimationByFloatBlock _Nonnull)speedBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(float data){
        @jobs_strongify(self)
        self.speed = data;
        return self;
    };
}

-(JobsReturnCABasicAnimationByCFTimeIntervalBlock _Nonnull)timeOffsetBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.timeOffset = data;
        return self;
    };
}

-(JobsReturnCABasicAnimationByFloatBlock _Nonnull)repeatCountBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(float data){
        @jobs_strongify(self)
        self.repeatCount = data;
        return self;
    };
}

-(JobsReturnCABasicAnimationByBOOLBlock _Nonnull)autoreversesBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.autoreverses = data;
        return self;
    };
}

-(JobsReturnCABasicAnimationByCAMediaTimingFillModeBlock _Nonnull)fillModeBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(CAMediaTimingFillMode _Nullable data){
        @jobs_strongify(self)
        self.fillMode = data;
        return self;
    };
}

@end
