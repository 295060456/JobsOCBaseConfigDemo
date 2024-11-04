//
//  UIColor+Other.m
//  MataShop
//
//  Created by Jobs Hi on 9/16/23.
//

#import "UIColor+Other.h"

@implementation UIColor (Other)
#pragma mark —— 类方法
/// 十六进制字符串 => UIColor *
+(JobsReturnColorByStringBlock _Nonnull)jobsCor{
    return ^UIColor * _Nullable(NSString *_Nonnull hexCorString) {
        if (!hexCorString) return (UIColor *)nil;
        /// 去除收尾可能含有的空格字符串
        hexCorString = [hexCorString stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
        // 移除可能的 '#' 前缀
        if ([hexCorString hasPrefix:@"#"]) {
            hexCorString = [hexCorString substringFromIndex:1];
        }
        // 检查是否是有效的十六进制颜色字符串
        if (hexCorString.length != 6) {
            return nil; // 无效的颜色字符串
        }
        // 将十六进制字符串转换为整数值
        NSScanner *scanner = [NSScanner scannerWithString:hexCorString];
        unsigned int hexValue;
        if (![scanner scanHexInt:&hexValue]) {
            return nil; // 转换失败
        }
        // 分解颜色分量
        CGFloat red = ((hexValue & 0xFF0000) >> 16) / 255.0;
        CGFloat green = ((hexValue & 0x00FF00) >> 8) / 255.0;
        CGFloat blue = (hexValue & 0x0000FF) / 255.0;
        
        return jobsMakeCor(^(JobsCorModel * _Nullable data) {
            data.red = red;
            data.green = green;
            data.blue = blue;
            data.alpha = 1.0f;
        });
    };
}
/// uint32_t 颜色的RGB数值 + 透明度 => UIColor *
+(JobsReturnColorByHexAlphaBlock _Nonnull)jobsColorByHexAlpha {
    return ^UIColor * _Nullable(uint32_t hexValue, CGFloat alpha) {
        return jobsMakeCor(^(JobsCorModel * _Nullable data) {
            data.red = ((float)((hexValue & 0xFF0000) >> 16)) / 255.0;
            data.green = ((float)((hexValue & 0xFF00) >> 8)) / 255.0;
            data.blue = ((float)(hexValue & 0xFF)) / 255.0;
            data.alpha = alpha;
        });
    };
}
/// uint32_t 颜色的RGB数值  => UIColor *
+(JobsReturnColorByHexBlock _Nonnull)jobsColorByHex {
    return ^UIColor * _Nullable(uint32_t hexValue) {
        return UIColor.jobsColorByHexAlpha(hexValue,1);
    };
}
/// 十六进制字符串 + 透明度 => UIColor *
+(UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha{
    // 删除字符串中的空格
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
    return jobsMakeCor(^(JobsCorModel * _Nullable data) {
        data.red = ((float)r / 255.0f);
        data.green = ((float)g / 255.0f);
        data.blue = ((float)b / 255.0f);
        data.alpha = alpha;
    });
}
/// 十六进制字符串 （默认透明度为1） => UIColor *
+(JobsReturnColorByStringBlock _Nonnull)colorWithHexString{
    @jobs_weakify(self)
    return ^UIColor * _Nullable(NSString *_Nonnull hexCorString) {
        @jobs_strongify(self)
        return [self colorWithHexString:hexCorString alpha:1.0f];
    };
}
/// UIColor * => UIImage *
+(JobsReturnImageByCorBlock)imageWithColor{
    return ^UIImage * _Nullable(UIColor * _Nullable cor) {
        CGRect rect = CGRectMake(0.0f,
                                 0.0f,
                                 1.0f,
                                 1.0f);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, cor.CGColor);
        CGContextFillRect(context, rect);
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    };
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
        CorDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add((id)JobsRedColor.CGColor);
            data.add((id)JobsGreenColor.CGColor);
        });
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
-(JobsReturnStringByCorBlock)rgbCorStr{
    @jobs_weakify(self)
    return ^NSString *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        /// 获得RGB值描述
        NSString *RGBValue = toStringByID(self);
        /// 将RGB值描述分隔成字符串
        NSArray *RGBArr = [RGBValue componentsSeparatedByString:@" "];
        /// 获取红色值
        int r = [[RGBArr objectAtIndex:1] floatValue] * 255;
        NSString *redStr = toStringByInt(r);
        /// 获取绿色值
        int g = [[RGBArr objectAtIndex:2] floatValue] * 255;
        NSString *greenStr = toStringByInt(g);
        /// 获取蓝色值
        int b = [[RGBArr objectAtIndex:3] floatValue] * 255;
        NSString *blueStr = toStringByInt(b);
        return JobsInternationalization(@"红色")
            .add(@":")
            .add(redStr)
            .add(JobsInternationalization(@"绿色"))
            .add(@":")
            .add(greenStr)
            .add(JobsInternationalization(@"蓝色"))
            .add(@":")
            .add(blueStr);
    };
}
/// 将一个确定的UIColor子类，翻译成十六进制格式的字符串值并对外输出
-(JobsReturnCorModelByVoidBlock)hexadecimalCorStr{
    @jobs_weakify(self)
    return ^JobsCorModel *_Nullable(void) {
        @jobs_strongify(self)
        // 获取颜色组件
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        size_t numberOfComponents = CGColorGetNumberOfComponents(self.CGColor);
        CGFloat redCor, greenCor, blueCor;

        if (numberOfComponents == 4) {
            // RGBA颜色空间
            redCor = components[0];
            greenCor = components[1];
            blueCor = components[2];
        } else if (numberOfComponents == 2) {
            // 灰度颜色空间
            redCor = greenCor = blueCor = components[0];
        } else {
            // 其他情况（不支持的颜色空间）
            return nil;
        }
        // 将RGB值转换为十六进制字符串
        return jobsMakeCorModel(^(JobsCorModel * _Nullable data) {
            @jobs_strongify(self)
            data.red = (redCor * 255);
            data.green = (greenCor * 255);
            data.blue = (blueCor * 255);
            data.alpha = CGColorGetAlpha(self.CGColor);
        });
    };
}
/// iOS 父视图透明度影响到子视图
/// https://blog.csdn.net/ios_xumin/article/details/114263960
-(JobsReturnColorByCGFloatBlock)colorWithAlphaComponent{
    @jobs_weakify(self)
    return ^(CGFloat alpha) {
        @jobs_strongify(self)
        return [self colorWithAlphaComponent:alpha];
    };
}
/// 根据颜色生成图片
-(UIImage *)image{
    return self.imageByRect(CGRectMake(0.0f,
                                       0.0f,
                                       1.0f,
                                       1.0f));
}
/// 根据颜色生成图片
-(JobsReturnImageByCGRectBlock)imageByRect{
    return ^UIImage *_Nonnull(CGRect rect){
        /// 开启位图上下文
        UIGraphicsBeginImageContext(rect.size);
        /// 获取位图上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        /// 使用color演示填充上下文
        CGContextSetFillColorWithColor(context, self.CGColor);
        /// 渲染上下文
        CGContextFillRect(context, rect);
        /// 从上下文中获取图片
        UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
        /// 结束上下文
        UIGraphicsEndImageContext();
        return theImage;
    };
}

@end
