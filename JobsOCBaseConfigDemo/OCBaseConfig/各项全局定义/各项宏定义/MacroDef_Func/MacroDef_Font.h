//
//  MacroDef_Font.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/23.
//

#ifndef MacroDef_Font_h
#define MacroDef_Font_h

#import "MacroDef_Size.h"

#pragma mark —— systemFontOfSize (9 + 1)种
NS_INLINE UIFont *UIFontSystemFontOfSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize)];
}

NS_INLINE UIFont *UIFontWeightUltraLightSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightUltraLight];
}

NS_INLINE UIFont *UIFontWeightThinSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightThin];
}

NS_INLINE UIFont *UIFontWeightLightSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightLight];
}

NS_INLINE UIFont *UIFontWeightRegularSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightRegular];
}

NS_INLINE UIFont *UIFontWeightMediumSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightMedium];
}

NS_INLINE UIFont *UIFontWeightSemiboldSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightSemibold];
}

NS_INLINE UIFont *UIFontWeightBoldSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightBold];
}

NS_INLINE UIFont *UIFontWeightHeavySize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightHeavy];
}

NS_INLINE UIFont *UIFontWeightBlackSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightBlack];
}
#pragma mark —— monospacedDigitSystemFontOfSize
NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightUltraLightSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightUltraLight];
}

NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightThinSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightThin];
}

NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightLightSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightLight];
}

NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightRegularSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightRegular];
}

NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightMediumSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightMedium];
}

NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightSemiboldSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightSemibold];
}

NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightBoldSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightBold];
}

NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightHeavySize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightHeavy];
}

NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightBlackSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightBlack];
}
#pragma mark —— monospacedSystemFontOfSize
NS_INLINE UIFont *UIFontMonospacedSystemWeightUltraLightSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightUltraLight];
}

NS_INLINE UIFont *UIFontMonospacedSystemWeightThinSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightThin];
}

NS_INLINE UIFont *UIFontMonospacedSystemWeightLightSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightLight];
}

NS_INLINE UIFont *UIFontMonospacedSystemWeightRegularSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightRegular];
}

NS_INLINE UIFont *UIFontMonospacedSystemWeightMediumSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightMedium];
}

NS_INLINE UIFont *UIFontMonospacedSystemWeightSemiboldSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightSemibold];
}

NS_INLINE UIFont *UIFontMonospacedSystemWeightBoldSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightBold];
}

NS_INLINE UIFont *UIFontMonospacedSystemWeightHeavySize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightHeavy];
}

NS_INLINE UIFont *UIFontMonospacedSystemWeightBlackSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightBlack];
}
#pragma mark —— Other
NS_INLINE UIFont *UIFontBoldSystemFontOfSize(CGFloat fontSize) {
    return [UIFont boldSystemFontOfSize:JobsWidth(fontSize)];
}

NS_INLINE UIFont *UIFontTitalicSystemFontOfSize(CGFloat fontSize) {
    return [UIFont italicSystemFontOfSize:JobsWidth(fontSize)];
}
/// 根据fontName出字体
/// https://www.jianshu.com/p/736f2972a660
/// @param fontName 外来字体要先通过方法：+(JobsReturnArrayByVoidBlock _Nonnull)getAvailableFont，获得fontName再进行代入
/// @param fontSize 字体大小
NS_INLINE UIFont *fontName(NSString *fontName,CGFloat fontSize) {
    return [UIFont fontWithName:fontName size:JobsWidth(fontSize)];
}

NS_INLINE UIFont *bayonRegular(CGFloat fontSize){
    return fontName(@"Bayon-Regular", JobsWidth(fontSize));
}

#endif /* MacroDef_Font_h */
