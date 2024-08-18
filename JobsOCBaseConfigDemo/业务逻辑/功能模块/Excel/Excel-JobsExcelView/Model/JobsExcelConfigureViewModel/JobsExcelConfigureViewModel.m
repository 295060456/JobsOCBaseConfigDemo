//
//  JobsExcelConfigureViewModel.m
//  JobsExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

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
        NSMutableArray <UIButtonModel *>*row = NSMutableArray.array;//30
        for (int j = 1; j <= 30; j++){/// x
            UIButtonModel *model = UIButtonModel.new;
            model.title = toStringByInt(i*j);
            model.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
            model.titleCor = JobsWhiteColor;
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
-(NSMutableArray<NSMutableArray<UIButtonModel *> *> *)contentArr{
    if(!_contentArr){
        _contentArr = NSMutableArray.array;
    }return _contentArr;
}

-(UIButtonModel *)data_00{
    if(!_data_00){
        _data_00 = UIButtonModel.new;
        _data_00.title = JobsInternationalization(@"楼层");
        _data_00.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
        _data_00.titleCor = JobsWhiteColor;
    }return _data_00;
}

-(NSMutableArray<UIButtonModel *> *)topHeaderDatas{
    if(!_topHeaderDatas){
        _topHeaderDatas = NSMutableArray.array;
        for (int y = 1; y <= self.contentArr[0].count ; y++) {
            UIButtonModel *btnModel = UIButtonModel.new;
            btnModel.title = toStringByInt(y).add(JobsInternationalization(@"层"));
            btnModel.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
            btnModel.titleCor = JobsWhiteColor;
            _topHeaderDatas.jobsAddObject(btnModel);
        }
    }return _topHeaderDatas;
}

-(NSMutableArray<UIButtonModel *> *)leftListDatas{
    if(!_leftListDatas){
        _leftListDatas = NSMutableArray.array;
        for (int y = 1; y <= self.contentArr.count ; y++) {
            UIButtonModel *btnModel = UIButtonModel.new;
            btnModel.title = toStringByInt(y).add(JobsInternationalization(@"楼"));
            btnModel.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
            btnModel.titleCor = JobsWhiteColor;
            _leftListDatas.jobsAddObject(btnModel);
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
