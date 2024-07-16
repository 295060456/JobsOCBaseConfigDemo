//
//  TableViewCell.h
//  JobsSearch
//
//  Created by Jobs on 2020/10/22.
//

#import <UIKit/UIKit.h>
#import "BaseCellProtocol.h"
#import "JobsSearchConfig.h"
#import "JobsSearchDataCVCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchTBVCell : UITableViewCell
<
BaseCellProtocol
,UIViewModelProtocol
,UICollectionViewDataSource
,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout
>

@end

NS_ASSUME_NONNULL_END
