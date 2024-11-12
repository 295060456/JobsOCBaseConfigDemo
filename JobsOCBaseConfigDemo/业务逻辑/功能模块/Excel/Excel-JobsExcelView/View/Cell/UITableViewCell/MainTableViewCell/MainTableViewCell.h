//
//  MainTableViewCell.h
//  BlankProject
//
//  Created by mac on 17/6/15.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsBaseTableViewCell.h"
#import "MainTableViewCellItem.h"

#import "BaseCellProtocol.h"
#import "JobsExcelConfigureViewModel.h"
@class UIButtonModel;

@protocol MianTableViewCellDelegate <NSObject>
-(jobsByScrollViewBlock _Nonnull)mianTableViewCellScrollerDid;
@end

@interface MainTableViewCell : JobsBaseTableViewCell
<
BaseCellProtocol,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>
/// Data
@property(nonatomic,weak)NSObject <MianTableViewCellDelegate>*delegate;

-(jobsByPointBlock _Nonnull)scrollerItemBy;

@end
