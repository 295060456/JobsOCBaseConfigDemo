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

+(JobsRetImpactFeedbackGeneratorByNSIntegerBlock _Nonnull)initByStyle;
+(UIImpactFeedbackGenerator *_Nonnull)initByLightStyle;
+(JobsRetImpactFeedbackGeneratorByViewBlock _Nonnull)initLightStyleBy;
+(UIImpactFeedbackGenerator *_Nonnull)initByMediumStyle;
+(JobsRetImpactFeedbackGeneratorByViewBlock _Nonnull)initMediumStyleBy;
+(UIImpactFeedbackGenerator *_Nonnull)initByHeavyStyle;
+(JobsRetImpactFeedbackGeneratorByViewBlock _Nonnull)initHeavyStyleBy;
+(UIImpactFeedbackGenerator *_Nonnull)initBySoftStyle API_AVAILABLE(ios(13.0));
+(JobsRetImpactFeedbackGeneratorByViewBlock _Nonnull)initSoftStyleBy;
+(UIImpactFeedbackGenerator *_Nonnull)initByRigidStyle;
+(JobsRetImpactFeedbackGeneratorByViewBlock _Nonnull)initRigidStyleBy;

@end

NS_ASSUME_NONNULL_END
