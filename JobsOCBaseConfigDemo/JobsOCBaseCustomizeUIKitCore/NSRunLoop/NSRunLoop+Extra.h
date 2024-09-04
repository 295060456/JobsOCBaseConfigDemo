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

-(jobsByTimerBlock)commonModesByTimer;
-(jobsByTimerBlock)defaultModeByTimer;

@end

NS_ASSUME_NONNULL_END
