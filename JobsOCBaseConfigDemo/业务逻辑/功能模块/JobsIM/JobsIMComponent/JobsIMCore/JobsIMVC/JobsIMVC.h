//
//  JobsIMVC.h
//  JobsIM
//
//  Created by Jobs on 2020/11/10.
//

#import <UIKit/UIKit.h>
#import "JobsIMChatInfoTBVCell.h"
#import "JobsIMInputview.h"
#import "LOTAnimationMJRefreshHeader.h"
#import "JobsIMChatInfoModel.h"
#import "JobsTimeModel.h"
#import "BaseViewController.h"

#if __has_include(<MGSwipeTableCell/MGSwipeTableCell.h>)
#import <MGSwipeTableCell/MGSwipeTableCell.h>
#else
#import "MGSwipeTableCell.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsIMVC : BaseViewController
<
UITableViewDelegate
,UITableViewDataSource
,MGSwipeTableCellDelegate
>

@end

NS_ASSUME_NONNULL_END
