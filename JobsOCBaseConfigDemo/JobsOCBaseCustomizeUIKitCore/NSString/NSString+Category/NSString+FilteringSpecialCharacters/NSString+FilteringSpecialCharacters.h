//
//  NSString+FilteringSpecialCharacters.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "DefineConstString.h"
#import "NSString+Others.h"
/// 参考文献：https://www.jianshu.com/p/de17fd495935
NS_ASSUME_NONNULL_BEGIN
/// 过滤特殊字符
@interface NSString (FilteringSpecialCharacters)
/// 外界灵活选择的特殊符号拼接成一个包含所有被选中特殊符号的字符串
-(JobsReturnStringByArrBlock _Nonnull)specialSymbolsActionBy;
/// 给定一个字符串，通过给定的过滤策略，过滤以后的字符串
-(JobsReturnStringByArrBlock _Nonnull)filteredBy;
/// 是否包含特殊字符【包含返回YES、不包含返回NO】
-(JobsReturnBOOLByArrBlock _Nonnull)isContainsSpecialSymbolsString;

@end

NS_ASSUME_NONNULL_END
