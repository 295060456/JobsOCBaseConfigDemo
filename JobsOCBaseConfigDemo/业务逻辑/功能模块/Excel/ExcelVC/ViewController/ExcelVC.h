//
//  ExcelVC.h
//  JobsOCBaseConfig
//
//  Created by admin on 5/26/24.
//

#import "BaseViewController.h"

#import "ZMJClassDataVC.h"
#import "ZMJTimeableVC.h"
#import "ZMJScheduleVC.h"
#import "ZMJGanttListVC.h"

#import "XZExcelVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExcelVC : BaseViewController
<
BaseViewProtocol
,UITableViewDelegate
,UITableViewDataSource
>

@end

NS_ASSUME_NONNULL_END
