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

+(JobsReturnNumberByCharBlock _Nonnull)initByChar;
+(JobsReturnNumberByUnsignedCharBlock _Nonnull)initByUnsignedChar;
+(JobsReturnNumberByShortBlock _Nonnull)initByShort;
+(JobsReturnNumberByUnsignedShortBlock _Nonnull)initByUnsignedShort;
+(JobsReturnNumberByIntBlock _Nonnull)initByInt;
+(JobsReturnNumberByUnsignedIntBlock _Nonnull)initByUnsignedInt;
+(JobsReturnNumberByLongBlock _Nonnull)initByLong;
+(JobsReturnNumberByUnsignedLongBlock _Nonnull)initByUnsignedLong;
+(JobsReturnNumberByLongLongBlock _Nonnull)initByLongLong;
+(JobsReturnNumberByUnsignedLongLongBlock _Nonnull)initByUnsignedLongLong;
+(JobsReturnNumberByFloatBlock _Nonnull)initByFloat;
+(JobsReturnNumberByDoubleBlock _Nonnull)initByDouble;
+(JobsReturnNumberByBOOLBlock _Nonnull)initByBOOL;
+(JobsReturnNumberByNSIntegerBlock _Nonnull)initByNSInteger;
+(JobsReturnNumberByNSUIntegerBlock _Nonnull)initByNSUInteger;
+(JobsReturnNumberByCGFloatBlock _Nonnull)initByCGFloat; /// 特殊处理 CGFloat 类型

-(CGFloat)byFloat;
-(JobsReturnStringByNumberBlock _Nonnull)toString;
-(JobsReturnNumberByNSIntegerBlock _Nonnull)updateByStepInt;
-(JobsReturnNumberByCGFloatBlock _Nonnull)updateByStepFloat;

@end

NS_ASSUME_NONNULL_END
