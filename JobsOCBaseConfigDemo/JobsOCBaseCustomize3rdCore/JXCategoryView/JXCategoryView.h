//
//  JXCategoryView.h
//  FM_Normal
//
//  Created by Admin on 15/4/2025.
//

#import "BaseView.h"

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryView : BaseView

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JXCategoryTitleView *_Nonnull jobsMakeCategoryTitleView(jobsByCategoryTitleViewBlock _Nullable block){
    JXCategoryTitleView *data = JXCategoryTitleView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JXCategoryImageView *_Nonnull jobsMakeCategoryImageView(jobsByCategoryImageViewBlock _Nullable block){
    JXCategoryImageView *data = JXCategoryImageView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JXCategoryDotView *_Nonnull jobsMakeCategoryDotView(jobsByCategoryDotViewBlock _Nullable block){
    JXCategoryDotView *data = JXCategoryDotView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JXCategoryNumberView *_Nonnull jobsMakeCategoryNumberView(jobsByCategoryNumberViewBlock _Nullable block){
    JXCategoryNumberView *data = JXCategoryNumberView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JXCategoryIndicatorBackgroundView *_Nonnull jobsMakeCategoryIndicatorBackgroundView(jobsByCategoryIndicatorBackgroundViewBlock _Nullable block){
    JXCategoryIndicatorBackgroundView *data = JXCategoryIndicatorBackgroundView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JXCategoryIndicatorLineView *_Nonnull jobsMakeCategoryIndicatorLineView(jobsCategoryIndicatorLineViewBlock _Nullable block){
    JXCategoryIndicatorLineView *data = JXCategoryIndicatorLineView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JXCategoryListContainerView *_Nonnull jobsMakeCategoryListContainerViewByScrollViewStyle(id<JXCategoryListContainerViewDelegate> delegate){
    JXCategoryListContainerView *data = [JXCategoryListContainerView.alloc initWithType:JXCategoryListContainerType_ScrollView
                                                                               delegate:delegate];
    return data;
}

NS_INLINE __kindof JXCategoryListContainerView *_Nonnull jobsMakeCategoryListContainerViewByCollectionViewStyle(id<JXCategoryListContainerViewDelegate> delegate){
    JXCategoryListContainerView *data = [JXCategoryListContainerView.alloc initWithType:JXCategoryListContainerType_CollectionView
                                                                               delegate:delegate];
    return data;
}
