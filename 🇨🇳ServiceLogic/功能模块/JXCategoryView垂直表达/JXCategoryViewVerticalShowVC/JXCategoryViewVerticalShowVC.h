//
//  JXCategoryViewVerticalShowVC.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/15.
//

#import "BaseViewController.h"
#import "JXCategoryViewVerticalShowSubBaseVC.h"

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryViewVerticalShowVC : UIViewController//BaseViewController
<
JXCategoryTitleViewDataSource
,JXCategoryListContainerViewDelegate
,JXCategoryViewDelegate
>

@end

NS_ASSUME_NONNULL_END
