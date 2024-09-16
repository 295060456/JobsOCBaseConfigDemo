//
//  NSString+FilteringSpecialCharacters.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>
#import "DefineConstString.h"
#import "NSString+Others.h"
/// 参考文献：https://www.jianshu.com/p/de17fd495935
NS_ASSUME_NONNULL_BEGIN
/// 过滤特殊字符
@interface NSString (FilteringSpecialCharacters)
/// 外界灵活选择的特殊符号拼接成一个包含所有被选中特殊符号的字符串
/// @param specialSymbolsStringMutArr 选择的特殊符号数组
-(NSString *)specialSymbolsAction:(NSMutableArray <NSString *>*_Nullable)specialSymbolsStringMutArr;
/// 给定一个字符串，通过给定的过滤策略，过滤以后的字符串
/// @param specialSymbolsStringMutArr 过滤策略
-(NSString *_Nullable)filtered:(NSMutableArray <NSString *>*_Nullable)specialSymbolsStringMutArr;
/// 是否包含特殊字符【包含返回YES、不包含返回NO】
/// @param specialSymbolsStringMutArr 过滤策略
-(BOOL)isContainsSpecialSymbolsString:(NSMutableArray <NSString *>*_Nullable)specialSymbolsStringMutArr;

@end

NS_ASSUME_NONNULL_END
