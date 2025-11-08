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

+(JobsRetCABasicAnimationByStrBlock _Nonnull)animationByKeyPath;

-(JobsRetCABasicAnimationByIDBlock _Nonnull)fromValueBy;
-(JobsRetCABasicAnimationByIDBlock _Nonnull)toValueBy;
-(JobsRetCABasicAnimationByIDBlock _Nonnull)valueBy;
-(JobsRetCABasicAnimationByCFTimeIntervalBlock _Nonnull)beginTimeBy;
-(JobsRetCABasicAnimationByCFTimeIntervalBlock _Nonnull)durationBy;
-(JobsRetCABasicAnimationByFloatBlock _Nonnull)speedBy;
-(JobsRetCABasicAnimationByCFTimeIntervalBlock _Nonnull)timeOffsetBy;
-(JobsRetCABasicAnimationByFloatBlock _Nonnull)repeatCountBy;
-(JobsRetCABasicAnimationByBOOLBlock _Nonnull)autoreversesBy;
-(JobsRetCABasicAnimationByCAMediaTimingFillModeBlock _Nonnull)fillModeBy;

@end

NS_ASSUME_NONNULL_END
