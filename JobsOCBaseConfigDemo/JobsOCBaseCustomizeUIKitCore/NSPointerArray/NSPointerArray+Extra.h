//
//  NSPointerArray+Extra.h
//  FMNormal
//
//  Created by Jobs on 2025/5/27.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSPointerArray (Extra)

-(JobsRetPointerByNSUIntegerBlock _Nonnull)pointerByIndex;
-(JobsRetPointerArrayByPointerBlock _Nonnull)add;
-(JobsRetPointerArrayByNSUIntegerBlock _Nonnull)removePointerBy;

@end

NS_ASSUME_NONNULL_END
