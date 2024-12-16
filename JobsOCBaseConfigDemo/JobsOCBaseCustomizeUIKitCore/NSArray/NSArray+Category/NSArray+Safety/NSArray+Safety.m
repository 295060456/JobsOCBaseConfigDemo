//
//  NSArray+Extension.m
//  Clipyeu ++
//
//  Created by Josee on 22/03/2019.
//  Copyright © 2019 Josee. All rights reserved.
//

#import "NSArray+Safety.h"

@implementation NSArray (Safety)
/// "__NSArrayI" 表示不可变数组类型
/// "__NSArrayM" 表示可变数组类型
+(void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma mark —— 替换不可变数组中的方法 objectAtIndex
        [self exchangeMethodForClass:@"__NSArrayI"
                                 originalSel:@selector(objectAtIndex:)
                                 swizzledSel:@selector(safe_objectAtIndex)];
#pragma mark —— 替换不可变数组中的方法 []调用的方法
        [self exchangeMethodForClass:@"__NSArrayI"
                                 originalSel:@selector(objectAtIndexedSubscript:)
                                 swizzledSel:@selector(safe_objectAtIndexedSubscript)];
#pragma mark —— 替换可变数组中的方法 objectAtIndex
        [self exchangeMethodForClass:@"__NSArrayI"
                                 originalSel:@selector(objectAtIndex:)
                                 swizzledSel:@selector(safe_mutableObjectAtIndex)];
#pragma mark —— 替换可变数组中的方法 []调用的方法
        [self exchangeMethodForClass:@"__NSArrayI"
                         originalSel:@selector(objectAtIndexedSubscript:)
                         swizzledSel:@selector(safe_mutableObjectAtIndexedSubscript)];
    });
}

-(JobsReturnIDByUIntegerBlock _Nonnull)safe_objectAtIndex{
    @jobs_weakify(self)
    return ^id _Nullable(NSUInteger index){
        @jobs_strongify(self)
        if (index < self.count && self.count > 0) {
            @try {
                return self.safe_objectAtIndex(index);
            } @catch (NSException *exception) {
                NSLog(@"不可变数组越界访问");
                return nil;
            }
        }NSLog(@"不可变数组为空或越界访问");
        return nil;
    };
}

-(JobsReturnIDByUIntegerBlock _Nonnull)safe_objectAtIndexedSubscript{
    @jobs_weakify(self)
    return ^id _Nullable(NSUInteger index){
        @jobs_strongify(self)
        if (index < self.count && self.count > 0) {
            @try {
                return self.safe_objectAtIndexedSubscript(index);
            } @catch (NSException *exception) {
                NSLog(@"不可变数组越界访问");
                return nil;
            }
        }NSLog(@"不可变数组为空或越界访问");
        return nil;
    };
}

-(JobsReturnIDByUIntegerBlock _Nonnull)safe_mutableObjectAtIndex{
    @jobs_weakify(self)
    return ^id _Nullable(NSUInteger index){
        @jobs_strongify(self)
        if (index < self.count && self.count > 0) {
            @try {
                return self.safe_mutableObjectAtIndex(index);
            } @catch (NSException *exception) {
                NSLog(@"可变数组越界访问");
                return nil;
            }
        }NSLog(@"可变数组为空或越界访问");
        return nil;
    };
}

-(JobsReturnIDByUIntegerBlock _Nonnull)safe_mutableObjectAtIndexedSubscript{
    @jobs_weakify(self)
    return ^id _Nullable(NSUInteger index){
        @jobs_strongify(self)
        if (index < self.count && self.count > 0) {
            @try {
                return self.safe_mutableObjectAtIndexedSubscript(index);
            } @catch (NSException *exception) {
                NSLog(@"可变数组越界访问");
                return nil;
            }
        }NSLog(@"可变数组为空或越界访问");
        return nil;
    };
}

@end
