//
//  XZExcelConfigureViewModel.m
//  XZExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "XZExcelConfigureViewModel.h"

NSString *const VerticalScrollBegin = @"VerticalScrollValue";
NSString *const HorizontalScrollBegin = @"HorizontalScrollValue";
const CGFloat LineWidth=2;

@interface XZExcelConfigureViewModel()

@end

@implementation XZExcelConfigureViewModel

- (instancetype)init{
    if (self=[super init]) {
        [self configureData];
    }return self;
}

- (void)configureData{
    for (int i = 0; i < 100; i++) {
        self.titleArr.jobsAddObject(toStringByInt(i).add(JobsInternationalization(@"行")));
    }
    
    for (int i = 0; i < 100; i++) {
        TableModel *model = TableModel.new;
        model.rowTitle = toStringByInt(i).add(JobsInternationalization(@"楼"));
        for (int j = 0; j < 100; j++) {
            ItemModel *itemM = ItemModel.new;
            itemM.contentStr = toStringByInt(i*j);
            model.itemArr.jobsAddObject(itemM);
        }[self.contentArr addObject:model];
    }
    
    self.itemH = 35;
    self.itemW = 60;
    self.rowNumber = self.titleArr.count;
    self.colNumber = self.contentArr.count;
}
#pragma mark —— lazyLoad
-(NSMutableArray<NSString *> *)titleArr{
    if (!_titleArr) {
        _titleArr = NSMutableArray.array;
    }return _titleArr;
}

-(NSMutableArray<TableModel *> *)contentArr{
    if(!_contentArr){
        _contentArr = NSMutableArray.array;
    }return _contentArr;
}

@end
