//
//  NSTextCheckingResult+Extra.h
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSTextCheckingResult (Extra)

-(JobsRetRangeByIntegerBlock _Nonnull)rangeAtIndex;

@end

NS_ASSUME_NONNULL_END
