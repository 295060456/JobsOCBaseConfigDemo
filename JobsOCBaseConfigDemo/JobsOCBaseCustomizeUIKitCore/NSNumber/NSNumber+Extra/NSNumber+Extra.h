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

+(JobsRetNumberByCharBlock _Nonnull)initByChar;
+(JobsRetNumberByUnsignedCharBlock _Nonnull)initByUnsignedChar;
+(JobsRetNumberByShortBlock _Nonnull)initByShort;
+(JobsRetNumberByUnsignedShortBlock _Nonnull)initByUnsignedShort;
+(JobsRetNumberByIntBlock _Nonnull)initByInt;
+(JobsRetNumberByUnsignedIntBlock _Nonnull)initByUnsignedInt;
+(JobsRetNumberByLongBlock _Nonnull)initByLong;
+(JobsRetNumberByUnsignedLongBlock _Nonnull)initByUnsignedLong;
+(JobsRetNumberByLongLongBlock _Nonnull)initByLongLong;
+(JobsRetNumberByUnsignedLongLongBlock _Nonnull)initByUnsignedLongLong;
+(JobsRetNumberByFloatBlock _Nonnull)initByFloat;
+(JobsRetNumberByDoubleBlock _Nonnull)initByDouble;
+(JobsRetNumberByBOOLBlock _Nonnull)initByBOOL;
+(JobsRetNumberByNSIntegerBlock _Nonnull)initByNSInteger;
+(JobsRetNumberByNSUIntegerBlock _Nonnull)initByNSUInteger;
+(JobsRetNumberByCGFloatBlock _Nonnull)initByCGFloat; /// 特殊处理 CGFloat 类型

-(CGFloat)byFloat;
-(JobsRetStringByNumberBlock _Nonnull)toString;
-(JobsRetNumberByNSIntegerBlock _Nonnull)updateByStepInt;
-(JobsRetNumberByCGFloatBlock _Nonnull)updateByStepFloat;

@end

NS_ASSUME_NONNULL_END
