//
//  CAPropertyAnimation+Extra.m
//  FMNormal
//
//  Created by Jobs on 2025/6/3.
//

#import "CAPropertyAnimation+Extra.h"

@implementation CAPropertyAnimation (Extra)

-(JobsRetCAPropertyAnimationByStrBlock _Nonnull)keyPathBy{
    @jobs_weakify(self)
    return ^__kindof CAPropertyAnimation *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.keyPath = data;
        return self;
    };
}

-(JobsRetCAPropertyAnimationByBOOLBlock _Nonnull)additiveBy{
    @jobs_weakify(self)
    return ^__kindof CAPropertyAnimation *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.additive = data;
        return self;
    };
}

-(JobsRetCAPropertyAnimationByBOOLBlock _Nonnull)cumulativeBy{
    @jobs_weakify(self)
    return ^__kindof CAPropertyAnimation *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.cumulative = data;
        return self;
    };
}

-(JobsRetCAPropertyAnimationByCAValueFunctionBlock _Nonnull)valueFunctionBy{
    @jobs_weakify(self)
    return ^__kindof CAPropertyAnimation *_Nullable(CAValueFunction *_Nullable data){
        @jobs_strongify(self)
        self.valueFunction = data;
        return self;
    };
}

@end
