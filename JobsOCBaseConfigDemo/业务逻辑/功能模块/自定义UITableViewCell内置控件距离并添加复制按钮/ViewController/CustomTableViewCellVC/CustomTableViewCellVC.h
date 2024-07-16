//
//  CustomTableViewCellVC.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/27.
//

#import "BaseViewController.h"
#import "BaiShaETProjOrderDetailsCVCell.h"
#import "NSObject+JobsDeployCellConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomTableViewCellVC : BaseViewController
<
UICollectionViewDataSource
,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout
>

@end

NS_ASSUME_NONNULL_END
