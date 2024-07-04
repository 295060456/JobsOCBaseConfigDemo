//
//  CLLanguageManager.m
//  CLDemo
//
//  Created by AUG on 2018/11/7.
//  Copyright © 2018年 JmoVxia. All rights reserved.
//

#import "CLLanguageManager.h"
//#ifndef CLUserLanguageKey_defined
//#define CLUserLanguageKey_defined
//NSString *const CLUserLanguageKey = @"CLUserLanguageKey";
//#endif /* CLUserLanguageKey_defined */
@implementation CLLanguageManager

+(void)setAppLanguage:(AppLanguage)appLanguage{
    /// 语言跟随手机系统
    if(appLanguage == AppLanguageBySys){
        [self resetSystemLanguage];
        return;
    }
    SetUserDefaultKeyWithInteger(CLUserLanguageKey, appLanguage);
}

+(AppLanguage)appLanguage{
    return GetUserDefaultIntegerForKey(CLUserLanguageKey);
}

/// 重置系统语言/跟随手机系统
+(void)resetSystemLanguage{
    DeleUserDefaultWithKey(CLUserLanguageKey);
    UserDefaultSynchronize;
}

@end
