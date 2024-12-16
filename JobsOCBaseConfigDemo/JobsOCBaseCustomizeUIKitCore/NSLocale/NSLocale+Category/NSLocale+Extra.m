//
//  NSLocale+Extra.m
//  FM
//
//  Created by User on 9/1/24.
//

#import "NSLocale+Extra.h"

@implementation NSLocale (Extra)

+(JobsReturnLocaleByStringBlock _Nonnull)initByID{
    return ^NSLocale *_Nullable(__kindof NSString *_Nullable ID){
        return [NSLocale localeWithLocaleIdentifier:ID];
    };
}
/// 对系统方法 objectForKey 的二次封装
-(JobsReturnIDByStringBlock _Nonnull)objectForKey{
    @jobs_weakify(self)
    return ^id _Nullable(NSLocaleKey _Nullable key){
        @jobs_strongify(self)
        return [self objectForKey:key];
    };
}
/// 区域标识符。例如 @"en_US" 表示美国的英语。
-(NSString *)areaID{
    return (NSString *)self.objectForKey(NSLocaleIdentifier);
}
/// 语言代码。例如 @"en" 表示英语，@"zh" 表示中文。
/// 当前本地化环境（即当前设备的区域设置）中所使用的语言代码
-(NSString *)languageCode{
    return (NSString *)self.objectForKey(NSLocaleLanguageCode);
}
/// 国家代码。例如 @"US" 表示美国，@"CN" 表示中国。
-(NSString *)countryCode{
    return (NSString *)self.objectForKey(NSLocaleCountryCode);
}
/// 书写系统代码。例如拉丁字母是 @"Latn"。
-(NSString *)scriptCode{
    return (NSString *)self.objectForKey(NSLocaleScriptCode);
}
/// 变体标识符，用于表示同一语言的特定地区或变体。
-(NSString *)variantCode{
    return (NSString *)self.objectForKey(NSLocaleVariantCode);
}
/// 区域使用的示例字符集。
-(NSCharacterSet *)exemplarCharacterSet{
    return (NSCharacterSet *)self.objectForKey(NSLocaleExemplarCharacterSet);
}
/// 区域中使用的默认日历类型，例如公历（Gregorian Calendar）。
-(NSCalendar *)calendar{
    return (NSCalendar *)self.objectForKey(NSLocaleCalendar);
}
/// 排序顺序标识符，用于指定文本排序的方式。
-(NSString *)collationIdentifier{
    return (NSString *)self.objectForKey(NSLocaleCollationIdentifier);
}
/// 是否使用公制系统。例如 @(YES) 表示使用公制系统。
-(NSNumber *)usesMetricSystem{
    return (NSNumber *)self.objectForKey(NSLocaleUsesMetricSystem);
}
/// 度量系统的描述，比如 @"Metric" 表示公制。
-(NSString *)measurementSystem{
    return (NSString *)self.objectForKey(NSLocaleMeasurementSystem);
}
/// 十进制分隔符，例如美国是 @"."，某些国家是 @","。
-(NSString *)decimalSeparator{
    return (NSString *)self.objectForKey(NSLocaleDecimalSeparator);
}
/// 千位分隔符，例如美国使用 @", "。
-(NSString *)groupingSeparator{
    return self.objectForKey(NSLocaleGroupingSeparator);
}
/// 货币符号，例如美元符号 @"$"。
-(NSString *)currencySymbol{
    return (NSString *)self.objectForKey(NSLocaleCurrencySymbol);
}
/// 货币代码，例如 @"USD" 表示美元。
-(NSString *)currencyCode{
    return (NSString *)self.objectForKey(NSLocaleCurrencyCode);
}
/// 排序标识符，用于文本比较和排序。
- (NSString *)collatorIdentifier{
    return (NSString *)self.objectForKey(NSLocaleCollatorIdentifier);
}
/// 引号的起始符号，例如英文使用 @"\u201c"。
-(NSString *)quotationBeginDelimiter{
    return (NSString *)self.objectForKey(NSLocaleQuotationBeginDelimiterKey);
}
/// 引号的结束符号，例如英文使用 @"\u201d"。
-(NSString *)quotationEndDelimiter{
    return (NSString *)self.objectForKey(NSLocaleQuotationEndDelimiterKey);
}
/// 备用引号的起始符号，例如英文的备用引号是 @"\u2018"。
-(NSString *)alternateQuotationBeginDelimiter{
    return (NSString *)self.objectForKey(NSLocaleAlternateQuotationBeginDelimiterKey);
}
/// 备用引号的结束符号，例如英文的备用引号是 @"\u2019"。
-(NSString *)alternateQuotationEndDelimiter{
    return (NSString *)self.objectForKey(NSLocaleAlternateQuotationEndDelimiterKey);
}

@end
