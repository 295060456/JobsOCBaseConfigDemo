//
//  UIImpactFeedbackGenerator+Extra.h
//  FM
//
//  Created by Admin on 17/12/2024.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImpactFeedbackGenerator (Extra)

+(JobsReturnImpactFeedbackGeneratorByNSIntegerBlock _Nonnull)initByStyle;
+(UIImpactFeedbackGenerator *_Nonnull)initByLightStyle;
+(JobsReturnImpactFeedbackGeneratorByViewBlock _Nonnull)initLightStyleBy;
+(UIImpactFeedbackGenerator *_Nonnull)initByMediumStyle;
+(JobsReturnImpactFeedbackGeneratorByViewBlock _Nonnull)initMediumStyleBy;
+(UIImpactFeedbackGenerator *_Nonnull)initByHeavyStyle;
+(JobsReturnImpactFeedbackGeneratorByViewBlock _Nonnull)initHeavyStyleBy;
+(UIImpactFeedbackGenerator *_Nonnull)initBySoftStyle API_AVAILABLE(ios(13.0));
+(JobsReturnImpactFeedbackGeneratorByViewBlock _Nonnull)initSoftStyleBy;
+(UIImpactFeedbackGenerator *_Nonnull)initByRigidStyle;
+(JobsReturnImpactFeedbackGeneratorByViewBlock _Nonnull)initRigidStyleBy;

@end

NS_ASSUME_NONNULL_END
