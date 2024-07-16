//
//  UIImage+Base16.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
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
@interface UIImage (Base16)
#pragma mark —— UIImage ==> Base16
///【类方法】将UIImage对象 转换为 以Base16（也称为十六进制）编码的字符串
+(NSString *_Nullable)base16StringByImage:(UIImage *_Nonnull)image;
///【实例方法】将UIImage对象 转换为 以Base16（也称为十六进制）编码的字符串
-(NSString *_Nullable)base16Str;
#pragma mark —— Base16 ==> UIImage
///【类方法】将以Base16编码的字符串 转换为 UIImage对象
+(UIImage *_Nullable)imageByBase16String:(NSString *_Nonnull)base16StringByImage;
///【实例方法】将以Base16编码的字符串 转换为 UIImage对象
-(UIImage *_Nullable)imageByBase16String:(NSString *_Nonnull)base16StringByImage;

@end

NS_ASSUME_NONNULL_END
