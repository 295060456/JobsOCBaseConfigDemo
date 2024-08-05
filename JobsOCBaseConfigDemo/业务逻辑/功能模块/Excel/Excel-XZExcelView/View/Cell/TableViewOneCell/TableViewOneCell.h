//
//  TableViewOneCell.h
//  BlankProject
//
//  Created by mac on 17/6/15.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BindViewModelProtocol.h"

#import "XZExcelConfigureViewModel.h"
#import "TableModel.h"

@interface TableViewOneCell : UITableViewCell<BindViewModelProtocol>

+(TableViewOneCell*)dequeneCellWithTableView:(UITableView*)tableView;

@end
