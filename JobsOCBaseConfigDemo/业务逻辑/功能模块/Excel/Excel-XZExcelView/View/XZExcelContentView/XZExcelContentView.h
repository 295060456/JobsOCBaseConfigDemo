//
//  XZExcelContentView.h
//  XZExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BindViewModelProtocol.h"

//#if __has_include(<SDAutoLayout/SDAutoLayout.h>)
//#import <SDAutoLayout/SDAutoLayout.h>
//#else
//#import "SDAutoLayout.h"
//#endif

#import "XZExcelConfigureViewModel.h"
#import "MainTableViewCell.h"
#import "TableModel.h"

@interface XZExcelContentView : UIView
<
UITableViewDelegate,
UITableViewDataSource,
MianTableViewCellDelegate,
BindViewModelProtocol
>

@end
