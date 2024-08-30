//
//  UIColor+Other.h
//  MataShop
//
//  Created by Jobs Hi on 9/16/23.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsCorModel.h"
#import "MacroDef_Cor.h"

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
-(JobsReturnCorModelByVoidBlock)hexadecimalCorStr;
/// iOS 父视图透明度影响到子视图
/// https://blog.csdn.net/ios_xumin/article/details/114263960
-(JobsReturnColorByCGFloatBlock)colorWithAlphaComponent;
/// 根据颜色生成图片
-(UIImage *)image;

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
static inline UIColor *_Nullable JobsLightTextCor(CGFloat alpha){
    JobsCorModel *corModel = JobsLightTextColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsLightGrayCor(CGFloat alpha){
    JobsCorModel *corModel = JobsLightGrayColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsGreenCor(CGFloat alpha){
    JobsCorModel *corModel = JobsGreenColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsMagentaCor(CGFloat alpha){
    JobsCorModel *corModel = JobsMagentaColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsBlackCor(CGFloat alpha){
    JobsCorModel *corModel = JobsBlackColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsBlueCor(CGFloat alpha){
    JobsCorModel *corModel = JobsBlueColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsWhiteCor(CGFloat alpha){
    JobsCorModel *corModel = JobsWhiteColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsCyanCor(CGFloat alpha){
    JobsCorModel *corModel = JobsCyanColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsGrayCor(CGFloat alpha){
    JobsCorModel *corModel = JobsGrayColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsOrangeCor(CGFloat alpha){
    JobsCorModel *corModel = JobsOrangeColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsRedCor(CGFloat alpha){
    JobsCorModel *corModel = JobsRedColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsBrownCor(CGFloat alpha){
    JobsCorModel *corModel = JobsBrownColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsDarkGrayCor(CGFloat alpha){
    JobsCorModel *corModel = JobsDarkGrayColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsDarkTextCor(CGFloat alpha){
    JobsCorModel *corModel = JobsDarkTextColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsYellowCor(CGFloat alpha){
    JobsCorModel *corModel = JobsYellowColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsPurpleCor(CGFloat alpha){
    JobsCorModel *corModel = JobsPurpleColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemRedCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemRedColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemGreenCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemGreenColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemBlueCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemBlueColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemOrangeCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemOrangeColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemYellowCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemYellowColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemPinkCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemPinkColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemPurpleCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemPurpleColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemTealCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemTealColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemIndigoCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemIndigoColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemGrayCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemGrayColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemGray2Cor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemGray2Color.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemGray3Cor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemGray3Color.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemGray4Cor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemGray4Color.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemGray5Cor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemGray5Color.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemGray6Cor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemGray6Color.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsLabelCor(CGFloat alpha){
    JobsCorModel *corModel = JobsLabelColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSecondaryLabelCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSecondaryLabelColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsTertiaryLabelCor(CGFloat alpha){
    JobsCorModel *corModel = JobsTertiaryLabelColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsQuaternaryLabelCor(CGFloat alpha){
    JobsCorModel *corModel = JobsQuaternaryLabelColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsLinkCor(CGFloat alpha){
    JobsCorModel *corModel = JobsLinkColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsPlaceholderTextCor(CGFloat alpha){
    JobsCorModel *corModel = JobsPlaceholderTextColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSeparatorCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSeparatorColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsOpaqueSeparatorCor(CGFloat alpha){
    JobsCorModel *corModel = JobsOpaqueSeparatorColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemBackgroundCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemBackgroundColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSecondarySystemBackgroundCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSecondarySystemBackgroundColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsTertiarySystemBackgroundCor(CGFloat alpha){
    JobsCorModel *corModel = JobsTertiarySystemBackgroundColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemGroupedBackgroundCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemGroupedBackgroundColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSecondarySystemGroupedBackgroundCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSecondarySystemGroupedBackgroundColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsTertiarySystemGroupedBackgroundCor(CGFloat alpha){
    JobsCorModel *corModel = JobsTertiarySystemGroupedBackgroundColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSystemFillCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSystemFillColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsSecondarySystemFillCor(CGFloat alpha){
    JobsCorModel *corModel = JobsSecondarySystemFillColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsTertiarySystemFillCor(CGFloat alpha){
    JobsCorModel *corModel = JobsTertiarySystemFillColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsQuaternarySystemFillCor(CGFloat alpha){
    JobsCorModel *corModel = JobsQuaternarySystemFillColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsRandomCor(CGFloat alpha){
    JobsCorModel *corModel = JobsRandomColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsHexCor(CGFloat alpha,UInt32 hexValue){
    JobsCorModel *corModel = HEXCOLOR(hexValue).hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
static inline UIColor *_Nullable JobsGroupTableViewBackgroundCor(CGFloat alpha){
    JobsCorModel *corModel = JobsGroupTableViewBackgroundColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsViewFlipsideBackgroundCor(CGFloat alpha){
    JobsCorModel *corModel = JobsViewFlipsideBackgroundColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsScrollViewTexturedBackgroundCor(CGFloat alpha){
    JobsCorModel *corModel = JobsScrollViewTexturedBackgroundColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}

static inline UIColor *_Nullable JobsUnderPageBackgroundCor(CGFloat alpha){
    JobsCorModel *corModel = JobsUnderPageBackgroundColor.hexadecimalCorStr();
    return [UIColor colorWithRed:corModel.red
                           green:corModel.green
                            blue:corModel.blue
                           alpha:alpha];
}
#pragma clang pop


