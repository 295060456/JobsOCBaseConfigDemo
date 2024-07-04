//
//  CLLanguageManager.h
//  CLDemo
//
//  Created by AUG on 2018/11/7.
//  Copyright © 2018年 JmoVxia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Judgment.h"
#import "JobsUserDefaultDefine.h"
//#ifndef CLUserLanguageKey_h
//#define CLUserLanguageKey_h
//FOUNDATION_EXTERN NSString * _Nonnull const CLUserLanguageKey;
//#endif /* CLUserLanguageKey_h */
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

@interface CLLanguageManager : NSObject
/// 用户自定义使用的语言，当传nil时，等同于resetSystemLanguage
@property(class,nonatomic,assign)AppLanguage appLanguage;

/// 重置系统语言/跟随手机系统
+(void)resetSystemLanguage;

@end

NS_ASSUME_NONNULL_END
