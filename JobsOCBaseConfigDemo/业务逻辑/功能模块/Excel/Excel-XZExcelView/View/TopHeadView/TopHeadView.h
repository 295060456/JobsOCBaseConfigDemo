//
//  TopHeadView.h
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

#import "TopViewITem.h"
#import "XZExcelConfigureViewModel.h"

@interface TopHeadView : UIView
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
BindViewModelProtocol
>

@end
