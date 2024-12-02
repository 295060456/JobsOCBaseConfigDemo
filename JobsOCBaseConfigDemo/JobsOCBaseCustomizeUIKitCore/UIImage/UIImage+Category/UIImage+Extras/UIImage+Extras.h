//
//  UIImage+Extras.h
//
//  Created by Aalto on 2018/12/19.
//  Copyright © 2018 Aalto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>/// 提供图像处理功能，包括滤镜和特效。
#import <AVFoundation/AVAsset.h>/// 用于处理音视频数据，支持加载和操作媒体资源。
#import <AVFoundation/AVAssetImageGenerator.h>/// 用于从视频生成缩略图。
#import <AVFoundation/AVTime.h>/// 提供时间相关的功能，用于音视频处理。
#import "JobsBlock.h"
#import "UIView+Measure.h"
#import "NSObject+Extras.h"
/// 图片填充模式
typedef NS_ENUM(NSInteger,DWContentMode){
    DWContentModeScaleAspectFit,/// 适应模式
    DWContentModeScaleAspectFill,/// 填充模式
    DWContentModeScaleToFill/// 拉伸模式
};

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extras)
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
                   textColor:(UIColor *)textColor;
/// NSString 转 UIImage
/// @param string 准备转换的字符串
/// @param size 字符串的尺寸
+(UIImage *)createNonInterpolatedUIImageFormString:(NSString *)string
                                          withSize:(CGFloat)size;
/// 对UIImage对象进行缩放，并返回一个指定尺寸的新图像
-(JobsReturnImageByCGSizeBlock _Nonnull)imageResize;
/// 图像模糊化
-(JobsReturnImageByAlphaBlock _Nonnull)alpha;
/// 截取当前image对象rect区域内的图像
-(JobsReturnImageByCGRectBlock _Nonnull)dw_SubImageWithRect;
/// 压缩图片至指定尺寸
-(JobsReturnImageByCGSizeBlock _Nonnull)dw_RescaleImageToSize;
/// 裁剪图片
-(JobsReturnImageByCGSizeBlock _Nonnull)imageScaleToSize;
/// 按给定path剪裁图片
/// @param path 路径，剪裁区域
/// @param mode 填充模式
-(UIImage *)dw_ClipImageWithPath:(UIBezierPath *)path
                            mode:(DWContentMode)mode;
/// 对系统方法 initWithData 的二次封装
+(JobsReturnImageByDataBlock _Nonnull)initByData;
/// 对系统方法 imageWithData 的二次封装
+(JobsReturnImageByDataBlock _Nonnull)imageWithData;

@end

NS_ASSUME_NONNULL_END
