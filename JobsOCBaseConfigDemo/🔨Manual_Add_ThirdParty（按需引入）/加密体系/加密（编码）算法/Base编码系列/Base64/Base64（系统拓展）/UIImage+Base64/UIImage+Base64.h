//
//  UIImage+Base64.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/25.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

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
@interface UIImage (Base64)
#pragma mark —— UIImage ==> Base64
///【类方法】UIImage对象 转换为 以Base64编码的字符串
+(JobsReturnStringByImageBlock _Nonnull)base64StringByImage;
///【实例方法】UIImage对象 转换为 以Base64编码的字符串
-(NSString *_Nullable)base64Str;
#pragma mark —— Base64 ==> UIImage
///【类方法】将以Base64编码的字符串 转换为 UIImage对象
+(JobsReturnImageByStringBlock _Nonnull)imageByBase64String;
///【实例方法】将以Base64编码的字符串 转换为 UIImage对象
-(JobsReturnImageByStringBlock _Nonnull)imageByBase64String;

@end

NS_ASSUME_NONNULL_END
