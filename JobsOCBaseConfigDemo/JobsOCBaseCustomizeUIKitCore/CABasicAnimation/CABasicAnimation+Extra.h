//
//  CABasicAnimation+Extra.h
//  FMNormal
//
//  Created by Jobs on 2025/6/3.
//

#import <QuartzCore/QuartzCore.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface CABasicAnimation (Extra)

+(JobsReturnCABasicAnimationByStringBlock _Nonnull)animationByKeyPath;

-(JobsReturnCABasicAnimationByIDBlock _Nonnull)fromValueBy;
-(JobsReturnCABasicAnimationByIDBlock _Nonnull)toValueBy;
-(JobsReturnCABasicAnimationByIDBlock _Nonnull)valueBy;
-(JobsReturnCABasicAnimationByCFTimeIntervalBlock _Nonnull)beginTimeBy;
-(JobsReturnCABasicAnimationByCFTimeIntervalBlock _Nonnull)durationBy;
-(JobsReturnCABasicAnimationByFloatBlock _Nonnull)speedBy;
-(JobsReturnCABasicAnimationByCFTimeIntervalBlock _Nonnull)timeOffsetBy;
-(JobsReturnCABasicAnimationByFloatBlock _Nonnull)repeatCountBy;
-(JobsReturnCABasicAnimationByBOOLBlock _Nonnull)autoreversesBy;
-(JobsReturnCABasicAnimationByCAMediaTimingFillModeBlock _Nonnull)fillModeBy;

@end

NS_ASSUME_NONNULL_END
