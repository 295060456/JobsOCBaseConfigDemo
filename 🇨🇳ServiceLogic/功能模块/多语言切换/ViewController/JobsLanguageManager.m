#import "JobsLanguageManager.h"
NSString *const JobsLanguageKey = @"JobsLanguageKey";
@implementation JobsLanguageManager

static NSBundle *bundle = nil;
static AppLanguage _language = AppLanguageBySys;

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        /// 读取存储的语言设置
        [self setLanguage:JobsGetUserDefaultIntegerForKey(JobsLanguageKey)];
    });
}

+ (NSBundle *)bundle {
    return bundle;
}

+ (AppLanguage)language {
    return _language;
}

+ (void)setLanguage:(AppLanguage)language {
    _language = language;
    NSString *languageCode = [self languageCodeForAppLanguage:language];
    NSString *path = [NSBundle.mainBundle pathForResource:languageCode ofType:@"lproj"];
    if (path) {
        bundle = [NSBundle bundleWithPath:path];
    } else {
        bundle = NSBundle.mainBundle;
    }
    /// 存储当前语言设置
    JobsSetUserDefaultKeyWithInteger(JobsLanguageKey, language);
    JobsUserDefaultSynchronize;
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
            return [NSBundle.mainBundle pathForResource:@"fil" ofType:@"lproj"] ? @"fil" : @"fil-PH";
        default:
            return NSLocale.preferredLanguages.firstObject;
    }
}

+ (NSString *)localStringWithKey:(NSString *)key {
    return NSLocalizedStringFromTableInBundle(key, 
                                              nil,
                                              self.bundle,
                                              nil);
}

@end
