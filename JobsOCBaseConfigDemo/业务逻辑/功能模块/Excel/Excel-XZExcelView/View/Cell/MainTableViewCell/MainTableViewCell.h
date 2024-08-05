//
//  MainTableViewCell.h
//  BlankProject
//
//  Created by mac on 17/6/15.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BindViewModelProtocol.h"

#import "MainTableViewCellITem.h"
#import "XZExcelConfigureViewModel.h"
#import "TableModel.h"

@protocol MianTableViewCellDelegate <NSObject>

- (void)mianTableViewCellScrollerDid:(UIScrollView *)scrollview;

@end

@interface MainTableViewCell : UITableViewCell
<
BindViewModelProtocol,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>

@property(nonatomic,weak)id<MianTableViewCellDelegate>delegate;

+(MainTableViewCell*)dequeneCellWithTableView:(UITableView*)tableView;

- (void)scrollerItemWithContentOffset:(CGPoint )contentOffset;

@end
