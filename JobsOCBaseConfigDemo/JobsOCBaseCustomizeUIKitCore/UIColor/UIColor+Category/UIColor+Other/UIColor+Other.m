//
//  UIColor+Other.m
//  MataShop
//
//  Created by Jobs Hi on 9/16/23.
//

#import "UIColor+Other.h"

@implementation UIColor (Other)

#pragma mark —— 类方法
/// 默认alpha值为1
+(UIColor *)colorWithHexString:(NSString *)color{
    return [self colorWithHexString:color
                              alpha:1.0f];
}
/// 十六进制格式的字符串翻译成UIColor *
+(UIColor *)colorWithHexString:(NSString *)color
                         alpha:(CGFloat)alpha{
    //删除字符串中的空格
    NSString *cString = [color stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet].uppercaseString;
    // String should be 6 or 8 characters
    if ([cString length] < 6){
        return JobsClearColor;
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]){
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6){
        return JobsClearColor;
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:alpha];
}
/// 将#格式的十六进制字符串转换为UIColor* 对外输出
/// 使用示例：UIColor *color = [UIColor colorFromHexString:@"#EA0000"];
+(UIColor *)colorFromHexString:(NSString *)hexString{
    NSString *cleanedString = [hexString stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    // 移除可能的 '#' 前缀
    if ([cleanedString hasPrefix:@"#"]) {
        cleanedString = [cleanedString substringFromIndex:1];
    }
    // 检查是否是有效的十六进制颜色字符串
    if (cleanedString.length != 6) {
        return nil; // 无效的颜色字符串
    }
    // 将十六进制字符串转换为整数值
    NSScanner *scanner = [NSScanner scannerWithString:cleanedString];
    unsigned int hexValue;
    if (![scanner scanHexInt:&hexValue]) {
        return nil; // 转换失败
    }
    // 分解颜色分量
    CGFloat red = ((hexValue & 0xFF0000) >> 16) / 255.0;
    CGFloat green = ((hexValue & 0x00FF00) >> 8) / 255.0;
    CGFloat blue = (hexValue & 0x0000FF) / 255.0;
    
    return [UIColor colorWithRed:red
                           green:green
                            blue:blue
                           alpha:1.0];
}
/// 颜色转换为背景图片
+(UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f,
                             0.0f,
                             1.0f,
                             1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
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
                   targetViewRect:(CGRect)targetViewRect{
    /**
     该方法首先检查目标视图矩形的宽度和高度是否为零，如果是零，则会触发断言，表示宽度或高度为零将返回nil。
     接下来，它检查传入的颜色数组CorDataMutArr是否为nil，如果为nil，则创建一个包含默认红色和绿色的颜色数组。
     如果不为nil，则将颜色数组中的颜色转换为CGColor。
     然后，它创建一个图形上下文，绘制一个线性渐变，使用传入的渐变颜色数组，起始点startPoint和结束点endPoint。
     最后，它获取生成的渐变图像，并释放相关的资源。
     最终，它将生成的渐变图像作为背景颜色创建并返回一个UIColor对象。
     */
    if (targetViewRect.size.width == 0 || targetViewRect.size.height == 0) {
        NSAssert(NO, @"宽或者高为0,则会对外输出nil");
    }
    
    if (!CorDataMutArr) {
        CorDataMutArr = NSMutableArray.array;
        [CorDataMutArr addObject:(id)JobsRedColor.CGColor];
        [CorDataMutArr addObject:(id)JobsGreenColor.CGColor];
    }else{
        for (int t = 0; t < CorDataMutArr.count; t++) {
            [CorDataMutArr replaceObjectAtIndex:t
                                     withObject:(id)CorDataMutArr[t].CGColor];
        }
    }
    
    UIGraphicsBeginImageContextWithOptions(targetViewRect.size,
                                           opaque,
                                           UIScreen.mainScreen.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //绘制渐变层
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpaceRef,
                                                           (__bridge CFArrayRef)CorDataMutArr,
                                                           NULL);
    
    CGPoint EndPoint = endPoint;
    if (CGPointEqualToPoint(endPoint, CGPointZero)) {
        EndPoint = CGPointMake(CGRectGetMaxX(targetViewRect),
                               CGRectGetMaxY(targetViewRect));
    }

    CGContextDrawLinearGradient(context,
                                gradientRef,
                                startPoint,
                                EndPoint,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    /// 取到渐变图片
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    /// 释放资源
    CGColorSpaceRelease(colorSpaceRef);
    CGGradientRelease(gradientRef);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:gradientImage];
}
#pragma mark —— 实例方法
/// 将一个确定的UIColor子类，翻译成RGB格式的字符串值并对外输出【可能因为四舍五入的问题影响末位精度，误差在±1】
/// 资料来源  https://blog.csdn.net/thanklife/article/details/25784879
-(NSString *_Nonnull)rgbCorStr{
    /// 获得RGB值描述
    NSString *RGBValue = [NSString stringWithFormat:@"%@",self];
    /// 将RGB值描述分隔成字符串
    NSArray *RGBArr = [RGBValue componentsSeparatedByString:@" "];
    /// 获取红色值
    int r = [[RGBArr objectAtIndex:1] floatValue] * 255;
    NSString *redStr = [NSString stringWithFormat:@"%d",r];
    /// 获取绿色值
    int g = [[RGBArr objectAtIndex:2] floatValue] * 255;
    NSString *greenStr = [NSString stringWithFormat:@"%d",g];
    /// 获取蓝色值
    int b = [[RGBArr objectAtIndex:3] floatValue] * 255;
    NSString *blueStr = [NSString stringWithFormat:@"%d",b];

    return [NSString stringWithFormat:@"红色:%@,绿色%@,蓝色%@",redStr,greenStr,blueStr];
}
/// 将一个确定的UIColor子类，翻译成十六进制格式的字符串值并对外输出
-(NSString *_Nonnull)hexadecimalCorStr{
    // 获取颜色组件
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    // 提取RGB值
    CGFloat redCor = components[0];
    CGFloat greenCor = components[1];
    CGFloat blueCor = components[2];
    // 将RGB值转换为十六进制字符串
    return [NSString stringWithFormat:@"#%02X%02X%02X",
            (int)(redCor * 255),
            (int)(greenCor * 255),
            (int)(blueCor * 255)];
}

@end
