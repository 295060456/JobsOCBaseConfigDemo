//
//  NSLocale+Extra.h
//  FM
//
//  Created by User on 9/1/24.
//

#import <Foundation/Foundation.h>
/// 获取系统的首选语言代码
NS_INLINE NSString *_Nullable currentLanguage(void){
    NSString *languageCode = NSLocale.preferredLanguages.firstObject;
    return languageCode;
}

NS_ASSUME_NONNULL_BEGIN

@interface NSLocale (Extra)

+(JobsReturnLocaleByStringBlock _Nonnull)initByID;
/// 对系统方法 objectForKey 的二次封装
-(JobsReturnIDByStringBlock _Nonnull)objectForKey;
/// 区域标识符。例如 @"en_US" 表示美国的英语。
-(NSString *)areaID;
/// 语言代码。例如 @"en" 表示英语，@"zh" 表示中文。
-(NSString *)languageCode;
/// 国家代码。例如 @"US" 表示美国，@"CN" 表示中国。
-(NSString *)countryCode;
/// 书写系统代码。例如拉丁字母是 @"Latn"。
-(NSString *)scriptCode;
/// 变体标识符，用于表示同一语言的特定地区或变体。
-(NSString *)variantCode;
/// 区域使用的示例字符集。
-(NSCharacterSet *)exemplarCharacterSet;
/// 区域中使用的默认日历类型，例如公历（Gregorian Calendar）。
-(NSCalendar *)calendar;
/// 排序顺序标识符，用于指定文本排序的方式。
-(NSString *)collationIdentifier;
/// 是否使用公制系统。例如 @(YES) 表示使用公制系统。
-(NSNumber *)usesMetricSystem;
/// 度量系统的描述，比如 @"Metric" 表示公制。
-(NSString *)measurementSystem;
/// 十进制分隔符，例如美国是 @"."，某些国家是 @","。
-(NSString *)decimalSeparator;
/// 千位分隔符，例如美国使用 @", "。
-(NSString *)groupingSeparator;
/// 货币符号，例如美元符号 @"$"。
-(NSString *)currencySymbol;
/// 货币代码，例如 @"USD" 表示美元。
-(NSString *)currencyCode;
/// 排序标识符，用于文本比较和排序。
- (NSString *)collatorIdentifier;
/// 引号的起始符号，例如英文使用 @"\u201c"。
-(NSString *)quotationBeginDelimiter;
/// 引号的结束符号，例如英文使用 @"\u201d"。
-(NSString *)quotationEndDelimiter;
/// 备用引号的起始符号，例如英文的备用引号是 @"\u2018"。
-(NSString *)alternateQuotationBeginDelimiter;
/// 备用引号的结束符号，例如英文的备用引号是 @"\u2019"。
-(NSString *)alternateQuotationEndDelimiter;



@end

NS_ASSUME_NONNULL_END
