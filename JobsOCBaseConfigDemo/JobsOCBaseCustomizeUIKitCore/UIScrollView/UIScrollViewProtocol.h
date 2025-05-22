//
//  UIScrollViewProtocol.h
//  FMNormal
//
//  Created by Jobs on 2025/5/19.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "DefineProperty.h"
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举

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
-(JobsReturnViewByVoidBlock _Nonnull)reloadDatas;
/// 得到visibleCells
-(NSArray <UIView *>*_Nullable)scrollViewCells;
/// 依据index得到cell
-(JobsReturnViewByNSUIntegerBlock _Nonnull)scrollViewCellsByIndex;
/// 对系统方法 - (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;  的二次封装
-(JobsReturnScrollViewByPointBlock _Nonnull)setContentOffsetByYES;
/// 对系统方法 - (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;  的二次封装
-(JobsReturnScrollViewByPointBlock _Nonnull)setContentOffsetByNO;
/// 对系统方法 - (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;   的二次封装
-(JobsReturnScrollViewByRectBlock _Nonnull)scrollRectToVisibleByYES;
/// 对系统方法 - (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;  的二次封装
-(JobsReturnScrollViewByRectBlock _Nonnull)scrollRectToVisibleByNO;
///
-(JobsReturnScrollViewByDelegateBlock _Nonnull)byDelegate;
-(JobsReturnScrollViewByBOOLBlock _Nonnull)showsVerticalScrollIndicatorBy;
-(JobsReturnScrollViewByBOOLBlock _Nonnull)showsHorizontalScrollIndicatorBy;
-(JobsReturnScrollViewBySizeBlock _Nonnull)byContentSize;
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
-(JobsReturnViewByViewBlock _Nonnull)showEmptyViewBy;
-(JobsReturnViewByButtonModelBlock _Nonnull)showEmptyButtonBy;
-(JobsReturnViewByTextModelBlock _Nonnull)showEmptyLabelBy;

@end

NS_ASSUME_NONNULL_END
