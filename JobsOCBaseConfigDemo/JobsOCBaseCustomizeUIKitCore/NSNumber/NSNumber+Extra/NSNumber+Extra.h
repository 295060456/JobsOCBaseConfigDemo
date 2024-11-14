//
//  NSNumber+Extra.h
//  Casino
//
//  Created by Jobs on 2021/12/28.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (Extra)

@property(nonatomic,readonly)NSString *stringValueOrEmpty;

-(JobsReturnStringByNumberBlock _Nonnull)toString;
-(JobsReturnNumberByIntegerBlock _Nonnull)updateByStepInt;
-(JobsReturnNumberByFloatBlock _Nonnull)updateByStepFloat;

@end

NS_ASSUME_NONNULL_END
