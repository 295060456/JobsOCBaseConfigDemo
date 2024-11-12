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
        method_exchangeImplementations(class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:)),
                                       class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(safe_objectAtIndex:)));
#pragma mark —— 替换不可变数组中的方法 []调用的方法
        method_exchangeImplementations(class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndexedSubscript:)),
                                       class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(safe_objectAtIndexedSubscript:)));
#pragma mark —— 替换可变数组中的方法 objectAtIndex
        method_exchangeImplementations(class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:)),
                                       class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safe_mutableObjectAtIndex:)));
#pragma mark —— 替换可变数组中的方法 []调用的方法
        method_exchangeImplementations(class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndexedSubscript:)),
                                       class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safe_mutableObjectAtIndexedSubscript:)));
    });
}

-(id)safe_objectAtIndex:(NSUInteger)index{
    if (index < self.count && self.count > 0) {
        @try {
            return [self safe_objectAtIndex:index];
        } @catch (NSException *exception) {
            NSLog(@"不可变数组越界访问");
            return nil;
        }
    }
    NSLog(@"不可变数组为空或越界访问");
    return nil;
}

-(id)safe_objectAtIndexedSubscript:(NSUInteger)index {
    if (index < self.count && self.count > 0) {
        @try {
            return [self safe_objectAtIndexedSubscript:index];
        } @catch (NSException *exception) {
            NSLog(@"不可变数组越界访问");
            return nil;
        }
    }
    NSLog(@"不可变数组为空或越界访问");
    return nil;
}

- (id)safe_mutableObjectAtIndex:(NSUInteger)index {
    if (index < self.count && self.count > 0) {
        @try {
            return [self safe_mutableObjectAtIndex:index];
        } @catch (NSException *exception) {
            NSLog(@"可变数组越界访问");
            return nil;
        }
    }
    NSLog(@"可变数组为空或越界访问");
    return nil;
}

-(id)safe_mutableObjectAtIndexedSubscript:(NSUInteger)index{
    if (index < self.count && self.count > 0) {
        @try {
            return [self safe_mutableObjectAtIndexedSubscript:index];
        } @catch (NSException *exception) {
            NSLog(@"可变数组越界访问");
            return nil;
        }
    }
    NSLog(@"可变数组为空或越界访问");
    return nil;
}

@end
