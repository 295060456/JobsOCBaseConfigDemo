//
//  NSString+Others.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+Others.h"

@implementation NSString (Others)
#pragma mark —— 动画相关
/// 创建CABasicAnimation
-(CABasicAnimation *)basicAnimation{
    return [CABasicAnimation animationWithKeyPath:self];
}
/// 创建CAKeyframeAnimation（关键帧动画）
-(CAKeyframeAnimation *)keyframeAnimation{
    return [CAKeyframeAnimation animationWithKeyPath:self];
}

-(CAKeyframeAnimation *)makeCAKeyframeAnimationByBlock:(jobsByCAKeyframeAnimationBlock _Nonnull)block{
    CAKeyframeAnimation *animation = self.keyframeAnimation;
    if(block) block(animation);
    return animation;
}

-(CABasicAnimation *)makeCABasicAnimationByBlock:(jobsByCABasicAnimationBlock _Nonnull)block{
    CABasicAnimation *animation = self.basicAnimation;
    if(block) block(animation);
    return animation;
}
#pragma mark —— 关于URL
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
        return self.remove200BMark;
    }else return self;
}

-(NSString *_Nonnull)byHttp{
    return HTTP.add(self).urlProtect;
}

-(NSString *_Nonnull)byHttps{
    return HTTPS.add(self).urlProtect;
}
#pragma mark —— 关于滤镜
/// 根据字符串生成二维码图像
-(UIImage *_Nonnull)createQRcode{
    // 1、实例化一个滤镜
    CIFilter *filter = @"CIQRCodeGenerator".filter;
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
/// 制作滤镜
-(CIFilter *_Nonnull)filter{
    return [CIFilter filterWithName:self];
}
#pragma mark —— 一些功能性的
/// 清除SDImage的图片缓存（用url为key）
/// ⚠️ 这个方法一旦使用，亦会清除掉placeholderImage
-(void)cleanSDImageCache:(SDWebImageNoParamsBlock _Nullable)block{
    [SDImageCache.sharedImageCache removeImageForKey:self withCompletion:block];
}
/// 复制到系统剪切板
-(JobsReturnStringByVoidBlock _Nonnull)pasteboard{
    return ^() {
        @jobs_weakify(self)
        return jobsMakePasteboard(^(__kindof UIPasteboard * _Nullable pasteboard) {
            @jobs_strongify(self)
            pasteboard.string = self;
            self.jobsToastSuccessMsg(JobsInternationalization(@"复制成功"));
        }).string;
    };
}
/// OC字符串的文本改变方向
/// @param aView 文本的控件
/// @param aRect 控件的尺寸
/// @param aFont 文字的字号
/// @param aColor 文字的颜色
/// @param directionStr  文字显示的方向
-(CAShapeLayer *_Nonnull)animateOnView:(__kindof UIView *_Nonnull)aView
                                atRect:(CGRect)aRect
                               forFont:(UIFont *)aFont
                             withColor:(UIColor *_Nonnull)aColor
                          andDirection:(TransformLayerDirectionType)directionStr{
    // 创建文字路径
    UIBezierPath *path = [UIBezierPath bezierPathWithText:self
                                                     font:aFont
                                         andWithDirection:directionStr];
    // 创建路径图层
    return jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
        layer.frame = aRect;
        layer.bounds = CGPathGetBoundingBox(path.CGPath);
        layer.geometryFlipped = NO;
        layer.path = path.CGPath;
        layer.strokeColor = aColor.CGColor;
        layer.fillColor = aColor.CGColor;
        layer.lineWidth = 1.0f;
        layer.lineJoin = kCALineJoinBevel;
        aView.layer.add(layer);
    });
}
#pragma mark —— 字符串的自定义截取/拼接
/// 截取并返回一个字符串里面冒号前的值，并返回。如果没有冒号，则返回自身
-(NSString *)substringBeforeColon{
    NSRange range = self.rangeOfString(@":");
    if (range.location != NSNotFound) {
        return self.substringToIndex(range.location);
    } else return self; // 如果没有找到冒号，则返回原始字符串
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
/// 获取到最后一个字符
-(NSString *_Nonnull)getLastChars{
    return self.substringFromIndex(self.length - 1);
}
/// 获取到最后一个非空格字符
-(NSString *_Nonnull)getLastValuedChars{
    return self.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet).getLastChars;
}
/// 用入参进行分隔字符串对外输出数组
-(JobsReturnArrayByStringBlock _Nonnull)makeArrBy{
    @jobs_weakify(self)
    return ^ __kindof NSArray <NSString *>*_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self componentsSeparatedByString:data];
    };
}
/// 截取字符串方法封装：从本字符串到endString
-(JobsReturnStringByStringBlock _Nonnull)subStringTo{
    return ^__kindof NSString *_Nullable(NSString *_Nullable endString){
        NSRange startRange = self.range;
        NSRange endRange = self.rangeOfString(endString);
        NSRange range = jobsMakeRangeByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
            data.location = startRange.location + startRange.length;
            data.length = endRange.location - startRange.location - startRange.length;
        });return [self substringWithRange:range];
    };
}
/// 组装set方法名：set+首字母大写+：
-(JobsReturnStringByVoidBlock _Nonnull)capitalizeFirstLetterAndPrefixSet{
    return ^__kindof NSString *_Nullable(){
        if (!self.length) return self; /// 如果字符串为空，直接返回
        /// 获取字符串的首字母并大写
        NSString *capitalizedFirstLetter = self.substringToIndex(1).uppercaseString;
        NSString *restOfString = self.substringFromIndex(1);
        /// 拼接大写的首字母和其余部分
        NSString *capitalizedString = capitalizedFirstLetter.add(restOfString);
        /// 在前面加上 "set"
        return @"set".add(capitalizedString).pureString;
    };
}
#pragma mark —— 其他
/// 该文字是否是Debug定义的文字
-(BOOL)isDebugText{
    return self.isEqualToString(JobsInternationalization(TextModelDataString));
}
#pragma mark —— 对系统方法的二次封装
/// 对系统方法 substringFromIndex 的二次封装
-(JobsReturnStringByUIntegerBlock _Nonnull)substringFromIndex{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        return [self substringFromIndex:data];
    };
}
/// 对系统方法 substringToIndex 的二次封装
-(JobsReturnStringByUIntegerBlock _Nonnull)substringToIndex{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        return [self substringToIndex:data];
    };
}
/// 对系统方法 substringWithRange 的二次封装
-(JobsReturnStringByRangeBlock _Nonnull)substringByRange{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSRange data){
        @jobs_strongify(self)
        return [self substringWithRange:data];
    };
}
/// 对系统方法 rangeOfString 的二次封装
-(JobsReturnRangeByStringBlock _Nonnull)rangeOfString{
    @jobs_weakify(self)
    return ^NSRange(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self rangeOfString:data];
    };
}
/// 对系统方法 rangeOfString 的二次封装（当执行参数是本字符串时）
-(NSRange)range{
    return [self rangeOfString:self];
}
/// 对系统方法 stringByTrimmingCharactersInSet 的二次封装
-(JobsReturnStringByCharacterSetBlock _Nonnull)byTrimmingCharactersInSet{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSCharacterSet *_Nullable data){
        @jobs_strongify(self)
        return [self stringByTrimmingCharactersInSet:data];
    };
}

@end
