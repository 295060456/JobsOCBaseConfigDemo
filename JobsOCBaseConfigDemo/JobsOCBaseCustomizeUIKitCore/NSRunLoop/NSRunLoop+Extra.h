//
//  NSRunLoop+Extra.h
//  FM
//
//  Created by User on 9/4/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSRunLoop (Extra)

+(JobsRetTimerByTimerBlock _Nonnull)addTimerAtMainRunLoopByCommonModes;
+(JobsRetTimerByTimerBlock _Nonnull)addTimerAtMainRunLoopByDefaultRunLoopMode;
+(JobsRetTimerByTimerBlock _Nonnull)addTimerAtCurrentRunLoopByCommonModes;
+(JobsRetTimerByTimerBlock _Nonnull)addTimerAtCurrentRunLoopByDefaultRunLoopMode;

-(jobsByTimerBlock _Nonnull)commonModesByTimer;
-(jobsByTimerBlock _Nonnull)defaultModeByTimer;

@end

NS_ASSUME_NONNULL_END
