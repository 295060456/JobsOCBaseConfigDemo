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

@interface JobsExcelConfigureViewModel()

@property(nonatomic,assign)NSInteger rowNumber;/// 行数
@property(nonatomic,assign)NSInteger colNumber;/// 列数

@end

@implementation JobsExcelConfigureViewModel

- (instancetype)init{
    if (self = [super init]) {

    }return self;
}
#pragma mark —— lazyLoad
-(jobsByVoidBlock)configureData{
    @jobs_weakify(self)
    if(!_configureData){
        _configureData = ^() {
            @jobs_strongify(self)
            for (int i = 1; i < 50; i++) {/// y
                NSMutableArray <UIButtonModel *>*row = NSMutableArray.array;
                for (int j = 1; j < (self.topHeaderTitles.count ? : 30) ; j++){/// x
                    UIButtonModel *model = UIButtonModel.new;
                    
                    if(j == 1){
                        model.title = self.topHeaderTitles[j];
                    }else{
                        model.title = toStringByInt(i * j);
                    }

                    if(j == 2){
                        model.imagePlacement = NSDirectionalRectEdgeTrailing;
                        model.imagePadding = JobsWidth(8);
                        model.normalImage = JobsIMG(@"复制图标");
                        model.clickEventBlock = ^id _Nullable(UIButton *_Nullable data) {
                            data.titleForNormalState.pasteboard();
                            return nil;
                        };
                        model.enabled = YES;
                        
                    }
                    
                    model.baseBackgroundColor = i % 2 ? self.cor2: self.cor1;
                    model.backgroundImage = i % 2 ? self.image2: self.image1;
                    model.titleCor = JobsWhiteColor;
                    model.titleFont = UIFontWeightRegularSize(JobsWidth(10));
                    
        //            model.jobsTestBlock();
        //            model.jobsReturnedTestBlock(^id _Nullable(id  _Nullable data) {
        //                return nil;
        //            });
                    row.add(model);/// 一行的数据
                }
                self.contentArr.add(row);
            }
            
            self.rowNumber = self.contentArr[0].count;
            self.colNumber = self.contentArr.count;
            NSLog(@"");
        };
    }return _configureData;
}

-(NSMutableArray<NSMutableArray<UIButtonModel *> *> *)contentArr{
    if(!_contentArr){
        _contentArr = NSMutableArray.array;
    }return _contentArr;
}

-(UIButtonModel *)data_00{
    if(!_data_00){
        _data_00 = UIButtonModel.new;
        _data_00.title = self.topHeaderTitles[0] ? : JobsInternationalization(@"楼层");
        _data_00.titleCor = self.cor4;
        _data_00.baseBackgroundColor = self.cor0;
        _data_00.backgroundImage = self.image0;
    }return _data_00;
}

-(NSMutableArray<UIButtonModel *> *)topHeaderDatas{
    if(!_topHeaderDatas){
        _topHeaderDatas = NSMutableArray.array;
        for (int y = 1; y <= self.contentArr[0].count ; y++) {
            UIButtonModel *btnModel = UIButtonModel.new;
            btnModel.title = self.topHeaderTitles[y] ? : toStringByInt(y).add(JobsInternationalization(@"层"));
            btnModel.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
            btnModel.titleCor = self.cor4;
            btnModel.baseBackgroundColor = self.cor3;
            btnModel.backgroundImage = self.image3;
            _topHeaderDatas.add(btnModel);
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
            btnModel.baseBackgroundColor = y % 2 ? self.cor2 : self.cor1;
            btnModel.backgroundImage = y % 2 ? self.image2 : self.image1;
            _leftListDatas.add(btnModel);
        }
    }return _leftListDatas;
}
/// 整张Excel表的宽度
-(CGFloat)XZExcelW{
    if(!_XZExcelW){
        _XZExcelW = [JobsExcelView viewSizeWithModel:nil].width;
    }return _XZExcelW;
}
/// 整张Excel表的高度
-(CGFloat)XZExcelH{
    if(!_XZExcelH){
        _XZExcelH = [JobsExcelView viewSizeWithModel:nil].height;
    }return _XZExcelH;
}
/// 线宽
-(CGFloat)LineWidth{
    if(!_LineWidth){
        _LineWidth = 1;
    }return _LineWidth;
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
        _cor1 = JobsCor(@"#7900B2");
    }return _cor1;
}
/// 偶数行的背景颜色
-(UIColor *)cor2{
    if(!_cor2){
        _cor2 = JobsCor(@"#4B00AB");
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
/// 表格线的颜色
-(UIColor *)cor6{
    if(!_cor6){
        _cor6 = JobsGrayColor;
    }return _cor6;
}
/// 第一行、第一列格子的背景图片
-(UIImage *)image0{
    if(!_image0){
        _image0 = JobsIMG(@"Excel表头的背景图");
    }return _image0;
}
/// 奇数行的背景图片
-(UIImage *)image1{
    if(!_image1){
        _image1 = JobsIMG(@"");
    }return _image1;
}
/// 偶数行的背景图片
-(UIImage *)image2{
    if(!_image2){
        _image2 = JobsIMG(@"");
    }return _image2;
}
/// 第一行的背景图片
-(UIImage *)image3{
    if(!_image3){
        _image3 = JobsIMG(@"Excel表头的背景图");
    }return _image3;
}

-(NSMutableArray<NSString *> *)topHeaderTitles{
    if(!_topHeaderTitles){
        _topHeaderTitles = NSMutableArray.array;
    }return _topHeaderTitles;
}

-(NSMutableArray<NSString *> *)leftTitles{
    if(!_leftTitles){
        _leftTitles = NSMutableArray.array;
    }return _leftTitles;
}

-(CGFloat)itemH{
    if(!_itemH){
        _itemH = JobsWidth(35);
    }return _itemH;
}

-(CGFloat)itemW{
    if(!_itemW){
        _itemW = JobsWidth(60);
    }return _itemW;
}

@end
