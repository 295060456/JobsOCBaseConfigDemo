//
//  JobsExcelConfigureViewModel.m
//  JobsExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "JobsExcelConfigureViewModel.h"

@interface JobsExcelConfigureViewModel()

@property(nonatomic,assign)NSInteger rowNumber;/// 行数
@property(nonatomic,assign)NSInteger colNumber;/// 列数

@end

@implementation JobsExcelConfigureViewModel

- (instancetype)init{
    if (self = [super init]) {
        self.verticalScrollSignal = RACSubject.subject;
        self.horizontalScrollSignal = RACSubject.subject;
    }return self;
}
#pragma mark —— lazyLoad
/// 因为UI架构的原因，数据必须先行后列
-(jobsByIDBlock _Nonnull)configureDataBy{
    @jobs_weakify(self)
    return ^(id _Nullable data){
        @jobs_strongify(self)
        /// 左边的标题
        self.leftTitles = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            data.add(@"1");
            data.add(@"2");
            data.add(@"3");
            data.add(@"4");
            data.add(@"5");
            data.add(@"6");
        });
        self.leftListDatas = jobsMakeMutArr(^(__kindof NSMutableArray <UIButtonModel *>*_Nullable data) {
            @jobs_strongify(self)
            for (int y = 1; y <= self.leftTitles.count ; y++) {
                data.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data1) {
                    @jobs_strongify(self)
                    data1.title = self.leftTitles[y - 1];
                    data1.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
                    data1.titleCor = JobsWhiteColor;
                    data1.baseBackgroundColor = y % 2 ? self.cor2 : self.cor1;
                    data1.backgroundImage = y % 2 ? self.image2 : self.image1;
                }));
            }
        });
        /// 头部标题
        self.topHeaderTitles = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable arr) {
            arr.add(JobsInternationalization(@"数字/标题"));
            arr.add(JobsInternationalization(@"标题一"));
            arr.add(JobsInternationalization(@"标题二"));
            arr.add(JobsInternationalization(@"标题三"));
            arr.add(JobsInternationalization(@"标题四"));
            arr.add(JobsInternationalization(@"标题五"));
            arr.add(JobsInternationalization(@"标题六"));
            arr.add(JobsInternationalization(@"标题七"));
            arr.add(JobsInternationalization(@"标题八"));
            arr.add(JobsInternationalization(@"标题九"));
        });
        /// 第一个元素
        self.data_00 = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
            @jobs_strongify(self)
            model.title = self.topHeaderTitles[0];
            model.titleCor = self.cor4;
            model.baseBackgroundColor = self.cor0;
            model.backgroundImage = self.image0;
        });
        /// 因为第一个元素是00，所以少一个。实际取值从下标1开始
        /// 先行后列
        for (int i = 0; i < self.leftTitles.count; i++){/// 行
            self.contentArr.add(jobsMakeMutArr(^(__kindof NSMutableArray <UIButtonModel *>*_Nullable colArr) {
                @jobs_strongify(self)
                for (int j = 1; j < self.topHeaderTitles.count ; j++){/// 列
                    colArr.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
                        @jobs_strongify(self)
                        model.title = self.leftTitles[i].add(@"@").add(self.topHeaderTitles[j]);
                        if(j == 2){
                            model.enabled = YES;
                            model.imagePlacement = NSDirectionalRectEdgeTrailing;
                            model.imagePadding = JobsWidth(8);
                            model.normalImage = JobsIMG(@"复制图标");
                            model.clickEventBlock = ^id _Nullable(UIButton *_Nullable data) {
                                data.titleForNormalState.pasteboard();
                                return nil;
                            };
                        }
                        model.baseBackgroundColor = i % 2 ? self.cor2: self.cor1;
                        model.backgroundImage = i % 2 ? self.image2: self.image1;
                        model.titleCor = JobsWhiteColor;
                        model.titleFont = UIFontWeightRegularSize(JobsWidth(10));
                        NSLog(@"");
                        model.jobsTestBlock();
                        model.jobsReturnedTestBlock(^id _Nullable(id  _Nullable data) {
                            return nil;
                        });
                    }));
                }
            }));
        }NSLog(@"");
    };
}

-(NSInteger)rowNumber{
    if(!_rowNumber){
        _rowNumber = self.leftTitles.count;
    }return _rowNumber;
}

-(NSInteger)colNumber{
    if(!_colNumber){
        _colNumber = self.topHeaderTitles.count - 1;
    }return _colNumber;
}

-(NSMutableArray<NSMutableArray<UIButtonModel *> *> *)contentArr{
    if(!_contentArr){
        _contentArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            
        });
    }return _contentArr;
}
/// 外界需要进行覆写
-(UIButtonModel *)data_00{
    if(!_data_00){
        @jobs_weakify(self)
        _data_00 = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            @jobs_strongify(self)
            data.title = self.topHeaderTitles.count ? self.topHeaderTitles[0] : JobsInternationalization(@"楼层");
            data.titleCor = self.cor4;
            data.baseBackgroundColor = self.cor0;
            data.backgroundImage = self.image0;
        });
    }return _data_00;
}
/// 外界需要进行覆写
-(NSMutableArray<UIButtonModel *> *)topHeaderDatas{
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
/// 外界需要进行覆写
-(NSMutableArray <UIButtonModel *>*)leftListDatas{
    if(!_leftListDatas){
//        @jobs_weakify(self)
        _leftListDatas = jobsMakeMutArr(^(__kindof NSMutableArray <UIButtonModel *>*_Nullable data) {
//            @jobs_strongify(self)
//            for (int y = 1; y <= self.contentArr.count ; y++) {
//                data.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data1) {
//                    @jobs_strongify(self)
//                    data1.title = toStringByInt(y).add(JobsInternationalization(@"楼"));
//                    data1.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
//                    data1.titleCor = JobsWhiteColor;
//                    data1.baseBackgroundColor = y % 2 ? self.cor2 : self.cor1;
//                    data1.backgroundImage = y % 2 ? self.image2 : self.image1;
//                }));
//            }
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
@synthesize topHeaderTitles = _topHeaderTitles;
-(NSMutableArray <NSString *>*)topHeaderTitles{
    if(!_topHeaderTitles){
        _topHeaderTitles = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            
        });
    }return _topHeaderTitles;
}

-(void)setTopHeaderTitles:(NSMutableArray <NSString *>*)topHeaderTitles{
    _topHeaderTitles = topHeaderTitles;
    self.colNumber = _topHeaderTitles.count;
    @jobs_weakify(self)
    self.topHeaderDatas = jobsMakeMutArr(^(__kindof NSMutableArray <UIButtonModel *>*_Nullable data) {
        for (int y = 1; y < topHeaderTitles.count ; y++) {
            data.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data1) {
                @jobs_strongify(self)
                data1.title = topHeaderTitles[y];
                data1.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
                data1.titleCor = self.cor4;
                data1.baseBackgroundColor = self.cor3;
                data1.backgroundImage = self.image3;
            }));
        }
    });
}
@synthesize leftTitles = _leftTitles;
-(NSMutableArray <NSString *>*)leftTitles{
    if(!_leftTitles){
        _leftTitles = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            
        });
    }return _leftTitles;
}

-(void)setLeftTitles:(NSMutableArray <NSString *>*)leftTitles{
    _leftTitles = leftTitles;
    self.rowNumber = _leftTitles.count;
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
