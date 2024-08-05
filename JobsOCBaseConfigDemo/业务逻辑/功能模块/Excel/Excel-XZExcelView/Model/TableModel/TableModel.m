//
//  TableModel.m
//  XZExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "TableModel.h"

@implementation TableModel

#pragma mark —— lazyLoad
- (NSMutableArray *)itemArr{
    if (!_itemArr) {
        _itemArr = NSMutableArray.array;
    }return _itemArr;
}

@end

@implementation ItemModel

@end
