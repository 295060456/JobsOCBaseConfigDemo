//
//  JobsUserHeaderDataView.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/19.
//

#import "BaseView.h"
#import "JobsBlock.h"
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

-(__kindof JobsUserHeaderDataView *)makeImageByBlock:(jobsByIDBlock _Nullable)block
                                         finishBlock:(jobsByVoidBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
