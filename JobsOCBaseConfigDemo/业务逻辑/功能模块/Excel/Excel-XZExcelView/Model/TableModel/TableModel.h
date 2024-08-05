//
//  TableModel.h
//  XZExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject

@property(nonatomic,copy)NSString *contentStr;

@end

@interface TableModel : NSObject

@property(nonatomic,copy)NSString *rowTitle;
@property(nonatomic,copy)NSMutableArray <ItemModel *>*itemArr;

@end
