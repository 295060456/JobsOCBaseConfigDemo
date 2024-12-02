//
//  UIImage+Base32.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/25.
//

#import "UIImage+Base32.h"
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
@implementation UIImage (Base32)
#pragma mark ——【Sys】NSData ==> UIImage
///【类方法】NSData 转 UIImage
+(JobsReturnImageByDataBlock _Nonnull)getImageWithData{
    return ^UIImage *_Nonnull(NSData *_Nullable data){
        return UIImage.imageByData(data);
    };
}
///【实例方法】NSData 转 UIImage
-(JobsReturnImageByDataBlock _Nonnull)getImageWithData{
    return ^UIImage *_Nonnull(NSData *_Nullable data){
        return UIImage.getImageWithData(data);
    };
}
#pragma mark ——【Sys】
#pragma mark ——【Sys】UIImage ==> NSData.PNG
///【类方法】UIImage 转 NSData（PNG格式）
+(JobsReturnDataByImageBlock _Nonnull)dataWithPNGImage{
    return ^NSData *_Nullable(UIImage *_Nullable image){
        return UIImagePNGRepresentation(image);
    };
}
///【实例方法】UIImage 转 NSData（PNG格式）
-(NSData *_Nullable)PNGImageData{
    return UIImage.dataWithPNGImage(self);
}
#pragma mark ——【Sys】UIImage ==> NSData.JPEG
///【类方法】UIImage 转 NSData（JPEG格式），指定压缩质量
+(NSData *_Nullable)dataWithJPEGImage:(UIImage *_Nonnull)image
                   compressionQuality:(CGFloat)compressionQuality{
    return UIImageJPEGRepresentation(image, compressionQuality);
}
///【实例方法】UIImage 转 NSData（JPEG格式），指定压缩质量
-(JobsReturnDataByFloatBlock _Nonnull)JPEGImageDataWithCompressionQuality{
    @jobs_weakify(self)
    return ^NSData *_Nullable(CGFloat compressionQuality){
        @jobs_strongify(self)
        return UIImageJPEGRepresentation(self, compressionQuality);
    };
}
#pragma mark ——【Custom】
#pragma mark —— Base32 <==> UIImage
///【类方法】将UIimage对象转成用Base32编码的字符串
+(JobsReturnStringByImageBlock _Nonnull)base32StringByImage{
    return ^__kindof NSString *_Nullable(UIImage *_Nullable image){
        return UIImagePNGRepresentation(image).base32String;
    };
}
///【实例方法】将UIimage对象转成用Base32编码的字符串
-(NSString *_Nullable)base32Str{
    return UIImage.base32StringByImage(self);
}
///【类方法】将以Base32编码的字符串 转换为 NSData对象，然后再转成UIImage
+(JobsReturnImageByStringBlock _Nonnull)imageByBase32String{
    return ^UIImage *_Nullable(NSString *_Nullable data){
        return UIImage.imageByData(NSData.dataWithBase32String(data));
    };
}
///【实例方法】将以Base32编码的字符串 转换为 NSData对象，然后再转成UIImage
-(JobsReturnImageByStringBlock _Nonnull)imageByBase32String{
    return ^UIImage *_Nullable(NSString *_Nullable data){
        return UIImage.imageByBase32String(data);
    };
}

@end
