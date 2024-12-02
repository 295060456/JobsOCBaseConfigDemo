//
//  NSObject+Algorithm.h
//  FM
//
//  Created by Admin on 29/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Algorithm)
/// 将数据做成3列，第一个元素的下标是1，判断任意一个下标数，处于哪一列
-(JobsReturnIntByIntBlock _Nonnull)column3By;

@end

NS_ASSUME_NONNULL_END
