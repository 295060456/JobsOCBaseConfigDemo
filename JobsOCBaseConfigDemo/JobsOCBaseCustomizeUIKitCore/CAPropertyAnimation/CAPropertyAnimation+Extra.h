//
//  CAPropertyAnimation+Extra.h
//  FMNormal
//
//  Created by Jobs on 2025/6/3.
//

#import <QuartzCore/QuartzCore.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAPropertyAnimation (Extra)

-(JobsReturnCAPropertyAnimationByStringBlock _Nonnull)keyPathBy;
-(JobsReturnCAPropertyAnimationByBOOLBlock _Nonnull)additiveBy;
-(JobsReturnCAPropertyAnimationByBOOLBlock _Nonnull)cumulativeBy;
-(JobsReturnCAPropertyAnimationByCAValueFunctionBlock _Nonnull)valueFunctionBy;

@end

NS_ASSUME_NONNULL_END
