//
//  NSString+Others.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>
#import "UIBezierPath+TextPath.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Others)
#pragma mark —— 其他
/// 字符串拼接
-(JobsReturnStringByStringBlock _Nonnull)add;
/// 该文字是否是Debug定义的文字
-(BOOL)isDebugText;
/// 复制到系统剪切板
-(NSString *_Nonnull)pasteboard;
/// 根据字符串生成二维码图像
-(UIImage *_Nonnull)createQRcode;

+(NSString *_Nonnull)test:(NSArray <NSString *>*_Nonnull)arr;

-(NSString *_Nonnull)getAnonymousString;
/// 系统的stringByAppendingString方法在参数为nil的时候会崩溃
-(NSString *_Nonnull)jobsStringByAppendingString:(NSString *_Nullable)str;
/// 获取到最后一个字符
-(NSString *_Nonnull)getLastChars;
/// 获取到最后一个非空格字符
-(NSString *_Nonnull)getLastValuedChars;
/// 去除最后一个字符
-(NSString *_Nonnull)removeLastChars;
/// 返回NSURL *
-(NSURL *_Nonnull)jobsUrl;
///  能否正常打开Url
-(BOOL)jobsCanOpenUrl;
/**
 问题：直接其他地方复制过来的中文字进行网页搜索、或者中文字识别排序等情况的，会出现搜索不到的情况。
 解决方法：可能存在复制源里面的文字带了空白url编码%E2%80%8B，空白编码没有宽度，虽然看不到但是会影响结果无法正确匹配对应的中文字。可以把文字重新url编码即可。
 */
-(NSString *_Nonnull)urlProtect;
/// 将某个字符串进行限定字符个数，二次包装以后对外输出。【截取完了以后添加替换字符】
/// @param replaceStr 多余的字符串用replaceStr进行占位表示，一般的这里是用"."来进行替换
/// @param replaceStrLenth 替代字符串的字符长度
/// @param lineBreakMode 省略的字符串位于整个原始字符串的位置
/// @param limit 限制的字符数
-(NSString *_Nonnull)omitByReplaceStr:(NSString *_Nullable)replaceStr
                      replaceStrLenth:(NSInteger)replaceStrLenth
                        lineBreakMode:(NSLineBreakMode)lineBreakMode
                                limit:(NSInteger)limit;
/// 文本改变方向
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

@end

NS_ASSUME_NONNULL_END
