//
//  JobsVerticalMenuMainVC.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/31/24.
//

#import "BaseViewController.h"

#import "JobsVerticalMenuVC@0.h"
#import "JobsVerticalMenuVC@1.h"
#import "JobsVerticalMenuVC@2.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsVerticalMenuMainVC : BaseViewController
<
BaseViewProtocol
,UITableViewDelegate
,UITableViewDataSource
>

@end

NS_ASSUME_NONNULL_END
