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
/// 阻止向可变数组添加空元素
-(JobsReturnMutableArrayByIDBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^NSMutableArray *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        if(data){
            [self addObject:data];/// 向数组加入nil会崩
        }else NSLog(@"数组被添加了一个空元素");
        return self;
    };
}
/// 删除元素
-(JobsReturnIDByIDBlock _Nonnull)remove{
    @jobs_weakify(self)
    return ^id (id _Nullable data) {
        @jobs_strongify(self)
        if(data){
            [self removeObject:data];
        }else NSLog(@"数组被删除了一个非空元素");
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
/// 改变输入的按钮状态
-(jobsByBtnBlock _Nonnull)chooseBy{
    @jobs_weakify(self)
    return ^(__kindof UIButton *_Nullable x){
        @jobs_strongify(self)
        for (UIButton *btn in self) {
            btn.selected = NO;
        }x.selected = YES;
    };
}
/// 监控选中状态
-(void)unselectBlock:(jobsByBtnBlock _Nullable)unselectBlock
         selectBlock:(jobsByBtnBlock _Nullable)selectBlock{
    for (id obj in self) {
        [[obj rac_valuesForKeyPath:@"selected" observer:self]
         subscribeNext:^(NSNumber *selected) {
            if(selected.boolValue){
                if(selectBlock) selectBlock(obj);
            }else{
                if(unselectBlock) unselectBlock(obj);
            }
         }];
    }
}

@end
