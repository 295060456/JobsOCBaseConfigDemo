//
//  NSMutableArray+Extra.m
//  Casino
//
//  Created by Jobs on 2022/1/14.
//

#import "NSMutableArray+Extra.h"

@implementation NSMutableArray (Extra)

+(JobsReturnArrayByArrayBlock _Nonnull)initBy{
    return ^__kindof NSArray *_Nullable(__kindof NSArray *_Nullable data){
        return [NSMutableArray arrayWithArray:data];
    };
}
/// 清除数组元素
-(jobsByVoidBlock _Nonnull)clean{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self removeAllObjects];
    };
}
/// 数组取值（无法关联数组的泛型）
-(JobsReturnIDByUIntegerBlock _Nonnull)objectAt{
    @jobs_weakify(self)
    return ^id _Nullable(NSUInteger data){
        @jobs_strongify(self)
        return [self objectAtIndex:data];
    };
}
/// 数组取下标
-(JobsReturnNSUIntegerByIDBlock _Nonnull)indexBy{
    @jobs_weakify(self)
    return ^NSUInteger(id _Nullable data){
        @jobs_strongify(self)
        return [self indexOfObject:data];
    };
}
/// 阻止向可变数组添加空元素
-(JobsReturnIDByIDBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^id (id _Nullable data) {
        @jobs_strongify(self)
        if(data){
            [self addObject:data];/// 向数组加入nil会崩
        }else NSLog(@"数组被添加了一个空元素");
        return self;
    };
}
/// 阻止向可变数组添加空元素
-(JobsReturnIDByIDBlock _Nonnull)addBy{
    @jobs_weakify(self)
    return ^id (__kindof NSArray *data) {
        @jobs_strongify(self)
        if(data){
            [self addObjectsFromArray:data];/// 向数组加入nil会崩
        }else NSLog(@"数组被添加了一个空元素");
        return self;
    };
}
/// 向数组加入一个从来没有没有过的元素，以保证数组元素的单一性
-(JobsReturnIDByIDBlock _Nonnull)jobsAddSoleObject{
    @jobs_weakify(self)
    return ^id (id _Nullable data) {
        @jobs_strongify(self)
        if(data){
            if (!self.containsObject(data)) self.add(data);
        }else NSLog(@"数组被添加了一个空元素");
        return self;
    };
}
/// 将数组里的某个元素移动到原数组的某个位
-(__kindof NSArray *_Nullable)moveElementFromIndex:(NSInteger)fromIndex
                                           toIndex:(NSInteger)toIndex{
    
    BOOL a = self.count > fromIndex;
    BOOL b = fromIndex >= 0;
    BOOL c = toIndex >= 0;
    
    if (a && b && c) {
        id element = [self objectAtIndex:fromIndex];
        [self removeObject:element];
        [self insertObject:element atIndex:toIndex];
        return self;
    }return nil;
}
/// 将数组里的元素复制times次
-(JobsReturnArrayByIntegerBlock _Nonnull)copyElementBytimes{
    @jobs_weakify(self)
    return ^NSMutableArray *(NSInteger times) {
        __block NSInteger Times = times;
        @jobs_strongify(self)
        return jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            for (int i = 0; i < Times; Times--) {
                data.addBy(self.copy);
            }
        });
    };
}

@end
