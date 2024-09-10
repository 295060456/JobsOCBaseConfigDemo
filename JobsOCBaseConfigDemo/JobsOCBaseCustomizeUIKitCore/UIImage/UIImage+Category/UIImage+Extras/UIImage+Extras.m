//
//  UIImage+Extras.m
//
//  Created by Aalto on 2018/12/19.
//  Copyright © 2018 Aalto. All rights reserved.
//

#import "UIImage+Extras.h"

@implementation UIImage (Extras)
/// NSString 转 UIImage
/// @param string 准备转换的字符串
/// @param font 该字符串的字号
/// @param width 该字符串的线宽
/// @param textAlignment 字符串位置
/// @param backGroundColor 背景色
/// @param textColor 字体颜色
+ (UIImage *)imageWithString:(NSString *)string
                        font:(UIFont *)font
                       width:(CGFloat)width
               textAlignment:(NSTextAlignment)textAlignment
             backGroundColor:(UIColor *)backGroundColor
                   textColor:(UIColor *)textColor{
    
    NSDictionary *attributeDic = @{NSFontAttributeName:font};
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, 10000)
                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                                    attributes:attributeDic
                                       context:nil].size;
    if ([UIScreen.mainScreen respondsToSelector:@selector(scale)]){
        if (UIScreen.mainScreen.scale == 2.0){
            UIGraphicsBeginImageContextWithOptions(size, NO, 1.0);
        } else{
            UIGraphicsBeginImageContext(size);
        }
    }else{
        UIGraphicsBeginImageContext(size);
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    [backGroundColor set];
    CGRect rect = CGRectMake(0,
                             0,
                             size.width + 1,
                             size.height + 1);
    CGContextFillRect(context, rect);
    NSMutableParagraphStyle *paragraph = NSMutableParagraphStyle.new;
    paragraph.alignment = textAlignment;
    NSDictionary *attributes = @ {
        NSForegroundColorAttributeName:textColor,
        NSFontAttributeName:font,
        NSParagraphStyleAttributeName:paragraph
    };
    [string drawInRect:rect
        withAttributes:attributes];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
/// NSString 转 UIImage
/// @param string 准备转换的字符串
/// @param size 字符串的尺寸
+(UIImage *)createNonInterpolatedUIImageFormString:(NSString *)string
                                          withSize:(CGFloat)size{
    /// 二维码滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    /// 恢复滤镜的默认属性
    [filter setDefaults];
    /// 将字符串转换成NSData
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    /// 通过KVO设置滤镜inputmessage数据
    filter.jobsKVC(@"inputMessage",data);
    /// 获得滤镜输出的图像
    CIImage *outputImage = filter.outputImage;
    /// 将CIImage转换成UIImage,并放大显示
    CGRect extent = CGRectIntegral(outputImage.extent);
    CGFloat scale = MIN(size / CGRectGetWidth(extent), size / CGRectGetHeight(extent));
    /// 创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil,
                                                   width,
                                                   height,
                                                   8,
                                                   0,
                                                   cs,
                                                   (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:outputImage
                                           fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef,
                      scale,
                      scale);
    CGContextDrawImage(bitmapRef,
                       extent,
                       bitmapImage);
    /// 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}
/// 对UIImage对象进行缩放，并返回一个指定尺寸的新图像
-(JobsReturnImageByCGSizeBlock)imageResize{
    return ^UIImage *_Nonnull(CGSize newSize){
        CGFloat scale = UIScreen.mainScreen.scale;
        //UIGraphicsBeginImageContext(newSize);
        UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
        [self drawInRect:CGRectMake(0,
                                    0,
                                    newSize.width,
                                    newSize.height)];
        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    };
}
/// 图像模糊化
-(JobsReturnImageByAlphaBlock)alpha{
    return ^UIImage *_Nonnull(CGFloat alpha){
        UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGRect area = CGRectMake(0, 0, self.size.width, self.size.height);

        CGContextScaleCTM(ctx, 1, -1);
        CGContextTranslateCTM(ctx, 0, -self.size.height);

        CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
        CGContextSetAlpha(ctx, alpha);

        CGContextDrawImage(ctx, area, self.CGImage);

        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

        return newImage;
    };
}

@end
