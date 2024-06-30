//
//  NSMutableArray+Extra.m
//  Casino
//
//  Created by Jobs on 2022/1/14.
//

#import "NSMutableArray+Extra.h"

@implementation NSMutableArray (Extra)
/// 阻止向可变数组添加空元素
-(void)jobsSecureAddObject:(id)object{
    if(object){
        [self addObject:object];
    }else{
        NSAssert(NO, @"数组被添加了一个空元素");
    }
}
/// 向数组加入一个从来没有没有过的元素，以保证数组元素的单一性
- (void)jobsAddObject:(id)anObject{
    if (![self containsObject:anObject]) {
        [self addObject:anObject];
    }
}
/// 将数组里的某个元素移动到原数组的某个位
-(NSMutableArray *_Nullable)moveElementFromIndex:(NSInteger)fromIndex
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
-(NSMutableArray *)copyElementBytimes:(NSInteger)times{
    NSMutableArray *tempMutArr = NSMutableArray.array;
    for (int i = 0; i < times; times++) {
        [tempMutArr addObjectsFromArray:self];
    }return tempMutArr;
}

@end
