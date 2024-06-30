//
//  JobsUserHeaderDataView.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/19.
//

#import "BaseView.h"
#import "JobsUserHeaderDataViewTBVCell.h"
#import "JobsUserHeaderDataViewForHeaderInSection.h"
#import "UITableView+RegisterClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsUserHeaderDataView : BaseView
<
BaseViewProtocol
,UITableViewDelegate
,UITableViewDataSource
>

@end

NS_ASSUME_NONNULL_END
