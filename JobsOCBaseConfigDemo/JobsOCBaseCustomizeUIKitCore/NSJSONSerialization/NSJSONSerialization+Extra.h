//
//  NSJSONSerialization+Extra.h
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSJSONSerialization (Extra)

+(JobsRetDicByDataBlock _Nonnull)makeDicByData;

@end

NS_ASSUME_NONNULL_END
