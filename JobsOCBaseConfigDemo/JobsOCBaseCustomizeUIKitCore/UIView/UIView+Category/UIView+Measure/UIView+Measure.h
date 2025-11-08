//
//  UIView+Measure.h
//  My_BaseProj
//
//  Created by Jobs on 2020/9/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsAppTools.h"
#import "JobsBlock.h"

@class UIViewModel;

NS_INLINE CGRect exchangeWidthAndHeight(CGRect frame){
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    return CGRectMake(frame.origin.x, frame.origin.y, height, width);
}

NS_INLINE CGRect exchangeXAndY(CGRect frame){
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    return CGRectMake(y, x, frame.size.width, frame.size.height);
}

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Measure)
#pragma mark —— 简捷获得控件坐标
Prop_assign()CGFloat x;
Prop_assign()CGFloat y;
Prop_assign()CGFloat width;
Prop_assign()CGFloat height;
Prop_assign()CGFloat centerX;
Prop_assign()CGFloat centerY;
Prop_assign()CGFloat left;
Prop_assign()CGFloat right;
Prop_assign()CGFloat top;
Prop_assign()CGFloat bottom;
Prop_assign()CGSize sizer;/// 避免与size冲突
Prop_assign()CGPoint Origin;
#pragma mark —— 初始化方法封装
+(JobsRetViewByClassBlock _Nonnull)build;
#pragma mark —— 控件居中的时候，相对于全屏的X和Y值
/// 当控件相对于view居中的时候，控件的X值
-(JobsRetCGFloatByViewBlock _Nonnull)xWhenViewInViewCenter;
/// 当控件相对于view居中的时候，控件的Y值
-(JobsRetCGFloatByViewBlock _Nonnull)yWhenViewInViewCenter;
/// 当控件相对于一个特定的值居中的时候，控件的X值
-(JobsRetCGFloatByCGFloatBlock _Nonnull)xWhenViewInViewCenterBy;
/// 当控件相对于一个特定的值居中的时候，控件的Y值
-(JobsRetCGFloatByCGFloatBlock _Nonnull)yWhenViewInViewCenterBy;
/// 当控件相对于整个设备屏幕居中的时候，控件的X值
-(JobsRetCGFloatByVoidBlock _Nonnull)xWhenViewInScreenCenter;
/// 当控件相对于整个设备屏幕居中的时候，控件的Y值
-(JobsRetCGFloatByVoidBlock _Nonnull)yWhenViewInScreenCenter;
#pragma mark —— 刷新UI
-(jobsByVoidBlock _Nonnull)jobsRefreshUI;
#pragma mark —— 交换宽高
/// 仅在横屏情况下交换Size宽高的值
-(JobsRetFrameByVoidBlock _Nonnull)fitSize;
-(JobsRetFrameByVoidBlock _Nonnull)exchangeWidthAndHeight;
#pragma mark —— 交换 X 和 Y
/// 仅在横屏情况下交换坐标XY的值
-(JobsRetFrameByVoidBlock _Nonnull)fitOrigin;
-(JobsRetFrameByVoidBlock _Nonnull)exchangeXAndY;
#pragma mark ——【类方法】设置控件的约束（返回控件自己本身）
+(JobsRetViewByCGSizeBlock _Nonnull)BySize;
/// 设置控件的 Frame
+(JobsRetViewByFrameBlock _Nonnull)ByFrame;
/// 设置控件的 Origin
+(JobsRetViewByCGPointBlock _Nonnull)ByOrigin;
/// 设置控件的 Width
+(JobsRetViewByFloatBlock _Nonnull)ByWidth;
/// 设置控件的 Height
+(JobsRetViewByFloatBlock _Nonnull)ByHeight;
/// 设置控件的 Center
+(JobsRetViewByCenterBlock _Nonnull)ByCenter;
#pragma mark ——【实例方法】设置控件的约束（返回控件自己本身）
/// 设置控件的 Size
-(JobsRetViewByCGSizeBlock _Nonnull)bySize;
/// 设置控件的 Frame
-(JobsRetViewByFrameBlock _Nonnull)byFrame;
/// 设置控件的 Origin
-(JobsRetViewByCGPointBlock _Nonnull)byOrigin;
/// 设置控件的 Width
-(JobsRetViewByFloatBlock _Nonnull)byWidth;
/// 设置控件的 Height
-(JobsRetViewByFloatBlock _Nonnull)byHeight;
/// 设置控件的 Center
-(JobsRetViewByCenterBlock _Nonnull)byCenter;
#pragma mark —— 重新设置控件的约束（返回控件的Frame）
/// 重设Frame
-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginX;
-(JobsRetFrameByCGFloatAndUIViewBlock _Nonnull)resetRightX;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginY;
-(JobsRetFrameByCGFloatAndUIViewBlock _Nonnull)resetBottomY;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetWidth;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetHeight;
-(JobsRetFrameByCGPointBlock _Nonnull)resetOrigin;
-(JobsRetFrameByCGSizeBlock _Nonnull)resetSize;
/// 依据偏移量重设Frame
-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginXByOffset;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginYByOffset;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetCenterX;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetCenterY;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetWidthByOffset;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetHeightByOffset;
-(JobsRetFrameByCGPointBlock _Nonnull)resetOriginByOffset;
-(JobsRetFrameByCGSizeBlock _Nonnull)resetSizeByOffset;
#pragma mark —— UIView对齐方法扩充 https://github.com/MisterZhouZhou/ZWUIViewExtension
/// 设置水平方向对齐
-(jobsByViewBlock _Nonnull)centerxEqualToView;
/// 设置垂平方向对齐
-(jobsByViewBlock _Nonnull)centeryEqualToView;
/// 设置中心方向对齐
-(jobsByViewBlock _Nonnull)centerEqualToView;
/// 设置左对齐
-(jobsByViewBlock _Nonnull)leftEqualToView;
/// 设置右对齐
-(jobsByViewBlock _Nonnull)rightEqualToView;
/// 设置顶部对齐
-(jobsByViewBlock _Nonnull)topEqualToView;
/// 设置底部对齐
-(jobsByViewBlock _Nonnull)bottomEqualToView;
#pragma mark —— UIScrollView.contentSize
-(jobsBySizeBlock _Nonnull)resetContentSize;
-(jobsByCGFloatBlock _Nonnull)resetContentSizeWidth;
-(jobsByCGFloatBlock _Nonnull)resetContentSizeHeight;
-(jobsByCGFloatBlock _Nonnull)resetContentSizeOffsetWidth;
-(jobsByCGFloatBlock _Nonnull)resetContentSizeOffsetHeight;
#pragma mark —— UIScrollView.contentOffset
-(jobsByPointBlock _Nonnull)resetContentOffset;
-(jobsByCGFloatBlock _Nonnull)resetContentOffsetX;
-(jobsByCGFloatBlock _Nonnull)resetContentOffsetY;
-(jobsByCGFloatBlock _Nonnull)resetContentOffsetX_offset;
-(jobsByCGFloatBlock _Nonnull)resetContentOffsetY_offset;
#pragma mark —— UIScrollView.contentInset
-(jobsByEdgeInsetBlock _Nonnull)resetContentInset;
-(jobsByCGFloatBlock _Nonnull)resetContentInsetTop;
-(jobsByCGFloatBlock _Nonnull)resetContentInsetLeft;
-(jobsByCGFloatBlock _Nonnull)resetContentInsetBottom;
-(jobsByCGFloatBlock _Nonnull)resetContentInsetRight;
-(jobsByCGFloatBlock _Nonnull)resetContentInsetOffsetTop;
-(jobsByCGFloatBlock _Nonnull)resetContentInsetOffsetLeft;
-(jobsByCGFloatBlock _Nonnull)resetContentInsetOffsetBottom;
-(jobsByCGFloatBlock _Nonnull)resetContentInsetOffsetRight;
#pragma mark —— 依据UIViewModel所携带的偏移量重塑Frame
-(jobsByViewModelBlock)offsetForView;
#pragma mark —— 拉升和平移
@property(nonatomic,readonly)CGFloat maxX;
@property(nonatomic,readonly)CGFloat maxY;
@property(nonatomic,readonly)CGPoint boundCenter;
/// [平移]这个view, 让view.maxX = maxX
-(void)setMaxXByShift:(CGFloat)maxX;
/// [拉伸]这个view, 让view.maxX = maxX
-(void)setMaxXByStretch:(CGFloat)maxX;
/// [平移]这个view, 让view.maxY = maxY
-(void)setMaxYByShift:(CGFloat)maxY;
/// [拉伸]这个view, 让view.maxY = maxY
-(void)setMaxYByStretch:(CGFloat)maxY;

@end

NS_ASSUME_NONNULL_END
