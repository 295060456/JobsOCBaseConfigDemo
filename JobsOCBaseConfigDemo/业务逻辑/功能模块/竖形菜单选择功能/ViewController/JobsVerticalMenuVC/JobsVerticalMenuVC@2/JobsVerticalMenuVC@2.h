//
//  JobsVerticalMenuVC@2.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/31/24.
//

#import "JobsVerticalMenuDefineHeader.h"
#import "LeftCell.h"
#import "ThreeClassCell.h"
#import "GoodsClassModel.h"
#import "JobsSearchBar.h"
#import "BaiShaETProjPopupView10.h"

NS_ASSUME_NONNULL_BEGIN
/// 左边的目录是UITableView，右边的内容是UICollectionView
@interface JobsVerticalMenuVC_2 : BaseViewController
<
UITableViewDelegate
,UITableViewDataSource
,UICollectionViewDelegate
,UICollectionViewDataSource
>

@end

NS_ASSUME_NONNULL_END
