//
//  JobsTuple.m
//  MataShop
//
//  Created by Jobs Hi on 9/21/23.
//

#import "JobsTuple.h"

@interface JobsTuple ()

@property(nonatomic,strong)NSMutableArray *valueMutArr;

@end

@implementation JobsTuple
/// 禁止使用系统的alloc.init方法来进行创建对象
/// 强制用户使用-(instancetype)initWithValues:(id)firstValue, ... 来进行创建对象
-(instancetype)init{
    @throw [NSException exceptionWithName:NSGenericException
                                   reason:@"`-init` unavailable. Use `-initWithReachability:` instead"
                                 userInfo:nil];
    return nil;
}
/// 禁止使用系统的new方法来进行创建对象
/// 强制用户使用-(instancetype)initWithValues:(id)firstValue, ... 来进行创建对象
+ (instancetype)new NS_UNAVAILABLE {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"'new' is not a valid method for this class. Use a custom initialization method instead."
                                 userInfo:nil];
}
/// 必须使用如下方式创建对象，否则得不到valueMutArr
-(instancetype)initWithValues:(id)firstValue, ... {
    if (self = [super init]) {
        // 将第一个参数添加到数组
        if (firstValue) {
            [self.valueMutArr addObject:firstValue];
            va_list args;
            va_start(args, firstValue);
            id value = va_arg(args, id);
            while (value) {
                [self.valueMutArr addObject:value];
                value = va_arg(args, id);
            }va_end(args);
        }
    }return self;
}

-(NSArray *)jobsTupleValueArr{
    return (NSArray *)self.valueMutArr;
}
#pragma mark —— lazyLoad
-(NSMutableArray *)valueMutArr{
    if(!_valueMutArr){
        _valueMutArr = NSMutableArray.array;
    }return _valueMutArr;
}

@end
