//
//  LeftListView.h
//  JobsExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"

#import "JobsExcelConfigureViewModel.h"
#import "TableViewOneCell.h"
@class UIButtonModel;

@interface JobsExcelLeftListView : UIView
<
UITableViewDelegate
,UITableViewDataSource
,BaseViewProtocol
>

@end
