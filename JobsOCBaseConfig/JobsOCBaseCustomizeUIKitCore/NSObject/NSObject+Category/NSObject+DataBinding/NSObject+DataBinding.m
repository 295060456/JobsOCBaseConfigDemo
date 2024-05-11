//
//  NSObject+DataBinding.m
//  DouDong-II
//
//  Created by Jobs on 2021/4/22.
//

#import "NSObject+DataBinding.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"

@implementation NSObject (DataBinding)

-(void)dataLinkByTableView:(UITableView *)tableView{
    tableView.delegate = self;
    tableView.dataSource = self;
}

-(void)dataLinkByCollectionView:(UICollectionView *)collectionView{
    collectionView.delegate = self;
    collectionView.dataSource = self;
}
#pragma mark —— UIViewModelOthersProtocol// requestParams
#pragma mark —— @property(nonatomic,strong,nullable)id __block data;/// 绑定的数据源，数据类型id
JobsKey(_data)
@dynamic data;
-(id)data{
    return Jobs_getAssociatedObject(_data);
}

-(void)setData:(id)data{
    Jobs_setAssociatedRETAIN_NONATOMIC(_data, data)
}
#pragma mark —— id __block requestParams;/// 绑定的数据源，数据类型id
JobsKey(_requestParams)
@dynamic requestParams;
-(id)requestParams{
    return Jobs_getAssociatedObject(_requestParams);
}

-(void)setRequestParams:(id)requestParams{
    Jobs_setAssociatedRETAIN_NONATOMIC(_requestParams, requestParams)
}

@end

#pragma clang diagnostic pop
