//
//  JobsTabBarCtrl.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/10/16.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "DefineProperty.h"
#import "JobsBlock.h"
#import "UIViewController+Extra.h"

NS_ASSUME_NONNULL_BEGIN

@class JobsTabBarCtrl;

@interface JobsTabBarCtrl : BaseViewController <UIScrollViewDelegate>
/// 是否允许内容区域左右滑动
Prop_assign()BOOL swipeEnabled;
/// 只允许横向翻页（默认 YES）
Prop_assign()BOOL horizontalOnly;
/// 可选：对子 VC 内滚动视图禁用纵向滚动
Prop_assign()BOOL suppressChildVerticalScrolls;
/// TabBar 高度；nil 表示用默认：49 + safeAreaBottom
Prop_strong(nullable)NSNumber *customBarHeight;
/// 距底部上移量（>0 上移）
Prop_assign()CGFloat barBottomOffset;
/// TabBar 背景色
Prop_strong()UIColor *barBackgroundColor;
/// TabBar 背景图
Prop_strong(nullable)UIImage *barBackgroundImage;
/// TabBar 内边距
Prop_assign()UIEdgeInsets contentInset;
/// 按钮间距（2~5 等分时）
Prop_assign()CGFloat equalSpacing;
/// 2~5 的可见等分范围（上限用于 >5 时计算“单元宽度”）
Prop_assign()NSInteger equalVisibleMin;
Prop_assign()NSInteger equalVisibleMax;
/// >max(默认5) 时是否仍按“max 等分”的单元宽度布局
Prop_assign()BOOL lockUnitToMaxEqualCount;
/// 旋转 / 尺寸变化时是否自动重排按钮
Prop_assign()BOOL autoRelayoutForBoundsChange;
/// 数据源（按钮 / 控制器），只读
Prop_strong(readonly)NSMutableArray<__kindof UIButton *> *buttons;
Prop_strong(readonly)NSMutableArray<__kindof UIViewController *> *controllers;
/// 当前选中 index
Prop_assign(readonly)NSInteger selectedIndex;
/// 暴露 TabBar / 内容滚动视图
Prop_strong(readonly)UIScrollView *tabBar;
Prop_strong(readonly)UIScrollView *contentScrollView;
/// 首次构建完按钮回调（只调一次）
Prop_copy(nullable)jobsByArrBlock onButtonsBuilt;
/// 每次布局完按钮 frame 的回调（包括旋转后）
Prop_copy(nullable)jobsByArrBlock onButtonsLayouted;
/// 配置数据源
-(void)setDataSourceByButtons:(NSArray<UIButton *> *)buttons
                  controllers:(NSArray<UIViewController *> *)controllers;
/// 主动选中某个 index
-(void)selectIndex:(NSInteger)index animated:(BOOL)animated;
/// 手动触发布局重排
-(void)requestRelayout;

@end

#pragma mark - 链式配置（和 Swift 版保持风格）
@interface JobsTabBarCtrl (Chainable)

-(JobsRetTabBarCtrlByBOOLBlock _Nonnull)bySwipeEnabled;
-(JobsRetTabBarCtrlByBOOLBlock _Nonnull)byHorizontalOnly;
-(JobsRetTabBarCtrlByBOOLBlock _Nonnull)bySuppressChildVerticalScrolls;
-(JobsRetTabBarCtrlByColorBlock _Nonnull)byBarBackgroundColor;
-(JobsRetTabBarCtrlByNumberBlock _Nonnull)byCustomBarHeight;
-(JobsRetTabBarCtrlByCGFloatBlock _Nonnull)byBarBottomOffset;
-(JobsRetTabBarCtrlByImageBlock _Nonnull)byBarBackgroundImage;
-(JobsRetTabBarCtrlByInsetsBlock _Nonnull)byContentInset;
-(JobsRetTabBarCtrlByCGFloatBlock _Nonnull)byEqualSpacing;
-(JobsRetTabBarCtrlByBOOLBlock _Nonnull)byLockUnitToMaxEqualCount;
-(JobsRetTabBarCtrlByBOOLBlock _Nonnull)byAutoRelayoutForBoundsChange;
-(JobsRetTabBarCtrlByArrBlocks _Nullable)onButtonsBuilt;
-(JobsRetTabBarCtrlByArrBlocks _Nullable)onButtonsLayouted;

-(instancetype)byEqualVisibleRangeFrom:(NSInteger)min to:(NSInteger)max ;
-(instancetype)byDataSourceWithButtons:(NSArray<UIButton *> *)buttons controllers:(NSArray<UIViewController *> *)controllers ;
-(instancetype)onButtonsLayoutedWeakOwner:(void(^)(JobsTabBarCtrl *owner, NSArray<UIButton *> *buttons))block ;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsTabBarCtrl *_Nonnull
jobsMakeTabBarCtrl(jobsByJobsTabBarCtrlBlock _Nonnull block){
    JobsTabBarCtrl *data = JobsTabBarCtrl.alloc.init;
    if (block) block(data);
    return data;
}
