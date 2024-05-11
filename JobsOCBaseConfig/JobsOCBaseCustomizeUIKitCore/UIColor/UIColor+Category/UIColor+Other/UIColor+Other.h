//
//  UIColor+Other.h
//  MataShop
//
//  Created by Jobs Hi on 9/16/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Other)
#pragma mark —— 类方法
/// 默认alpha值为1
+(UIColor *)colorWithHexString:(NSString *)color;
/// 十六进制格式的字符串翻译成UIColor *
+(UIColor *)colorWithHexString:(NSString *)color
                         alpha:(CGFloat)alpha;
/// 将#格式的十六进制字符串转换为UIColor* 对外输出
/// 使用示例：UIColor *color = [UIColor colorFromHexString:@"#EA0000"];
+(UIColor *)colorFromHexString:(NSString *)hexString;
/// 颜色转换为背景图片
+(UIImage *)imageWithColor:(UIColor *)color;
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
-(NSString *_Nonnull)rgbCorStr;
/// 将一个确定的UIColor子类，翻译成十六进制格式的字符串值并对外输出
-(NSString *_Nonnull)hexadecimalCorStr;

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
