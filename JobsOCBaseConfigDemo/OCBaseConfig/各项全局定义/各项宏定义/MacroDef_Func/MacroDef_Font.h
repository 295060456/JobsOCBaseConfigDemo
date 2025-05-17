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
/// Bayon-Regular
NS_INLINE UIFont *bayonRegular(CGFloat fontSize){
    return fontName(@"Bayon-Regular", JobsWidth(fontSize));
}
#pragma mark —— Helvetica Neue
NS_INLINE UIFont *helveticaNeue(CGFloat fontSize){
    return fontName(@"Helvetica Neue", JobsWidth(fontSize));
}
#pragma mark —— DIN Alternate 字体
NS_INLINE UIFont *dinAlternate(CGFloat fontSize){
    return fontName(@"DIN Alternate", JobsWidth(fontSize));
}
#pragma mark —— PingFangHK 字体
/// PingFangHK-Regular
NS_INLINE UIFont *pingFangHKRegular(CGFloat fontSize){
    return fontName(@"PingFangHK-Regular", JobsWidth(fontSize));
}
/// PingFangHK-Medium
NS_INLINE UIFont *pingFangHKMedium(CGFloat fontSize){
    return fontName(@"PingFangHK-Medium", JobsWidth(fontSize));
}
/// PingFangHK-Semibold
NS_INLINE UIFont *pingFangHKSemibold(CGFloat fontSize){
    return fontName(@"PingFangHK-Semibold", JobsWidth(fontSize));
}
/// PingFangHK-Bold
NS_INLINE UIFont *pingFangHKBold(CGFloat fontSize){
    return fontName(@"PingFangHK-Bold", JobsWidth(fontSize));
}
/// PingFangHK-Ultralight
NS_INLINE UIFont *pingFangHKUltralight(CGFloat fontSize){
    return fontName(@"PingFangHK-Ultralight", JobsWidth(fontSize));
}
/// PingFangHK-Thin
NS_INLINE UIFont *pingFangHKThin(CGFloat fontSize){
    return fontName(@"PingFangHK-Thin", JobsWidth(fontSize));
}
/// PingFangHK-Light
NS_INLINE UIFont *pingFangHKLight(CGFloat fontSize){
    return fontName(@"PingFangHK-Light", JobsWidth(fontSize));
}
/// PingFangTC-Ultralight
NS_INLINE UIFont *pingFangTCUltralight(CGFloat fontSize) {
    return fontName(@"PingFangTC-Ultralight", JobsWidth(fontSize));
}
/// PingFangTC-Thin
NS_INLINE UIFont *pingFangTCThin(CGFloat fontSize) {
    return fontName(@"PingFangTC-Thin", JobsWidth(fontSize));
}
/// PingFangTC-Light
NS_INLINE UIFont *pingFangTCLight(CGFloat fontSize) {
    return fontName(@"PingFangTC-Light", JobsWidth(fontSize));
}
/// PingFangTC-Regular
NS_INLINE UIFont *pingFangTCRegular(CGFloat fontSize) {
    return fontName(@"PingFangTC-Regular", JobsWidth(fontSize));
}
/// PingFangTC-Medium
NS_INLINE UIFont *pingFangTCMedium(CGFloat fontSize) {
    return fontName(@"PingFangTC-Medium", JobsWidth(fontSize));
}
/// PingFangTC-Semibold
NS_INLINE UIFont *pingFangTCSemibold(CGFloat fontSize) {
    return fontName(@"PingFangTC-Semibold", JobsWidth(fontSize));
}

#endif /* MacroDef_Font_h */
