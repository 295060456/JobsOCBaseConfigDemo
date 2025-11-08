//
//  NSData+HexadecimalData.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import <Foundation/Foundation.h>
#import "JobsMakes.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSData (HexadecimalData)
#pragma mark —— NSData对象 ==> 16进制字符串
///【类方法】NSData对象  转换为  16进制字符串
+(JobsRetStringByDataBlock _Nonnull)hexStringByData;
///【实例方法】NSData对象  转换为  16进制字符串
-(NSString *_Nullable)hexStringByData;
#pragma mark —— 16进制字符串 ==> NSData对象
///【类方法】16进制字符串 转换为 NSData对象
+(JobsRetDataByStringBlock _Nonnull)dataByHexString;
///【实例方法】16进制字符串 转换为 NSData对象
-(JobsRetDataByStringBlock _Nonnull)dataByHexString;

@end

NS_ASSUME_NONNULL_END
