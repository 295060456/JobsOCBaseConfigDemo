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

static inline CGRect exchangeWidthAndHeight(CGRect frame){
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    return CGRectMake(frame.origin.x, frame.origin.y, height, width);
}

static inline CGRect exchangeXAndY(CGRect frame){
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
@property(nonatomic,assign)CGSize Size;
@property(nonatomic,assign)CGPoint Origin;
#pragma mark —— 刷新UI
-(jobsByVoidBlock _Nonnull)jobsRefreshUI;
#pragma mark —— 交换宽高
-(JobsReturnCGRectByVoidBlock _Nonnull)exchangeWidthAndHeight;
#pragma mark —— 交换 X 和 Y
-(JobsReturnCGRectByVoidBlock _Nonnull)exchangeXAndY;
#pragma mark —— 设置控件的约束（返回控件自己本身）
/// 设置控件的 Size
-(JobsReturnIDByCGSizeBlock _Nonnull)bySize;
/// 设置控件的 Frame
-(JobsReturnIDByCGRectBlock _Nonnull)byFrame;
/// 设置控件的 Origin
-(JobsReturnIDByCGPointBlock _Nonnull)byOrigin;
/// 设置控件的 Width
-(JobsReturnIDByCGFloatBlock _Nonnull)byWidth;
/// 设置控件的 Height
-(JobsReturnIDByCGFloatBlock _Nonnull)byHeight;
/// 设置控件的 Center
-(JobsReturnIDByCenterBlock _Nonnull)byCenter;
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
