//
//  UIScrollViewProtocol.h
//  FMNormal
//
//  Created by Jobs on 2025/5/19.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "DefineProperty.h"
#import "JobsDefineAllEnumHeader.h"            // 此文件用来存储记录全局的一些枚举

NS_ASSUME_NONNULL_BEGIN

#ifndef JobsEmptyViewType_h
#define JobsEmptyViewType_h
typedef NS_OPTIONS(NSUInteger, JobsEmptyViewType) {
    JobsEmptyViewTypeNone       = 0,
    JobsEmptyViewTypeLabel      = 1 << 0,
    JobsEmptyViewTypeButton     = 1 << 1,
    JobsEmptyViewTypeCustomView = 1 << 2,
};
#endif /* JobsEmptyViewType_h */

@protocol UIScrollViewProtocol <NSObject>
@optional
#pragma mark —— UIScrollView
/// UIScrollView 滑动的方向定义
Prop_assign()ScrollDirection direction;
/// 在 UIScrollViewDelegate协议方法 -(void)scrollViewDidScroll:(UIScrollView *)scrollView里进行调用
-(ScrollDirection)scrolldirectionWhenScrollViewDidScroll;
/// 刷新UI
-(JobsRetViewByVoidBlock _Nonnull)reloadDatas;
/// 得到visibleCells
-(NSArray <UIView *>*_Nullable)scrollViewCells;
/// 依据index得到cell
-(JobsRetViewByNSUIntegerBlock _Nonnull)scrollViewCellsByIndex;
/// 对系统方法 - (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;  的二次封装
-(JobsRetScrollViewByPointBlock _Nonnull)setContentOffsetByYES;
/// 对系统方法 - (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;  的二次封装
-(JobsRetScrollViewByPointBlock _Nonnull)setContentOffsetByNO;
/// 对系统方法 - (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;   的二次封装
-(JobsRetScrollViewByFrameBlock _Nonnull)scrollRectToVisibleByYES;
/// 对系统方法 - (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;  的二次封装
-(JobsRetScrollViewByFrameBlock _Nonnull)scrollRectToVisibleByNO;
///
-(JobsRetScrollViewByDelegateBlock _Nonnull)byDelegate;
-(JobsRetScrollViewByBOOLBlock _Nonnull)showsVerticalScrollIndicatorBy;
-(JobsRetScrollViewByBOOLBlock _Nonnull)showsHorizontalScrollIndicatorBy;
-(JobsRetScrollViewBySizeBlock _Nonnull)byContentSize;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byContentWidth;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byContentHeight;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byScrollEnabled;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byBounces;
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byEdgeInsets;
-(JobsReturnScrollViewByMJRefreshHeaderBlock _Nonnull)byMJRefreshHeader;
-(JobsReturnScrollViewByMJRefreshFooterBlock _Nonnull)byMJRefreshFooter;
#pragma mark —— AnimationKit
-(void)moveAnimWithSortingType:(SortingType)sortingType
                animationBlock:(jobsByVoidBlock _Nullable)animationBlock
               completionBlock:(jobsByIDBlock _Nullable)completionBlock;
/// moveSpringAnimation
-(void)moveSpringAnimWithSortingType:(SortingType)sortingType
                      animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                     completionBlock:(jobsByIDBlock _Nullable)completionBlock;
/// alphaAnimation
-(void)alphaAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                completionBlock:(jobsByIDBlock _Nullable)completionBlock;
/// fallAnimation
-(void)fallAnimWithSortingType:(SortingType)sortingType
                animationBlock:(jobsByVoidBlock _Nullable)animationBlock
               completionBlock:(jobsByIDBlock _Nullable)completionBlock;
/// shakeAnimation
-(void)shakeAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                completionBlock:(jobsByIDBlock _Nullable)completionBlock;
/// overTurnAnimation
-(void)overTurnAnimWithSortingType:(SortingType)sortingType
                    animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                   completionBlock:(jobsByIDBlock _Nullable)completionBlock;
/// toTopAnimation
-(void)toTopAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                completionBlock:(jobsByIDBlock _Nullable)completionBlock;
/// springListAnimation
-(void)springListAnimWithSortingType:(SortingType)sortingType
                      animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                     completionBlock:(jobsByIDBlock _Nullable)completionBlock;
/// shrinkToTopAnimation
-(void)shrinkToTopAnimWithSortingType:(SortingType)sortingType
                       animationBlock:(jobsByVoidBlock _Nullable)animationBlock;
/// layDownAnimation
-(void)layDownAnimWithSortingType:(SortingType)sortingType
                   animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                  completionBlock:(jobsByIDBlock _Nullable)completionBlock;
/// roteAnimation
-(void)roteAnimWithSortingType:(SortingType)sortingType
                animationBlock:(jobsByVoidBlock _Nullable)animationBlock
               completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— EmptyData
Prop_assign()JobsEmptyViewType jobsEmptyViewType;
Prop_strong()UITextModel *textModelEmptyData;
Prop_strong()UIButtonModel *buttonModelEmptyData;
Prop_strong()__kindof UIView *emptyDataView;
-(JobsRetViewByViewBlock _Nonnull)showEmptyViewBy;
-(JobsReturnViewByButtonModelBlock _Nonnull)showEmptyButtonBy;
-(JobsReturnViewByTextModelBlock _Nonnull)showEmptyLabelBy;
-(JobsRetScrollViewByButtonModelBlock _Nonnull)emptyDataByButtonModel;

@end

NS_ASSUME_NONNULL_END
