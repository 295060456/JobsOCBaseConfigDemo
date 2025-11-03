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
- (JobsReturnViewByFrameBlock _Nonnull)byFrame;
- (JobsReturnViewByFrameBlock _Nonnull)byBounds;
- (JobsReturnViewByPointBlock _Nonnull)byCenterPoint;
- (JobsReturnViewByCGAffineTransformBlock _Nonnull)byTransform;
- (JobsReturnViewByCATransform3DBlock _Nonnull)byTransform3D;
- (JobsReturnViewByCGFloatBlock _Nonnull)byContentScaleFactor;
- (JobsReturnViewByPointBlock _Nonnull)byAnchorPoint API_AVAILABLE(ios(16.0));
#pragma mark —— Identity
- (JobsReturnViewByNSIntegerBlock _Nonnull)byTag;
- (JobsReturnViewByBOOLBlock _Nonnull)byUserInteractionEnabled;
- (JobsReturnViewByBOOLBlock _Nonnull)byMultipleTouchEnabled API_UNAVAILABLE(tvos);
- (JobsReturnViewByBOOLBlock _Nonnull)byExclusiveTouch API_UNAVAILABLE(tvos);
#pragma mark —— Rendering
- (JobsReturnViewByBOOLBlock _Nonnull)byClipsToBounds;
- (JobsReturnViewByCorBlock _Nonnull)byBgColor;
- (JobsReturnViewByCGFloatBlock _Nonnull)byAlpha;
- (JobsReturnViewByBOOLBlock _Nonnull)byOpaque;
- (JobsReturnViewByBOOLBlock _Nonnull)byClearsContextBeforeDrawing;
- (JobsReturnViewByBOOLBlock _Nonnull)byHidden;
- (JobsReturnViewByNSIntegerBlock _Nonnull)byContentMode;
- (JobsReturnViewByViewBlock _Nonnull)byMaskView;
- (JobsReturnViewByCorBlock _Nonnull)byTintColor;
- (JobsReturnViewByNSIntegerBlock _Nonnull)byTintAdjustmentMode;
#pragma mark —— Semantics / RTL
- (JobsReturnViewByNSIntegerBlock _Nonnull)bySemanticContentAttribute;
#pragma mark —— Layout behaviors
- (JobsReturnViewByBOOLBlock _Nonnull)byAutoresizesSubviews;
- (JobsReturnViewByNSUIntegerBlock _Nonnull)byAutoresizingMask;
- (JobsReturnViewByUIEdgeInsetBlock _Nonnull)byLayoutMargins API_AVAILABLE(ios(8.0));
- (JobsReturnViewByNSDirectionalEdgeInsetsBlock _Nonnull)byDirectionalLayoutMargins API_AVAILABLE(ios(11.0));
- (JobsReturnViewByBOOLBlock _Nonnull)byPreservesSuperviewLayoutMargins API_AVAILABLE(ios(8.0));
- (JobsReturnViewByBOOLBlock _Nonnull)byInsetsLayoutMarginsFromSafeArea API_AVAILABLE(ios(11.0));
#pragma mark —— UIUserInterfaceStyle
- (JobsReturnViewByUIUserInterfaceStyleBlock _Nonnull)byOverrideUserInterfaceStyle API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos);
#pragma mark —— Dynamic Type limits
- (JobsReturnViewByStringBlock _Nonnull)byMinimumContentSizeCategory API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(watchos);
- (JobsReturnViewByStringBlock _Nonnull)byMaximumContentSizeCategory API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(watchos);
#pragma mark —— Focus
- (JobsReturnViewByStringBlock _Nonnull)byFocusGroupIdentifier API_AVAILABLE(ios(14.0)) API_UNAVAILABLE(tvos, watchos);
- (JobsReturnViewByNSIntegerBlock _Nonnull)byFocusGroupPriority API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(tvos, watchos);
- (JobsReturnViewByIDBlock _Nonnull)byFocusEffect API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(tvos, watchos);
#pragma mark —— iOS 26+
- (JobsReturnViewByCornerConfigurationBlock _Nonnull)byCornerConfiguration API_AVAILABLE(ios(26.0), tvos(26.0), visionos(26.0)) API_UNAVAILABLE(watchos);

@end

NS_ASSUME_NONNULL_END
