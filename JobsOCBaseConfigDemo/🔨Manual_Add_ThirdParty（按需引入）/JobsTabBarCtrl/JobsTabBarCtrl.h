//
//  JobsTabBarCtrl.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/10/16.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^JobsTabBarButtonsBlock)(NSArray<UIButton *> *buttons);
typedef void(^JobsTabBarButtonsOwnerBlock)(/* owner */ id owner, NSArray<UIButton *> *buttons);

@interface JobsTabBarCtrl : BaseViewController <UIScrollViewDelegate>

/// 是否允许左右滑动切页（默认 YES）
@property (nonatomic, assign) BOOL swipeEnabled;

/// 只允许横向翻页（默认 YES）
@property (nonatomic, assign) BOOL horizontalOnly;

/// （可选）对子 VC 内滚动视图禁用纵向滚动（默认 NO）
@property (nonatomic, assign) BOOL suppressChildVerticalScrolls;

/// 默认高度 = 49 + safeAreaBottom；nil 表示用默认高度
@property (nonatomic, strong, nullable) NSNumber *customBarHeight;

/// 距底部上移量（>0 上移）
@property (nonatomic, assign) CGFloat barBottomOffset;

/// TabBar 背景色
@property (nonatomic, strong) UIColor *barBackgroundColor;

/// TabBar 背景图
@property (nonatomic, strong, nullable) UIImage *barBackgroundImage;

/// TabBar 内边距（用于 1/2~5 规则与 >5 的参考宽度计算）
@property (nonatomic, assign) UIEdgeInsets contentInset;

/// 2~5 等分时的按钮间距
@property (nonatomic, assign) CGFloat equalSpacing;

/// 2~5 的可见等分范围（上限决定 >5 时的“参考单元宽度”）
@property (nonatomic, assign) NSInteger equalVisibleMin;   ///< 默认 2
@property (nonatomic, assign) NSInteger equalVisibleMax;   ///< 默认 5

/// 超过 5 个时是否仍然用“max 等分”的单元宽度与间距（是则超出横滑）
@property (nonatomic, assign) BOOL lockUnitToMaxEqualCount;

/// 尺寸变化（旋转/分屏）时是否自动重排按钮
@property (nonatomic, assign) BOOL autoRelayoutForBoundsChange;

/// 满足 [tabBarCtrl TabBar].xxx 的使用习惯
@property (nonatomic, strong, readonly) UIScrollView *TabBar;

/// 内容区（横向分页）的滚动视图
@property (nonatomic, strong, readonly) UIScrollView *contentScrollView;

/// 只读：所有按钮
@property (nonatomic, strong, readonly) NSArray<UIButton *> *buttons;

/// 只读：所有子控制器
@property (nonatomic, strong, readonly) NSArray<UIViewController *> *controllers;

/// 当前选中下标
@property (nonatomic, assign, readonly) NSInteger selectedIndex;

/// 首次构建完按钮（addSubview 完）回调——只调一次
@property (nonatomic, copy, nullable) JobsTabBarButtonsBlock onButtonsBuilt;

/// 每次布局完按钮 frame 之后回调（含旋转/尺寸变化后）——可在此重复“中间按钮凸起”
@property (nonatomic, copy, nullable) JobsTabBarButtonsBlock onButtonsLayouted;

/// 配置数据源：按钮数组 + 子控制器数组（仅取前 N 个，N = min(btns, ctrls)）
- (void)setDataSourceWithButtons:(NSArray<UIButton *> *)buttons
                     controllers:(NSArray<UIViewController *> *)controllers;

/// 切页（按钮 + 内容滚动同步）
- (void)selectIndex:(NSInteger)index animated:(BOOL)animated;

#pragma mark - 链式配置（尽量贴近 Swift 版本）

- (instancetype)bySwipeEnabled:(BOOL)flag;
- (instancetype)byHorizontalOnly:(BOOL)flag;
- (instancetype)bySuppressChildVerticalScrolls:(BOOL)flag;

- (instancetype)byBarBackgroundColor:(UIColor *)color;
- (instancetype)byCustomBarHeight:(nullable NSNumber *)height;   ///< 传 nil = 用默认高度
- (instancetype)byBarBottomOffset:(CGFloat)offset;
- (instancetype)byBarBackgroundImage:(nullable UIImage *)image;

- (instancetype)byContentInset:(UIEdgeInsets)inset;
- (instancetype)byEqualSpacing:(CGFloat)spacing;
- (instancetype)byEqualVisibleRangeMin:(NSInteger)min max:(NSInteger)max;
- (instancetype)byLockUnitToMaxEqualCount:(BOOL)flag;
- (instancetype)byAutoRelayoutForBoundsChange:(BOOL)flag;

- (instancetype)onButtonsBuilt:(JobsTabBarButtonsBlock)block;
- (instancetype)onButtonsLayouted:(JobsTabBarButtonsBlock)block;
- (instancetype)onButtonsLayoutedWeakOwner:(JobsTabBarButtonsOwnerBlock)block;

/// 一次性塞数据源
- (instancetype)byDataSourceButtons:(NSArray<UIButton *> *)buttons
                        controllers:(NSArray<UIViewController *> *)controllers;

@end

NS_ASSUME_NONNULL_END
