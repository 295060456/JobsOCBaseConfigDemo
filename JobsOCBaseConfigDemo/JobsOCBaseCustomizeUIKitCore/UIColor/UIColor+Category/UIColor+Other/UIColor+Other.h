//
//  UIColor+Other.h
//  MataShop
//
//  Created by Jobs Hi on 9/16/23.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Other)
#pragma mark —— 类方法
/// 十六进制字符串 => UIColor *
+(JobsReturnColorByStringBlock _Nonnull)jobsCor;
/// uint32_t 颜色的RGB数值 + 透明度 => UIColor *
+(JobsReturnColorByHexAlphaBlock _Nonnull)jobsColorByHexAlpha;
/// uint32_t 颜色的RGB数值  => UIColor *
+(JobsReturnColorByHexBlock _Nonnull)jobsColorByHex;
/// 十六进制字符串 + 透明度 => UIColor *
+(UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
/// 十六进制字符串 （默认透明度为1） => UIColor *
+(JobsReturnColorByStringBlock _Nonnull)colorWithHexString;
/// UIColor * => UIImage *
+(JobsReturnImageByCorBlock)imageWithColor;
/// 生成的渐变图像
/// - Parameters:
///   - CorDataMutArr: 一个可选的NSMutableArray，其中包含用于渐变的颜色数组。如果未提供或为nil，方法将默认使用红色和绿色作为渐变颜色。
///   - startPoint: 渐变的起始点，使用CGPoint表示
///   - endPoint: 渐变的结束点，使用CGPoint表示。如果未指定，将使用目标视图矩形的右下角作为结束点
///   - opaque: 一个布尔值，表示生成的图像是否支持不透明度。
///   - targetViewRect: 目标视图的矩形区域，用于确定生成渐变图像的大小
+(UIColor *)gradientCorDataMutArr:(NSMutableArray <UIColor *>*_Nullable)CorDataMutArr
                       startPoint:(CGPoint)startPoint
                         endPoint:(CGPoint)endPoint
                           opaque:(BOOL)opaque
                   targetViewRect:(CGRect)targetViewRect;
#pragma mark —— 实例方法
/// 将一个确定的UIColor子类，翻译成RGB格式的字符串值并对外输出【可能因为四舍五入的问题影响末位精度，误差在±1】
/// 资料来源  https://blog.csdn.net/thanklife/article/details/25784879
-(JobsReturnStrByCorBlock)rgbCorStr;
/// 将一个确定的UIColor子类，翻译成十六进制格式的字符串值并对外输出
-(JobsReturnStrByCorBlock)hexadecimalCorStr;
/// iOS 父视图透明度影响到子视图
/// https://blog.csdn.net/ios_xumin/article/details/114263960
-(JobsReturnColorByCGFloatBlock)colorWithAlphaComponent;

@end

NS_ASSUME_NONNULL_END
/**
 
 调用示例：渐变色
 
 CGRect viewRect = CGRectMake(0, 0, 320, 480);
 UIColor *gradientColor = [YourClassName gradientCorDataMutArr:nil
                                                    startPoint:CGPointMake(0, 0)
                                                      endPoint:CGPointMake(320, 480)
                                                        opaque:NO
                                                targetViewRect:viewRect];
 yourView.backgroundColor = gradientColor;
 
 */
