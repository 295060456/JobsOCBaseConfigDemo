//
//  NSObject+Algorithm.h
//  FM
//
//  Created by Admin on 29/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/// 算法相关
@interface NSObject (Algorithm)
/// 将数据做成3列，第一个元素的下标是1，判断任意一个下标数，处于哪一列
-(JobsReturnIntByIntBlock _Nonnull)column3By;
/// 给定一个数据源（数组）和 每行需要展示的元素个数，计算行数
-(NSInteger)count:(NSUInteger)count num:(NSInteger)num;
/// 判断任意给定的一个整型是多少位数
-(JobsReturnByNSIntegerBlock _Nonnull)bitNum;
/// 判断任意数字是否为小数
-(JobsReturnBOOLByCGFloatBlock _Nonnull)isFloat;
/**
    判断 num1 是否能被 num2 整除
    也就是判断 num2 是否是 num1 的整数倍
    也就是判断 num1 除以 num2 的余数是否是 0
 
    特别指出的是：
    1、除数为零的情况，被判定为不能被整除；
    2、num1 和 num2 必须为 NSNumber* 类型，否则判定为不能够被整除
 */
-(BOOL)judgementExactDivisionByNum1:(NSNumber *_Nonnull)num1 num2:(NSNumber *_Nonnull)num2;
/// 雪花算法
-(NSNumber *_Nonnull)makeSnowflake;
/// 查询算法
/// @param data 查询的数据源
/// @param searchStrategy 查询策略
/// @param keywords 关键词
-(NSMutableSet *_Nullable)dimSearchWithData:(id _Nonnull)data
                             searchStrategy:(JobsSearchStrategy)searchStrategy
                                   keywords:(NSString *_Nonnull)keywords;

@end

NS_ASSUME_NONNULL_END
