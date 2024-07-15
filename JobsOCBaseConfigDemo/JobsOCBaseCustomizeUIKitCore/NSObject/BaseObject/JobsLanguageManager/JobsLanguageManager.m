//
//  JobsLanguageManager.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/5/24.
//

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
/// 语言包路径
+ (NSBundle *)bundle {
    return bundle;
}
/// 获取当前语言
+ (AppLanguage)language {
    return _language;
}
/// 设置当前语言
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
/// 枚举和语言字符串的转换
+ (NSString *)languageCodeForAppLanguage:(AppLanguage)language {
    switch (language) {
        case AppLanguageChineseSimplified:
            return @"zh-Hans";
        case AppLanguageChineseTraditional:
            return @"zh-Hant";
        case AppLanguageEnglish:
            return @"en";
        case AppLanguageTagalog:
            /// fil（菲律宾语）：这是菲律宾的国家语言，基于他加禄语（Tagalog），但融合了来自菲律宾其他语言和外来语言的词汇和语法。ISO 639-1代码为"fil"
            /// tl（他加禄语）：这是菲律宾的主要语言之一，也是菲律宾语的基础语言。ISO 639-1代码为"tl"
            /// fil-PH：表示菲律宾的菲律宾语
            /// tl-PH：表示菲律宾的他加禄语
            return [NSBundle.mainBundle pathForResource:@"fil" ofType:@"lproj"] ? @"fil" : @"fil-PH";
        default:
            return NSLocale.preferredLanguages.firstObject;
    }
}
/// 通过key取值对应的语言
+ (NSString *)localStringWithKey:(NSString *_Nonnull)key {
    return [self localizedString:key 
                       fromTable:nil
                        inBundle:self.bundle];
}

@end
