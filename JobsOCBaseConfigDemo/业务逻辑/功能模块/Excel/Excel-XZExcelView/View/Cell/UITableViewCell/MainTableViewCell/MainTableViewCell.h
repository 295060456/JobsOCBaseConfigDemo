//
//  MainTableViewCell.h
//  BlankProject
//
//  Created by mac on 17/6/15.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBaseTableViewCell.h"
#import "MainTableViewCellITem.h"

#import "BaseCellProtocol.h"
#import "XZExcelConfigureViewModel.h"
#import "TableModel.h"

@protocol MianTableViewCellDelegate <NSObject>

- (void)mianTableViewCellScrollerDid:(UIScrollView *)scrollview;

@end

@interface MainTableViewCell : JobsBaseTableViewCell
<
BaseCellProtocol,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>

@property(nonatomic,weak)id<MianTableViewCellDelegate>delegate;

- (void)scrollerItemWithContentOffset:(CGPoint )contentOffset;

@end
