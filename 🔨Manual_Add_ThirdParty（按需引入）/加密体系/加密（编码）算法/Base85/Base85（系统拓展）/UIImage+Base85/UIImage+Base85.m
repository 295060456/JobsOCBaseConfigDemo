//
//  UIImage+Base85.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/25.
//

#import "UIImage+Base85.h"
/*
 UIImagePNGRepresentation：
 这个方法将UIImage对象转换为PNG格式的NSData对象。
 PNG格式是一种无损压缩格式，因此生成的图像数据保留了原始图像的质量，但文件大小可能会比JPEG格式大。
 PNG格式通常用于需要保留图像透明度、精确颜色和细节的情况，如图标、线条图和图形设计等。
 
 UIImageJPEGRepresentation：
 这个方法将UIImage对象转换为JPEG格式的NSData对象。
 JPEG格式是一种有损压缩格式，通过牺牲一些图像细节来实现更小的文件大小。
 JPEG格式通常用于照片和图像，因为它可以提供较小的文件大小，而且人眼对于JPEG压缩引起的细节损失不太敏感。
 **/
@implementation UIImage (Base85)
#pragma mark —— UIImage ==> Base85
///【类方法】将给定的UIImage对象 转换为 以Base85编码的字符串
+(NSString *_Nullable)base85StringByImage:(UIImage *_Nonnull)image{
    /**
     首先将UIImage转换为NSData，然后遍历NSData的字节序列，并将每个连续的四个字节转换为Base85编码的字符序列。 Base85编码是一种用于将二进制数据编码为可打印字符的编码方式，比Base64编码更有效率。
     */
    NSData *imageData = UIImagePNGRepresentation(image); // 或者 UIImageJPEGRepresentation(image, compressionQuality)
    NSUInteger length = imageData.length;
    const unsigned char *bytes = imageData.bytes;
    NSMutableString *base85String = NSMutableString.string;
    NSUInteger remainder = length % 4;
    
    NSUInteger i;
    for (i = 0; i < length - remainder; i += 4) {
        uint32_t value = (bytes[i] << 24) | (bytes[i + 1] << 16) | (bytes[i + 2] << 8) | bytes[i + 3];
        [base85String appendFormat:@"%c%c%c%c%c",
         (value / (85 * 85 * 85 * 85)) % 85 + 33,
         (value / (85 * 85 * 85)) % 85 + 33,
         (value / (85 * 85)) % 85 + 33,
         (value / 85) % 85 + 33,
         value % 85 + 33];
    }
    
    if (remainder > 0) {
        uint32_t value = 0;
        for (NSUInteger j = 0; j < remainder; j++) {
            value |= bytes[i + j] << (8 * (3 - j));
        }
        for (NSUInteger j = 0; j < remainder + 1; j++) {
            [base85String appendFormat:@"%c", (value / (uint32_t)pow(85, 4 - j)) % 85 + 33];
        }
    }return base85String;
}
///【实例方法】将给定的UIImage对象 转换为 以Base85编码的字符串
-(NSString *_Nullable)base85Str{
    /**
     首先将UIImage转换为NSData，然后遍历NSData的字节序列，并将每个连续的四个字节转换为Base85编码的字符序列。 Base85编码是一种用于将二进制数据编码为可打印字符的编码方式，比Base64编码更有效率。
     */
    NSData *imageData = UIImagePNGRepresentation(self); // 或者 UIImageJPEGRepresentation(image, compressionQuality)
    NSUInteger length = imageData.length;
    const unsigned char *bytes = imageData.bytes;
    NSMutableString *base85String = NSMutableString.string;
    NSUInteger remainder = length % 4;
    
    NSUInteger i;
    for (i = 0; i < length - remainder; i += 4) {
        uint32_t value = (bytes[i] << 24) | (bytes[i + 1] << 16) | (bytes[i + 2] << 8) | bytes[i + 3];
        [base85String appendFormat:@"%c%c%c%c%c",
         (value / (85 * 85 * 85 * 85)) % 85 + 33,
         (value / (85 * 85 * 85)) % 85 + 33,
         (value / (85 * 85)) % 85 + 33,
         (value / 85) % 85 + 33,
         value % 85 + 33];
    }
    
    if (remainder > 0) {
        uint32_t value = 0;
        for (NSUInteger j = 0; j < remainder; j++) {
            value |= bytes[i + j] << (8 * (3 - j));
        }
        for (NSUInteger j = 0; j < remainder + 1; j++) {
            [base85String appendFormat:@"%c", (value / (uint32_t)pow(85, 4 - j)) % 85 + 33];
        }
    }return base85String;
}
#pragma mark —— Base85 ==> UIImage
///【类方法】从给定的以Base85编码的字符串中解码并转换为UIImage对象
+(UIImage *_Nullable)imageByBase85String:(NSString *_Nonnull)base85String{
    /**
     首先将Base85字符串解析为对应的字节序列
     然后将字节序列转换为NSData对象
     最后使用UIImage的imageWithData:方法将NSData对象转换为UIImage对象
     */
    NSMutableData *imageData = NSMutableData.data;
    NSUInteger length = [base85String length];
    for (NSUInteger i = 0; i < length; i += 5) {
        uint32_t value = 0;
        for (NSUInteger j = 0; j < 5; j++) {
            if (i + j < length) {
                value = value * 85 + ([base85String characterAtIndex:i + j] - 33);
            }
        }
        for (NSUInteger j = 0; j < 4 && i + j < length; j++) {
            uint8_t byte = (value >> (8 * (3 - j))) & 0xFF;
            [imageData appendBytes:&byte length:1];
        }
    }return [UIImage imageWithData:imageData];
}
///【实例方法】从给定的以Base85编码的字符串中解码并转换为UIImage对象
-(UIImage *_Nullable)imageByBase85String:(NSString *_Nonnull)base85String{
    /**
     首先将Base85字符串解析为对应的字节序列
     然后将字节序列转换为NSData对象
     最后使用UIImage的imageWithData:方法将NSData对象转换为UIImage对象
     */
    NSMutableData *imageData = NSMutableData.data;
    NSUInteger length = [base85String length];
    for (NSUInteger i = 0; i < length; i += 5) {
        uint32_t value = 0;
        for (NSUInteger j = 0; j < 5; j++) {
            if (i + j < length) {
                value = value * 85 + ([base85String characterAtIndex:i + j] - 33);
            }
        }
        for (NSUInteger j = 0; j < 4 && i + j < length; j++) {
            uint8_t byte = (value >> (8 * (3 - j))) & 0xFF;
            [imageData appendBytes:&byte length:1];
        }
    }return [UIImage imageWithData:imageData];
}

@end
