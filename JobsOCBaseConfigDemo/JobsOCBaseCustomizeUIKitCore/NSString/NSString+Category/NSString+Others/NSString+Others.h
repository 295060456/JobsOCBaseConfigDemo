//
//  NSString+Others.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>
#import "JobsDefineAllEnumHeader.h"
#import "NSObject+Extras.h"
#import "NSString+Check.h"
#import "JobsBlock.h"
#import "FileNameModel.h"

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

#ifndef HTTP
#define HTTP @"http://"
#endif

#ifndef HTTPS
#define HTTPS @"https://"
#endif

NS_INLINE NSMutableString *_Nonnull JobsMutableString(NSString * _Nonnull str){
    if(!str) str = @"";
    return [NSMutableString stringWithString:str];
}

NS_INLINE NSString *_Nonnull StringWithUTF8String(const char *_Nonnull data){
    return [NSString stringWithUTF8String:data];
}

NS_INLINE NSURL * _Nullable JobsUrl(NSString *_Nonnull string) {
    if(!isValue(string)) return nil;  // 如果字符串无效，返回 nil
    return [NSURL URLWithString:string];
}

NS_INLINE NSURL * _Nullable JobsFileUrl(NSString *_Nonnull string) {
    if(!isValue(string)) return nil;
    return [NSURL fileURLWithPath:string];
}

NS_INLINE BOOL JobsCanOpenUrl(NSString *_Nonnull string) {
    if(!isValue(string)) return NO;
    return [UIApplication.sharedApplication canOpenURL:JobsUrl(string)];
}

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Others)
#pragma mark —— 动画相关
/// 创建CABasicAnimation
-(CABasicAnimation *)basicAnimation;
/// 创建CAKeyframeAnimation（关键帧动画）
-(CAKeyframeAnimation *)keyframeAnimation;

-(CAKeyframeAnimation *)makeCAKeyframeAnimationByBlock:(jobsByCAKeyframeAnimationBlock _Nonnull)block;
-(CABasicAnimation *)makeCABasicAnimationByBlock:(jobsByCABasicAnimationBlock _Nonnull)block;
#pragma mark —— 关于URL
/// 返回网址相关的NSURL *
-(NSURL *_Nonnull)jobsUrl;
/// 返回文件路径相关的NSURL *
/// 增加file://
-(NSURL *_Nonnull)jobsFileUrl;
///  能否正常打开Url
-(BOOL)jobsCanOpenUrl;
/**
 问题：直接其他地方复制过来的中文字进行网页搜索、或者中文字识别排序等情况的，会出现搜索不到的情况。
 解决方法：可能存在复制源里面的文字带了空白url编码%E2%80%8B，空白编码没有宽度，虽然看不到但是会影响结果无法正确匹配对应的中文字。可以把文字重新url编码即可。
 */
-(NSString *_Nonnull)urlProtect;
-(NSString *_Nonnull)byHttp;
-(NSString *_Nonnull)byHttps;
#pragma mark —— 关于滤镜
/// 根据字符串生成二维码图像
-(UIImage *_Nonnull)createQRcode;
/// 制作滤镜
-(CIFilter *_Nonnull)filter;
#pragma mark —— 一些功能性的
/// 清除SDImage的图片缓存（用url为key）
/// ⚠️ 这个方法一旦使用，亦会清除掉placeholderImage
-(void)cleanSDImageCache:(SDWebImageNoParamsBlock _Nullable)block;
/// 复制到系统剪切板
-(JobsReturnStringByVoidBlock _Nonnull)pasteboard;
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
                          andDirection:(TransformLayerDirectionType)directionStr;
#pragma mark —— 字符串的自定义截取/拼接
/// 截取并返回一个字符串里面冒号前的值，并返回。如果没有冒号，则返回自身
-(NSString *)substringBeforeColon;
/// OC字符串拼接
-(JobsReturnStringByStringBlock _Nonnull)add;
/// 获取到最后一个字符
-(NSString *_Nonnull)getLastChars;
/// 获取到最后一个非空格字符
-(NSString *_Nonnull)getLastValuedChars;
/// 用入参进行分隔字符串对外输出数组
-(JobsReturnArrayByStringBlock _Nonnull)makeArrBy;
/// 截取字符串方法封装：从本字符串到endString
-(JobsReturnStringByStringBlock _Nonnull)subStringTo;
/// 组装set方法名：set+首字母大写+：
-(JobsReturnStringByVoidBlock _Nonnull)capitalizeFirstLetterAndPrefixSet;
#pragma mark —— 其他
/// 该文字是否是Debug定义的文字
-(BOOL)isDebugText;
#pragma mark —— 对系统方法的二次封装
/// 对系统方法 substringFromIndex 的二次封装
-(JobsReturnStringByUIntegerBlock _Nonnull)substringFromIndex;
/// 对系统方法 substringToIndex 的二次封装
-(JobsReturnStringByUIntegerBlock _Nonnull)substringToIndex;
/// 对系统方法 substringWithRange 的二次封装
-(JobsReturnStringByRangeBlock _Nonnull)substringByRange;
/// 对系统方法 rangeOfString 的二次封装
-(JobsReturnRangeByStringBlock _Nonnull)rangeOfString;
/// 对系统方法 rangeOfString 的二次封装（当执行参数是本字符串时）
-(NSRange)range;
/// 对系统方法 stringByTrimmingCharactersInSet 的二次封装
-(JobsReturnStringByCharacterSetBlock _Nonnull)byTrimmingCharactersInSet;

@end

NS_ASSUME_NONNULL_END
