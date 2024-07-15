//
//  JobsSearchVC.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "UIViewController+BaseNavigationBar.h"

#import "JobsSearchConfig.h"
#import "JobsSearchBar.h"
#import "JobsSearchTableViewHeaderView.h"
#import "JobsSearchShowHistoryDataTBVCell.h"/// 搜索历史
#import "JobsSearchShowHotwordsTBVCell.h"/// 热门搜索

#import "UITableView+WWFoldableTableView.h"
#import "JobsSearchTBVCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchVC : BaseViewController
<
UITableViewDelegate,
UITableViewDataSource
>

@property(nonatomic,assign)BOOL isOpenLetterCase;//模糊查询时，是否开启输入字母大小写检测？默认开启

@end

NS_ASSUME_NONNULL_END
