//
//  NSString+Others.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+Others.h"

@implementation NSString (Others)
#pragma mark —— URL相关
/// 返回网址相关的NSURL *
-(NSURL *_Nonnull)jobsUrl{
    return [NSURL URLWithString:self];
}
/// 返回文件路径相关的NSURL *
/// 增加file://
-(NSURL *_Nonnull)jobsFileUrl{
    return [NSURL fileURLWithPath:self];
}
///  能否正常打开Url
-(BOOL)jobsCanOpenUrl{
    return [UIApplication.sharedApplication canOpenURL:self.jobsUrl];
}
/**
 问题：直接其他地方复制过来的中文字进行网页搜索、或者中文字识别排序等情况的，会出现搜索不到的情况。
 解决方法：可能存在复制源里面的文字带了空白url编码%E2%80%8B，空白编码没有宽度，虽然看不到但是会影响结果无法正确匹配对应的中文字。可以把文字重新url编码即可。
 */
-(NSString *_Nonnull)urlProtect{
    if ([self containsString:@"\u200B"]) {
        return [self stringByReplacingOccurrencesOfString:@"\u200B" withString:@""];
    }else return self;
}
#pragma mark —— 一些功能性的
/// 用入参进行分隔字符串对外输出数组
-(JobsReturnArrayByStringBlock _Nonnull)makeArrBy{
    @jobs_weakify(self)
    return ^ __kindof NSArray *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self componentsSeparatedByString:data];
    };
}
/// 复制到系统剪切板
-(JobsReturnStringByVoidBlock _Nonnull)pasteboard{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        UIPasteboard *pasteboard = UIPasteboard.generalPasteboard;
        pasteboard.string = self;
        self.jobsToastSuccessMsg(JobsInternationalization(@"复制成功"));
        return pasteboard.string;
    };
}
/// 根据字符串生成二维码图像
-(UIImage *_Nonnull)createQRcode{
    // 1、实例化一个滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 1.1、设置filter的默认值
    // 因为之前如果使用过滤镜，输入有可能会被保留，因此，在使用滤镜之前，最好恢复默认设置
    [filter setDefaults];
    // 2、将传入的字符串转换为NSData
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    // 3、将NSData传递给滤镜（通过KVC的方式，设置inputMessage）
    filter.jobsKVC(@"inputMessage",data);
    // 4、由filter输出图像
    CIImage *outputImage = filter.outputImage;
    // 5、将CIImage转换为UIImage
    UIImage *qrImage = [UIImage imageWithCIImage:outputImage];
    // 6、返回二维码图像
    return qrImage;
}
/// 获取到最后一个字符
-(NSString *_Nonnull)getLastChars{
    return [self substringFromIndex:self.length - 1];
}
/// 获取到最后一个非空格字符
-(NSString *_Nonnull)getLastValuedChars{
    NSString *valuedStr = [self stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    return valuedStr.getLastChars;
}
/// OC字符串的文本改变方向
/// @param aView 文本的控件
/// @param aRect 控件的尺寸
/// @param aFont 文字的字号
/// @param aColor 文字的颜色
/// @param directionStr  文字显示的方向
-(CAShapeLayer *_Nonnull)animateOnView:(UIView *_Nonnull)aView
                                atRect:(CGRect)aRect
                               forFont:(UIFont *)aFont
                             withColor:(UIColor *_Nonnull)aColor
                          andDirection:(TransformLayerDirectionType)directionStr{
    // 创建文字路径
    UIBezierPath *path = [UIBezierPath bezierPathWithText:self
                                                     font:aFont
                                         andWithDirection:directionStr];
    // 创建路径图层
    CAShapeLayer *pathLayer = CAShapeLayer.layer;
    pathLayer.frame = aRect;
    pathLayer.bounds = CGPathGetBoundingBox(path.CGPath);
    pathLayer.geometryFlipped = NO;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = aColor.CGColor;
    pathLayer.fillColor = aColor.CGColor;
    pathLayer.lineWidth = 1.0f;
    pathLayer.lineJoin = kCALineJoinBevel;
    [aView.layer addSublayer:pathLayer];
    
    return pathLayer;
}
/// 该文字是否是Debug定义的文字
-(BOOL)isDebugText{
    return self.isEqualToString(JobsInternationalization(TextModelDataString));
}
/// 截取字符串方法封装
-(NSString *)subStringFrom:(NSString *)startString to:(NSString *)endString{
    NSRange startRange = [self rangeOfString:startString];
    NSRange endRange = [self rangeOfString:endString];
    NSRange range = jobsMakeRangeByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
        data.location = startRange.location + startRange.length;
        data.length = endRange.location - startRange.location - startRange.length;
    });return [self substringWithRange:range];
}
/// OC字符串拼接
-(JobsReturnStringByStringBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^NSMutableString *_Nullable(NSString *_Nonnull str) {
        @jobs_strongify(self)
        if(!str) str = @"";
        // 系统的stringByAppendingString方法在参数为nil的时候会崩溃
        return JobsMutableString([self stringByAppendingString:str]);/// 原始字符串不会改变，输出一个新的字符串
    };
}
/// 清除SDImage的图片缓存（用url为key）
/// ⚠️ 这个方法一旦使用，亦会清除掉placeholderImage
-(void)cleanSDImageCache:(SDWebImageNoParamsBlock)block{
    [SDImageCache.sharedImageCache removeImageForKey:self withCompletion:block];
}

@end
