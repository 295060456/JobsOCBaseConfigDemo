//
//  JhtBannerScrollView.m
//  JhtBannerScrollView
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jinht on 2017/6/2.
//  Copyright © 2017年 JhtBannerScrollView. All rights reserved.
//

#import "JhtBannerScrollView.h"

@interface JhtBannerScrollView () {
    NSTimer *_bannerTimer;
    NSInteger _timerPageIndex;
    BOOL _timerIsPause; /// 标识定时器是否为 暂停状态
    NSInteger _orginPageCount; /// 原始页数（代理传入的值）
    NSInteger _pageCount; /// 总页数
    CGSize _pageSize; /// 单页的尺寸（代理传入的值）
    NSRange _visibleRange; /// 可视范围
}
Prop_strong()NSMutableArray *cardViewArray; /// 装有cardView 数组
Prop_strong()NSMutableArray *reusableArray; /// 可重用cardView 数组
Prop_strong()UIScrollView *insideScrollView;

@end

@implementation JhtBannerScrollView

- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
    self.destroyNSTimer(_bannerTimer);
    JobsRemoveNotification(self);
}

+(JobsReturnJhtBannerScrollViewByFrame _Nonnull)initByFrame{
    return ^JhtBannerScrollView *_Nullable(CGRect frame){
        return [JhtBannerScrollView.alloc initWithFrame:frame];
    };
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self bsvInitParam];
        [self bsvRegisterSystemNotification];
    }return self;
}
#pragma mark —— UIView
/// 在父控件中移除后销毁定时器
- (void)removeFromSuperview {
    [super removeFromSuperview];
    self.destroyNSTimer(_bannerTimer);
}
/// recursively calls -pointInside:withEvent:. point is in the receiver's coordinate system
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if ([self pointInside:point withEvent:event]) {
        CGPoint newPoint = CGPointZero;
        newPoint.x = point.x - self.insideScrollView.frame.origin.x + self.insideScrollView.contentOffset.x;
        newPoint.y = point.y - self.insideScrollView.frame.origin.y + self.insideScrollView.contentOffset.y;
        /// insideScrollView内部
        if ([self.insideScrollView pointInside:newPoint
                                     withEvent:event]) {
            return [self.insideScrollView hitTest:newPoint
                                        withEvent:event];
        }
        /// insideScrollView以外
        for (JhtBannerCardView *view in self.insideScrollView.subviews) {
            if (CGRectContainsPoint(view.frame, newPoint)) return view;
        }return self.insideScrollView;
    }return nil;
}
#pragma mark —— 一些私有方法
/// 初始化相关参数
- (void)bsvInitParam {
    self.clipsToBounds = YES;
    
    _autoTime = 3.0;
    _currentIndex = 0;
    _minCoverViewAlpha = 0.4;
    
    _pageCount = 0;
    self.isCarousel = YES;
    self.isOpenAutoScroll = YES;
    self.leftRightMargin = 20.0;
    self.topBottomMargin = 15.0;
    
    _visibleRange = NSMakeRange(0, 0);
    /// 由于UIScrollView在滚动之后会调用自己的layoutSubviews以及父View的layoutSubviews，
    /// 这里为了避免scrollview滚动带来自己layoutSubviews的调用，所以给scrollView加了一层父View
    @jobs_weakify(self)
    self.addSubview(jobsMakeView(^(__kindof UIView * _Nullable view) {
        @jobs_strongify(self)
        view.frame = self.bounds;
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight; /// 自动调整view的宽度，保证左边距和右边距不变 || 自动调整view的高度，以保证上边距和下边距不变
        view.backgroundColor = JobsClearColor;
        view.addSubview(self.insideScrollView);
    }));
}
/// 注册系统通知
-(void)bsvRegisterSystemNotification {
    @jobs_weakify(self)
    // 后台 --> 前台
    [self addNotificationName:UIApplicationDidBecomeActiveNotification
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        @jobs_strongify(self)
        // 判断定时器是否为 暂停状态
        @jobs_weakify(self)
        if (self->_timerIsPause) {
            // 延迟0.2S调用，给人相应反应时间
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                         (int64_t)(0.2 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                if (self->_bannerTimer) {
                    self->_bannerTimer.fireDate = NSDate.distantPast;
                } else {
                    [self bsvStartTimer];/// 开启
                }
            });self->_timerIsPause = !self->_timerIsPause;
        }
    }];
    // 前台 --> 后台
    [self addNotificationName:UIApplicationDidEnterBackgroundNotification
                        block:^(id  _Nullable weakSelf,
                                id  _Nullable arg) {
        @jobs_strongify(self)
        self->_timerIsPause = YES;
        self->_bannerTimer.fireDate = NSDate.distantFuture;
    }];
}
///
- (void)bsvStartTimer {
    if (_orginPageCount > 1 &&
        self.isOpenAutoScroll &&
        self.isCarousel) {
        NSRunLoop.addTimerAtMainRunLoopByCommonModes([NSTimer scheduledTimerWithTimeInterval:self.autoTime
                                                                                      target:self
                                                                                    selector:@selector(bsvAutoNextCardView)
                                                                                    userInfo:nil
                                                                                     repeats:YES]);
    }
}
/// 自动滚动
-(void)bsvAutoNextCardView{
    // 更新定时器用到的页数索引
    _timerPageIndex ++;
//    JobsLog(@"_timerPageIndex ==> %ld", _timerPageIndex);
    switch (self.orientation) {
        /// 横向
        case BV_Orientation_Horizontal: {
            self.insideScrollView.setContentOffsetByYES(CGPointMake(_timerPageIndex * _pageSize.width, 0));
            break;
        }
        /// 纵向
        case BV_Orientation_Vertical: {
            self.insideScrollView.setContentOffsetByYES(CGPointMake(0,_timerPageIndex * _pageSize.height));
            break;
        }default:
            break;
    }
}
/// 更新各个可见cardView
- (void)bsvUpdateVisibleCardViewAppearance {
    if (_minCoverViewAlpha == 1.0 && self.leftRightMargin == 0 && self.topBottomMargin == 0)  return;
    switch (self.orientation) {
        // 横向
        case BV_Orientation_Horizontal: {
            CGFloat offsetX = self.insideScrollView.contentOffset.x;
            for (NSInteger i = _visibleRange.location; i < (_visibleRange.location + _visibleRange.length); i ++) {
                JhtBannerCardView *cardView = self.cardViewArray.objectAt(i);
                subviewClassName = NSStringFromClass([cardView class]);
                // 计算cardView坐标X值与偏移量X值的绝对值
                CGFloat originX = cardView.frame.origin.x;
                CGFloat delta = fabs(originX - offsetX);
                // 没有缩小效果情况下的原始Frame
                CGRect originCardViewFrame = CGRectMake(_pageSize.width * i,
                                                        0,
                                                        _pageSize.width,
                                                        _pageSize.height);
                
                if (delta < _pageSize.width) {
                    // _minCoverViewAlpha ===> 0（两侧 ==> 中间）
                    cardView.coverView.alpha = (delta / _pageSize.width) * _minCoverViewAlpha;
                    
                    CGFloat leftRightInset = self.leftRightMargin * delta / _pageSize.width;
                    CGFloat topBottomInset = self.topBottomMargin * delta / _pageSize.width;
                    
                    cardView.layer.transform = CATransform3DMakeScale((_pageSize.width - leftRightInset * 2) / _pageSize.width,
                                                                      (_pageSize.height - topBottomInset * 2) / _pageSize.height,
                                                                      1.0);
                    // UIEdgeInsetsInsetRect: 表示在原来的rect基础上根据边缘距离内切一个rect出来
                    cardView.frame = UIEdgeInsetsInsetRect(originCardViewFrame,
                                                           UIEdgeInsetsMake(topBottomInset,
                                                                            leftRightInset,
                                                                            topBottomInset,
                                                                            leftRightInset));
                    
                } else {
                    // 中间 ==> 两侧
                    cardView.coverView.alpha = _minCoverViewAlpha;
                    cardView.layer.transform = CATransform3DMakeScale((_pageSize.width - self.leftRightMargin * 2) / _pageSize.width,
                                                                      (_pageSize.height - self.topBottomMargin * 2) / _pageSize.height, 1.0);
                    // UIEdgeInsetsInsetRect: 表示在原来的rect基础上根据边缘距离内切一个rect出来
                    cardView.frame = UIEdgeInsetsInsetRect(originCardViewFrame,
                                                           UIEdgeInsetsMake(self.topBottomMargin,
                                                                            self.leftRightMargin,
                                                                            self.topBottomMargin,
                                                                            self.leftRightMargin));
                }
            }break;
        }
        // 纵向
        case BV_Orientation_Vertical:{
            CGFloat offset = self.insideScrollView.contentOffset.y;
            for (NSInteger i = _visibleRange.location; i < (_visibleRange.location + _visibleRange.length); i ++) {
                JhtBannerCardView *cardView = [self.cardViewArray objectAtIndex:i];
                subviewClassName = NSStringFromClass([cardView class]);
                CGFloat originY = cardView.frame.origin.y;
                CGFloat delta = fabs(originY - offset);
                
                // 没有缩小效果情况下的原始Frame
                CGRect originCardViewFrame = CGRectMake(0,
                                                        _pageSize.height * i,
                                                        _pageSize.width,
                                                        _pageSize.height);
                
                if (delta < _pageSize.height) {
                    cardView.coverView.alpha = (delta / _pageSize.height) * _minCoverViewAlpha;
                    
                    CGFloat leftRightInset = self.leftRightMargin * delta / _pageSize.height;
                    CGFloat topBottomInset = self.topBottomMargin * delta / _pageSize.height;
                    
                    cardView.layer.transform = CATransform3DMakeScale((_pageSize.width - leftRightInset * 2) / _pageSize.width,
                                                                      (_pageSize.height - topBottomInset * 2) / _pageSize.height,
                                                                      1.0);
                    cardView.frame = UIEdgeInsetsInsetRect(originCardViewFrame,
                                                           UIEdgeInsetsMake(topBottomInset,
                                                                            leftRightInset,
                                                                            topBottomInset,
                                                                            leftRightInset));
                    cardView.cardImageView.frame = cardView.bounds;
                    
                } else {
                    cardView.coverView.alpha = _minCoverViewAlpha;
                    cardView.frame = UIEdgeInsetsInsetRect(originCardViewFrame,
                                                           UIEdgeInsetsMake(self.topBottomMargin,
                                                                            self.leftRightMargin,
                                                                            self.topBottomMargin,
                                                                            self.leftRightMargin));
                    cardView.cardImageView.frame = cardView.bounds;
                }
            }
        }default:
            break;
    }
}
/// 调整 cardView
-(jobsByPointBlock _Nonnull)bsvAdjustCardViewByContentOffset{
    @jobs_weakify(self)
    return ^(CGPoint offset){
        @jobs_strongify(self)
        /// 计算_visibleRange
        CGPoint startPoint = CGPointMake(offset.x - CGRectGetMinX(self.insideScrollView.frame),
                                         offset.y - CGRectGetMinY(self.insideScrollView.frame));
        CGPoint endPoint = CGPointMake(startPoint.x + CGRectGetWidth(self.bounds),
                                       startPoint.y + CGRectGetHeight(self.bounds));
        
        switch (self.orientation) {
            /// 横向
            case BV_Orientation_Horizontal: {
                // 屏幕可视区左侧第一个cardView（第一个）索引
                NSInteger startIndex = 0;
                for (NSInteger i = 0; i < self.cardViewArray.count; i ++) {
                    if (self->_pageSize.width * (i + 1) > startPoint.x) {
                        startIndex = i;
                        break;
                    }
                }
                /// 屏幕可视区右侧第一个cardView（最后一个）索引
                NSInteger endIndex = startIndex;
                for (NSInteger i = startIndex; i < self.cardViewArray.count; i ++) {
                    /// 如果都不超过则取最后一个
                    if (((self->_pageSize.width * (i + 1)) < endPoint.x && (self->_pageSize.width * (i + 2)) >= endPoint.x) ||
                        (i + 2) == self.cardViewArray.count) {
                        /// i + 2 是个数，所以其index需要减去1
                        endIndex = i + 1;
                        break;
                    }
                }
                /// 分别向前后（可视区域外）扩展一个可见页，提高展示效率
                startIndex = MAX(startIndex - 1, 0);
                endIndex = MIN(endIndex + 1, self.cardViewArray.count - 1);
                /// 定制visibleRange
                self->_visibleRange = NSMakeRange(startIndex, endIndex - startIndex + 1);
                /// 向insideScrollView中添加CardView
                for (NSInteger i = startIndex; i <= endIndex; i ++) self.bsvAddCardViewToInsideScrollViewByIndex(i);
                /// 删除可视区域两侧cardViewArray里面的cardView
                for (NSInteger i = 0; i < startIndex; i ++) self.bsvRemoveCardViewFromCardViewArrayByIndex(i);
                for (NSInteger i = endIndex + 1; i < self.cardViewArray.count; i ++) self.bsvRemoveCardViewFromCardViewArrayByIndex(i);
                break;
            }
            /// 纵向
            case BV_Orientation_Vertical: {
                NSInteger startIndex = 0;
                for (NSInteger i = 0; i < self.cardViewArray.count; i ++) {
                    if (self->_pageSize.height * (i + 1) > startPoint.y) {
                        startIndex = i;
                        break;
                    }
                }
                NSInteger endIndex = startIndex;
                for (NSInteger i = startIndex; i < self.cardViewArray.count; i ++) {
                    /// 如果都不超过则取最后一个
                    if (((self->_pageSize.height * (i + 1)) < endPoint.y && (self->_pageSize.height * (i + 2) >= endPoint.y)) || i + 2 == self.cardViewArray.count) {
                        /// i + 2 是个数，所以其index需要减去1
                        endIndex = i + 1;
                        break;
                    }
                }
                /// 分别向前后（可视区域外）扩展一个可见页，提高展示效率
                startIndex = MAX(startIndex - 1, 0);
                endIndex = MIN(endIndex + 1, self.cardViewArray.count - 1);
                self->_visibleRange.location = startIndex;
                self->_visibleRange.length = endIndex - startIndex + 1;
                
                /// 向insideScrollView中添加CardView
                for (NSInteger i = startIndex; i <= endIndex; i ++) {
                    self.bsvAddCardViewToInsideScrollViewByIndex(i);
                }
                /// 删除可视区域两侧cardViewArray里面的cardView
                for (NSInteger i = 0; i < startIndex; i ++) self.bsvRemoveCardViewFromCardViewArrayByIndex(i);
                for (NSInteger i = (endIndex + 1); i < self.cardViewArray.count; i ++) self.bsvRemoveCardViewFromCardViewArrayByIndex(i);
                break;
            }
        }
    };
}
/// 添加 CardView
-(jobsByNSIntegerBlock _Nonnull)bsvAddCardViewToInsideScrollViewByIndex{
    @jobs_weakify(self)
    return ^(NSInteger pageIndex){
        @jobs_strongify(self)
        NSParameterAssert(pageIndex >= 0 && pageIndex < self.cardViewArray.count);
        UIView *cardView = self.cardViewArray.objectAt(pageIndex);
        if ((NSObject *)cardView == NSNull.null) {
            cardView = [self->_dataSource bannerView:self
                        cardViewForBannerViewAtIndex:pageIndex % self->_orginPageCount];
            NSAssert(cardView != nil, @"cardView不能为nil");
            [self.cardViewArray replaceObjectAtIndex:pageIndex withObject:cardView];
            cardView.tag = pageIndex % self->_orginPageCount;
            cardView.addGesture([jobsMakeTapGesture(^(UITapGestureRecognizer * _Nullable gesture) {
                /// 这里写手势的配置
            }) GestureActionBy:^(__kindof UIGestureRecognizer * _Nullable gesture) {
                @jobs_strongify(self)
                if ([self.delegate respondsToSelector:@selector(bannerView:didSelectCardView:withCardViewIndex:)]) {
                    [self.delegate bannerView:self
                            didSelectCardView:gesture.view
                            withCardViewIndex:gesture.view.tag];
                }
            }]);
            switch (self.orientation) {
                /// 横向
                case BV_Orientation_Horizontal: {
                    cardView.frame = CGRectMake(self->_pageSize.width * pageIndex,
                                                0,
                                                self->_pageSize.width,
                                                self->_pageSize.height);
                    
                    break;
                }
                /// 纵向
                case BV_Orientation_Vertical: {
                    cardView.frame = CGRectMake(0,
                                                self->_pageSize.height * pageIndex,
                                                self->_pageSize.width,
                                                self->_pageSize.height);
                    break;
                }
            }
            if (!cardView.superview) [self.insideScrollView addSubview:cardView];
        }
    };
}
/// 删除 cardViewArray 里的 cardView
-(jobsByNSIntegerBlock _Nonnull)bsvRemoveCardViewFromCardViewArrayByIndex{
    return ^(NSInteger index){
        UIView *cardView = self.cardViewArray.objectAt(index);
        if ((NSObject *)cardView == NSNull.null)  return;
        self.reusableArray.add(cardView);/// 向可重用的数组中加入 可重用cardView
        if (cardView.superview) [cardView removeFromSuperview];
        [self.cardViewArray replaceObjectAtIndex:index withObject:NSNull.null];
    };
}
/// 通过各组之间的切换实现循环
-(void)bsvAdjustEachGroupToRealizeCycle {
    switch (self.orientation) {
        /// 横向
        case BV_Orientation_Horizontal: {
            if ((NSInteger)round(self.insideScrollView.contentOffset.x / _pageSize.width) >= (2 * _orginPageCount)) {
                // 3组 ===> 2组（3组第1个 ====> 2组第1个）
                [self.insideScrollView setContentOffset:CGPointMake(_pageSize.width * _orginPageCount,
                                                                    0)
                                               animated:NO];
                
                _timerPageIndex = _orginPageCount;
            }
            
            if ((self.insideScrollView.contentOffset.x / _pageSize.width) <= (_orginPageCount - 1)) {
                // 1组 ===> 2组
                [self.insideScrollView setContentOffset:CGPointMake((2 * _orginPageCount - 1) * _pageSize.width,
                                                                    0)
                                               animated:NO];
                _timerPageIndex = 2 * _orginPageCount - 1;
            }break;
        }
        /// 纵向
        case BV_Orientation_Vertical: {
            if (floor(self.insideScrollView.contentOffset.y / _pageSize.height) >= (2 * _orginPageCount)) {
                    [self.insideScrollView setContentOffset:CGPointMake(0,
                                                                        _pageSize.height * _orginPageCount)
                                                   animated:NO];
                    
                    _timerPageIndex = _orginPageCount;
            }
            
            if ((self.insideScrollView.contentOffset.y / _pageSize.height) <= (_orginPageCount - 1)) {
                [self.insideScrollView setContentOffset:CGPointMake(0,
                                                                    (2 * _orginPageCount - 1) * _pageSize.height)
                                               animated:NO];
                _timerPageIndex = 2 * _orginPageCount;
            }break;
        }
        default:
            break;
    }
}
#pragma mark —— 一些公共方法
/// 刷新视图
-(void)reloadData{
    /// 清空self.insideScrollView的子控件
    for (UIView *view in self.insideScrollView.subviews) {
        if (NSStringFromClass(view.class).isEqualToString(subviewClassName)) [view removeFromSuperview];
    }
    /// 销毁定时器，防止手势误触碰
    self.destroyNSTimer(_bannerTimer);
    /// 重置pageCount
    if (_dataSource &&
        [_dataSource respondsToSelector:@selector(numberOfCardViewInBannerView)]) {
        // 原始页数
        _orginPageCount = _dataSource.numberOfCardViewInBannerView(self);
        // 总页数
        if (self.isCarousel) {
            _pageCount = _orginPageCount == 1 ? 1 : _dataSource.numberOfCardViewInBannerView(self) * 3;
        } else {
            _pageCount = _orginPageCount == 1 ? 1 : _dataSource.numberOfCardViewInBannerView(self);
        }
        /// 如果总页数为0，return
        if (!_pageCount) return;
        /// 更新pageControl
        if (self.pageControl && [self.pageControl respondsToSelector:@selector(setNumberOfPages:)]) self.pageControl.numberOfPages = _orginPageCount;
    }
    // 重置 装有cardView的数组
    [self.cardViewArray removeAllObjects];
    for (NSInteger i = 0; i < _pageCount; i ++) {
        // 使用[NSNull null]占位
        self.cardViewArray.add(NSNull.null);
    }
    /// 重置 可重用cardView的数组 && 可视范围
    [self.reusableArray removeAllObjects];
    _visibleRange = NSRangeZero;
    /// 重置_pageSize
    /// defaultSize
    CGFloat defaultPageSizeWidth = (CGRectGetWidth(self.bounds) - 4 * self.leftRightMargin);
    _pageSize = CGSizeMake(defaultPageSizeWidth, defaultPageSizeWidth * 9 / 16);
    /// 获取 委托 中自定义的尺寸
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(sizeForCurrentCardViewInBannerView)]) {
        _pageSize = self.delegate.sizeForCurrentCardViewInBannerView(self);
    }
    /// 重置self.insideScrollView
    switch (self.orientation) {
        /// 横向
        case BV_Orientation_Horizontal: {
            self.insideScrollView.frame = CGRectMake(0,
                                                     0,
                                                     _pageSize.width,
                                                     _pageSize.height);
            self.insideScrollView.contentSize = CGSizeMake(_pageSize.width * _pageCount,
                                                           _pageSize.height);
            CGPoint theCenter = CGPointMake(CGRectGetMidX(self.bounds),
                                            CGRectGetMidY(self.bounds));
            self.insideScrollView.center = theCenter;
            if (_orginPageCount > 1) {
                // 是否开启无限轮播
                if (self.isCarousel) {
                    // 滚到第二组第一张
                    self.insideScrollView.setContentOffsetByNO(CGPointMake(_pageSize.width * _orginPageCount, 0));
                    _timerPageIndex = _orginPageCount;
                    // 开启定时器
                    [self bsvStartTimer];
                } else {
                    // 滚到开始
                    self.insideScrollView.setContentOffsetByNO(CGPointZero);
                    _timerPageIndex = _orginPageCount;
                }
            }break;
        }
        /// 纵向
        case BV_Orientation_Vertical:{
            self.insideScrollView.frame = CGRectMake(0,
                                                     0,
                                                     _pageSize.width,
                                                     _pageSize.height);
            self.insideScrollView.contentSize = CGSizeMake(_pageSize.width,
                                                           _pageSize.height * _pageCount);
            CGPoint theCenter = CGPointMake(CGRectGetMidX(self.bounds),
                                            CGRectGetMidY(self.bounds));
            self.insideScrollView.center = theCenter;
            if (_orginPageCount > 1) {
                // 是否开启无限轮播
                if (self.isCarousel) {
                    /// 滚到第二组第一张
                    self.insideScrollView.setContentOffsetByNO(CGPointMake(0,_pageSize.height * _orginPageCount));
                    _timerPageIndex = _orginPageCount;
                    /// 开启定时器
                    [self bsvStartTimer];
                } else {
                    /// 滚到第二组
                    self.insideScrollView.setContentOffsetByNO(CGPointZero);
                    _timerPageIndex = _orginPageCount;
                }
            }break;
        }
    }
    // 通过contentOffset调整insideScrollView内的cardView
    self.bsvAdjustCardViewByContentOffset(self.insideScrollView.contentOffset);
    // 更新各个可见cardView
    [self bsvUpdateVisibleCardViewAppearance];
}
/// 获取可重复使用的卡片View（cardView）
-(UIView *_Nullable)dequeueReusableView {
    JhtBannerCardView *cardView = self.reusableArray.lastObject;
    if (cardView) [self.reusableArray removeLastObject];
    return cardView;
}
/// 滚动到指定的页面
-(jobsByNSUIntegerBlock _Nonnull)scrollToPageByPageNumber{
    @jobs_weakify(self)
    return ^(NSUInteger pageNumber){
        @jobs_strongify(self)
        if (pageNumber < self->_pageCount) {
            self.destroyNSTimer(self->_bannerTimer);/// 销毁定时器，防止手势误触碰
            if (self.isCarousel) {
                /// 更新定时器用到的页数索引
                self->_timerPageIndex = pageNumber + self->_orginPageCount;
                // 取消之前的操作
                [NSObject cancelPreviousPerformRequestsWithTarget:self
                                                         selector:@selector(bsvStartTimer)
                                                           object:nil];
                /// 重新开启定时器
                [self performSelector:@selector(bsvStartTimer)
                           withObject:nil
                           afterDelay:0.5];
            } else self->_timerPageIndex = pageNumber;/// 更新定时器用到的页数索引
            
            switch (self.orientation) {
                /// 横向
                case BV_Orientation_Horizontal: {
                    self.insideScrollView.setContentOffsetByYES(CGPointMake(self->_pageSize.width * self->_timerPageIndex,
                                                                            0));
                    break;
                }
                /// 纵向
                case BV_Orientation_Vertical: {
                    self.insideScrollView.setContentOffsetByYES(CGPointMake(0,
                                                                            self->_pageSize.height * self->_timerPageIndex));
                    break;
                }
            }
            self.bsvAdjustCardViewByContentOffset(self.insideScrollView.contentOffset);/// 通过contentOffset调整insideScrollView内的cardView
            [self bsvUpdateVisibleCardViewAppearance];/// 更新各个可见cardView
        }
    };
}
/// 继续滚动
- (void)continueScroll {
    /// 判断定时器是否为 暂停状态
    if (_timerIsPause) {
        /// 延迟0.2S调用，给人相应反应时间
        @jobs_weakify(self)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            if (self->_bannerTimer) {
                self->_bannerTimer.fireDate = NSDate.distantPast;
            } else [self bsvStartTimer]; /// 开启
        });_timerIsPause = !_timerIsPause;
    }
}
/// 暂停滚动
-(void)pauseScroll{
    _timerIsPause = YES;
    _bannerTimer.fireDate = NSDate.distantFuture;
}
#pragma mark —— UIScrollViewDelegate
///
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!_orginPageCount) return;
    NSInteger pageIndex;
    switch (self.orientation) {
        /// 横向
        case BV_Orientation_Horizontal: {
            pageIndex = (NSInteger)round(self.insideScrollView.contentOffset.x / _pageSize.width) % _orginPageCount;
            break;
        }
        /// 纵向
        case BV_Orientation_Vertical: {
            pageIndex = (NSInteger)round(self.insideScrollView.contentOffset.y / _pageSize.height) % _orginPageCount;
            break;
        }
        default:
            break;
    }
    /// 通过contentOffset调整insideScrollView内的cardView
    self.bsvAdjustCardViewByContentOffset(scrollView.contentOffset);
    /// 更新各个可见cardView
    [self bsvUpdateVisibleCardViewAppearance];
    if (self.pageControl &&
        [self.pageControl respondsToSelector:@selector(setCurrentPage:)]) {
        self.pageControl.currentPage = pageIndex;
    }

    if ([_delegate respondsToSelector:@selector(bannerView:didScrollToCardViewWithIndex:)] &&
        (_currentIndex != pageIndex) && (pageIndex >= 0)) {
        [_delegate bannerView:self didScrollToCardViewWithIndex:pageIndex];
    }
    _currentIndex = pageIndex;
    /// 是否开启无限轮播
    @jobs_weakify(self)
    if (self.isCarousel && (_orginPageCount > 1)) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                     (int64_t)(0.25 * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            // 通过各组之间的切换实现循环
            [self bsvAdjustEachGroupToRealizeCycle];
        });
    }
}
/// 开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    /// 销毁定时器
    self.destroyNSTimer(_bannerTimer);;
}
/// 结束拖拽
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset {
//    JobsLog(@"velocity ===> %@", NSStringFromCGPoint(velocity));
//    JobsLog(@"scrollViewWillEndDragging --> _timerPageIndex = %ld", _timerPageIndex);
    if (_orginPageCount > 1 &&
        self.isOpenAutoScroll &&
        self.isCarousel) {
        /// 销毁定时器，防止手势误触碰
        self.destroyNSTimer(_bannerTimer);;
        // 重新初始化定时器
        _bannerTimer = NSRunLoop.addTimerAtMainRunLoopByCommonModes([NSTimer scheduledTimerWithTimeInterval:self.autoTime
                                                                                                     target:self
                                                                                                   selector:@selector(bsvAutoNextCardView)
                                                                                                   userInfo:nil
                                                                                                    repeats:YES]);
        switch (self.orientation) {
            // 横向
            case BV_Orientation_Horizontal: {
                if (velocity.x > 0) {
                    _timerPageIndex = self.pageControl.currentPage + _orginPageCount + 1;// 右 --> 左
                } else {
                    
                    _timerPageIndex = self.pageControl.currentPage + _orginPageCount - 1;// 左 --> 右
                }break;
            }
            // 纵向
            case BV_Orientation_Vertical: {
                if (velocity.y > 0) {
                    _timerPageIndex = self.pageControl.currentPage + _orginPageCount + 1;// 下 --> 上
                } else {
                    _timerPageIndex = self.pageControl.currentPage + _orginPageCount - 1;// 上 --> 下
                }break;
            }
            default:
                break;
        }
    }
}
#pragma mark —— Getter
- (NSMutableArray *)cardViewArray {
    if (!_cardViewArray) {
        _cardViewArray = NSMutableArray.array;
    }return _cardViewArray;
}

- (NSMutableArray *)reusableArray {
    if (!_reusableArray) {
        _reusableArray = NSMutableArray.array;
    }return _reusableArray;
}

- (UIScrollView *)insideScrollView {
    if (!_insideScrollView) {
        @jobs_weakify(self)
        _insideScrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            @jobs_strongify(self)
            scrollView.frame = self.bounds;
            scrollView.scrollsToTop = NO;
            scrollView.delegate = self;
            scrollView.pagingEnabled = YES;
            scrollView.clipsToBounds = NO;
            scrollView.showsHorizontalScrollIndicator = NO;
            scrollView.showsVerticalScrollIndicator = NO;
        });
    }return _insideScrollView;
}
#pragma mark —— Setter
- (void)setLeftRightMargin:(CGFloat)leftRightMargin {
    _leftRightMargin = leftRightMargin;
}

- (void)setTopBottomMargin:(CGFloat)topBottomMargin {
    _topBottomMargin = topBottomMargin;
}

-(void)setIsOpenAutoScroll:(BOOL)isOpenAutoScroll{
    _isOpenAutoScroll = isOpenAutoScroll;
}

@end
