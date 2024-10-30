//
//  NSString+FilteringSpecialCharacters.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+FilteringSpecialCharacters.h"

@implementation NSString (FilteringSpecialCharacters)
/// 外界灵活选择的特殊符号拼接成一个包含所有被选中特殊符号的字符串
-(JobsReturnStringByArrBlock _Nonnull)specialSymbolsActionBy{
    return ^NSString *(NSMutableArray <NSString *>*_Nullable arr){
        NSString *tempStr = @"";
        for (NSString *specialSymbolsString in arr) {
            tempStr = tempStr.add(specialSymbolsString);
        }return tempStr;
    };
}
/// 给定一个字符串，通过给定的过滤策略，过滤以后的字符串
-(JobsReturnStringByArrBlock _Nonnull)filteredBy{
    @jobs_weakify(self)
    return ^NSString *(NSMutableArray <NSString *>*_Nullable arr){
        @jobs_strongify(self)
        if (!arr) arr = self.makeStringArr;
        NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:self.specialSymbolsActionBy(arr)];
        /**
            componentsJoinedByString：将array数组转换为string字符串、构造并返回一个NSString对象，该对象是在数组元素之间插入给定分隔符的结果
            componentsSeparatedByString：将string字符串转换为array数组、通过传入的字符串来对目标字符串进行切割成为数组
         
            componentsSeparatedByCharactersInSet：返回一个数组，其中包含来自接收者的子字符串，这些子字符串已被给定集合中的字符分开
         */
        NSString *filtered = [[self componentsSeparatedByCharactersInSet:set] componentsJoinedByString:@""];//filtered 就是过滤掉特殊符号的字符串。可以输入中文英文
        return filtered;
    };
}
/// 是否包含特殊字符【包含返回YES、不包含返回NO】
-(JobsReturnBOOLByArrBlock _Nonnull)isContainsSpecialSymbolsString{
    @jobs_weakify(self)
    return ^BOOL(__kindof NSArray *_Nullable arr){
        @jobs_strongify(self)
        if (!arr) arr = self.makeStringArr;
        NSString *checkStr = self.specialSymbolsActionBy(arr);
        NSArray <NSString *>*checkArr = [checkStr componentsSeparatedByString:@""]; // 意思是通过“,”来切割字符串
        for (NSString *str in checkArr) {
            if ([self containsString:str]) {
                return YES;
            }
        }return NO;
    };
}
#pragma mark —— 一些私有方法
-(NSMutableArray <NSString *>*)makeStringArr{
    return jobsMakeMutArr(^(NSMutableArray <NSString *>*_Nullable data) {
        data.add(皇冠符号);
        data.add(数学符号);
        data.add(标点符号);
        data.add(单位符号);
        data.add(货币符号);
        data.add(制表符);
        data.add(特殊符号);
        data.add(键盘特殊符号);
        data.add(编号序号);
        data.add(爱心符号);
        data.add(箭头符号);
        data.add(符号图案);
    });
}

@end
