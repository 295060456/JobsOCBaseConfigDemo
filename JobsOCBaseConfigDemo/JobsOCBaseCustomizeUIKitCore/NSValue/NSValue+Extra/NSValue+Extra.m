//
//  NSValue+Extra.m
//  FM
//
//  Created by User on 9/28/24.
//

#import "NSValue+Extra.h"

@implementation NSValue (Extra)

+(JobsReturnValueByCGSizeBlock _Nonnull)bySize{
    return ^NSValue *_Nullable(CGSize data){
        return [NSValue valueWithCGSize:data];
    };
}

+(JobsReturnValueByPointBlock _Nonnull)byPoint{
    return ^NSValue *_Nullable(const void *_Nullable data){
        return [NSValue valueWithPointer:data];
    };
}

@end
