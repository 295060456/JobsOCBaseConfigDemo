//
//  NSBundle+CLLanguage.h
//  CLDemo
//
//  Created by AUG on 2018/11/7.
//  Copyright © 2018年 JmoVxia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "CLLanguageManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (CLLanguage)
/// 是否是中文
+(BOOL)isChineseLanguage;
/// 查询当前语言：自定义枚举 和 基于 ISO 639-1 语言代码标准的字符串之间的转换关系
+(NSString *)currentLanguage;

@end

NS_ASSUME_NONNULL_END
