//
//  NSObject+DataBinding.h
//  DouDong-II
//
//  Created by Jobs on 2021/4/22.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "UIViewModelOthersProtocol.h"

NS_ASSUME_NONNULL_BEGIN
/**
    数据绑定专用参数
 */
@interface NSObject (DataBinding)
<
UITableViewDelegate
,UITableViewDataSource
,UICollectionViewDelegate
,UICollectionViewDataSource
,UIViewModelOthersProtocol
>

-(void)dataLinkByTableView:(UITableView *)tableView;
-(void)dataLinkByCollectionView:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END
