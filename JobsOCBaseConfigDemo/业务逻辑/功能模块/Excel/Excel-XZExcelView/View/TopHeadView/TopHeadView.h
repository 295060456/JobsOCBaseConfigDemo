//
//  TopHeadView.h
//  XZExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"

#import "TopViewITem.h"
#import "XZExcelConfigureViewModel.h"

@interface TopHeadView : UIView
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
BaseViewProtocol
>

@end
