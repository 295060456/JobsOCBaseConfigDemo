//
//  NSCoder+Extra.h
//  FM
//
//  Created by Admin on 9/11/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSCoder (Extra)
/// 解档：字符串类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeStringBy;
/// 解档：UIImage类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeImageBy;
/// 解档：NSNumber类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeNumberBy;
/// 解档：BOOL值
-(JobsRetBOOLByStringBlock _Nonnull)decodeBOOLBy;
/// 解档：NSInteger值
-(JobsRetNSIntegerByStringBlock _Nonnull)decodeIntegerBy;
/// 解档：浮点数 (double) 数据
-(JobsRetDoubleByStringBlock _Nonnull)decodeDoubleBy;
/// 解档：字典类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeDictionaryBy;
/// 解档：数组类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeArrayBy;
/// 解档：NSData类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeDataBy;

@end

NS_ASSUME_NONNULL_END
