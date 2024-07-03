//
//  NSString+Base32.h
//  JobsOCBaseConfig
//  see http://www.ietf.org/rfc/rfc4648.txt for more details
//
//  Created by Jobs on 2024/4/25.
//

#import <Foundation/Foundation.h>
#import "MF_Base32Codec.h"
#import "NSData+Base32.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Base32)
#pragma mark —— Base32 <==> NSString
///【类方法】以Base32编码的字符串 转换为 普通的字符串
+(NSString *_Nullable)stringByBase32String:(NSString *_Nonnull)base32String;
///【实例方法】以Base32编码的字符串 转换为 普通的字符串
-(NSString *_Nullable)stringByBase32String;
///【类方法】普通的字符串 转换为 以Base32编码的字符串
+(NSString *_Nullable)base32String:(NSString *)string;
///【实例方法】普通的字符串 转换为 以Base32编码的字符串
-(NSString *_Nullable)base32String;
#pragma mark —— Base32 <==> UIImage
///【类方法】将以Base32编码的字符串 转换为 NSData对象，然后再转成UIImage
+(UIImage *_Nullable)imageByBase32String:(NSString *_Nonnull)base32String;
///【实例方法】将以Base32编码的字符串 转换为 NSData对象，然后再转成UIImage
-(UIImage *_Nullable)imageByBase32String;
#pragma mark —— Base32 <==> NSData
/// 将Base32编码的字符串 转换为 NSData对象
+(NSData *_Nullable)dataWithBase32String:(NSString *_Nonnull)base32String;
///【实例方法】将Base32编码的字符串 转换为 NSData对象
-(NSData *_Nullable)dataWithBase32String;

@end

NS_ASSUME_NONNULL_END
