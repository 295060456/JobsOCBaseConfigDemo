//
//  NSRunLoop+Extra.m
//  FM
//
//  Created by User on 9/4/24.
//

#import "NSRunLoop+Extra.h"

@implementation NSRunLoop (Extra)

-(jobsByTimerBlock)commonModesByTimer{
    return ^(NSTimer *_Nullable data){
        [self addTimer:data forMode:NSRunLoopCommonModes];
    };
}

-(jobsByTimerBlock)defaultModeByTimer{
    return ^(NSTimer *_Nullable data){
        [self addTimer:data forMode:NSDefaultRunLoopMode];
    };
}

@end
