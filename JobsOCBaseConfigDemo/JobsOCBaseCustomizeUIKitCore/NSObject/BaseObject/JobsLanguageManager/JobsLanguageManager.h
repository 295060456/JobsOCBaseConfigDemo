//
//  JobsLanguageManager.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/5/24.
//

#import <Foundation/Foundation.h>
#import "JobsUserDefaultDefine.h"
#import "DefineConstString.h"
/// 系统支持语言
#ifndef APP_LANGUAGE_ENUM_DEFINED
#define APP_LANGUAGE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, AppLanguage) {
    AppLanguageBySys,/// App语言跟随当前系统
    AppLanguageChineseSimplified, /// zh-Hans：简体中文
    AppLanguageChineseTraditional,/// zh-Hant：繁体中文
    AppLanguageEnglish,           /// en：标准英语
    AppLanguageTagalog            /// tl：菲律宾他加禄语
};
#endif/* APP_LANGUAGE_ENUM_DEFINED */

NS_ASSUME_NONNULL_BEGIN

@interface JobsLanguageManager : NSObject
/// 获取和设置当前语言
@property(class,nonatomic,assign)AppLanguage language;
/// 语言包路径
+ (NSBundle *)bundle;
/// 枚举和语言字符串的转换
+ (NSString *)languageCodeForAppLanguage:(AppLanguage)language;
/// 通过key取值对应的语言
+ (NSString *)localStringWithKey:(NSString *_Nonnull)key;

@end

NS_ASSUME_NONNULL_END
