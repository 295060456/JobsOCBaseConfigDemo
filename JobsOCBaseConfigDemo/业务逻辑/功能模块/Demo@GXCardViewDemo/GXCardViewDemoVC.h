//
//  GXCardViewDemoVC.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/7/6.
//

#import "BaseViewController.h"

#import "GXCardView.h"
#import "GXCardItemDemoCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface GXCardViewDemoVC : BaseViewController
<
GXCardViewDataSource
,GXCardViewDelegate
,UITableViewDelegate
>

@end

NS_ASSUME_NONNULL_END
