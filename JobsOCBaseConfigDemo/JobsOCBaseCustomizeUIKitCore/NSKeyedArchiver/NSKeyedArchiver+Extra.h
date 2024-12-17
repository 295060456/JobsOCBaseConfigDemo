//
//  NSKeyedArchiver+Extra.h
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSKeyedArchiver (Extra)

+(JobsReturnDataByIDBlock _Nonnull)initByObject;
+(JobsReturnDataByIDBlock _Nonnull)archivedDataByRootObject_NO;
+(JobsReturnDataByIDBlock _Nonnull)archivedDataByRootObject_YES;

@end

NS_ASSUME_NONNULL_END
