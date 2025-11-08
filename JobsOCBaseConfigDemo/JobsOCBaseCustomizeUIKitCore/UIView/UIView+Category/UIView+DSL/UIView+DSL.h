//
//  UIView+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/3/25.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JobsChain)
#pragma mark —— Geometry
- (JobsRetViewByFrameBlock _Nonnull)byFrame;
- (JobsRetViewByFrameBlock _Nonnull)byBounds;
- (JobsRetViewByCGPointBlock _Nonnull)byCenterPoint;
- (JobsRetViewByCGAffineTransformBlock _Nonnull)byTransform;
- (JobsRetViewByCATransform3DBlock _Nonnull)byTransform3D;
- (JobsRetViewByCGFloatBlock _Nonnull)byContentScaleFactor;
- (JobsRetViewByCGPointBlock _Nonnull)byAnchorPoint API_AVAILABLE(ios(16.0));
#pragma mark —— Identity
- (JobsRetViewByNSIntegerBlock _Nonnull)byTag;
- (JobsRetViewByBOOLBlock _Nonnull)byUserInteractionEnabled;
- (JobsRetViewByBOOLBlock _Nonnull)byMultipleTouchEnabled API_UNAVAILABLE(tvos);
- (JobsRetViewByBOOLBlock _Nonnull)byExclusiveTouch API_UNAVAILABLE(tvos);
#pragma mark —— Rendering
- (JobsRetViewByBOOLBlock _Nonnull)byClipsToBounds;
- (JobsRetViewByCorBlock _Nonnull)byBgColor;
- (JobsRetViewByCGFloatBlock _Nonnull)byAlpha;
- (JobsRetViewByBOOLBlock _Nonnull)byOpaque;
- (JobsRetViewByBOOLBlock _Nonnull)byClearsContextBeforeDrawing;
- (JobsRetViewByBOOLBlock _Nonnull)byHidden;
- (JobsRetViewByNSIntegerBlock _Nonnull)byContentMode;
- (JobsRetViewByViewBlock _Nonnull)byMaskView;
- (JobsRetViewByCorBlock _Nonnull)byTintColor;
- (JobsRetViewByNSIntegerBlock _Nonnull)byTintAdjustmentMode;
#pragma mark —— Semantics / RTL
- (JobsRetViewByNSIntegerBlock _Nonnull)bySemanticContentAttribute;
#pragma mark —— Layout behaviors
- (JobsRetViewByBOOLBlock _Nonnull)byAutoresizesSubviews;
- (JobsRetViewByNSUIntegerBlock _Nonnull)byAutoresizingMask;
- (JobsRetViewByUIEdgeInsetBlock _Nonnull)byLayoutMargins API_AVAILABLE(ios(8.0));
- (JobsRetViewByNSDirectionalEdgeInsetsBlock _Nonnull)byDirectionalLayoutMargins API_AVAILABLE(ios(11.0));
- (JobsRetViewByBOOLBlock _Nonnull)byPreservesSuperviewLayoutMargins API_AVAILABLE(ios(8.0));
- (JobsRetViewByBOOLBlock _Nonnull)byInsetsLayoutMarginsFromSafeArea API_AVAILABLE(ios(11.0));
#pragma mark —— UIUserInterfaceStyle
- (JobsRetViewByUIUserInterfaceStyleBlock _Nonnull)byOverrideUserInterfaceStyle API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos);
#pragma mark —— Dynamic Type limits
- (JobsRetViewByStringBlock _Nonnull)byMinimumContentSizeCategory API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(watchos);
- (JobsRetViewByStringBlock _Nonnull)byMaximumContentSizeCategory API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(watchos);
#pragma mark —— Focus
- (JobsRetViewByStringBlock _Nonnull)byFocusGroupIdentifier API_AVAILABLE(ios(14.0)) API_UNAVAILABLE(tvos, watchos);
- (JobsRetViewByNSIntegerBlock _Nonnull)byFocusGroupPriority API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(tvos, watchos);
- (JobsRetViewByIDBlock _Nonnull)byFocusEffect API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(tvos, watchos);
#pragma mark —— iOS 26+
- (JobsRetViewByCornerConfigBlock _Nonnull)byCornerConfiguration API_AVAILABLE(ios(26.0), tvos(26.0), visionos(26.0)) API_UNAVAILABLE(watchos);

@end

NS_ASSUME_NONNULL_END
