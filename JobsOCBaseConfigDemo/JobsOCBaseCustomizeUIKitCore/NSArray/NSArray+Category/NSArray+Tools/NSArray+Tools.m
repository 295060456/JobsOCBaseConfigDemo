//
//  NSArray+Tools.m
//  Wifi
//
//  Created by muxi on 14/11/27.
//  Copyright (c) 2014年 muxi. All rights reserved.
//

#import "NSArray+Tools.h"

@implementation NSArray (Tools)
/// 数组里面是否包含某个元素
-(JobsReturnBOOLByIDBlock _Nonnull)containsObject{
    @jobs_weakify(self)
    return ^BOOL(id _Nullable data) {
        @jobs_strongify(self)
        if(!data) return NO;
        return [self containsObject:data];
    };
}
/// 数组转字符串
-(NSString *_Nonnull)string{
    if(!self ||self.count == 0) return JobsInternationalization(@"");
    NSMutableString *str = NSMutableString.string;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx,
                                       BOOL *stop) {
        [str appendFormat:@"%@,",obj];
    }];
    //删除最后一个','
    NSString *strForRight = [str substringWithRange:NSMakeRange(0, str.length - 1)];
    return strForRight;
}
/// 数组比较
-(JobsReturnBOOLByArrBlock _Nonnull)compareEqualArrElement{
    @jobs_weakify(self)
    return ^BOOL(NSArray *_Nullable array){
        @jobs_strongify(self)
        return [[NSSet setWithArray:self] isEqualToSet:[NSSet setWithArray:array]];
    };
}
/// 数组计算交集
-(JobsReturnArrayByArrayBlock _Nonnull)arrayForIntersectionWithOtherArray{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(__kindof NSArray *_Nullable otherArray){
        @jobs_strongify(self)
        NSMutableArray *intersectionArray = NSMutableArray.array;
        if(self.count == 0) return nil;
        if(!otherArray) return nil;
        /// 遍历
        for (id obj in self) {
            if(!otherArray.containsObject(obj)) continue;
            /// 添加
            intersectionArray.add(obj);
        }return intersectionArray;
    };
}
/// 数据计算差集
-(JobsReturnArrayByArrayBlock _Nonnull)arrayForMinusWithOtherArray{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(__kindof NSArray *_Nullable otherArray){
        @jobs_strongify(self)
        if(!self) return nil;
        if(!otherArray) return self;
        NSMutableArray *minusArray = [NSMutableArray arrayWithArray:self];
        /// 遍历
        for (id obj in otherArray) {
            if(!self.containsObject(obj)) continue;
            /// 添加
            [minusArray removeObject:obj];
        }return minusArray;
    };
}

@end
