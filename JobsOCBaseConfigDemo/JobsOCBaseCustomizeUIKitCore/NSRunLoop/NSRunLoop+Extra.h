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

+(JobsReturnTimerByTimerBlock _Nonnull)addTimerAtMainRunLoopByCommonModes;
+(JobsReturnTimerByTimerBlock _Nonnull)addTimerAtMainRunLoopByDefaultRunLoopMode;
+(JobsReturnTimerByTimerBlock _Nonnull)addTimerAtCurrentRunLoopByCommonModes;
+(JobsReturnTimerByTimerBlock _Nonnull)addTimerAtCurrentRunLoopByDefaultRunLoopMode;

-(jobsByTimerBlock _Nonnull)commonModesByTimer;
-(jobsByTimerBlock _Nonnull)defaultModeByTimer;

@end

NS_ASSUME_NONNULL_END
