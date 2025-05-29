//
//  JXCategoryBaseView+Extra.h
//  FMNormal
//
//  Created by Jobs on 2025/5/29.
//

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryBaseView (Extra)

-(JobsReturnCategoryBaseViewByDelegateBlock _Nonnull)byDelegate;
-(JobsReturnCategoryBaseViewByCGFloatBlock _Nonnull)byCellSpacing;
-(JobsReturnCategoryBaseViewByViewBlock _Nonnull)byContentScrollView;
-(JobsReturnCategoryTitleViewByNSIntegerBlock _Nonnull)byDefaultSelectedIndex;
-(JobsReturnCategoryBaseViewByListContainerBlock _Nonnull)byListContainer;
-(JobsReturnCategoryBaseViewByVoidBlock _Nonnull)reloadDatasWithoutListContainer;

@end

NS_ASSUME_NONNULL_END
