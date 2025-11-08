//
//  UIImpactFeedbackGenerator+Extra.m
//  FM
//
//  Created by Admin on 17/12/2024.
//

#import "UIImpactFeedbackGenerator+Extra.h"

@implementation UIImpactFeedbackGenerator (Extra)

+(JobsRetImpactFeedbackGeneratorByNSIntegerBlock _Nonnull)initByStyle{
    return ^UIImpactFeedbackGenerator *_Nonnull(UIImpactFeedbackStyle style){
        return [UIImpactFeedbackGenerator.alloc initWithStyle:style];
    };
}

+(UIImpactFeedbackGenerator *_Nonnull)initByLightStyle{
    return UIImpactFeedbackGenerator.initByStyle(UIImpactFeedbackStyleLight);
}

+(JobsRetImpactFeedbackGeneratorByViewBlock _Nonnull)initLightStyleBy{
    return ^UIImpactFeedbackGenerator *_Nonnull(__kindof UIView *_Nullable view){
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 170500
        if (@available(iOS 17.5, *)) {
            return [UIImpactFeedbackGenerator feedbackGeneratorWithStyle:UIImpactFeedbackStyleLight forView:view];
        } else
#endif
        {return UIImpactFeedbackGenerator.initByLightStyle;}
    };
}

+(UIImpactFeedbackGenerator *_Nonnull)initByMediumStyle{
    return UIImpactFeedbackGenerator.initByStyle(UIImpactFeedbackStyleMedium);
}

+(JobsRetImpactFeedbackGeneratorByViewBlock _Nonnull)initMediumStyleBy{
    return ^UIImpactFeedbackGenerator *_Nonnull(__kindof UIView *_Nullable view){
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 170500
        if (@available(iOS 17.5, *)) {
            return [UIImpactFeedbackGenerator feedbackGeneratorWithStyle:UIImpactFeedbackStyleMedium forView:view];
        } else 
#endif
        {return UIImpactFeedbackGenerator.initByMediumStyle;}
    };
}

+(UIImpactFeedbackGenerator *_Nonnull)initByHeavyStyle{
    return UIImpactFeedbackGenerator.initByStyle(UIImpactFeedbackStyleHeavy);
}

+(JobsRetImpactFeedbackGeneratorByViewBlock _Nonnull)initHeavyStyleBy{
    return ^UIImpactFeedbackGenerator *_Nonnull(__kindof UIView *_Nullable view){
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 170500
        if (@available(iOS 17.5, *)) {
            return [UIImpactFeedbackGenerator feedbackGeneratorWithStyle:UIImpactFeedbackStyleHeavy forView:view];
        } else 
#endif
        {return UIImpactFeedbackGenerator.initByHeavyStyle;}
    };
}

+(UIImpactFeedbackGenerator *_Nonnull)initBySoftStyle API_AVAILABLE(ios(13.0)){
    return UIImpactFeedbackGenerator.initByStyle(UIImpactFeedbackStyleSoft);
}

+(JobsRetImpactFeedbackGeneratorByViewBlock _Nonnull)initSoftStyleBy{
    return ^UIImpactFeedbackGenerator *_Nonnull(__kindof UIView *_Nullable view){
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 170500
        if (@available(iOS 17.5, *)) {
            return [UIImpactFeedbackGenerator feedbackGeneratorWithStyle:UIImpactFeedbackStyleSoft forView:view];
        } else
#endif
        {return UIImpactFeedbackGenerator.initBySoftStyle;}
    };
}

+(UIImpactFeedbackGenerator *_Nonnull)initByRigidStyle{
    return UIImpactFeedbackGenerator.initByStyle(UIImpactFeedbackStyleRigid);
}

+(JobsRetImpactFeedbackGeneratorByViewBlock _Nonnull)initRigidStyleBy{
    return ^UIImpactFeedbackGenerator *_Nonnull(__kindof UIView *_Nullable view){
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 170500
        if (@available(iOS 17.5, *)) {
            return [UIImpactFeedbackGenerator feedbackGeneratorWithStyle:UIImpactFeedbackStyleRigid forView:view];
        } else 
#endif
        {return UIImpactFeedbackGenerator.initByRigidStyle;}
    };
}


@end
