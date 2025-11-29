//
//  UIScrollView+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/29/25.
//

#import "UIScrollView+DSL.h"

@implementation UIScrollView (DSL)
#pragma mark —— UIScrollViewProtocol
-(JobsRetScrollViewByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(id <UIScrollViewDelegate>_Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byShowsVerticalScrollIndicator{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showsVerticalScrollIndicator = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byShowsHorizontalScrollIndicator{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showsHorizontalScrollIndicator = data;
        return self;
    };
}

-(JobsRetScrollViewBySizeBlock _Nonnull)byContentSize{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGSize size){
        @jobs_strongify(self)
        self.contentSize = size;
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)byContentWidth{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.contentSize = CGSizeMake(data ? : self.width,
                                      self.contentSize.height ? : self.height);
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)byContentHeight{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.contentSize = CGSizeMake(self.contentSize.width ? : self.width,
                                      data ? : self.height);
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byScrollEnabled{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.scrollEnabled = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byBounces{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.bounces = data;
        return self;
    };
}

-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byContentInset{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIEdgeInsets insets){
        @jobs_strongify(self)
        self.contentInset = insets;
        return self;
    };
}

-(JobsReturnScrollViewByMJRefreshHeaderBlock _Nonnull)byMJRefreshHeader{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(__kindof MJRefreshHeader * _Nullable header){
        @jobs_strongify(self)
        self.mj_header = header;
        self.mj_header.automaticallyChangeAlpha = YES; // 根据拖拽比例自动切换透明度
        return self;
    };
}

-(JobsReturnScrollViewByMJRefreshFooterBlock _Nonnull)byMJRefreshFooter{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(__kindof MJRefreshFooter * _Nullable header){
        @jobs_strongify(self)
        self.mj_footer = header;
        self.mj_footer.automaticallyChangeAlpha = YES; // 根据拖拽比例自动切换透明度
        return self;
    };
}
/// Content
-(JobsRetScrollViewByPointBlock _Nonnull)byContentOffset{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGPoint point){
        @jobs_strongify(self)
        self.contentOffset = point;
        return self;
    };
}

-(JobsRetScrollViewByPointBlock _Nonnull)byContentAlignmentPoint{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGPoint alignmentPoint){
        @jobs_strongify(self)
        if (@available(iOS 17.4, *)) {
            self.contentAlignmentPoint = alignmentPoint;
        }
        return self;
    };
}

-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byContentInsetAdjustmentBehavior{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIScrollViewContentInsetAdjustmentBehavior behavior){
        @jobs_strongify(self)
        if (@available(iOS 11.0, tvOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = behavior;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byAutomaticallyAdjustsScrollIndicatorInsets{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 13.0, tvOS 13.0, *)) {
            self.automaticallyAdjustsScrollIndicatorInsets = data;
        };return self;
    };
}/// Scroll Behavior / Bounce
-(JobsRetScrollViewByBOOLBlock _Nonnull)byDirectionalLockEnabled{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.directionalLockEnabled = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byBouncesHorizontally{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 17.4, *)) {
            self.bouncesHorizontally = data;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byBouncesVertically{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 17.4, *)) {
            self.bouncesVertically = data;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byAlwaysBounceVertical{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.alwaysBounceVertical = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byAlwaysBounceHorizontal{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.alwaysBounceHorizontal = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byPagingEnabled{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.pagingEnabled = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byTransfersHorizontalScrollingToParent{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 17.4, *)) {
            self.transfersHorizontalScrollingToParent = data;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byTransfersVerticalScrollingToParent{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 17.4, *)) {
            self.transfersVerticalScrollingToParent = data;
        };return self;
    };
}
/// Indicator / Deceleration
-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byIndicatorStyle{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIScrollViewIndicatorStyle style){
        @jobs_strongify(self)
        self.indicatorStyle = style;
        return self;
    };
}

-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byVerticalScrollIndicatorInsets{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIEdgeInsets insets){
        @jobs_strongify(self)
        if (@available(iOS 11.1, tvOS 11.1, *)) {
            self.verticalScrollIndicatorInsets = insets;
        };return self;
    };
}

-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byHorizontalScrollIndicatorInsets{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIEdgeInsets insets){
        @jobs_strongify(self)
        if (@available(iOS 11.1, tvOS 11.1, *)) {
            self.horizontalScrollIndicatorInsets = insets;
        };return self;
    };
}

-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byScrollIndicatorInsets{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIEdgeInsets insets){
        @jobs_strongify(self)
        self.scrollIndicatorInsets = insets;
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)byDecelerationRate{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIScrollViewDecelerationRate rate){
        @jobs_strongify(self)
        self.decelerationRate = rate;
        return self;
    };
}
/// Touch Behavior
-(JobsRetScrollViewByBOOLBlock _Nonnull)byDelaysContentTouches{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.delaysContentTouches = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byCanCancelContentTouches{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.canCancelContentTouches = data;
        return self;
    };
}
/// Zoom
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byMinimumZoomScale{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.minimumZoomScale = data;
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)byMaximumZoomScale{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.maximumZoomScale = data;
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)byZoomScale{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        if (@available(iOS 3.0, *)) {
            self.zoomScale = data;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byBouncesZoom{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.bouncesZoom = data;
        return self;
    };
}
/// StatusBar / Keyboard
-(JobsRetScrollViewByBOOLBlock _Nonnull)byScrollsToTop{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
#if !TARGET_OS_TV
        self.scrollsToTop = data;
#endif
        return self;
    };
}

-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byKeyboardDismissMode{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIScrollViewKeyboardDismissMode mode){
        @jobs_strongify(self)
        if (@available(iOS 7.0, *)) {
            self.keyboardDismissMode = mode;
        };return self;
    };
}
/// Refresh / Keyboard Scrolling
-(JobsRetScrollViewByUIRefreshControlBlock _Nonnull)byRefreshControl{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIRefreshControl * _Nullable refreshControl){
        @jobs_strongify(self)
#if !TARGET_OS_TV && !TARGET_OS_WATCH
        if (@available(iOS 10.0, *)) {
            self.refreshControl = refreshControl;
        }
#endif
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byAllowsKeyboardScrolling{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
#if !TARGET_OS_TV && !TARGET_OS_WATCH
        if (@available(iOS 17.0, *)) {
            self.allowsKeyboardScrolling = data;
        }
#endif
        return self;
    };
}
/// tvOS / visionOS
-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byIndexDisplayMode{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIScrollViewIndexDisplayMode mode){
        @jobs_strongify(self)
#if TARGET_OS_TV
        if (@available(tvOS 10.2, *)) {
            self.indexDisplayMode = mode;
        }
#endif
        return self;
    };
}

-(JobsRetScrollViewByNSUIntegerBlock _Nonnull)byLookToScrollAxes{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIAxis axis){
        @jobs_strongify(self)
#if TARGET_OS_VISION
        if (@available(visionOS 26.0, *)) {
            self.lookToScrollAxes = axis;
        }
#endif
        return self;
    };
}

@end
