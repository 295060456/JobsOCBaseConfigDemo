//
//  MainTableViewCellITem.h
//  BlankProject
//
//  Created by mac on 17/6/15.
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
#import "TableModel.h"

@interface MainTableViewCellITem : UICollectionViewCell<BindViewModelProtocol>

@end
