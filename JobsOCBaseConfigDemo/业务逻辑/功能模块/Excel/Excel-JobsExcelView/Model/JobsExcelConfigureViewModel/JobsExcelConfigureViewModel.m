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
            model.title = toStringByInt(i * j);
            model.baseBackgroundColor = i % 2 ? self.cor2: self.cor1;
            model.titleCor = JobsWhiteColor;
//            model.jobsTestBlock();
//            model.jobsReturnedTestBlock(^id _Nullable(id  _Nullable data) {
//                return nil;
//            });
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
        _data_00.baseBackgroundColor = self.cor0;
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
/// 第一行、第一列格子的背景颜色
-(UIColor *)cor0{
    if(!_cor0){
        _cor0 = self.cor1;
    }return _cor0;
}
/// 奇数行的背景颜色
-(UIColor *)cor1{
    if(!_cor1){
        _cor1 = JobsRedColor;
    }return _cor1;
}
/// 偶数行的背景颜色
-(UIColor *)cor2{
    if(!_cor2){
        _cor2 = JobsGreenColor;
    }return _cor2;
}
/// 第一行的背景颜色
-(UIColor *)cor3{
    if(!_cor3){
        _cor3 = self.cor1;
    }return _cor3;
}
/// 第一行的主文字颜色
-(UIColor *)cor4{
    if(!_cor4){
        _cor4 = JobsBlackColor;
    }return _cor4;
}
/// 其他行的主文字颜色
-(UIColor *)cor5{
    if(!_cor5){
        _cor5 = JobsWhiteColor;
    }return _cor5;
}

@end
