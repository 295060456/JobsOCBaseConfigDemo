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
static inline UIFont *UIFontSystemFontOfSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize)];
}

static inline UIFont *UIFontWeightUltraLightSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightUltraLight];
}

static inline UIFont *UIFontWeightThinSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightThin];
}

static inline UIFont *UIFontWeightLightSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightLight];
}

static inline UIFont *UIFontWeightRegularSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightRegular];
}

static inline UIFont *UIFontWeightMediumSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightMedium];
}

static inline UIFont *UIFontWeightSemiboldSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightSemibold];
}

static inline UIFont *UIFontWeightBoldSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightBold];
}

static inline UIFont *UIFontWeightHeavySize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightHeavy];
}

static inline UIFont *UIFontWeightBlackSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightBlack];
}
#pragma mark —— monospacedDigitSystemFontOfSize
static inline UIFont *UIFontMonospacedDigitSystemWeightUltraLightSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightUltraLight];
}

static inline UIFont *UIFontMonospacedDigitSystemWeightThinSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightThin];
}

static inline UIFont *UIFontMonospacedDigitSystemWeightLightSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightLight];
}

static inline UIFont *UIFontMonospacedDigitSystemWeightRegularSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightRegular];
}

static inline UIFont *UIFontMonospacedDigitSystemWeightMediumSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightMedium];
}

static inline UIFont *UIFontMonospacedDigitSystemWeightSemiboldSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightSemibold];
}

static inline UIFont *UIFontMonospacedDigitSystemWeightBoldSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightBold];
}

static inline UIFont *UIFontMonospacedDigitSystemWeightHeavySize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightHeavy];
}

static inline UIFont *UIFontMonospacedDigitSystemWeightBlackSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightBlack];
}
#pragma mark —— monospacedSystemFontOfSize
static inline UIFont *UIFontMonospacedSystemWeightUltraLightSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightUltraLight];
}

static inline UIFont *UIFontMonospacedSystemWeightThinSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightThin];
}

static inline UIFont *UIFontMonospacedSystemWeightLightSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightLight];
}

static inline UIFont *UIFontMonospacedSystemWeightRegularSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightRegular];
}

static inline UIFont *UIFontMonospacedSystemWeightMediumSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightMedium];
}

static inline UIFont *UIFontMonospacedSystemWeightSemiboldSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightSemibold];
}

static inline UIFont *UIFontMonospacedSystemWeightBoldSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightBold];
}

static inline UIFont *UIFontMonospacedSystemWeightHeavySize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightHeavy];
}

static inline UIFont *UIFontMonospacedSystemWeightBlackSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:JobsWidth(fontSize) weight:UIFontWeightBlack];
}
#pragma mark —— Other
static inline UIFont *UIFontBoldSystemFontOfSize(CGFloat fontSize) {
    return [UIFont boldSystemFontOfSize:JobsWidth(fontSize)];
}

static inline UIFont *UIFontTitalicSystemFontOfSize(CGFloat fontSize) {
    return [UIFont italicSystemFontOfSize:JobsWidth(fontSize)];
}
/// 根据fontName出字体
/// https://www.jianshu.com/p/736f2972a660
/// @param fontName 外来字体要先通过方法：+(NSMutableArray <NSString *>*)getAvailableFont，获得fontName再进行代入
/// @param fontSize 字体大小
static inline UIFont *fontName(NSString *fontName,CGFloat fontSize) {
    return [UIFont fontWithName:fontName size:JobsWidth(fontSize)];
}

static inline UIFont *notoSansBold(CGFloat fontSize){
    return fontName(@"NotoSans-Bold", JobsWidth(fontSize));
}

static inline UIFont *notoSansRegular(CGFloat fontSize){
    return fontName(@"NotoSans-Regular", JobsWidth(fontSize));
}

#endif /* MacroDef_Font_h */
