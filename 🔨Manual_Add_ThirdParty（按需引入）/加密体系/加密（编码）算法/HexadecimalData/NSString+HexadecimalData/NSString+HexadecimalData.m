//
//  NSString+HexadecimalData.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import "NSString+HexadecimalData.h"

@implementation NSString (HexadecimalData)
#pragma mark —— HexadecimalData <==> NSString
///【类方法】16进制字符串 转换成 普通的NSString对象
+(NSString *_Nullable)stringByHexString:(NSString *_Nonnull)hexString{
    NSMutableString *string = NSMutableString.string;
    for (int i = 0; i < hexString.length; i += 2) {
        NSString *hex = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner *scanner = [NSScanner scannerWithString:hex];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [string appendFormat:@"%c", (char)intValue];
    }return string;
}
///【实例方法】16进制字符串 转换成 普通的NSString对象
-(NSString *_Nullable)stringByHexString{
    NSMutableString *string = NSMutableString.string;
    for (int i = 0; i < self.length; i += 2) {
        NSString *hex = [self substringWithRange:NSMakeRange(i, 2)];
        NSScanner *scanner = [NSScanner scannerWithString:hex];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [string appendFormat:@"%c", (char)intValue];
    }return string;
}
///【类方法】普通的NSString对象 转换成 16进制字符串
+(NSString *_Nullable)hexStringByString:(NSString *_Nonnull)string{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableString *hexString = [NSMutableString stringWithCapacity:data.length * 2];
    const unsigned char *bytes = data.bytes;
    for (int i = 0; i < data.length; ++i) {
        [hexString appendFormat:@"%02x", bytes[i]];
    }return hexString;
}
///【实例方法】普通的NSString对象 转换成 16进制字符串
-(NSString *_Nullable)hexStringByString{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableString *hexString = [NSMutableString stringWithCapacity:data.length * 2];
    const unsigned char *bytes = data.bytes;
    for (int i = 0; i < data.length; ++i) {
        [hexString appendFormat:@"%02x", bytes[i]];
    }return hexString;
}
#pragma mark —— HexadecimalData ==> UIImage
///【类方法】16进制字符串 转换为 UIImage对象
+(UIImage *_Nullable)imageByHexString:(NSString *_Nonnull)hexString{
    NSMutableData *imageData = NSMutableData.data;
    for (int i = 0; i + 1 < hexString.length; i += 2) {
        NSString *hexByte = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner *scanner = [NSScanner scannerWithString:hexByte];
        unsigned int byteValue;
        [scanner scanHexInt:&byteValue];
        uint8_t byte = (uint8_t)byteValue;
        [imageData appendBytes:&byte length:1];
    }return [UIImage imageWithData:imageData];
}
///【实例方法】16进制字符串 转换为 UIImage对象
-(UIImage *_Nullable)imageByHexString{
    NSMutableData *imageData = NSMutableData.data;
    for (int i = 0; i + 1 < self.length; i += 2) {
        NSString *hexByte = [self substringWithRange:NSMakeRange(i, 2)];
        NSScanner *scanner = [NSScanner scannerWithString:hexByte];
        unsigned int byteValue;
        [scanner scanHexInt:&byteValue];
        uint8_t byte = (uint8_t)byteValue;
        [imageData appendBytes:&byte length:1];
    }return [UIImage imageWithData:imageData];
}
#pragma mark —— HexadecimalData ==> NSData
///【类方法】16进制字符串 转换为 NSData对象
+(NSData *_Nullable)dataByHexString:(NSString *_Nonnull)hexString{
    NSMutableData *data = NSMutableData.data;
    for (int i = 0; i + 1 < hexString.length; i += 2) {
        NSString *hexByte = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner *scanner = [NSScanner scannerWithString:hexByte];
        unsigned int byteValue;
        [scanner scanHexInt:&byteValue];
        uint8_t byte = (uint8_t)byteValue;
        [data appendBytes:&byte length:1];
    }return data.copy;
}
///【实例方法】16进制字符串 转换为 NSData对象
-(NSData *_Nullable)dataByHexString{
    NSMutableData *data = NSMutableData.data;
    for (int i = 0; i + 1 < self.length; i += 2) {
        NSString *hexByte = [self substringWithRange:NSMakeRange(i, 2)];
        NSScanner *scanner = [NSScanner scannerWithString:hexByte];
        unsigned int byteValue;
        [scanner scanHexInt:&byteValue];
        uint8_t byte = (uint8_t)byteValue;
        [data appendBytes:&byte length:1];
    }return data.copy;
}

@end
