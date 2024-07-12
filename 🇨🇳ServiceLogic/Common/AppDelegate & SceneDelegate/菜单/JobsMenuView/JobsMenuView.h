//
//  JobsMenuView.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/10/24.
//

#import "BaseView.h"
#import "BaseViewProtocol.h"

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif
/**
    因为
    JobsMenuView : BaseView<BaseViewProtocol>
    HomeMenuSubBaseVC : BaseViewController<BaseViewControllerProtocol<BaseViewProtocol>>
    都共同继承自同一份协议BaseViewProtocol
    所以这里进行 #import "HomeMenuSubBaseVC.h" 将会引起编译器错误
 */
NS_ASSUME_NONNULL_BEGIN

@interface JobsMenuView : BaseView
<
JXCategoryTitleViewDataSource
,JXCategoryListContainerViewDelegate
,JXCategoryViewDelegate
>

@end

NS_ASSUME_NONNULL_END
