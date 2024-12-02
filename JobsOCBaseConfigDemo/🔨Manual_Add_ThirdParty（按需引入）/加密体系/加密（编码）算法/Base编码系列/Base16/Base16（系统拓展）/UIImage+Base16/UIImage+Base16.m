//
//  UIImage+Base16.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/24.
//

#import "UIImage+Base16.h"
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
@implementation UIImage (Base16)
#pragma mark —— UIImage ==> Base16
///【类方法】将UIImage对象 转换为 以Base16（也称为十六进制）编码的字符串
+(NSString *_Nullable)base16StringByImage:(UIImage *_Nonnull)image{
    /**
     首先通过UIImagePNGRepresentation（或者UIImageJPEGRepresentation）将UIImage对象转换为NSData对象
     然后遍历该NSData对象的字节序列，并将每个字节转换为两个十六进制字符
     然后将这些字符拼接到一个NSMutableString中
     最终返回这个Base16字符串。
     
     例如：如果UIImage对象表示的是一张图片，那么这个方法将返回该图片的Base16表示形式，即将图片的所有字节以十六进制表示
     */
    NSData *imageData = UIImagePNGRepresentation(image); // 或者 UIImageJPEGRepresentation(self, compressionQuality)
    NSUInteger length = imageData.length;
    const unsigned char *bytes = imageData.bytes;
    NSMutableString *hexString = [NSMutableString stringWithCapacity:length * 2];
    for (NSUInteger i = 0; i < length; i++) {
        [hexString appendFormat:@"%02X", bytes[i]];
    }return hexString;
}
///【实例方法】将UIImage对象 转换为 以Base16（也称为十六进制）编码的字符串
-(NSString *_Nullable)base16Str{
    /**
     首先通过UIImagePNGRepresentation（或者UIImageJPEGRepresentation）将UIImage对象转换为NSData对象
     然后遍历该NSData对象的字节序列，并将每个字节转换为两个十六进制字符
     然后将这些字符拼接到一个NSMutableString中
     最终返回这个Base16字符串。
     
     例如：如果UIImage对象表示的是一张图片，那么这个方法将返回该图片的Base16表示形式，即将图片的所有字节以十六进制表示
     */
    NSData *imageData = UIImagePNGRepresentation(self); // 或者 UIImageJPEGRepresentation(self, compressionQuality)
    NSUInteger length = imageData.length;
    const unsigned char *bytes = imageData.bytes;
    NSMutableString *hexString = [NSMutableString stringWithCapacity:length * 2];
    for (NSUInteger i = 0; i < length; i++) {
        [hexString appendFormat:@"%02X", bytes[i]];
    }return hexString;
}
#pragma mark —— Base16 ==> UIImage
///【类方法】将以Base16编码的字符串 转换为 UIImage对象
+(UIImage *_Nullable)imageByBase16String:(NSString *_Nonnull)base16StringByImage{
    /**
     首先创建了一个NSMutableData对象，然后对Base16字符串进行遍历，每两个字符为一组，表示一个字节的十六进制值
     然后使用NSScanner将这个十六进制字符串转换为无符号整数，再将其转换为UInt8类型的字节，最后将这个字节添加到NSMutableData中
     完成遍历后，使用NSData对象初始化UIImage对象，并返回。
     
     例如：如果Base16字符串表示的是一张图片的十六进制表示形式，那么这个方法将返回表示相同图片的UIImage对象。
     */
    NSMutableData *imageData = NSMutableData.data;
    for (NSUInteger i = 0; i + 1 < base16StringByImage.length; i += 2) {
        NSString *hexChar = [base16StringByImage substringWithRange:NSMakeRange(i, 2)];
        NSScanner *scanner = [NSScanner scannerWithString:hexChar];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        UInt8 byte = (UInt8)intValue;
        [imageData appendBytes:&byte length:1];
    }return UIImage.imageByData(imageData);
}
///【实例方法】将以Base16编码的字符串 转换为 UIImage对象
-(UIImage *_Nullable)imageByBase16String:(NSString *_Nonnull)base16StringByImage{
    /**
     首先创建了一个NSMutableData对象，然后对Base16字符串进行遍历，每两个字符为一组，表示一个字节的十六进制值
     然后使用NSScanner将这个十六进制字符串转换为无符号整数，再将其转换为UInt8类型的字节，最后将这个字节添加到NSMutableData中
     完成遍历后，使用NSData对象初始化UIImage对象，并返回。
     
     例如：如果Base16字符串表示的是一张图片的十六进制表示形式，那么这个方法将返回表示相同图片的UIImage对象。
     */
    NSMutableData *imageData = NSMutableData.data;
    for (NSUInteger i = 0; i + 1 < base16StringByImage.length; i += 2) {
        NSString *hexChar = [base16StringByImage substringWithRange:NSMakeRange(i, 2)];
        NSScanner *scanner = [NSScanner scannerWithString:hexChar];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        UInt8 byte = (UInt8)intValue;
        [imageData appendBytes:&byte length:1];
    }return UIImage.imageByData(imageData);
}

@end
