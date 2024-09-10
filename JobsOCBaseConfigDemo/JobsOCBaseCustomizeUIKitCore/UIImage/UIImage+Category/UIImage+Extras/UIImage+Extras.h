//
//  UIImage+Extras.h

//
//  Created by Aalto on 2018/12/19.
//  Copyright © 2018 Aalto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
#import <AVFoundation/AVAsset.h>
#import <AVFoundation/AVAssetImageGenerator.h>
#import <AVFoundation/AVTime.h>

#import "UIView+Measure.h"
#import "NSObject+Extras.h"

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
-(JobsReturnImageByCGSizeBlock)imageResize;
/// 图像模糊化
-(JobsReturnImageByAlphaBlock)alpha;

@end

NS_ASSUME_NONNULL_END
