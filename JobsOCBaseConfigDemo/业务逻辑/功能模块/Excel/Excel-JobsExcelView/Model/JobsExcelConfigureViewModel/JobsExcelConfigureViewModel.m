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
#pragma mark —— 一些私有方法
-(jobsByButtonModelBlock _Nonnull)configCopy{
    return ^(__kindof UIButtonModel *_Nullable data){
        data.imagePlacement = NSDirectionalRectEdgeTrailing;
        data.imagePadding = JobsWidth(8);
        data.normalImage = JobsIMG(@"复制图标");
        data.clickEventBlock = ^id _Nullable(UIButton *_Nullable data) {
            data.titleForNormalState.pasteboard();
            return nil;
        };data.enabled = YES;
    };
}
#pragma mark —— lazyLoad
-(jobsByVoidBlock)configureData{
    @jobs_weakify(self)
    if(!_configureData){
        _configureData = ^() {
            @jobs_strongify(self)
            for (int i = 1; i < 50; i++) {/// y
                self.contentArr.add(jobsMakeMutArr(^(__kindof NSMutableArray <UIButtonModel *>*_Nullable row) {
                    @jobs_strongify(self)
                    for (int j = 1; j < (self.topHeaderTitles.count ? : 30) ; j++){/// x
                        row.add(jobsMakeButtonModel(^(__kindof UIButtonModel *_Nullable model) {
                            @jobs_strongify(self)
                            model.baseBackgroundColor = i % 2 ? self.cor2: self.cor1;
                            model.backgroundImage = i % 2 ? self.image2: self.image1;
                            model.titleCor = JobsWhiteColor;
                            model.titleFont = UIFontWeightRegularSize(JobsWidth(10));
                            model.title = j == 1 ? self.topHeaderTitles[j] : toStringByInt(i * j);
                            model.btn_width = [model.title jobsTextWidthWithFont:model.titleFont
                                                                      lineHeight:0
                                                                   controlHeight:self.itemH].jobsHeight;
                            NSLog(@"标题%@-长度%f",model.title,model.btn_width);
                            if(j == 2) self.configCopy(model);
                        }));/// 一行的数据
                    }
                }));
            }
            self.rowNumber = self.contentArr[0].count;
            self.colNumber = self.contentArr.count;
            NSLog(@"");
        };
    }return _configureData;
}
/// 起始格子的数据
-(UIButtonModel *)data_00{
    if(!_data_00){
        @jobs_weakify(self)
        _data_00 = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            @jobs_strongify(self)
            data.title = self.topHeaderTitles[0] ? : JobsInternationalization(@"楼层");
            data.titleCor = self.cor4;
            data.baseBackgroundColor = self.cor0;
            data.backgroundImage = self.image0;
        });
    }return _data_00;
}
/// 最上边（非0,0）横向格子的数据
-(NSMutableArray <UIButtonModel *>*)topHeaderDatas{
    if(!_topHeaderDatas){
        @jobs_weakify(self)
        _topHeaderDatas = jobsMakeMutArr(^(__kindof NSMutableArray <UIButtonModel *>*_Nullable data) {
            @jobs_strongify(self)
            for (int y = 1; y <= self.contentArr[0].count ; y++) {
                data.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data1) {
                    @jobs_strongify(self)
                    data1.title = self.topHeaderTitles[y] ? : toStringByInt(y).add(JobsInternationalization(@"层"));
                    data1.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
                    data1.titleCor = self.cor4;
                    data1.baseBackgroundColor = self.cor3;
                    data1.backgroundImage = self.image3;
                }));
            }
        });
    }return _topHeaderDatas;
}
/// 最左边（非0,0）垂直格子的数据
-(NSMutableArray <UIButtonModel *>*)leftListDatas{
    if(!_leftListDatas){
        @jobs_weakify(self)
        _leftListDatas = jobsMakeMutArr(^(__kindof NSMutableArray <UIButtonModel *>*_Nullable data) {
            @jobs_strongify(self)
            for (int y = 1; y <= self.contentArr.count ; y++) {
                data.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data1) {
                    @jobs_strongify(self)
                    data1.title = toStringByInt(y).add(JobsInternationalization(@"楼"));
                    data1.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
                    data1.titleCor = JobsWhiteColor;
                    data1.baseBackgroundColor = y % 2 ? self.cor2 : self.cor1;
                    data1.backgroundImage = y % 2 ? self.image2 : self.image1;
                }));
            }
        });
    }return _leftListDatas;
}
/// 整张Excel表的宽度
-(CGFloat)XZExcelW{
    if(!_XZExcelW){
        _XZExcelW = JobsExcelView.viewSizeByModel(nil).width;
    }return _XZExcelW;
}
/// 整张Excel表的高度
-(CGFloat)XZExcelH{
    if(!_XZExcelH){
        _XZExcelH = JobsExcelView.viewSizeByModel(nil).height;
    }return _XZExcelH;
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
        _topHeaderTitles = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            
        });
    }return _topHeaderTitles;
}

-(NSMutableArray<NSMutableArray<UIButtonModel *> *> *)contentArr{
    if(!_contentArr){
        _contentArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            
        });
    }return _contentArr;
}

-(NSMutableArray<NSString *> *)leftTitles{
    if(!_leftTitles){
        _leftTitles = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            
        });
    }return _leftTitles;
}

@end
