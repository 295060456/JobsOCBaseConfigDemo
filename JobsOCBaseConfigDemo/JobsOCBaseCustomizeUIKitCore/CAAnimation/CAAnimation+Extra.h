//
//  CAAnimation+Extra.h
//  FMNormal
//
//  Created by Jobs on 2025/6/3.
//

#import <QuartzCore/QuartzCore.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAAnimation (Extra)

-(JobsRetCAAnimationByCAMediaTimingFunctionBlock _Nonnull)timingFunctionBy;
-(JobsRetCAAnimationByDelegateBlock _Nonnull)delegateBy;
-(JobsRetCAAnimationByBOOLBlock _Nonnull)removedOnCompletionBy;

@end

NS_ASSUME_NONNULL_END
