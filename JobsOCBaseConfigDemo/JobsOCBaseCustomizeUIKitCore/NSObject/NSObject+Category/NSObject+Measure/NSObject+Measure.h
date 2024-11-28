//
//  NSObject+Measure.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/8/18.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIViewModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Measure)<UIViewModelProtocol>
/// 已知父控件和子控件的宽度或者高度，当父控件为X轴或者Y轴中心的时候，子控件的X 和 Y 是多少？
/// @param subview 子控件的宽 或者 高
/// @param superview 父控件的宽 或者 高
+(CGFloat)measureSubview:(CGFloat)subview
               superview:(CGFloat)superview;
#pragma mark —— 几何数据类型的比较
/// 比较 size ？= CGSizeZero
-(JobsReturnBOOLBySizeBlock _Nonnull)isSizeZero;
/// 比较 point ？= CGPointZero
-(JobsReturnBOOLByPointBlock _Nonnull)isPointZero;
/// 比较 rect ？= CGRectZero
-(JobsReturnBOOLByFrameBlock _Nonnull)isRectZero;
/// 比较 rect1 ？= rect2
-(BOOL)rect1:(CGRect)rect1
isEqualToRect2:(CGRect)rect2;
/// 比较 point1 ？= point2
-(BOOL)point1:(CGPoint)point1
isEqualToPoint2:(CGPoint)point2;
/// 比较 size1 ？= size2
-(BOOL)size1:(CGSize)size1
isEqualToSize2:(CGSize)size2;
/// UILabel多行文本的高度（定宽）：根据文本+字体+控件宽度+提行模式，计算高度
-(CGFloat)jobsGetLabelHeightByWidth:(CGFloat)width
                              title:(NSString *)title
                               font:(UIFont *)font;
/// UILabe单行文本的宽度：根据字体计算单行文本的宽度
-(CGSize)jobsGetLabelWidthWithTitle:(NSString *)title font:(UIFont *)font;
/// UILabel多行文本的行数（定宽）：根据文本+字体+控件宽度+提行模式，计算行数
-(NSInteger)jobsGetLineNumsByWidth:(CGFloat)width
                             title:(NSString *)title
                              font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
