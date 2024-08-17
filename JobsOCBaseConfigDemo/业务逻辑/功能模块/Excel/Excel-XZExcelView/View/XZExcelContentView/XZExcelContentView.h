//
//  XZExcelContentView.h
//  XZExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"

#import "XZExcelConfigureViewModel.h"
#import "MainTableViewCell.h"

@interface XZExcelContentView : UIView
<
UITableViewDelegate,
UITableViewDataSource,
MianTableViewCellDelegate,
BaseViewProtocol
>

@end
