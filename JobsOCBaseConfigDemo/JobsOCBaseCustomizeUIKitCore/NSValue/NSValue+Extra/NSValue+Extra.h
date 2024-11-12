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

+(JobsReturnValueByCGSizeBlock _Nonnull)bySize;
+(JobsReturnValueByPointerBlock _Nonnull)byPointer;
+(JobsReturnValueByPointBlock _Nonnull)byPoint;

@end

NS_ASSUME_NONNULL_END
