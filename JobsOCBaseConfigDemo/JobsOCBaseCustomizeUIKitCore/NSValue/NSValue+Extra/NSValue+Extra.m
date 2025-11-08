//
//  NSValue+Extra.m
//  FM
//
//  Created by User on 9/28/24.
//

#import "NSValue+Extra.h"

@implementation NSValue (Extra)

+(JobsRetValueByCGSizeBlock _Nonnull)bySize{
    return ^NSValue *_Nullable(CGSize data){
        return [NSValue valueWithCGSize:data];
    };
}

+(JobsRetValueByPointerBlock _Nonnull)byPointer{
    return ^NSValue *_Nullable(const void *_Nullable data){
        return [NSValue valueWithPointer:data];
    };
}

+(JobsRetValueByPointBlock _Nonnull)byPoint{
    return ^NSValue *_Nullable(CGPoint data){
        return [NSValue valueWithCGPoint:data];
    };
}

+(JobsRetValueByVectorBlock _Nonnull)byVector{
    return ^NSValue *_Nullable(CGVector data){
        return [NSValue valueWithCGVector:data];
    };
}

+(JobsRetValueByFrameBlock _Nonnull)byRect{
    return ^NSValue *_Nullable(CGRect data){
        return [NSValue valueWithCGRect:data];
    };
}

+(JobsRetValueByAffineTransformBlock _Nonnull)byAffineTransform{
    return ^NSValue *_Nullable(CGAffineTransform data){
        return [NSValue valueWithCGAffineTransform:data];
    };
}

+(JobsRetValueByEdgeInsetsBlock _Nonnull)byEdgeInsets{
    return ^NSValue *_Nullable(UIEdgeInsets data){
        return [NSValue valueWithUIEdgeInsets:data];
    };
}

+(JobsRetValueByDirectionalEdgeInsetsBlock _Nonnull)byDirectionalEdgeInsets{
    return ^NSValue *_Nullable(NSDirectionalEdgeInsets data){
        return [NSValue valueWithDirectionalEdgeInsets:data];
    };
}

+(JobsRetValueByOffsetBlock _Nonnull)byOffset{
    return ^NSValue *_Nullable(UIOffset data){
        return [NSValue valueWithUIOffset:data];
    };
}

@end
