//
//  JobsExcelConfigureViewModel.m
//  JobsExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import "JobsExcelConfigureViewModel.h"

NSString *const VerticalScrollBegin = @"VerticalScrollValue";
NSString *const HorizontalScrollBegin = @"HorizontalScrollValue";
const CGFloat LineWidth = 2;

@interface JobsExcelConfigureViewModel()

@end

@implementation JobsExcelConfigureViewModel

- (instancetype)init{
    if (self = [super init]) {
        [self configureData];
    }return self;
}

- (void)configureData{
    for (int i = 1; i <= 50; i++) {/// y
        NSMutableArray <UITextModel *>*row = NSMutableArray.array;//30
        for (int j = 1; j <= 30; j++){/// x
            UITextModel *model = UITextModel.new;
            model.text = toStringByInt(i*j);
            row.jobsAddObject(model);/// 一行的数据
        }
        self.contentArr.jobsAddObject(row);//50
    }
    
    self.itemH = 35;
    self.itemW = 60;
    self.rowNumber = self.contentArr[0].count;// 30
    self.colNumber = self.contentArr.count;// 50
    NSLog(@"");
}
#pragma mark —— lazyLoad
-(NSMutableArray<NSMutableArray<UITextModel *> *> *)contentArr{
    if(!_contentArr){
        _contentArr = NSMutableArray.array;
    }return _contentArr;
}

-(UITextModel *)textModel_00{
    if(!_textModel_00){
        _textModel_00 = UITextModel.new;
        _textModel_00.text = JobsInternationalization(@"楼层");
    }return _textModel_00;
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

-(CGFloat)XZExcelW{
    if(!_XZExcelW){
        _XZExcelW = [JobsExcelView viewSizeWithModel:nil].width;
    }return _XZExcelW;
}

-(CGFloat)XZExcelH{
    if(!_XZExcelH){
        _XZExcelH = [JobsExcelView viewSizeWithModel:nil].height;
    }return _XZExcelH;
}

@end
