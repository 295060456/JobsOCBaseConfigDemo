//
//  JobsLanguageManager.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/5/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举
#import "JobsUserDefaultDefine.h"
#import "DefineConstString.h" /// 常亮字符串的定义
#import "NSBundle+Extra.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsLanguageManager : NSObject
/// 获取和设置当前语言
@property(class,nonatomic,assign)AppLanguage language;
/// 语言包路径
+(NSBundle *_Nullable)bundle;
/// 通过key取值对应的语言
+(JobsReturnStringByStringBlock _Nonnull)localStringByKey;
/// 枚举和语言字符串的转换
+(JobsReturnStringByIntegerBlock _Nonnull)languageCodeByAppLanguage;
-(JobsReturnStringByIntegerBlock _Nonnull)languageCodeByAppLanguage;

@end

NS_ASSUME_NONNULL_END
