//
//  NSMutableSet+Extra.m
//  FM
//
//  Created by User on 8/6/24.
//

#import "NSMutableSet+Extra.h"

@implementation NSMutableSet (Extra)
/// 阻止向可变集合添加空元素
-(JobsReturnIDByIDBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^id (id _Nullable data) {
        @jobs_strongify(self)
        if(data){
            /// 向集合加入nil会崩
            [self addObject:data];
        }else{
            NSLog(@"集合被添加了一个空元素");
        }return self;
    };
}

@end
