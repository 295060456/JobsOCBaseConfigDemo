//
//  JobsVerticalMenuVC@0.h
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

#import "JobsVerticalMenuSubView.h" // 新的自定义UIView类

NS_ASSUME_NONNULL_BEGIN
/// 左边的目录是UITableView，右边的内容是UIView
@interface JobsVerticalMenuVC_0 : BaseViewController
<
UITableViewDelegate,
UITableViewDataSource
>

@end

NS_ASSUME_NONNULL_END
