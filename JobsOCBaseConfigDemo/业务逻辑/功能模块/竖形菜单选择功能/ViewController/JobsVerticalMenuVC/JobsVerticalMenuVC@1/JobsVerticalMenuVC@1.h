//
//  JobsVerticalMenuVC@1.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/31/24.
//

#import "BaseViewController.h"
#import "JobsVerticalMenuDefineHeader.h"
#import "LeftCell.h"
#import "ThreeClassCell.h"
#import "GoodsClassModel.h"
#import "JobsSearchBar.h"
#import "BaiShaETProjPopupView10.h"

#import "JobsVerticalMenuSubVC.h"

NS_ASSUME_NONNULL_BEGIN
/// 左边的目录是UITableView，右边的内容是UIViewController
@interface JobsVerticalMenuVC_1 : BaseViewController
<
UITableViewDelegate
,UITableViewDataSource
,UICollectionViewDelegate
,UICollectionViewDataSource
>

@end

NS_ASSUME_NONNULL_END
