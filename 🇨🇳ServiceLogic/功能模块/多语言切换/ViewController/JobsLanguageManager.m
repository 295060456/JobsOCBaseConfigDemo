//
//  JobsLanguageManager.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/5/24.
//

#import "JobsLanguageManager.h"

@implementation JobsLanguageManager

static NSBundle *bundle = nil;
static AppLanguage currentLanguage = AppLanguageBySys;

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self setLanguage:AppLanguageBySys];
    });
}

+ (NSBundle *)bundle {
    return bundle;
}

+ (NSString *)languageCodeForAppLanguage:(AppLanguage)language {
    switch (language) {
        case AppLanguageChineseSimplified:
            return @"zh-Hans";
        case AppLanguageChineseTraditional:
            return @"zh-Hant";
        case AppLanguageEnglish:
            return @"en";
        case AppLanguageTagalog:
            return @"tl";
        default:
            return [[NSLocale preferredLanguages] firstObject];
    }
}

+ (void)setLanguage:(AppLanguage)language {
    currentLanguage = language;
    NSString *languageCode = [self languageCodeForAppLanguage:language];
    NSString *path = [[NSBundle mainBundle] pathForResource:languageCode ofType:@"lproj"];
    if (path) {
        bundle = [NSBundle bundleWithPath:path];
    } else {
        bundle = [NSBundle mainBundle];
    }
}

+ (AppLanguage)currentAppLanguage {
    return currentLanguage;
}

+ (NSString *)localStringWithKey:(NSString *)key {
    return NSLocalizedStringFromTableInBundle(key, nil, [self bundle], nil);
}

@end
