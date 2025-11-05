//
//  JXCategoryPopupVC.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/5/29.
//

#import "MacroDef_Func.h"

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#import "BaseViewController.h"
#import "JXCategoryPopupSubVC.h"
#import "UIViewController+TFPopupView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryPopupVC : BaseViewController
<
JXCategoryTitleViewDataSource
,JXCategoryListContainerViewDelegate
,JXCategoryViewDelegate
,TFPopupDelegate
>

@end

NS_ASSUME_NONNULL_END
