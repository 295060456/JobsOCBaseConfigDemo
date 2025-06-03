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

-(JobsReturnCAAnimationByCAMediaTimingFunctionBlock _Nonnull)timingFunctionBy;
-(JobsReturnCAAnimationByDelegateBlock _Nonnull)delegateBy;
-(JobsReturnCAAnimationByBOOLBlock _Nonnull)removedOnCompletionBy;

@end

NS_ASSUME_NONNULL_END
