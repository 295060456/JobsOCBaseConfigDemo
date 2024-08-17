//
//  TableModel.h
//  XZExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject

@property(nonatomic,copy)NSString *contentStr;/// 除了第一（水平）行以外，每一行【除了】第一个格子以外，剩下的数据

@end

@interface TableModel : NSObject

@property(nonatomic,copy)NSString *rowTitle;/// 除了第一（水平）行以外，每一（水平）行第一个格子的数据
@property(nonatomic,copy)NSMutableArray <ItemModel *>*itemArr;

@end
