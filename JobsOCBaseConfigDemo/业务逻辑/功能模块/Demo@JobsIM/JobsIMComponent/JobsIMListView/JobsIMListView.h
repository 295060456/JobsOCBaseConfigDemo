//
//  JobsIMListView.h
//  JobsIM
//
//  Created by Jobs on 2020/11/17.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

#if __has_include(<MGSwipeTableCell/MGSwipeTableCell.h>)
#import <MGSwipeTableCell/MGSwipeTableCell.h>
#else
#import "MGSwipeTableCell.h"
#endif

#import "JobsIMListTBVCell.h"
#import "LOTAnimationMJRefreshHeader.h"
#import "JobsIMListDataModel.h"
#import "UIImage+YBGIF.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsIMListView : BaseView
<
UITableViewDelegate
,UITableViewDataSource
,MGSwipeTableCellDelegate
>

@end

NS_ASSUME_NONNULL_END
