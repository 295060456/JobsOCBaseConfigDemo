//
//  NSValue+Extra.h
//  FM
//
//  Created by User on 9/28/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSValue (Extra)

+(JobsRetValueByCGSizeBlock _Nonnull)bySize;
+(JobsRetValueByPointerBlock _Nonnull)byPointer;
+(JobsRetValueByPointBlock _Nonnull)byPoint;
+(JobsRetValueByVectorBlock _Nonnull)byVector;
+(JobsRetValueByFrameBlock _Nonnull)byRect;
+(JobsRetValueByAffineTransformBlock _Nonnull)byAffineTransform;
+(JobsRetValueByEdgeInsetsBlock _Nonnull)byEdgeInsets;
+(JobsRetValueByDirectionalEdgeInsetsBlock _Nonnull)byDirectionalEdgeInsets;
+(JobsRetValueByOffsetBlock _Nonnull)byOffset;

@end

NS_ASSUME_NONNULL_END
