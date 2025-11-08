//
//  NSRegularExpression+Extra.h
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSRegularExpression (Extra)

+(JobsRetRegularExpressionByStringBlock _Nonnull)byString;

@end

NS_ASSUME_NONNULL_END
