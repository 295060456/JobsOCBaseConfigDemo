//
//  UIImage+HexadecimalData.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import "UIImage+HexadecimalData.h"

@implementation UIImage (HexadecimalData)
#pragma mark —— UIImage对象 ==> 16进制字符串
///【类方法】UIImage对象 转换为 16进制字符串
+(NSString *_Nullable)hexStringByImage:(UIImage *_Nonnull)image{
    NSData *imageData = UIImagePNGRepresentation(image); // 或者 UIImageJPEGRepresentation(self, compressionQuality)
    NSMutableString *hexString = [NSMutableString stringWithCapacity:imageData.length * 2];
    const unsigned char *bytes = imageData.bytes;
    for (int i = 0; i < imageData.length; ++i) {
        [hexString appendFormat:@"%02X", bytes[i]];
    }return hexString;
}
///【实例方法】UIImage对象 转换为 16进制字符串
-(NSString *_Nullable)hexStr{
    NSData *imageData = UIImagePNGRepresentation(self); // 或者 UIImageJPEGRepresentation(self, compressionQuality)
    NSMutableString *hexString = [NSMutableString stringWithCapacity:imageData.length * 2];
    const unsigned char *bytes = imageData.bytes;
    for (int i = 0; i < imageData.length; ++i) {
        [hexString appendFormat:@"%02X", bytes[i]];
    }return hexString;
}
#pragma mark —— 16进制字符串 ==> UIImage对象
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
-(UIImage *_Nullable)imageByHexString:(NSString *_Nonnull)hexString{
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

@end
