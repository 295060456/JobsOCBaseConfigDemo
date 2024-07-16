//
//  UITableViewCellEditorVC.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/6.
//

#import "BaseViewController.h"
#import "JobsMsgDetailVC.h"
#import "MsgEditBoardView.h"
#import "JobsMsgDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCellEditorVC : BaseViewController
<
BaseViewProtocol
,UITableViewDelegate
,UITableViewDataSource
>

-(MsgEditBoardView *)getMsgEditBoardView;
-(UITableView *)getTableView;

@end

NS_ASSUME_NONNULL_END
