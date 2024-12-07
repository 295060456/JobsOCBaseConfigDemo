//
//  NSData+Base16.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsMakes.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Base16)
#pragma mark —— NSData ==> Base16
///【类方法】将NSData对象 转换为 以Base16（也称为十六进制）编码的字符串
+(JobsReturnStringByDataBlock _Nonnull)base16StringByData;
///【实例方法】将NSData对象 转换为 以Base16（也称为十六进制）编码的字符串
-(NSString *_Nullable)base16StringByImage;
#pragma mark —— Base16 ==> NSData
///【类方法】将以Base16编码的字符串 转换为 NSData对象
+(JobsReturnDataByStringBlock _Nonnull)dataByBase16String;
///【实例方法】将以Base16编码的字符串 转换为 NSData对象
-(JobsReturnDataByStringBlock _Nonnull)dataByBase16String;

@end

NS_ASSUME_NONNULL_END
