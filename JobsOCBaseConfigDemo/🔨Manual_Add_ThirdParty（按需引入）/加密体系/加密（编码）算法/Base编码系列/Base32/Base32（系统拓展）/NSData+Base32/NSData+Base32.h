//
//  NSData+Base32.h
//  JobsOCBaseConfig
//  see http://www.ietf.org/rfc/rfc4648.txt for more details
//
//  Created by Jobs on 2024/4/25.
//

#import <Foundation/Foundation.h>
#import "MF_Base32Codec.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Base32)
#pragma mark —— NSData ==> Base32
///【类方法】将NSData对象 转换为 以Base32编码的字符串
+(JobsReturnStringByDataBlock _Nonnull)base32String;
///【实例方法】将NSData对象 转换为 以Base32编码的字符串
-(NSString *_Nullable)base32String;
#pragma mark —— Base32 ==> NSData
///【类方法】将Base32编码的字符串 转换为 NSData对象
+(JobsReturnDataByStringBlock _Nonnull)dataWithBase32String;
///【实例方法】将Base32编码的字符串 转换为 NSData对象
-(JobsReturnDataByStringBlock _Nonnull)dataWithBase32String;

@end

NS_ASSUME_NONNULL_END
