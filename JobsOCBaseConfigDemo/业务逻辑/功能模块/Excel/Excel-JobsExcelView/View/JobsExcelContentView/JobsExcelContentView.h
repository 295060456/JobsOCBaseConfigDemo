//
//  JobsExcelContentView.h
//  JobsExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"

#import "JobsExcelConfigureViewModel.h"
#import "MainTableViewCell.h"
@class UIButtonModel;

@interface JobsExcelContentView : UIView
<
UITableViewDelegate,
UITableViewDataSource,
MianTableViewCellDelegate,
BaseViewProtocol
>

@end
