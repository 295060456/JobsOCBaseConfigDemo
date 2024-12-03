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

+(JobsReturnValueByPointerBlock _Nonnull)byPointer{
    return ^NSValue *_Nullable(const void *_Nullable data){
        return [NSValue valueWithPointer:data];
    };
}

+(JobsReturnValueByPointBlock _Nonnull)byPoint{
    return ^NSValue *_Nullable(CGPoint data){
        return [NSValue valueWithCGPoint:data];
    };
}

+(JobsReturnValueByVectorBlock _Nonnull)byVector{
    return ^NSValue *_Nullable(CGVector data){
        return [NSValue valueWithCGVector:data];
    };
}

+(JobsReturnValueByRectBlock _Nonnull)byRect{
    return ^NSValue *_Nullable(CGRect data){
        return [NSValue valueWithCGRect:data];
    };
}

+(JobsReturnValueByAffineTransformBlock _Nonnull)byAffineTransform{
    return ^NSValue *_Nullable(CGAffineTransform data){
        return [NSValue valueWithCGAffineTransform:data];
    };
}

+(JobsReturnValueByEdgeInsetsBlock _Nonnull)byEdgeInsets{
    return ^NSValue *_Nullable(UIEdgeInsets data){
        return [NSValue valueWithUIEdgeInsets:data];
    };
}

+(JobsReturnValueByDirectionalEdgeInsetsBlock _Nonnull)byDirectionalEdgeInsets{
    return ^NSValue *_Nullable(NSDirectionalEdgeInsets data){
        return [NSValue valueWithDirectionalEdgeInsets:data];
    };
}

+(JobsReturnValueByOffsetBlock _Nonnull)byOffset{
    return ^NSValue *_Nullable(UIOffset data){
        return [NSValue valueWithUIOffset:data];
    };
}

@end
