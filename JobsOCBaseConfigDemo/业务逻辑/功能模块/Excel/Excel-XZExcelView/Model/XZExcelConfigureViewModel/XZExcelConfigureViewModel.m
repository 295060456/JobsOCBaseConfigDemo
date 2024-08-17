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
const CGFloat LineWidth = 2;

@interface XZExcelConfigureViewModel()

@end

@implementation XZExcelConfigureViewModel

- (instancetype)init{
    if (self = [super init]) {
        [self configureData];
    }return self;
}

- (void)configureData{
    for (int i = 1; i <= 100; i++) {/// y
        self.titleArr.jobsAddObject(toStringByInt(i).add(JobsInternationalization(@"行")));
        TableModel *model = TableModel.new;
        model.rowTitle = toStringByInt(i).add(JobsInternationalization(@"楼"));
        for (int j = 1; j <= 100; j++) {
            ItemModel *itemM = ItemModel.new;
            itemM.contentStr = toStringByInt(i*j);
            model.itemArr.jobsAddObject(itemM);
        }self.contentArr.jobsAddObject(model);
    }
    
    self.itemH = 35;
    self.itemW = 60;
    self.rowNumber = self.titleArr.count;
    self.colNumber = self.contentArr.count;
    NSLog(@"");
}
#pragma mark —— lazyLoad
/// 第一（水平）行，除了第一个格子的，水平方向的数据
-(NSMutableArray<NSString *> *)titleArr{
    if (!_titleArr) {
        _titleArr = NSMutableArray.array;
    }return _titleArr;
}
/// 每一（水平）行的数据
-(NSMutableArray<TableModel *> *)contentArr{
    if(!_contentArr){
        _contentArr = NSMutableArray.array;
    }return _contentArr;
}

-(NSString *)contentStr_00{
    if(!_contentStr_00){
        _contentStr_00 = JobsInternationalization(@"楼层");
    }return _contentStr_00;
}

@end
