//
//  UIView+Measure.h
//  My_BaseProj
//
//  Created by Jobs on 2020/9/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
#import "JobsBlock.h"

@class UIViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Measure)
<BaseViewProtocol>
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
@property(nonatomic,assign)CGSize size;
@property(nonatomic,assign)CGPoint origin;
#pragma mark —— UIView
/// 重设Frame
-(JobsReturnCGRectByCGFloatBlock _Nullable)resetOriginX;
-(JobsReturnCGRectByCGFloatAndUIViewBlock _Nullable)resetRightX;
-(JobsReturnCGRectByCGFloatBlock _Nullable)resetOriginY;
-(JobsReturnCGRectByCGFloatAndUIViewBlock _Nullable)resetBottomY;
-(JobsReturnCGRectByCGFloatBlock _Nullable)resetWidth;
-(JobsReturnCGRectByCGFloatBlock _Nullable)resetHeight;
-(JobsReturnCGRectByCGPointBlock _Nullable)resetOrigin;
-(JobsReturnCGRectByCGSizeBlock _Nullable)resetSize;
/// 依据偏移量重设Frame
-(JobsReturnCGRectByCGFloatBlock _Nullable)resetByOffsetOriginX;
-(JobsReturnCGRectByCGFloatBlock _Nullable)resetByOffsetOriginY;
-(JobsReturnCGRectByCGFloatBlock _Nullable)resetCenterX;
-(JobsReturnCGRectByCGFloatBlock _Nullable)resetCenterY;
-(JobsReturnCGRectByCGFloatBlock _Nullable)resetByOffsetWidth;
-(JobsReturnCGRectByCGFloatBlock _Nullable)resetByOffsetHeight;
-(JobsReturnCGRectByCGPointBlock _Nullable)resetByOffsetOrigin;
-(JobsReturnCGRectByCGSizeBlock _Nullable)resetByOffsetSize;
#pragma mark —— UIView对齐方法扩充 https://github.com/MisterZhouZhou/ZWUIViewExtension
/// 设置水平方向对齐
-(jobsByViewBlock)centerxEqualToView;
/// 设置垂平方向对齐
-(jobsByViewBlock)centeryEqualToView;
/// 设置中心方向对齐
-(jobsByViewBlock)centerEqualToView;
/// 设置左对齐
-(jobsByViewBlock)leftEqualToView;
/// 设置右对齐
-(jobsByViewBlock)rightEqualToView;
/// 设置顶部对齐
-(jobsByViewBlock)topEqualToView;
/// 设置底部对齐
-(jobsByViewBlock)bottomEqualToView;
#pragma mark —— UIScrollView.contentSize
-(jobsBySizeBlock _Nullable)resetContentSize;
-(jobsByCGFloatBlock _Nullable)resetContentSizeWidth;
-(jobsByCGFloatBlock _Nullable)resetContentSizeHeight;
-(jobsByCGFloatBlock _Nullable)resetContentSizeOffsetWidth;
-(jobsByCGFloatBlock _Nullable)resetContentSizeOffsetHeight;
#pragma mark —— UIScrollView.contentOffset
-(jobsByPointBlock _Nullable)resetContentOffset;
-(jobsByCGFloatBlock _Nullable)resetContentOffsetX;
-(jobsByCGFloatBlock _Nullable)resetContentOffsetY;
-(jobsByCGFloatBlock _Nullable)resetContentOffsetX_offset;
-(jobsByCGFloatBlock _Nullable)resetContentOffsetY_offset;
#pragma mark —— UIScrollView.contentInset
-(jobsByEdgeInsetBlock _Nullable)resetContentInset;
-(jobsByCGFloatBlock _Nullable)resetContentInsetTop;
-(jobsByCGFloatBlock _Nullable)resetContentInsetLeft;
-(jobsByCGFloatBlock _Nullable)resetContentInsetBottom;
-(jobsByCGFloatBlock _Nullable)resetContentInsetRight;
-(jobsByCGFloatBlock _Nullable)resetContentInsetOffsetTop;
-(jobsByCGFloatBlock _Nullable)resetContentInsetOffsetLeft;
-(jobsByCGFloatBlock _Nullable)resetContentInsetOffsetBottom;
-(jobsByCGFloatBlock _Nullable)resetContentInsetOffsetRight;
#pragma mark —— 依据UIViewModel所携带的偏移量重塑Frame
-(jobsByViewModelBlock)offsetForView;
#pragma mark —— 拉升和平移
@property(nonatomic,readonly)CGFloat maxX;
@property(nonatomic,readonly)CGFloat maxY;
@property(nonatomic,readonly)CGPoint boundCenter;
/// [平移]这个view, 让view.maxX = maxX
- (void)setMaxXByShift:(CGFloat)maxX;
/// [拉伸]这个view, 让view.maxX = maxX
- (void)setMaxXByStretch:(CGFloat)maxX;
/// [平移]这个view, 让view.maxY = maxY
- (void)setMaxYByShift:(CGFloat)maxY;
/// [拉伸]这个view, 让view.maxY = maxY
- (void)setMaxYByStretch:(CGFloat)maxY;

@end

NS_ASSUME_NONNULL_END
