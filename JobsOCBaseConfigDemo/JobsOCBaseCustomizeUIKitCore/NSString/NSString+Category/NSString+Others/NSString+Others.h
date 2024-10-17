//
//  NSString+Others.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>
#import "UIBezierPath+TextPath.h"
#import "NSObject+Extras.h"
#import "NSString+Check.h"
#import "JobsBlock.h"
#import "FileNameModel.h"

NS_INLINE NSMutableString *_Nonnull JobsMutableString(NSString * _Nonnull str){
    if(!str) str = @"";
    return [NSMutableString stringWithString:str];
}

NS_INLINE NSString *_Nonnull StringWithUTF8String(const char *_Nonnull data){
    return [NSString stringWithUTF8String:data];
}

NS_INLINE NSURL * _Nullable JobsUrl(NSString *_Nonnull string) {
    if(isValue(string)) return nil;
    return [NSURL URLWithString:string];
}

NS_INLINE NSURL * _Nullable JobsFileUrl(NSString *_Nonnull string) {
    if(isValue(string)) return nil;
    return [NSURL fileURLWithPath:string];
}

NS_INLINE BOOL JobsCanOpenUrl(NSString *_Nonnull string) {
    if(isValue(string)) return NO;
    return [UIApplication.sharedApplication canOpenURL:JobsUrl(string)];
}

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Others)
#pragma mark —— URL相关
/// 返回网址相关的NSURL *
-(NSURL *_Nonnull)jobsUrl;
/// 返回文件路径相关的NSURL *
-(NSURL *_Nonnull)jobsFileUrl;
///  能否正常打开Url
-(BOOL)jobsCanOpenUrl;
/**
 问题：直接其他地方复制过来的中文字进行网页搜索、或者中文字识别排序等情况的，会出现搜索不到的情况。
 解决方法：可能存在复制源里面的文字带了空白url编码%E2%80%8B，空白编码没有宽度，虽然看不到但是会影响结果无法正确匹配对应的中文字。可以把文字重新url编码即可。
 */
-(NSString *_Nonnull)urlProtect;
#pragma mark —— 一些功能性的
/// 复制到系统剪切板
-(JobsReturnStringByVoidBlock _Nonnull)pasteboard;
/// 根据字符串生成二维码图像
-(UIImage *_Nonnull)createQRcode;
/// 获取到最后一个字符
-(NSString *_Nonnull)getLastChars;
/// 获取到最后一个非空格字符
-(NSString *_Nonnull)getLastValuedChars;
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
                          andDirection:(TransformLayerDirectionType)directionStr;
/// 该文字是否是Debug定义的文字
-(BOOL)isDebugText;
/// 截取字符串方法封装
-(NSString *)subStringFrom:(NSString *)startString to:(NSString *)endString;
/// OC字符串拼接
-(JobsReturnStringByStringBlock _Nonnull)add;

@end

NS_ASSUME_NONNULL_END
