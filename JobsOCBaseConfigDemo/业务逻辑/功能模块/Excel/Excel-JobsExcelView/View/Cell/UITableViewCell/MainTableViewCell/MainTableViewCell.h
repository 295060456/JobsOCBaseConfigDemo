//
//  MainTableViewCell.h
//  BlankProject
//
//  Created by mac on 17/6/15.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import <UIKit/UIKit.h>
#import "JobsBaseTableViewCell.h"
#import "MainTableViewCellItem.h"

#import "BaseCellProtocol.h"
#import "JobsExcelConfigureViewModel.h"

@protocol MianTableViewCellDelegate <NSObject>
-(void)mianTableViewCellScrollerDid:(UIScrollView *)scrollview;
@end

@interface MainTableViewCell : JobsBaseTableViewCell
<
BaseCellProtocol,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>
/// UI
@property(nonatomic,strong)UICollectionView *collectionView;
/// Data
@property(nonatomic,weak)NSObject <MianTableViewCellDelegate>*delegate;

-(void)scrollerItemWithContentOffset:(CGPoint )contentOffset;

@end
