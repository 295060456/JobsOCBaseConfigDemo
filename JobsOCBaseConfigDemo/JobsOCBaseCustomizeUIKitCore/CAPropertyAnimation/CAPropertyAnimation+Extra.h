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

-(JobsRetCAPropertyAnimationByStringBlock _Nonnull)keyPathBy;
-(JobsRetCAPropertyAnimationByBOOLBlock _Nonnull)additiveBy;
-(JobsRetCAPropertyAnimationByBOOLBlock _Nonnull)cumulativeBy;
-(JobsRetCAPropertyAnimationByCAValueFunctionBlock _Nonnull)valueFunctionBy;

@end

NS_ASSUME_NONNULL_END
