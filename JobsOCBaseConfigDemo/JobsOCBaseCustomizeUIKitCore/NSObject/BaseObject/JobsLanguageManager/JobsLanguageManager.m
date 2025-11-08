//
//  JobsLanguageManager.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/5/24.
//

#import "JobsLanguageManager.h"

@implementation JobsLanguageManager

static NSBundle *bundle = nil;
static AppLanguage _language = AppLanguageBySys;

+(void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        /// 读取存储的语言设置
        [self setLanguage:JobsGetUserDefaultIntegerForKey(JobsLanguageKey)];
    });
}
/// 获取当前语言
+(AppLanguage)language{
    return _language;
}
/// 设置当前语言
+(void)setLanguage:(AppLanguage)language{
    _language = language;
    NSString *languageCode = self.languageCodeByAppLanguage(language);
    NSString *path = languageCode.add(@".lproj").pathForResourceWithFullName;
    bundle = isValue(path) ? NSBundle.initByPath(path) : NSBundle.mainBundle;
    /// 存储当前语言设置
    JobsSetUserDefaultKeyWithInteger(JobsLanguageKey, language);
    JobsUserDefaultSynchronize;
}
/// 语言包路径
+(NSBundle *_Nullable)bundle{
    return bundle;
}
/// 通过key取值对应的语言
+(JobsRetStrByStrBlock _Nonnull)localStringByKey{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(__kindof NSString *_Nullable key){
        @jobs_strongify(self)
        return [self localizedString:key
                           fromTable:nil
                            inBundle:self.bundle];
    };
}
/// 枚举和语言字符串的转换
+(JobsRetStrByIntegerBlock _Nonnull)languageCodeByAppLanguage{
    return ^__kindof NSString *_Nullable(AppLanguage language){
        switch (language) {
            case AppLanguageChineseSimplified:
                return 简体中文;
            case AppLanguageChineseTraditional:
                return 繁体中文;
            case AppLanguageEnglish:
                return 英文_不带区域组合;
            case AppLanguageTagalog:
                /// fil（菲律宾语）：这是菲律宾的国家语言，基于他加禄语（Tagalog），但融合了来自菲律宾其他语言和外来语言的词汇和语法。ISO 639-1代码为"fil"
                /// tl（他加禄语）：这是菲律宾的主要语言之一，也是菲律宾语的基础语言。ISO 639-1代码为"tl"
                /// fil-PH：表示菲律宾的菲律宾语
                /// tl-PH：表示菲律宾的他加禄语
                return isValue(@"fil.lproj".pathForResourceWithFullName) ? 菲律宾语_不带区域组合: 菲律宾语_菲律宾;
            default:return NSLocale.preferredLanguages.firstObject;
        }
    };
}

-(JobsRetStrByIntegerBlock _Nonnull)languageCodeByAppLanguage{
    return ^__kindof NSString *_Nullable(AppLanguage language){
        return JobsLanguageManager.languageCodeByAppLanguage(language);
    };
}

@end
