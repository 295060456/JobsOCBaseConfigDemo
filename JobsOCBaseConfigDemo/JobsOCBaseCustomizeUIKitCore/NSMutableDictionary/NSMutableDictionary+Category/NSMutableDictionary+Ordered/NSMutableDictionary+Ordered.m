//
//  NSMutableDictionary+Ordered.m
//  OrderedMutableDictionary
//
//  Created by Locke on 2017/3/17.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import "NSMutableDictionary+Ordered.h"

static BOOL isHasBeenRemoved;
/**
    因为是对setObject:forKey:、removeObjectForKey:、removeAllObjects、removeObjectsForKeys:
    所以在调用结果集的前提条件是需要对目标数组进行上述条件的操作
    特别的，比如MJExtension，模型转字典，因为没有调用上述相关方法，所以结果集会失败
 */
@implementation NSMutableDictionary (Ordered)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSDictionaryM") swizzlingInstanceMethod:@selector(setObject:forKey:)
                                                     swizzledSelector:@selector(swizzled_setObject:forKey:)];
            [objc_getClass("__NSDictionaryM") swizzlingInstanceMethod:@selector(removeObjectForKey:)
                                                     swizzledSelector:@selector(swizzled_removeObjectForKey:)];
            [objc_getClass("__NSDictionaryM") swizzlingInstanceMethod:@selector(removeAllObjects)
                                                     swizzledSelector:@selector(swizzled_removeAllObjects)];
            [objc_getClass("__NSDictionaryM") swizzlingInstanceMethod:@selector(removeObjectsForKeys:)
                                                     swizzledSelector:@selector(swizzled_removeObjectsForKeys:)];
        }
    });
}
static const void *OrderedDictionaryKeys = (void *)@"OrderedDictionaryKeys";
-(NSMutableArray *)keys{
    return objc_getAssociatedObject(self, OrderedDictionaryKeys);
}

-(void)setKeys:(NSMutableArray *)keys {
    objc_setAssociatedObject(self,
                             OrderedDictionaryKeys,
                             keys,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/// 添加键值对
-(void)swizzled_setObject:(nonnull id)anObject
                   forKey:(nonnull id<NSCopying>)aKey{
    if (!self.keys) self.keys = NSMutableArray.array;
    @jobs_weakify(self)
    if (self.keys.count == self.allKeys.count) {
        [self.keys enumerateObjectsUsingBlock:^(id _Nonnull obj,
                                                NSUInteger idx,
                                                BOOL *_Nonnull stop) {
            @jobs_strongify(self)
            if ([obj isEqual:aKey]) {
                [self.keys removeObjectAtIndex:idx];
                *stop = YES;
            }
        }];[self.keys addObject:aKey];
    }[self swizzled_setObject:anObject forKey:aKey];
}
/// 移除给定key键值对
-(void)swizzled_removeObjectForKey:(id)aKey{
    if (!isHasBeenRemoved) {
        [self.keys removeObject:aKey];
    }isHasBeenRemoved = NO;
    [self swizzled_removeObjectForKey:aKey];
}
/// 移除全部键值对
-(void)swizzled_removeAllObjects {
    [self.keys removeAllObjects];
    [self swizzled_removeAllObjects];
}
/// 移除给定的keyArray键值对
-(void)swizzled_removeObjectsForKeys:(NSArray<id> *)keyArray{
    for (id obj in keyArray) {
        [self.keys removeObject:obj];
    }[self swizzled_removeObjectsForKeys:keyArray];
}
/// 获取给定index的对象
- (id)objectAtIndex:(NSUInteger)index {
    if (index >= self.keys.count) {
        return nil;
    }return [self objectForKey:self.keys[index]];
}
/// 插入键值对至给定index
-(void)insertObject:(id)anObject
             forKey:(id<NSCopying>)aKey
            atIndex:(NSUInteger)index {
    if (index < self.keys.count) {
        [self.keys insertObject:aKey atIndex:index];
        //如果插入的数据字典中已存在，移除一个
        [self.keys enumerateObjectsUsingBlock:^(id  _Nonnull obj,
                                                NSUInteger idx,
                                                BOOL * _Nonnull stop) {
            if ([obj isEqual:aKey] && index != idx) {
                [self.keys removeObjectAtIndex:idx];
                isHasBeenRemoved = YES;
                [self removeObjectForKey:obj];
                *stop = YES;
            }
        }];[self setObject:anObject forKey:aKey];
    }
}
/// 移除最后一个键值对
-(void)removeLastObject{
    [self removeObjectAtIndex:self.keys.count - 1];
}
/// 移除给定index的键值对
-(void)removeObjectAtIndex:(NSUInteger)index{
    if (index < self.keys.count) {
        [self removeObjectForKey:self.keys[index]];
    }
}
/// 替换给定index的值
-(void)replaceObjectAtIndex:(NSUInteger)index
                 withObject:(id)anObject {
    if (index < self.keys.count) {
        [self insertObject:anObject
                    forKey:self.keys[index]
                   atIndex:index];
    }
}
/// 插入键值对至给定indexes
-(void)insertObjects:(NSArray<id> *)objects
                keys:(NSArray<id <NSCopying>> *)keys
           atIndexes:(NSIndexSet *)indexes {
    __block NSUInteger index = 0;
    @jobs_weakify(self)
    [indexes enumerateIndexesUsingBlock:^(NSUInteger idx,
                                          BOOL * _Nonnull stop) {
        @jobs_strongify(self)
        [self insertObject:objects[index] forKey:keys[index] atIndex:idx];
        index ++;
    }];
}
/// 移除给定indexes的键值对
-(void)removeObjectsAtIndexes:(NSIndexSet *)indexes {
    @jobs_weakify(self)
    [indexes enumerateIndexesWithOptions:NSEnumerationReverse
                              usingBlock:^(NSUInteger idx,
                                           BOOL * _Nonnull stop) {
        @jobs_strongify(self)
        [self removeObjectAtIndex:idx];
   }];
}
/// 替换给定indexes的值
-(void)replaceObjectsAtIndexes:(NSIndexSet *)indexes
                   withObjects:(NSArray<id> *)objects {
    __block NSUInteger index = 0;
    @jobs_weakify(self)
    [indexes enumerateIndexesUsingBlock:^(NSUInteger idx,
                                          BOOL *_Nonnull stop) {
        @jobs_strongify(self)
        [self replaceObjectAtIndex:idx withObject:objects[index]];
        index ++;
    }];
}

@end
