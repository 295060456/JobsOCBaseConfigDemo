//
//  UIFont+Extras.m
//  UBallLive
//
//  Created by Jobs on 2020/11/4.
//

#import "UIFont+Extras.h"

@implementation UIFont (Extras)
/// 打印全员字体
+(JobsReturnMutableArrayByVoidBlock _Nonnull)getAvailableFont{
    return ^NSMutableArray <NSString *>*_Nullable(){
        NSMutableArray <NSString *>*fontNamesMutArr = NSMutableArray.array;
        printf("=== 打印全员字体 === \n");
        for (NSString *fontFamilyName in UIFont.familyNames) {
            printf("--- %s--- \n",fontFamilyName.UTF8String);
            [fontNamesMutArr addObjectsFromArray:[UIFont fontNamesForFamilyName:fontFamilyName]];
            for (NSString *fontName in [UIFont fontNamesForFamilyName:fontFamilyName]) {
                printf("%s\n",fontName.UTF8String);
            }
        }return fontNamesMutArr;
    };
}
/// 打印外援字体
+(JobsReturnMutableArrayByVoidBlock _Nonnull)foreignAidFontName{
    return ^NSMutableArray <NSString *>*_Nullable(){
        /// 苹果可能每次发布版本会添加一些字体，这个时候需要对这个已知的字体库进行同步升级
        /// 系统自带的字体合集
        NSArray *sysFontNameArr = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            data.add(@"AcademyEngravedLetPlain");
            data.add(@"AlNile");
            data.add(@"AlNile-Bold");
            data.add(@"AmericanTypewriter");
            data.add(@"AmericanTypewriter-Light");
            data.add(@"AmericanTypewriter-Semibold");
            data.add(@"AmericanTypewriter-Bold");
            data.add(@"AmericanTypewriter-Condensed");
            data.add(@"AmericanTypewriter-CondensedLight");
            data.add(@"AmericanTypewriter-CondensedBold");
            data.add(@"AppleColorEmoji");
            data.add(@"AppleSDGothicNeo-Regular");
            data.add(@"AppleSDGothicNeo-Thin");
            data.add(@"AppleSDGothicNeo-UltraLight");
            data.add(@"AppleSDGothicNeo-Light");
            data.add(@"AppleSDGothicNeo-Medium");
            data.add(@"AppleSDGothicNeo-SemiBold");
            data.add(@"AppleSDGothicNeo-Bold");
            data.add(@"AppleSymbols");
            data.add(@"ArialMT");
            data.add(@"Arial-ItalicMT");
            data.add(@"Arial-BoldMT");
            data.add(@"Arial-BoldItalicMT");
            data.add(@"ArialHebrew");
            data.add(@"ArialHebrew-Light");
            data.add(@"ArialHebrew-Bold");
            data.add(@"ArialRoundedMTBold");
            data.add(@"Avenir-Book");
            data.add(@"Avenir-Roman");
            data.add(@"Avenir-BookOblique");
            data.add(@"Avenir-Oblique");
            data.add(@"Avenir-Light");
            data.add(@"Avenir-LightOblique");
            data.add(@"Avenir-Medium");
            data.add(@"Avenir-MediumOblique");
            data.add(@"Avenir-Heavy");
            data.add(@"Avenir-HeavyOblique");
            data.add(@"Avenir-Black");
            data.add(@"Avenir-BlackOblique");
            data.add(@"AvenirNext-Regular");
            data.add(@"AvenirNext-Italic");
            data.add(@"AvenirNext-UltraLight");
            data.add(@"AvenirNext-UltraLightItalic");
            data.add(@"AvenirNext-Medium");
            data.add(@"AvenirNext-MediumItalic");
            data.add(@"AvenirNext-DemiBold");
            data.add(@"AvenirNext-DemiBoldItalic");
            data.add(@"AvenirNext-Bold");
            data.add(@"AvenirNext-BoldItalic");
            data.add(@"AvenirNext-Heavy");
            data.add(@"AvenirNext-HeavyItalic");
            data.add(@"AvenirNextCondensed-Regular");
            data.add(@"AvenirNextCondensed-Italic");
            data.add(@"AvenirNextCondensed-UltraLight");
            data.add(@"AvenirNextCondensed-UltraLightItalic");
            data.add(@"AvenirNextCondensed-Medium");
            data.add(@"AvenirNextCondensed-MediumItalic");
            data.add(@"AvenirNextCondensed-DemiBold");
            data.add(@"AvenirNextCondensed-DemiBoldItalic");
            data.add(@"AvenirNextCondensed-Bold");
            data.add(@"AvenirNextCondensed-BoldItalic");
            data.add(@"AvenirNextCondensed-Heavy");
            data.add(@"AvenirNextCondensed-HeavyItalic");
            data.add(@"Baskerville");
            data.add(@"Baskerville-Italic");
            data.add(@"Baskerville-SemiBold");
            data.add(@"Baskerville-SemiBoldItalic");
            data.add(@"Baskerville-Bold");
            data.add(@"Baskerville-BoldItalic");
            data.add(@"BodoniSvtyTwoITCTT-Book");
            data.add(@"BodoniSvtyTwoITCTT-BookIta");
            data.add(@"BodoniSvtyTwoITCTT-Bold");
            data.add(@"BodoniSvtyTwoOSITCTT-Book");
            data.add(@"BodoniSvtyTwoOSITCTT-BookIt");
            data.add(@"BodoniSvtyTwoOSITCTT-Bold");
            data.add(@"BodoniSvtyTwoSCITCTT-Book");
            data.add(@"BodoniOrnamentsITCTT");
            data.add(@"BradleyHandITCTT-Bold");
            data.add(@"ChalkboardSE-Regular");
            data.add(@"ChalkboardSE-Light");
            data.add(@"ChalkboardSE-Bold");
            data.add(@"Chalkduster");
            data.add(@"Charter-Roman");
            data.add(@"Charter-Italic");
            data.add(@"Charter-Bold");
            data.add(@"Charter-BoldItalic");
            data.add(@"Charter-Black");
            data.add(@"Charter-BlackItalic");
            data.add(@"Cochin");
            data.add(@"Cochin-Italic");
            data.add(@"Cochin-Bold");
            data.add(@"Cochin-BoldItalic");
            data.add(@"Copperplate");
            data.add(@"Copperplate-Light");
            data.add(@"Copperplate-Bold");
            data.add(@"Courier");
            data.add(@"Courier-Oblique");
            data.add(@"Courier-Bold");
            data.add(@"Courier-BoldOblique");
            data.add(@"CourierNewPSMT");
            data.add(@"CourierNewPS-ItalicMT");
            data.add(@"CourierNewPS-BoldMT");
            data.add(@"CourierNewPS-BoldItalicMT");
            data.add(@"Damascus");
            data.add(@"DamascusLight");
            data.add(@"DamascusMedium");
            data.add(@"DamascusSemiBold");
            data.add(@"DamascusBold");
            data.add(@"DevanagariSangamMN");
            data.add(@"DevanagariSangamMN-Bold");
            data.add(@"Didot");
            data.add(@"Didot-Italic");
            data.add(@"Didot-Bold");
            data.add(@"DINAlternate-Bold");
            data.add(@"DINCondensed-Bold");
            data.add(@"EuphemiaUCAS");
            data.add(@"EuphemiaUCAS-Italic");
            data.add(@"EuphemiaUCAS-Bold");
            data.add(@"Farah");
            data.add(@"Futura-Medium");
            data.add(@"Futura-MediumItalic");
            data.add(@"Futura-Bold");
            data.add(@"Futura-CondensedMedium");
            data.add(@"Futura-CondensedExtraBold");
            data.add(@"Galvji");
            data.add(@"Galvji-Bold");
            data.add(@"GeezaPro");
            data.add(@"GeezaPro-Bold");
            data.add(@"Georgia");
            data.add(@"Georgia-Italic");
            data.add(@"Georgia-Bold");
            data.add(@"Georgia-BoldItalic");
            data.add(@"GillSans");
            data.add(@"GillSans-Italic");
            data.add(@"GillSans-Light");
            data.add(@"GillSans-LightItalic");
            data.add(@"GillSans-SemiBold");
            data.add(@"GillSans-SemiBoldItalic");
            data.add(@"GillSans-Bold");
            data.add(@"GillSans-BoldItalic");
            data.add(@"GillSans-UltraBold");
            data.add(@"GranthaSangamMN-Regular");
            data.add(@"GranthaSangamMN-Bold");
            data.add(@"Helvetica");
            data.add(@"Helvetica-Oblique");
            data.add(@"Helvetica-Light");
            data.add(@"Helvetica-LightOblique");
            data.add(@"Helvetica-Bold");
            data.add(@"Helvetica-BoldOblique");
            data.add(@"HelveticaNeue");
            data.add(@"HelveticaNeue-Italic");
            data.add(@"HelveticaNeue-UltraLight");
            data.add(@"HelveticaNeue-UltraLightItalic");
            data.add(@"HelveticaNeue-Thin");
            data.add(@"HelveticaNeue-ThinItalic");
            data.add(@"HelveticaNeue-Light");
            data.add(@"HelveticaNeue-LightItalic");
            data.add(@"HelveticaNeue-Medium");
            data.add(@"HelveticaNeue-MediumItalic");
            data.add(@"HelveticaNeue-Bold");
            data.add(@"HelveticaNeue-BoldItalic");
            data.add(@"HelveticaNeue-CondensedBold");
            data.add(@"HelveticaNeue-CondensedBlack");
            data.add(@"HiraMaruProN-W4");
            data.add(@"HiraMinProN-W3");
            data.add(@"HiraMinProN-W6");
            data.add(@"HiraginoSans-W3");
            data.add(@"HiraginoSans-W6");
            data.add(@"HiraginoSans-W7");
            data.add(@"HoeflerText-Regular");
            data.add(@"HoeflerText-Italic");
            data.add(@"HoeflerText-Black");
            data.add(@"HoeflerText-BlackItalic");
            data.add(@"Kailasa-Bold");
            data.add(@"Kefa-Regular");
            data.add(@"KhmerSangamMN");
            data.add(@"KohinoorBangla-Regular");
            data.add(@"KohinoorBangla-Light");
            data.add(@"KohinoorBangla-Semibold");
            data.add(@"KohinoorDevanagari-Regular");
            data.add(@"KohinoorDevanagari-Light");
            data.add(@"KohinoorDevanagari-Semibold");
            data.add(@"KohinoorGujarati-Regular");
            data.add(@"KohinoorGujarati-Light");
            data.add(@"KohinoorGujarati-Bold");
            data.add(@"KohinoorTelugu-Regular");
            data.add(@"KohinoorTelugu-Light");
            data.add(@"KohinoorTelugu-Medium");
            data.add(@"LaoSangamMN");
            data.add(@"MalayalamSangamMN");
            data.add(@"MalayalamSangamMN-Bold");
            data.add(@"MarkerFelt-Thin");
            data.add(@"MarkerFelt-Wide");
            data.add(@"Menlo-Regular");
            data.add(@"Menlo-Italic");
            data.add(@"Menlo-Bold");
            data.add(@"Menlo-BoldItalic");
            data.add(@"MyanmarSangamMN");
            data.add(@"MyanmarSangamMN-Bold");
            data.add(@"Noteworthy-Light");
            data.add(@"Noteworthy-Bold");
            data.add(@"NotoNastaliqUrdu");
            data.add(@"NotoNastaliqUrdu-Bold");
            data.add(@"NotoSansKannada-Regular");
            data.add(@"NotoSansKannada-Bold");
            data.add(@"NotoSansMyanmar-Regular");
            data.add(@"NotoSansMyanmar-Bold");
            data.add(@"NotoSansOriya");
            data.add(@"NotoSansOriya-Bold");
            data.add(@"Optima-Regular");
            data.add(@"Optima-Italic");
            data.add(@"Optima-Bold");
            data.add(@"Optima-BoldItalic");
            data.add(@"Optima-ExtraBlack");
            data.add(@"Palatino-Roman");
            data.add(@"Palatino-Italic");
            data.add(@"Palatino-Bold");
            data.add(@"Palatino-BoldItalic");
            data.add(@"Papyrus");
            data.add(@"Papyrus-Condensed");
            data.add(@"PartyLetPlain");
            data.add(@"PingFangHK-Ultralight");
            data.add(@"PingFangHK-Thin");
            data.add(@"PingFangHK-Light");
            data.add(@"PingFangHK-Regular");
            data.add(@"PingFangHK-Medium");
            data.add(@"PingFangHK-Semibold");
            data.add(@"PingFangSC-Ultralight");
            data.add(@"PingFangSC-Thin");
            data.add(@"PingFangSC-Light");
            data.add(@"PingFangSC-Regular");
            data.add(@"PingFangSC-Medium");
            data.add(@"PingFangSC-Semibold");
            data.add(@"PingFangTC-Ultralight");
            data.add(@"PingFangTC-Thin");
            data.add(@"PingFangTC-Light");
            data.add(@"PingFangTC-Regular");
            data.add(@"PingFangTC-Medium");
            data.add(@"PingFangTC-Semibold");
            data.add(@"SavoyeLetPlain");
            data.add(@"SinhalaSangamMN");
            data.add(@"SinhalaSangamMN-Bold");
            data.add(@"SnellRoundhand");
            data.add(@"SnellRoundhand-Bold");
            data.add(@"SnellRoundhand-Black");
            data.add(@"Symbol");
            data.add(@"TamilSangamMN");
            data.add(@"TamilSangamMN-Bold");
            data.add(@"TeluguSangamMN");
            data.add(@"TeluguSangamMN-Bold");
            data.add(@"Thonburi");
            data.add(@"Thonburi-Light");
            data.add(@"Thonburi-Bold");
            data.add(@"TimesNewRomanPSMT");
            data.add(@"TimesNewRomanPS-ItalicMT");
            data.add(@"TimesNewRomanPS-BoldMT");
            data.add(@"TimesNewRomanPS-BoldItalicMT");
            data.add(@"TrebuchetMS");
            data.add(@"TrebuchetMS-Italic");
            data.add(@"TrebuchetMS-Bold");
            data.add(@"Trebuchet-BoldItalic");
            data.add(@"Verdana");
            data.add(@"Verdana-Italic");
            data.add(@"Verdana-Bold");
            data.add(@"Verdana-BoldItalic");
            data.add(@"ZapfDingbatsITC");
            data.add(@"Zapfino");
        });
        NSMutableArray <NSString *>*temp = NSMutableArray.array;
        for (NSString *string in UIFont.getAvailableFont()) {
            if (!sysFontNameArr.containsObject(string)) {
                temp.add(string);
            }
        }
        printf("--- 外来字体为 --- \n");
        for (NSString *string in temp) {
            printf("%s \n",string.UTF8String);
        }return temp;
    };
}

@end
