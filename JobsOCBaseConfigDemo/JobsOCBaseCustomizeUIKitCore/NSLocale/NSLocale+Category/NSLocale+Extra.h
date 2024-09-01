//
//  NSLocale+Extra.h
//  FM
//
//  Created by User on 9/1/24.
//

#import <Foundation/Foundation.h>
/// 获取系统的首选语言代码
static inline NSString *currentLanguage(void){
    NSString *languageCode = NSLocale.preferredLanguages.firstObject;
    return languageCode;
}

NS_ASSUME_NONNULL_BEGIN

@interface NSLocale (Extra)

@end

NS_ASSUME_NONNULL_END
