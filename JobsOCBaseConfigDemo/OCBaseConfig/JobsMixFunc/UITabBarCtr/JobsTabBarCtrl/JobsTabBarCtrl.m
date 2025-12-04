//
//  JobsTabBarCtrl.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/10/16.
//

#import "JobsTabBarCtrl.h"

@interface JobsTabBarCtrl ()

Prop_strong(readwrite)UIScrollView *tabBar;
Prop_strong(readwrite)UIScrollView *contentScrollView;
Prop_strong(readwrite)NSMutableArray<__kindof UIButton *> *buttons;
Prop_strong(readwrite)NSMutableArray<__kindof UIViewController *> *controllers;
Prop_assign(readwrite)NSInteger selectedIndex;
Prop_assign(readwrite)BOOL builtOnce;

@end

@implementation JobsTabBarCtrl

-(instancetype)init {
    if (self = [super init]) {
        _swipeEnabled = YES;
        _horizontalOnly = YES;
        _suppressChildVerticalScrolls = NO;
        _contentInset = UIEdgeInsetsMake(0, 12, 0, 12);
        _equalSpacing = 8.0;
        _equalVisibleMin = 2;
        _equalVisibleMax = 5;
        _lockUnitToMaxEqualCount = YES;
        _autoRelayoutForBoundsChange = YES;
        _barBottomOffset = 0;

        if (@available(iOS 13.0, *)) {
            _barBackgroundColor = [UIColor systemBackgroundColor];
        } else {
            _barBackgroundColor = [UIColor whiteColor];
        }
    }return self;
}

#pragma mark —— Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = [UIColor systemBackgroundColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    [self.view addSubview:self.contentScrollView];
    [self.tabBar addSubview:self.bgImageView];
    [self.view addSubview:self.tabBar];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat safeBottom = self.view.safeAreaInsets.bottom;
    CGFloat barH = self.customBarHeight ? self.customBarHeight.doubleValue : (49.0 + safeBottom);

    self.tabBar.frame = CGRectMake(0,CGRectGetHeight(self.view.bounds) - barH - self.barBottomOffset,
                                   CGRectGetWidth(self.view.bounds),barH);
    self.bgImageView.frame = self.tabBar.bounds;

    self.contentScrollView.frame = CGRectMake(0,0,
                                              CGRectGetWidth(self.view.bounds),CGRectGetHeight(self.view.bounds) - barH - self.barBottomOffset);
    // 布局按钮
    if (self.autoRelayoutForBoundsChange || !self.builtOnce) {
        [self layoutButtonsByRule];
        self.builtOnce = YES;
        if (self.onButtonsLayouted) {
            self.onButtonsLayouted(self.buttons);
        }
    }
    // 布局页面
    NSInteger pageCount = MIN(self.buttons.count, self.controllers.count);
    if (pageCount <= 0) {
        self.contentScrollView.contentSize = CGSizeZero;
        return;
    }

    CGFloat pageW = self.contentScrollView.bounds.size.width;
    CGFloat pageH = self.contentScrollView.bounds.size.height;

    for (NSInteger i = 0; i < pageCount; i++) {
        UIViewController *vc = self.childViewControllers[i];
        vc.view.frame = CGRectMake((CGFloat)i * pageW, 0, pageW, pageH);
    }
    self.contentScrollView.contentSize = CGSizeMake(pageW * pageCount, pageH);

    self.syncContentOffsetAnimated(NO);
}
#pragma mark —— Property override
- (void)setSwipeEnabled:(BOOL)swipeEnabled {
    _swipeEnabled = swipeEnabled;
    self.contentScrollView.scrollEnabled = swipeEnabled;
}

- (void)setHorizontalOnly:(BOOL)horizontalOnly {
    _horizontalOnly = horizontalOnly;
    self.contentScrollView.alwaysBounceVertical = !horizontalOnly;
    self.contentScrollView.directionalLockEnabled = horizontalOnly;
}

- (void)setBarBackgroundColor:(UIColor *)barBackgroundColor {
    _barBackgroundColor = barBackgroundColor;
    self.tabBar.backgroundColor = barBackgroundColor;
}

- (void)setBarBackgroundImage:(UIImage *)barBackgroundImage {
    _barBackgroundImage = barBackgroundImage;
    self.bgImageView.image = barBackgroundImage;
}

- (void)setCustomBarHeight:(NSNumber *)customBarHeight {
    _customBarHeight = customBarHeight;
    [self.view setNeedsLayout];
}

- (void)setBarBottomOffset:(CGFloat)barBottomOffset {
    _barBottomOffset = barBottomOffset;
    [self.view setNeedsLayout];
}
#pragma mark —— 一些私有方法
/// UI
- (void)layoutButtonsByRule {
    if (self.buttons.count == 0) {
        self.tabBar.contentSize = CGSizeZero;
        return;
    }

    NSInteger total = self.buttons.count;
    CGRect bounds = self.tabBar.bounds;
    CGFloat availableW = MAX(0, bounds.size.width - self.contentInset.left - self.contentInset.right);
    CGFloat h = MAX(0, bounds.size.height - self.contentInset.top - self.contentInset.bottom);

    NSMutableArray<NSValue *> *frames = [NSMutableArray arrayWithCapacity:total];
    for (NSInteger i = 0; i < total; i++) {
        [frames addObject:[NSValue valueWithCGRect:CGRectZero]];
    }

    static const CGFloat kMinItemWidth = 60.0;

    if (total == 1) {
        UIButton *b = self.buttons.firstObject;
        CGFloat ideal = b.intrinsicContentSize.width;
        NSInteger n2 = MAX(self.equalVisibleMin, 2);
        CGFloat refW = (availableW - (CGFloat)(n2 - 1) * self.equalSpacing) / (CGFloat)n2;
        CGFloat w = MAX(kMinItemWidth, MIN(ideal + 2 * 16.0, refW));
        CGFloat x = self.contentInset.left + (availableW - w) * 0.5;
        CGRect f = CGRectMake(x, self.contentInset.top, w, h);
        frames[0] = [NSValue valueWithCGRect:f];
    } else if (total >= self.equalVisibleMin && total <= self.equalVisibleMax) {
        NSInteger n = total;
        CGFloat w = (availableW - (CGFloat)(n - 1) * self.equalSpacing) / (CGFloat)n;
        CGFloat curX = self.contentInset.left;
        for (NSInteger i = 0; i < total; i++) {
            CGRect f = CGRectMake(curX, self.contentInset.top, w, h);
            frames[i] = [NSValue valueWithCGRect:f];
            curX += w + self.equalSpacing;
        }
    } else {
        NSInteger nRef = MAX(self.equalVisibleMax, 2);
        CGFloat unitW = (availableW - (CGFloat)(nRef - 1) * self.equalSpacing) / (CGFloat)nRef;
        CGFloat curX = self.contentInset.left;
        for (NSInteger i = 0; i < total; i++) {
            CGRect f = CGRectMake(curX, self.contentInset.top, unitW, h);
            frames[i] = [NSValue valueWithCGRect:f];
            curX += unitW + self.equalSpacing;
        }
    }
    /// 应用 frame
    for (NSInteger i = 0; i < total; i++) {
        UIButton *btn = self.buttons[i];
        btn.frame = frames[i].CGRectValue;
    }
    /// contentSize
    CGFloat widthSum;
    if (self.buttons.count <= self.equalVisibleMax) {
        widthSum = bounds.size.width;
    } else {
        UIButton *last = self.buttons.lastObject;
        widthSum = CGRectGetMaxX(last.frame) + self.contentInset.right;
    }self.tabBar.contentSize = CGSizeMake(widthSum, bounds.size.height);
}
/// 交互
-(jobsByBOOLBlock _Nonnull)applySelectionStateAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        [self.buttons enumerateObjectsUsingBlock:^(UIButton *b, NSUInteger idx, BOOL *stop) {
            b.selected = (idx == self.selectedIndex);
        }];
        self.syncContentOffsetAnimated(animated);
        [self scrollTabBarToVisibleIndex:self.selectedIndex animated:animated];
    };
}

-(jobsByBOOLBlock _Nonnull)syncContentOffsetAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        CGFloat pageW = self.contentScrollView.bounds.size.width;
        CGFloat x = (CGFloat)self.selectedIndex * pageW;
        [self.contentScrollView setContentOffset:CGPointMake(x, 0) animated:animated];
    };
}

-(void)scrollTabBarToVisibleIndex:(NSInteger)index animated:(BOOL)animated {
    if (index < 0 || index >= (NSInteger)self.buttons.count) return;
    UIButton *btn = self.buttons[index];
    CGRect frame = CGRectInset(btn.frame, -16.0, 0);
    [self.tabBar scrollRectToVisible:frame animated:animated];
}
/// 禁用子 VC 内纵向滚动（可选）
-(jobsByViewBlock _Nonnull)suppressVerticalInView{
    @jobs_weakify(self)
    return ^(__kindof UIView *_Nullable root){
        @jobs_strongify(self)
        if ([root isKindOfClass:UITableView.class]) {
            UITableView *tv = (UITableView *)root;
            tv.scrollEnabled = NO;
            tv.showsVerticalScrollIndicator = NO;
            tv.alwaysBounceVertical = NO;
        } else if ([root isKindOfClass:UICollectionView.class]) {
            UICollectionView *cv = (UICollectionView *)root;
            UICollectionViewLayout *layout = cv.collectionViewLayout;
            if ([layout isKindOfClass:[UICollectionViewFlowLayout class]] &&
                ((UICollectionViewFlowLayout *)layout).scrollDirection == UICollectionViewScrollDirectionHorizontal) {
                cv.showsVerticalScrollIndicator = NO;
                cv.alwaysBounceVertical = NO;
            } else {
                cv.scrollEnabled = NO;
                cv.showsVerticalScrollIndicator = NO;
                cv.alwaysBounceVertical = NO;
            }
        } else if ([root isKindOfClass:UIScrollView.class]) {
            UIScrollView *sv = (UIScrollView *)root;
            sv.showsVerticalScrollIndicator = NO;
            sv.alwaysBounceVertical = NO;
        }

        for (UIView *sub in root.subviews) {
            self.suppressVerticalInView(sub);
        }
    };
}
#pragma mark —— 一些公共方法
- (void)setDataSourceWithButtons:(__kindof NSArray<__kindof UIButton *> *)buttons
                     controllers:(__kindof NSArray<__kindof UIViewController *> *)controllers {
    /// 清理旧的按钮
    for (UIButton *b in self.buttons) {
        [b removeFromSuperview];
    }
    /// 清理旧的子控制器
    for (UIViewController *vc in self.controllers) {
        if (vc.parentViewController == self) {
            [vc willMoveToParentViewController:nil];
            [vc.view removeFromSuperview];
            [vc removeFromParentViewController];
        }
    }
    self.builtOnce = NO;
    /// 添加按钮
    [self.buttons enumerateObjectsUsingBlock:^(UIButton *b,
                                               NSUInteger idx,
                                               BOOL *stop) {
        b.onClickBy(^(UIButton *x){
            NSInteger index = x.tag;
            if (index >= MIN(self.buttons.count, self.controllers.count)) {
                toastBy(@"请配置子控制器");
                return;
            }[self selectIndex:index animated:YES];
        })
        .byTag(idx)
        .addOn(self.tabBar);
    }];
    /// 添加子控制器（只取 min(buttons, controllers)）
    NSInteger pageCount = MIN(self.buttons.count, self.controllers.count);
    for (NSInteger i = 0; i < pageCount; i++) {
        UIViewController *vc = self.controllers[i].navCtrl;
        [self addChildViewController:vc];
        [self.contentScrollView addSubview:vc.view];
        [vc didMoveToParentViewController:self];
        if (self.suppressChildVerticalScrolls) self.suppressVerticalInView(vc.view);
    }
    self.selectedIndex = 0;
    self.applySelectionStateAnimated(NO);
    if (self.onButtonsBuilt) self.onButtonsBuilt(self.buttons);
    [self.view setNeedsLayout];
}

- (void)selectIndex:(NSInteger)index animated:(BOOL)animated {
    if (index < 0 || index >= (NSInteger)self.buttons.count) return;
    if (index >= MIN(self.buttons.count, self.controllers.count)) {
        toastBy(@"请配置子控制器");
        return;
    }
    self.selectedIndex = index;
    self.applySelectionStateAnimated(animated);
}

-(void)requestRelayout {
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
}
#pragma mark —— UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (!self.horizontalOnly) return;
    if (scrollView == self.contentScrollView && scrollView.contentOffset.y != 0) {
        CGPoint offset = scrollView.contentOffset;
        offset.y = 0;
        scrollView.contentOffset = offset;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView != self.contentScrollView) return;
    CGFloat pageW = MAX(scrollView.bounds.size.width, 1);
    NSInteger page = (NSInteger)llround(scrollView.contentOffset.x / pageW);
    if (page != self.selectedIndex) {
        self.selectedIndex = page;
        self.applySelectionStateAnimated(YES);
    }
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if (scrollView != self.contentScrollView) return;
    CGFloat pageW = MAX(scrollView.bounds.size.width, 1);
    NSInteger page = (NSInteger)llround(scrollView.contentOffset.x / pageW);
    if (page != self.selectedIndex) {
        self.selectedIndex = page;
        self.applySelectionStateAnimated(NO);
    }
}
#pragma mark —— LazyLoad
-(UIScrollView *)tabBar {
    if (!_tabBar) {
        _tabBar = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            scrollView
                .byShowsHorizontalScrollIndicator(NO)
                .byAlwaysBounceHorizontal(YES)
                .byClipsToBounds(NO)
                .byBgColor(self.barBackgroundColor);
        });
    }return _tabBar;
}

-(UIScrollView *)contentScrollView {
    if (!_contentScrollView) {
        _contentScrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            scrollView
                .byPagingEnabled(YES)
                .byBounces(NO)
                .byShowsHorizontalScrollIndicator(NO)
                .byShowsVerticalScrollIndicator(NO)
                .byDelegate(self)
                .byScrollEnabled(self.swipeEnabled)
                .byAlwaysBounceVertical(!self.horizontalOnly)
                .byDirectionalLockEnabled(YES)
                .byAlwaysBounceHorizontal(YES)
                .byBgColor(JobsClearColor);
        });
    }return _contentScrollView;
}
@synthesize bgImageView = _bgImageView;
- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView.byContentMode(UIViewContentModeScaleToFill);
        });
    }return _bgImageView;
}

-(NSMutableArray<__kindof UIButton *> *)buttons{
    if(!_buttons){
        _buttons = jobsMakeMutArr(^(__kindof NSMutableArray<__kindof UIButton *> * _Nullable arr) {

        });
    }return _buttons;
}

-(NSMutableArray<__kindof UIViewController *> *)controllers{
    if(!_controllers){
        _controllers = jobsMakeMutArr(^(__kindof NSMutableArray<__kindof UIViewController *> * _Nullable arr) {

        });
    }return _controllers;
}

@end

#pragma mark - 链式扩展实现

@implementation JobsTabBarCtrl (Chainable)

- (instancetype)bySwipeEnabled:(BOOL)flag {
    self.swipeEnabled = flag;
    return self;
}

- (instancetype)byHorizontalOnly:(BOOL)flag {
    self.horizontalOnly = flag;
    return self;
}

- (instancetype)bySuppressChildVerticalScrolls:(BOOL)flag {
    self.suppressChildVerticalScrolls = flag;
    return self;
}

- (instancetype)byBarBackgroundColor:(UIColor *)color {
    self.barBackgroundColor = color;
    return self;
}

- (instancetype)byCustomBarHeight:(NSNumber *)height {
    self.customBarHeight = height;
    return self;
}

- (instancetype)byBarBottomOffset:(CGFloat)offset {
    self.barBottomOffset = offset;
    return self;
}

- (instancetype)byBarBackgroundImage:(UIImage *)img {
    self.barBackgroundImage = img;
    return self;
}

- (instancetype)byContentInset:(UIEdgeInsets)inset {
    self.contentInset = inset;
    return self;
}

- (instancetype)byEqualSpacing:(CGFloat)spacing {
    self.equalSpacing = spacing;
    return self;
}

- (instancetype)byEqualVisibleRangeFrom:(NSInteger)min to:(NSInteger)max {
    self.equalVisibleMin = min;
    self.equalVisibleMax = max;
    return self;
}

- (instancetype)byLockUnitToMaxEqualCount:(BOOL)flag {
    self.lockUnitToMaxEqualCount = flag;
    return self;
}

- (instancetype)byAutoRelayoutForBoundsChange:(BOOL)flag {
    self.autoRelayoutForBoundsChange = flag;
    return self;
}

- (instancetype)onButtonsBuilt:(JobsTabBarButtonsCallback)block {
    self.onButtonsBuilt = block;
    return self;
}

- (instancetype)onButtonsLayouted:(JobsTabBarButtonsCallback)block {
    self.onButtonsLayouted = block;
    return self;
}

- (instancetype)byDataSourceWithButtons:(NSArray<UIButton *> *)buttons
                             controllers:(NSArray<UIViewController *> *)controllers {
    [self setDataSourceWithButtons:buttons controllers:controllers];
    return self;
}

- (instancetype)onButtonsLayoutedWeakOwner:(void(^)(JobsTabBarCtrl *owner,
                                                    NSArray<UIButton *> *buttons))block {
    __weak typeof(self) weakSelf = self;
    self.onButtonsLayouted = ^(NSArray<UIButton *> *btns) {
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) return;
        block(strongSelf, btns);
    };
    return self;
}

@end
