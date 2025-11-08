//
//  NSRunLoop+Extra.m
//  FM
//
//  Created by User on 9/4/24.
//

#import "NSRunLoop+Extra.h"

@implementation NSRunLoop (Extra)

+(JobsRetTimerByTimerBlock _Nonnull)addTimerAtMainRunLoopByCommonModes{
    return ^__kindof NSTimer *_Nullable(NSTimer *_Nonnull timer){
        NSRunLoop.mainRunLoop.commonModesByTimer(timer);
        return timer;
    };
}

+(JobsRetTimerByTimerBlock _Nonnull)addTimerAtMainRunLoopByDefaultRunLoopMode{
    return ^__kindof NSTimer *_Nullable(NSTimer *_Nonnull timer){
        NSRunLoop.mainRunLoop.defaultModeByTimer(timer);
        return timer;
    };
}

+(JobsRetTimerByTimerBlock _Nonnull)addTimerAtCurrentRunLoopByCommonModes{
    return ^__kindof NSTimer *_Nullable(NSTimer *_Nonnull timer){
        NSRunLoop.currentRunLoop.commonModesByTimer(timer);
        return timer;
    };
}

+(JobsRetTimerByTimerBlock _Nonnull)addTimerAtCurrentRunLoopByDefaultRunLoopMode{
    return ^__kindof NSTimer *_Nullable(NSTimer *_Nonnull timer){
        NSRunLoop.currentRunLoop.defaultModeByTimer(timer);
        return timer;
    };
}

-(jobsByTimerBlock _Nonnull)commonModesByTimer{
    @jobs_weakify(self)
    return ^(NSTimer *_Nullable data){
        @jobs_strongify(self)
        [self addTimer:data forMode:NSRunLoopCommonModes];
    };
}

-(jobsByTimerBlock _Nonnull)defaultModeByTimer{
    @jobs_weakify(self)
    return ^(NSTimer *_Nullable data){
        @jobs_strongify(self)
        [self addTimer:data forMode:NSDefaultRunLoopMode];
    };
}

@end
