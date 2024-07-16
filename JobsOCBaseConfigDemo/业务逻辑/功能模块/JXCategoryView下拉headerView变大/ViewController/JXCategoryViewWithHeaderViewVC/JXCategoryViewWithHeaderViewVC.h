//
//  BaiShaETProjVIPVC.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/7.
//

#import "BaiShaETProjMembersSubsBaseVC.h"
#import "JXCategoryViewWithHeaderViewSubVC.h"

#import "BaiShaETProjCollectionHeaderView.h"

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryViewWithHeaderViewVC : BaiShaETProjMembersSubsBaseVC
<
JXCategoryTitleViewDataSource
,JXCategoryViewDelegate
,JXPagerViewDelegate
>

@end

NS_ASSUME_NONNULL_END
