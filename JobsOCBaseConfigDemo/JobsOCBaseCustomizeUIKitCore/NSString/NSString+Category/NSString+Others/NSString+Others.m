//
//  NSString+Others.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+Others.h"

@implementation NSString (Others)
#pragma mark —— URL相关
/// 返回NSURL *
-(NSURL *_Nonnull)jobsUrl{
    return [NSURL URLWithString:self];
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
#pragma mark —— 转化
/// 对象转OC字符串
+(JobsReturnStringByIDBlock)toString{
    return ^NSString *_Nullable (id _Nullable data) {
        return [NSString stringWithFormat:@"%@",data];
    };
}
/// OC字符串拼接
-(JobsReturnStringByStringBlock _Nonnull)add{
    return ^(NSString *_Nonnull str) {
        if(!str) str = @"";
        // 系统的stringByAppendingString方法在参数为nil的时候会崩溃
        return [self stringByAppendingString:str];
    };
}
/// OC字符串数组 转 OC字符串
+(NSString *_Nonnull)toStrByStringArr:(NSArray <NSString *>*_Nonnull)arr{
    NSString *resultStr;
    for (int i = 0; i < arr.count; i++) {
        NSString *tempStr = arr[i];
        tempStr = [tempStr stringByReplacingOccurrencesOfString:@"/" withString:@""];//去除字符 /
        resultStr.add(@"/").add(tempStr);
    }return resultStr;
}
#pragma mark —— 自定义替换、裁剪
/// 将字符串中除首尾字符外的所有字符替换为星号 (*)
-(NSString *_Nonnull)getAnonymousString{
    if (self.length < 2) return self;
    NSMutableArray <NSString *>*carries = NSMutableArray.array;
    for (int i = 1; i < self.length - 1; i++) {
        char s = [self characterAtIndex:i];
        s = '*';
        NSString *tempString = [NSString stringWithUTF8String:&s];
        carries.jobsAddObject(tempString);
    }
    NSString *string = [carries componentsJoinedByString:@""];
    NSString *anonymousString = [self stringByReplacingCharactersInRange:NSMakeRange(1, self.length - 2)
                                                              withString:string];
    return anonymousString;
}
/// OC字符串去除最后一个字符
-(NSString *_Nonnull)removeLastChars{
    return [self substringToIndex:self.length - 1];
}
/// 将某个OC字符串进行限定字符个数，二次包装以后对外输出。【截取完了以后添加替换字符】
/// @param replaceStr 多余的字符串用replaceStr进行占位表示，一般的这里是用"."来进行替换
/// @param replaceStrLenth 替代字符串的字符长度
/// @param lineBreakMode 省略的字符串位于整个原始字符串的位置
/// @param limit 限制的字符数
-(NSString *_Nonnull)omitByReplaceStr:(NSString *_Nullable)replaceStr
                      replaceStrLenth:(NSInteger)replaceStrLenth
                        lineBreakMode:(NSLineBreakMode)lineBreakMode
                                limit:(NSInteger)limit{
    if (!replaceStrLenth) replaceStrLenth = 3;
    if ([NSString isNullString:replaceStr]) replaceStr = @".";
    /// limit 是不包括省略号的实际的限制字数
    NSString *resultStr = self;
    NSRange range;
    NSString *pointStr = @"";
    for (int i = 0; i < replaceStrLenth; i++) {
        pointStr = pointStr.add(replaceStr);
    }
    /// 关键节点用向下取整进行保守处理
    if (self.length > limit) {
        if (lineBreakMode == NSLineBreakByTruncatingHead){/// 前面部分文字以...方式省略，显示尾部文字内容
            range = NSMakeRange(self.length - limit,limit);
            resultStr = pointStr.add([self substringWithRange:range]);
        }else if (lineBreakMode == NSLineBreakByTruncatingTail){/// 结尾部分的内容以……方式省略，显示头的文字内容
            range = NSMakeRange(0,limit);
            resultStr = [self substringWithRange:range].add(pointStr);
        }else if (lineBreakMode == NSLineBreakByTruncatingMiddle){/// 中间的内容以...方式省略，显示头尾的文字内容
            NSRange rangeA = NSMakeRange(0,floor(limit / 2));
            NSString *resultStrA = [self substringWithRange:rangeA];
            NSRange rangeB = NSMakeRange(floor(self.length - limit / 2),floor(limit / 2));
            NSString *resultStrB = [self substringWithRange:rangeB];
            resultStr = resultStrA.add(pointStr).add(resultStrB);
        }else{}
    }return resultStr;
}
#pragma mark —— 一些功能性的
/// 复制到系统剪切板
-(NSString *_Nonnull)pasteboard{
    UIPasteboard *pasteboard = UIPasteboard.generalPasteboard;
    pasteboard.string = self;
    [WHToast jobsToastSuccessMsg:JobsInternationalization(@"复制成功")];
    return pasteboard.string;
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
#pragma mark —— 其他
/// 该文字是否是Debug定义的文字
-(BOOL)isDebugText{
    return self.isEqualToString(JobsInternationalization(TextModelDataString));
}

@end
