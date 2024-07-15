//
//  A_VC.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/8.
//

#import "BaseViewController.h"
#import "B_VC.h"

#import "MyFansTBVCell.h"
#import "PushAnimation.h"

NS_ASSUME_NONNULL_BEGIN
/// 参考源码： https://github.com/AmoAmoAmo/PushTransformAnimation
@interface A_VC : BaseViewController
<
UITableViewDelegate
,UITableViewDataSource
,UINavigationControllerDelegate
>

@property(nonatomic,strong,nullable)UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
