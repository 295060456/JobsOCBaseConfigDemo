//
//  JobsTabBarCtrl.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/10/16.
//

#import "JobsTabBarCtrl.h"
#import <Masonry/Masonry.h>

@interface JobsTabBarCtrl ()

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong, readwrite) UIScrollView *TabBar;
@property (nonatomic, strong, readwrite) UIScrollView *contentScrollView;

@property (nonatomic, strong, readwrite) NSArray<UIButton *> *buttons;
@property (nonatomic, strong, readwrite) NSArray<UIViewController *> *controllers;
@property (nonatomic, assign, readwrite) NSInteger selectedIndex;

@property (nonatomic, assign) BOOL builtOnce;

@end

@implementation JobsTabBarCtrl

#pragma mark - Init

- (instancetype)init {
    self = [super init];
    if (self) {
        _swipeEnabled = YES;
        _horizontalOnly = YES;
        _suppressChildVerticalScrolls = NO;

        _barBottomOffset = 0.0;
        _barBackgroundColor = [UIColor systemBackgroundColor];

        _contentInset = UIEdgeInsetsMake(0, 12, 0, 12);
        _equalSpacing = 8.0;
        _equalVisibleMin = 2;
        _equalVisibleMax = 5;
        _lockUnitToMaxEqualCount = YES;
        _autoRelayoutForBoundsChange = YES;

        _buttons = @[];
        _controllers = @[];
        _selectedIndex = 0;
        _builtOnce = NO;
    }
    return self;
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self layoutUI];
}

#pragma mark - UI

- (void)setupUI {
    [self.view addSubview:self.contentScrollView];
    [self.view addSubview:self.TabBar];
    [self.TabBar addSubview:self.backgroundImageView];
    [self.TabBar sendSubviewToBack:self.backgroundImageView];
}

- (void)layoutUI {
    CGRect bounds = self.view.bounds;

    CGFloat safeBottom = 0;
    if (@available(iOS 11.0, *)) {
        safeBottom = self.view.safeAreaInsets.bottom;
    }

    CGFloat defaultH = 49.0 + safeBottom;
    CGFloat barH = self.customBarHeight ? self.customBarHeight.doubleValue : defaultH;

    // TabBar frame
    self.TabBar.frame = CGRectMake(0,
                                   CGRectGetHeight(bounds) - barH - self.barBottomOffset,
                                   CGRectGetWidth(bounds),
                                   barH);
    self.backgroundImageView.frame = self.TabBar.bounds;

    // 内容区 frame
    self.contentScrollView.frame = CGRectMake(0,
                                              0,
                                              CGRectGetWidth(bounds),
                                              CGRectGetHeight(bounds) - barH - self.barBottomOffset);

    // 按钮布局
    if (self.autoRelayoutForBoundsChange || !self.builtOnce) {
        [self layoutButtonsByRule];
        self.builtOnce = YES;
        if (self.onButtonsLayouted) {
            self.onButtonsLayouted(self.buttons);
        }
    }

    // 页面布局
    [self layoutPages];
    [self syncContentOffsetAnimated:NO];
}

#pragma mark - Public API

- (void)setDataSourceWithButtons:(NSArray<UIButton *> *)buttons
                     controllers:(NSArray<UIViewController *> *)controllers {

    // 清理旧按钮
    for (UIButton *btn in self.buttons) {
        [btn removeFromSuperview];
    }

    // 清理旧 VC
    for (UIViewController *vc in self.controllers) {
        if (vc.parentViewController == self) {
            [vc willMoveToParentViewController:nil];
            [vc.view removeFromSuperview];
            [vc removeFromParentViewController];
        }
    }

    self.buttons = @[];
    self.controllers = @[];
    self.builtOnce = NO;
    self.selectedIndex = 0;

    // 写入新数据
    self.buttons = [buttons copy];
    self.controllers = [controllers copy];

    // 配按钮
    [buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull b, NSUInteger idx, BOOL * _Nonnull stop) {
        b.tag = idx;
        [b addTarget:self action:@selector(tabButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.TabBar addSubview:b];
    }];

    // 配子控制器：仅取前 N（N = min(btns, ctrls)）
    NSInteger pageCount = MIN((NSInteger)buttons.count, (NSInteger)controllers.count);
    for (NSInteger i = 0; i < pageCount; i++) {
        UIViewController *vc = [self embedIfNeeded:controllers[i]];
        [self addChildViewController:vc];
        [self.contentScrollView addSubview:vc.view];
        [vc didMoveToParentViewController:self];

        if (self.suppressChildVerticalScrolls) {
            [self suppressVerticalInView:vc.view];
        }
    }

    // 初次构建回调
    if (self.onButtonsBuilt) {
        self.onButtonsBuilt(self.buttons);
    }

    // 默认选中第 0 个
    [self applySelectionStateAnimated:NO];
}

/// 切页（按钮 + 内容滚动同步）
- (void)selectIndex:(NSInteger)index animated:(BOOL)animated {
    NSInteger maxIndex = MIN((NSInteger)self.buttons.count, (NSInteger)self.controllers.count) - 1;
    if (index < 0 || index > maxIndex) {
        return;
    }
    self.selectedIndex = index;
    [self applySelectionStateAnimated:animated];
}

#pragma mark - Layout rules

/// 1 -> 居中；2~5 -> 等分；>5 -> 仍按“max 等分(默认 5)”的单元宽度排，超出横滑
- (void)layoutButtonsByRule {
    if (self.buttons.count == 0) {
        self.TabBar.contentSize = CGSizeZero;
        return;
    }

    NSInteger total = (NSInteger)self.buttons.count;
    CGRect bounds = self.TabBar.bounds;
    CGFloat availableW = MAX(0.0, CGRectGetWidth(bounds) - self.contentInset.left - self.contentInset.right);
    CGFloat h = MAX(0.0, CGRectGetHeight(bounds) - self.contentInset.top - self.contentInset.bottom);

    NSMutableArray<NSValue *> *frames = [NSMutableArray arrayWithCapacity:total];
    for (NSInteger i = 0; i < total; i++) {
        [frames addObject:[NSValue valueWithCGRect:CGRectZero]];
    }

    if (total == 1) {
        // 居中：宽度取 intrinsic + padding 与 availableW 的夹取
        UIButton *b = self.buttons.firstObject;
        CGFloat ideal = b.intrinsicContentSize.width;
        NSInteger n2 = MAX(self.equalVisibleMin, 2);
        CGFloat refW = (availableW - (CGFloat)(n2 - 1) * self.equalSpacing) / (CGFloat)n2;
        CGFloat w = MAX([self minItemWidth], MIN(ideal + 2.0 * 16.0, refW));
        CGFloat x = self.contentInset.left + (availableW - w) * 0.5;

        CGRect f = CGRectMake(x, self.contentInset.top, w, h);
        frames[0] = [NSValue valueWithCGRect:f];

    } else if (total >= self.equalVisibleMin && total <= self.equalVisibleMax) {
        // 2~5 等分
        NSInteger n = total;
        CGFloat w = (availableW - (CGFloat)(n - 1) * self.equalSpacing) / (CGFloat)n;
        CGFloat curX = self.contentInset.left;
        for (NSInteger i = 0; i < total; i++) {
            CGRect f = CGRectMake(curX, self.contentInset.top, w, h);
            frames[i] = [NSValue valueWithCGRect:f];
            curX += w + self.equalSpacing;
        }

    } else {
        // >5：用“max 等分数”（默认 5）来确定单元宽度与间距
        NSInteger nRef = MAX(self.equalVisibleMax, 2);
        CGFloat unitW = (availableW - (CGFloat)(nRef - 1) * self.equalSpacing) / (CGFloat)nRef;
        CGFloat curX = self.contentInset.left;
        for (NSInteger i = 0; i < total; i++) {
            CGRect f = CGRectMake(curX, self.contentInset.top, unitW, h);
            frames[i] = [NSValue valueWithCGRect:f];
            curX += unitW + self.equalSpacing;
        }
    }

    // 应用 frame
    for (NSInteger i = 0; i < total; i++) {
        UIButton *b = self.buttons[i];
        b.frame = [frames[i] CGRectValue];
    }

    // contentSize
    CGFloat widthSum = 0.0;
    if (self.buttons.count <= (NSUInteger)self.equalVisibleMax) {
        widthSum = CGRectGetWidth(bounds); // 不需要滚动
    } else {
        UIButton *last = self.buttons.lastObject;
        widthSum = CGRectGetMaxX(last.frame) + self.contentInset.right;
    }
    self.TabBar.contentSize = CGSizeMake(widthSum, CGRectGetHeight(bounds));
}

- (CGFloat)minItemWidth {
    return 60.0;
}

- (void)layoutPages {
    NSInteger pageCount = MIN((NSInteger)self.buttons.count, (NSInteger)self.controllers.count);
    if (pageCount <= 0) {
        self.contentScrollView.contentSize = CGSizeZero;
        return;
    }

    CGFloat pageW = CGRectGetWidth(self.contentScrollView.bounds);
    CGFloat pageH = CGRectGetHeight(self.contentScrollView.bounds);

    // children 顺序与 controllers 一致
    for (NSInteger i = 0; i < pageCount; i++) {
        UIViewController *vc = self.childViewControllers[i];
        vc.view.frame = CGRectMake((CGFloat)i * pageW, 0, pageW, pageH);
    }

    self.contentScrollView.contentSize = CGSizeMake(pageW * (CGFloat)pageCount, pageH);
}

#pragma mark - Interaction

- (void)tabButtonTapped:(UIButton *)sender {
    NSInteger index = sender.tag;
    [self handleTapAtIndex:index];
}

- (void)handleTapAtIndex:(NSInteger)index {
    NSInteger maxIndex = MIN((NSInteger)self.buttons.count, (NSInteger)self.controllers.count) - 1;
    if (index < 0 || index > maxIndex) {
        [self showNoControllerToast];
        return;
    }
    [self selectIndex:index animated:YES];
}

- (void)showNoControllerToast {
    // 这里你可以替换成自己的 Toast 实现
    NSLog(@"[JobsTabBarCtrl] 请配置子控制器");
}

- (void)applySelectionStateAnimated:(BOOL)animated {
    [self.buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull b, NSUInteger idx, BOOL * _Nonnull stop) {
        b.selected = (idx == (NSUInteger)self.selectedIndex);
    }];
    [self syncContentOffsetAnimated:animated];
    [self scrollTabBarToVisibleIndex:self.selectedIndex animated:animated];
}

- (void)syncContentOffsetAnimated:(BOOL)animated {
    CGFloat pageW = CGRectGetWidth(self.contentScrollView.bounds);
    CGFloat x = (CGFloat)self.selectedIndex * pageW;
    [self.contentScrollView setContentOffset:CGPointMake(x, 0) animated:animated];
}

- (void)scrollTabBarToVisibleIndex:(NSInteger)index animated:(BOOL)animated {
    if (index < 0 || index >= (NSInteger)self.buttons.count) {
        return;
    }
    UIButton *btn = self.buttons[index];
    CGRect frame = CGRectInset(btn.frame, -16.0, 0);
    [self.TabBar scrollRectToVisible:frame animated:animated];
}

#pragma mark - Child embedding / suppress vertical scroll

- (UIViewController *)embedIfNeeded:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return vc;
    }
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    return nav;
}

/// 子 VC 内纵向滚动禁用（可选启用）
- (void)suppressVerticalInView:(UIView *)root {
    if ([root isKindOfClass:[UITableView class]]) {
        UITableView *tv = (UITableView *)root;
        tv.scrollEnabled = NO;
        tv.showsVerticalScrollIndicator = NO;
        tv.alwaysBounceVertical = NO;
    } else if ([root isKindOfClass:[UICollectionView class]]) {
        UICollectionView *cv = (UICollectionView *)root;
        UICollectionViewLayout *layout = cv.collectionViewLayout;
        if ([layout isKindOfClass:[UICollectionViewFlowLayout class]]) {
            UICollectionViewFlowLayout *flow = (UICollectionViewFlowLayout *)layout;
            if (flow.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
                cv.showsVerticalScrollIndicator = NO;
                cv.alwaysBounceVertical = NO;
                // 如需“一刀切完全不滚”，可加：cv.scrollEnabled = NO;
            }
        }
    } else if ([root isKindOfClass:[UIScrollView class]]) {
        UIScrollView *sv = (UIScrollView *)root;
        sv.showsVerticalScrollIndicator = NO;
        sv.alwaysBounceVertical = NO;
    }

    for (UIView *sub in root.subviews) {
        [self suppressVerticalInView:sub];
    }
}

#pragma mark - UIScrollViewDelegate（页切换同步）

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!self.horizontalOnly) { return; }
    if (scrollView != self.contentScrollView) { return; }

    if (scrollView.contentOffset.y != 0) {
        CGPoint offset = scrollView.contentOffset;
        offset.y = 0;
        scrollView.contentOffset = offset;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView != self.contentScrollView) { return; }

    CGFloat width = MAX(CGRectGetWidth(scrollView.bounds), 1.0);
    NSInteger page = (NSInteger)llround(scrollView.contentOffset.x / width);
    if (page != self.selectedIndex) {
        self.selectedIndex = page;
        [self applySelectionStateAnimated:YES];
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if (scrollView != self.contentScrollView) { return; }

    CGFloat width = MAX(CGRectGetWidth(scrollView.bounds), 1.0);
    NSInteger page = (NSInteger)llround(scrollView.contentOffset.x / width);
    if (page != self.selectedIndex) {
        self.selectedIndex = page;
        [self applySelectionStateAnimated:NO];
    }
}

#pragma mark - Setter override

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
    _barBackgroundColor = barBackgroundColor ?: [UIColor clearColor];
    self.TabBar.backgroundColor = _barBackgroundColor;
}

- (void)setBarBackgroundImage:(UIImage *)barBackgroundImage {
    _barBackgroundImage = barBackgroundImage;
    self.backgroundImageView.image = barBackgroundImage;
}

#pragma mark - Lazy

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _backgroundImageView;
}

- (UIScrollView *)TabBar {
    if (!_TabBar) {
        _TabBar = [[UIScrollView alloc] init];
        _TabBar.showsHorizontalScrollIndicator = NO;
        _TabBar.alwaysBounceHorizontal = YES;
        _TabBar.clipsToBounds = NO;
        _TabBar.backgroundColor = self.barBackgroundColor;
    }
    return _TabBar;
}

- (UIScrollView *)contentScrollView {
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] init];
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.bounces = NO;
        _contentScrollView.showsHorizontalScrollIndicator = NO;
        _contentScrollView.showsVerticalScrollIndicator = NO;
        _contentScrollView.delegate = self;
        _contentScrollView.backgroundColor = UIColor.clearColor;
        _contentScrollView.scrollEnabled = self.swipeEnabled;
        _contentScrollView.alwaysBounceVertical = !self.horizontalOnly;
        _contentScrollView.directionalLockEnabled = YES;
        _contentScrollView.alwaysBounceHorizontal = YES;
    }
    return _contentScrollView;
}

#pragma mark - 链式扩展实现

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

- (instancetype)byBarBackgroundImage:(UIImage *)image {
    self.barBackgroundImage = image;
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

- (instancetype)byEqualVisibleRangeMin:(NSInteger)min max:(NSInteger)max {
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

- (instancetype)onButtonsBuilt:(JobsTabBarButtonsBlock)block {
    self.onButtonsBuilt = block;
    return self;
}

- (instancetype)onButtonsLayouted:(JobsTabBarButtonsBlock)block {
    self.onButtonsLayouted = block;
    return self;
}

- (instancetype)onButtonsLayoutedWeakOwner:(JobsTabBarButtonsOwnerBlock)block {
    __weak typeof(self) weakSelf = self;
    self.onButtonsLayouted = ^(NSArray<UIButton *> *btns) {
        __strong typeof(weakSelf) self = weakSelf;
        if (!self) { return; }
        if (block) {
            block(self, btns);
        }
    };
    return self;
}

- (instancetype)byDataSourceButtons:(NSArray<UIButton *> *)buttons
                        controllers:(NSArray<UIViewController *> *)controllers {
    [self setDataSourceWithButtons:buttons controllers:controllers];
    return self;
}

@end
