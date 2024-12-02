//
//  NSObject+Algorithm.m
//  FM
//
//  Created by Admin on 29/11/2024.
//

#import "NSObject+Algorithm.h"

@implementation NSObject (Algorithm)
/// 将数据做成3列，第一个元素的下标是1，判断任意一个下标数，处于哪一列
-(JobsReturnIntByIntBlock _Nonnull)column3By{
    return ^int(int n){
        return ((n - 1) % 3) + 1;
    };
}

@end
