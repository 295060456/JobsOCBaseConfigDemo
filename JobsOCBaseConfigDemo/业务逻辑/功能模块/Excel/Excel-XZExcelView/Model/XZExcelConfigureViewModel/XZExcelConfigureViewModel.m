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
// toStringByInt(i*j).add(JobsInternationalization(@"楼"));
@implementation XZExcelConfigureViewModel

- (instancetype)init{
    if (self = [super init]) {
        [self configureData];
    }return self;
}

- (void)configureData{
    for (int i = 1; i <= 50; i++) {/// y
        NSMutableArray <UITextModel *>*row = NSMutableArray.array;
        for (int j = 1; j <= 30; j++){/// x
            UITextModel *model = UITextModel.new;
            model.text = toStringByInt(i*j);
            row.jobsAddObject(model);/// 一行的数据
        }self.contentArr.jobsAddObject(row);
    }
    
    self.itemH = 35;
    self.itemW = 60;
    self.rowNumber = self.contentArr[0].count;
    self.colNumber = self.contentArr.count;
    NSLog(@"");
}
#pragma mark —— lazyLoad
-(NSMutableArray<NSMutableArray<UITextModel *> *> *)contentArr{
    if(!_contentArr){
        _contentArr = NSMutableArray.array;
    }return _contentArr;
}

-(NSString *)contentStr_00{
    if(!_contentStr_00){
        _contentStr_00 = JobsInternationalization(@"楼层");
    }return _contentStr_00;
}

-(NSMutableArray<UITextModel *> *)topHeaderDatas{
    if(!_topHeaderDatas){
        _topHeaderDatas = NSMutableArray.array;
        for (int y = 1; y <= self.contentArr[0].count ; y++) {
            UITextModel *textModel = UITextModel.new;
            textModel.text = toStringByInt(y).add(JobsInternationalization(@"行"));
            _topHeaderDatas.jobsAddObject(textModel);
        }
    }return _topHeaderDatas;
}

-(NSMutableArray<UITextModel *> *)leftListDatas{
    if(!_leftListDatas){
        _leftListDatas = NSMutableArray.array;
        for (int y = 1; y <= self.contentArr.count ; y++) {
            UITextModel *textModel = UITextModel.new;
            textModel.text = toStringByInt(y).add(JobsInternationalization(@"楼"));
            _leftListDatas.jobsAddObject(textModel);
        }
    }return _leftListDatas;
}

@end
