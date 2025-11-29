//
//  UIScrollViewDSLProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/29/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UIScrollViewDSLProtocol <NSObject>
@optional
-(JobsRetScrollViewByDelegateBlock _Nonnull)byDelegate;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byShowsVerticalScrollIndicator;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byShowsHorizontalScrollIndicator;
-(JobsRetScrollViewBySizeBlock _Nonnull)byContentSize;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byContentWidth;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byContentHeight;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byScrollEnabled;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byBounces;
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byContentInset;
-(JobsReturnScrollViewByMJRefreshHeaderBlock _Nonnull)byMJRefreshHeader;
-(JobsReturnScrollViewByMJRefreshFooterBlock _Nonnull)byMJRefreshFooter;
/// Content
-(JobsRetScrollViewByPointBlock _Nonnull)byContentOffset;
-(JobsRetScrollViewByPointBlock _Nonnull)byContentAlignmentPoint;
-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byContentInsetAdjustmentBehavior;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byAutomaticallyAdjustsScrollIndicatorInsets;/// Scroll Behavior / Bounce
-(JobsRetScrollViewByBOOLBlock _Nonnull)byDirectionalLockEnabled;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byBouncesHorizontally;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byBouncesVertically;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byAlwaysBounceVertical;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byAlwaysBounceHorizontal;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byPagingEnabled;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byTransfersHorizontalScrollingToParent;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byTransfersVerticalScrollingToParent;
/// Indicator / Deceleration
-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byIndicatorStyle;
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byVerticalScrollIndicatorInsets;
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byHorizontalScrollIndicatorInsets;
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byScrollIndicatorInsets;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byDecelerationRate;
/// Touch Behavior
-(JobsRetScrollViewByBOOLBlock _Nonnull)byDelaysContentTouches;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byCanCancelContentTouches;
/// Zoom
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byMinimumZoomScale;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byMaximumZoomScale;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byZoomScale;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byBouncesZoom;
/// StatusBar / Keyboard
-(JobsRetScrollViewByBOOLBlock _Nonnull)byScrollsToTop;
-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byKeyboardDismissMode;
/// Refresh / Keyboard Scrolling
-(JobsRetScrollViewByUIRefreshControlBlock _Nonnull)byRefreshControl;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byAllowsKeyboardScrolling;
/// tvOS / visionOS
-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byIndexDisplayMode;
-(JobsRetScrollViewByNSUIntegerBlock _Nonnull)byLookToScrollAxes;

@end

NS_ASSUME_NONNULL_END
