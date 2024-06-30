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

/// 操作顺序，添加视图 再进行 布局
typedef void(^EqualToView)(UIView *view);

@interface UIView (Measure)<BaseViewProtocol>

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
#pragma mark —— 一些工具方法
/// 重设Frame
-(JobsReturnCGRectByCGFloatBlock _Nullable)resetOriginX;
-(JobsReturnCGRectByCGFloatBlock _Nullable)resetOriginY;
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
/// 依据偏移量重塑Frame
-(void)offsetForView:(UIViewModel *)viewModel;
#pragma mark ——【UIView对齐方法扩充】 https://github.com/MisterZhouZhou/ZWUIViewExtension
/** centerX equal to View‘s centerX
 *  centerxEqualToView(superview/view)
 */
-(EqualToView)centerxEqualToView;
/** centerY equal to View‘s centerY
 *  centeryEqualToView(superview/view)
 */
-(EqualToView)centeryEqualToView;
/** center equal to View‘s center
 *  centerEqualToView(superview/view)
 */
-(EqualToView)centerEqualToView;
/** left equal to View‘s left
 *  leftEqualToView(superview/view)
 */
-(EqualToView)leftEqualToView;
/** right equal to View‘s right
 *  rightEqualToView(superview/view)
 */
-(EqualToView)rightEqualToView;
/** top equal to View‘s top
 *  topEqualToView(superview/view)
 */
-(EqualToView)topEqualToView;
/** bottom equal to View‘s bottom
 *  bottomEqualToView(superview/view)
 */
-(EqualToView)bottomEqualToView;

@end

NS_ASSUME_NONNULL_END
