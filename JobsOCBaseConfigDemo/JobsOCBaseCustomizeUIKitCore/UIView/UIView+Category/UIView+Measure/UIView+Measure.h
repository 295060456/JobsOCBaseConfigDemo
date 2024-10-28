//
//  UIView+Measure.h
//  My_BaseProj
//
//  Created by Jobs on 2020/9/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
#import "JobsAppTools.h"
#import "JobsBlock.h"
#import <objc/runtime.h>

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

@interface UIView (Measure) <BaseViewProtocol>
#pragma mark —— 简捷获得控件坐标
@property(nonatomic,assign)CGFloat x;
@property(nonatomic,assign)CGFloat y;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,assign)CGFloat centerX;
@property(nonatomic,assign)CGFloat centerY;
@property(nonatomic,assign)CGFloat left;
@property(nonatomic,assign)CGFloat right;
@property(nonatomic,assign)CGFloat top;
@property(nonatomic,assign)CGFloat bottom;
@property(nonatomic,assign)CGSize sizer;/// 避免与size冲突
@property(nonatomic,assign)CGPoint Origin;
#pragma mark —— 刷新UI
-(jobsByVoidBlock _Nonnull)jobsRefreshUI;
#pragma mark —— 交换宽高
/// 仅在横屏情况下交换Size宽高的值
-(JobsReturnCGRectByVoidBlock _Nonnull)fitSize;
-(JobsReturnCGRectByVoidBlock _Nonnull)exchangeWidthAndHeight;
#pragma mark —— 交换 X 和 Y
/// 仅在横屏情况下交换坐标XY的值
-(JobsReturnCGRectByVoidBlock _Nonnull)fitOrigin;
-(JobsReturnCGRectByVoidBlock _Nonnull)exchangeXAndY;
#pragma mark ——【类方法】设置控件的约束（返回控件自己本身）
+(JobsReturnViewBySizeBlock _Nonnull)BySize;
/// 设置控件的 Frame
+(JobsReturnViewByRectBlock _Nonnull)ByFrame;
/// 设置控件的 Origin
+(JobsReturnViewByPointBlock _Nonnull)ByOrigin;
/// 设置控件的 Width
+(JobsReturnViewByFloatBlock _Nonnull)ByWidth;
/// 设置控件的 Height
+(JobsReturnViewByFloatBlock _Nonnull)ByHeight;
/// 设置控件的 Center
+(JobsReturnViewByCenterBlock _Nonnull)ByCenter;
#pragma mark ——【实例方法】设置控件的约束（返回控件自己本身）
/// 设置控件的 Size
-(JobsReturnViewBySizeBlock _Nonnull)bySize;
/// 设置控件的 Frame
-(JobsReturnViewByRectBlock _Nonnull)byFrame;
/// 设置控件的 Origin
-(JobsReturnViewByPointBlock _Nonnull)byOrigin;
/// 设置控件的 Width
-(JobsReturnViewByFloatBlock _Nonnull)byWidth;
/// 设置控件的 Height
-(JobsReturnViewByFloatBlock _Nonnull)byHeight;
/// 设置控件的 Center
-(JobsReturnViewByCenterBlock _Nonnull)byCenter;
#pragma mark —— 重新设置控件的约束（返回控件的Frame）
/// 重设Frame
-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetOriginX;
-(JobsReturnCGRectByCGFloatAndUIViewBlock _Nonnull)resetRightX;
-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetOriginY;
-(JobsReturnCGRectByCGFloatAndUIViewBlock _Nonnull)resetBottomY;
-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetWidth;
-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetHeight;
-(JobsReturnCGRectByCGPointBlock _Nonnull)resetOrigin;
-(JobsReturnCGRectByCGSizeBlock _Nonnull)resetSize;
/// 依据偏移量重设Frame
-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetOriginXByOffset;
-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetOriginYByOffset;
-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetCenterX;
-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetCenterY;
-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetWidthByOffset;
-(JobsReturnCGRectByCGFloatBlock _Nonnull)resetHeightByOffset;
-(JobsReturnCGRectByCGPointBlock _Nonnull)resetOriginByOffset;
-(JobsReturnCGRectByCGSizeBlock _Nonnull)resetSizeByOffset;
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
