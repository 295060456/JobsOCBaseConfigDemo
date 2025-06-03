//
//  CAAnimation+Extra.m
//  FMNormal
//
//  Created by Jobs on 2025/6/3.
//

#import "CAAnimation+Extra.h"

@implementation CAAnimation (Extra)

-(JobsReturnCAAnimationByCAMediaTimingFunctionBlock _Nonnull)timingFunctionBy{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(CAMediaTimingFunction *_Nullable data){
        @jobs_strongify(self)
        self.timingFunction = data;
        return self;
    };
}

-(JobsReturnCAAnimationByDelegateBlock _Nonnull)delegateBy{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(id<CAAnimationDelegate> _Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

-(JobsReturnCAAnimationByBOOLBlock _Nonnull)removedOnCompletionBy{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.removedOnCompletion = data;
        return self;
    };
}

@end
