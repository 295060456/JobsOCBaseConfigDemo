//
//  BindViewModelProtocol.h
//  TeYouDian
//
//  Created by mac on 17/1/13.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

@protocol BindViewModelProtocol <NSObject>

@optional
- (void)viewBindViewModel:(id)viewModel;
- (void)cellBindViewModel:(id)viewModel;
- (void)cellBindModel:(id)model;
+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object;

@end
