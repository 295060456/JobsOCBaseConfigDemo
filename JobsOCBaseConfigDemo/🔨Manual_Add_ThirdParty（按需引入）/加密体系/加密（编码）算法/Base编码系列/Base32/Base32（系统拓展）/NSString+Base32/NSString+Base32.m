//
//  NSString+Base32.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/25.
//

#import "NSString+Base32.h"

@implementation NSString (Base32)
#pragma mark —— Base32 <==> NSString
///【类方法】以Base32编码的字符串 转换为 普通的字符串
+(NSString *_Nullable)stringByBase32String:(NSString *_Nonnull)base32String{
    NSData *utf8encoding = [MF_Base32Codec dataFromBase32String:base32String];
    return [NSString.alloc initWithData:utf8encoding encoding:NSUTF8StringEncoding];
}
///【实例方法】以Base32编码的字符串 转换为 普通的字符串
-(NSString *_Nullable)stringByBase32String{
    NSData *utf8encoding = [MF_Base32Codec dataFromBase32String:self];
    return [NSString.alloc initWithData:utf8encoding encoding:NSUTF8StringEncoding];
}
///【类方法】普通的字符串 转换为 以Base32编码的字符串
+(NSString *_Nullable)base32String:(NSString *)string{
    NSData *utf8encoding = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [MF_Base32Codec base32StringFromData:utf8encoding];
}
///【实例方法】普通的字符串 转换为 以Base32编码的字符串
-(NSString *_Nullable)base32String{
    NSData *utf8encoding = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [MF_Base32Codec base32StringFromData:utf8encoding];
}
#pragma mark —— Base32 <==> UIImage
///【类方法】将以Base32编码的字符串 转换为 NSData对象，然后再转成UIImage
+(UIImage *_Nullable)imageByBase32String:(NSString *_Nonnull)base32String{
   return [UIImage imageWithData:[NSData dataWithBase32String:base32String]];
}
///【实例方法】将以Base32编码的字符串 转换为 NSData对象，然后再转成UIImage
-(UIImage *_Nullable)imageByBase32String{
   return [UIImage imageWithData:[NSData dataWithBase32String:self]];
}
#pragma mark —— Base32 <==> NSData
/// 将Base32编码的字符串 转换为 NSData对象
+(NSData *_Nullable)dataWithBase32String:(NSString *_Nonnull)base32String{
    return [MF_Base32Codec dataFromBase32String:base32String];
}
///【实例方法】将Base32编码的字符串 转换为 NSData对象
-(NSData *_Nullable)dataWithBase32String{
    return [MF_Base32Codec dataFromBase32String:self];
}

@end
