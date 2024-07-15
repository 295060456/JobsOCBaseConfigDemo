//
//  UIImage+Base32.h
//  JobsOCBaseConfig
//  see http://www.ietf.org/rfc/rfc4648.txt for more details
//
//  Created by Jobs on 2024/4/25.
//

#import <UIKit/UIKit.h>
#import "NSData+Base32.h"

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
@interface UIImage (Base32)
#pragma mark ——【Sys】NSData ==> UIImage
///【类方法】NSData 转 UIImage
+(UIImage *_Nullable)getImageWithData:(NSData *_Nonnull)data;
///【实例方法】NSData 转 UIImage
-(UIImage *_Nullable)getImageWithData:(NSData *_Nonnull)data;
#pragma mark ——【Sys】
#pragma mark ——【Sys】UIImage ==> NSData.PNG
///【类方法】UIImage 转 NSData（PNG格式）
+(NSData *_Nullable)dataWithPNGImage:(UIImage *_Nonnull)image;
///【实例方法】UIImage 转 NSData（PNG格式）
-(NSData *_Nullable)PNGImageData;
#pragma mark ——【Sys】UIImage ==> NSData.JPEG
///【类方法】UIImage 转 NSData（JPEG格式），指定压缩质量
+(NSData *_Nullable)dataWithJPEGImage:(UIImage *_Nonnull)image
                   compressionQuality:(CGFloat)compressionQuality;
///【实例方法】UIImage 转 NSData（JPEG格式），指定压缩质量
-(NSData *_Nullable)JPEGImageDataWithCompressionQuality:(CGFloat)compressionQuality;
#pragma mark ——【Custom】
#pragma mark —— Base32 <==> UIImage
///【类方法】将UIimage对象转成用Base32编码的字符串
+(NSString *_Nullable)base32StringByImage:(UIImage *_Nonnull)image;
///【实例方法】将UIimage对象转成用Base32编码的字符串
-(NSString *_Nullable)base32Str;
///【类方法】将以Base32编码的字符串 转换为 NSData对象，然后再转成UIImage
+(UIImage *_Nullable)imageByBase32String:(NSString *_Nonnull)base32String;
///【实例方法】将以Base32编码的字符串 转换为 NSData对象，然后再转成UIImage
-(UIImage *_Nullable)imageByBase32String:(NSString *_Nonnull)base32String;

@end

NS_ASSUME_NONNULL_END
