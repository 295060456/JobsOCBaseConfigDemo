//
//  NSArray+Tools.h
//  Wifi
//
//  Created by muxi on 14/11/27.
//  Copyright (c) 2014年 muxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

@interface NSArray (Tools)
/// 数组里面是否包含某个元素
-(JobsReturnBOOLByIDBlock _Nonnull)containsObject;
/// 数组转字符串
-(NSString *_Nonnull)string;
/// 数组比较
-(JobsReturnBOOLByArrBlock _Nonnull)compareEqualArrElement;
/// 数组计算交集
-(JobsReturnArrayByArrayBlock _Nonnull)arrayForIntersectionWithOtherArray;
/// 数据计算差集
-(JobsReturnArrayByArrayBlock _Nonnull)arrayForMinusWithOtherArray;

@end
