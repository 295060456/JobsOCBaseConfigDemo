//
//  NSSet+Extra.m
//  FM
//
//  Created by Admin on 16/12/2024.
//

#import "NSSet+Extra.h"

@implementation NSSet (Extra)
/// 对系统方法 setWithArray 的二次封装
+(JobsReturnNSSetByArrBlock _Nonnull)initByArr{
    return ^__kindof NSSet *_Nullable(__kindof NSArray *_Nullable data){
        return [NSSet setWithArray:data];
    };
}

@end
