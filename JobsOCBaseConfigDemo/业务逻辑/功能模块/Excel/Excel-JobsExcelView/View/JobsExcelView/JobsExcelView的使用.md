# `JobsExcelView` 的使用

## 1、属性定义

```objective-c
@property(nonatomic,strong)JobsExcelConfigureViewModel *excelData;
@property(nonatomic,strong)JobsExcelView *excelView;
```

## 2、UI实现

```objective-c
-(JobsExcelView *)excelView{
    if(!_excelView){
        @jobs_weakify(self)
        _excelView = jobsMakeExcelView(^(__kindof JobsExcelView * _Nullable view) {
            @jobs_strongify(self)
            view.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
            [self addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self);
                make.height.mas_equalTo(JobsWidth(240));
                make.right.equalTo(self.settled_textField);
                make.top.equalTo(self.today_btn.mas_bottom).offset(JobsWidth(10));
            }];
            [self layoutIfNeeded];
            view.jobsRichViewByModel(self.excelData);
        });
    }return _excelView;
}
```

## 3、数据配置

### 3.1、默认数据配置

```objective-c
/// 这里配置Excel表格里面相关固定的数据
-(JobsExcelConfigureViewModel *)excelData{
    if(!_excelData){
        @jobs_weakify(self)
        _excelData = jobsMakeExcelConfigureViewModel(^(JobsExcelConfigureViewModel * _Nullable data) {
            @jobs_strongify(self)
            data.XZExcelH = self->_excelView.width;//JobsExcelView.viewSizeByModel(nil).height;
            data.XZExcelW = self->_excelView.height;//JobsExcelView.viewSizeByModel(nil).width;
            data.itemW = JobsWidth(115);
            data.itemH = JobsWidth(35);
            data.scrollOffsetX = 0;
            // data.scrollOffsetY;
            data.topHeaderTitles = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
                arr.add(JobsInternationalization(@"Bet Time"));
                arr.add(JobsInternationalization(@"Order No."));
                arr.add(JobsInternationalization(@"Game Content"));
                arr.add(JobsInternationalization(@"Bet Amount"));
                arr.add(JobsInternationalization(@"Valid Bet Amount"));
                arr.add(JobsInternationalization(@"Previous Balance"));
                arr.add(JobsInternationalization(@"Current Balance"));
                arr.add(JobsInternationalization(@"Win/Loss"));
                arr.add(JobsInternationalization(@"Bet Statuse"));
            });
            data.data_00 = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
                model.title = data.topHeaderTitles[0];
                model.titleCor = data.cor4;
                model.baseBackgroundColor = data.cor0;
                model.backgroundImage = data.image0;
            });
//            data.configureDataBy(nil);
        });
    }return _excelData;
}
```

### 3.2、动态数据配置

```objective-c
#pragma mark —— 一些私有方法
/// 配置Excel表格的数据源
-(JobsReturnExcelConfigureDataByMyBetOrderDetailModelBlock _Nonnull)configExcelDataBy{
    @jobs_weakify(self)
    return ^JobsExcelConfigureViewModel *(__kindof FMMyBetOrderDetailModel *_Nullable model){
        @jobs_strongify(self)
        /// 左边的标题
        self.excelData.leftTitles = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            for (FMBetRecordModel *betRecordModel in model.records) {
                data.add(betRecordModel.betTime);
            }
        });
        self.excelData.leftListDatas = jobsMakeMutArr(^(__kindof NSMutableArray <UIButtonModel *>*_Nullable data) {
            @jobs_strongify(self)
            for (int y = 0; y < self.excelData.leftTitles.count ; y++) {
                data.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
                    @jobs_strongify(self)
                    buttonModel.title = self.excelData.leftTitles[y];
                    buttonModel.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
                    buttonModel.titleCor = JobsWhiteColor;
                    buttonModel.baseBackgroundColor = y % 2 ? self.excelData.cor2 : self.excelData.cor1;
                    buttonModel.backgroundImage = y % 2 ? self.excelData.image2 : self.excelData.image1;
                    buttonModel.titleFont = UIFontWeightRegularSize(JobsWidth(10));
                }));
            }
        });
        /// 中间的内容数据
        /// 行级数据
        for (int i = 0; i < model.records.count; i++) {/// y
            self.excelData.contentArr.add(jobsMakeMutArr(^(__kindof NSMutableArray <UIButtonModel *>*_Nullable row) {
                /// 列级数据
                for (int j = 1; j <= self.excelData.topHeaderTitles.count ; j++){/// x
                    row.add(jobsMakeButtonModel(^(__kindof UIButtonModel *_Nullable buttonModel) {
                        if(j == 1){
                            buttonModel.enabled = YES;
//                            buttonModel.textAlignment = NSTextAlignmentRight;
                            buttonModel.imagePlacement = NSDirectionalRectEdgeTrailing;
                            buttonModel.imagePadding = JobsWidth(8);
                            buttonModel.normalImage = JobsIMG(@"复制图标");
                            buttonModel.clickEventBlock = ^id _Nullable(UIButton *_Nullable data) {
                                data.titleForNormalState.pasteboard();
                                return nil;
                            };
                        }
                        
                        if(j == 1) buttonModel.title = model.records[i].orderNo;/// Order No.
                        if(j == 2) buttonModel.title = model.records[i].gameName;/// Game Content
                        if(j == 3) buttonModel.title = model.records[i].totalAmount.stringValue;/// Bet Amount
                        if(j == 4) buttonModel.title = model.records[i].validBet.stringValue;/// Valid Bet Amount
                        if(j == 5) buttonModel.title = model.records[i].orderAmount.stringValue;/// Previous Balance
                        if(j == 6) buttonModel.title = model.records[i].betList;/// Current Balance
                        if(j == 7) buttonModel.title = model.records[i].betResult;/// Win/Loss
                        if(j == 8) buttonModel.title = model.records[i].status;/// bet statuse
                        
                        buttonModel.baseBackgroundColor = i % 2 ? self.excelData.cor2: self.excelData.cor1;
                        buttonModel.backgroundImage = i % 2 ? self.excelData.image2: self.excelData.image1;
                        buttonModel.titleCor = JobsWhiteColor;
                        buttonModel.titleFont = UIFontWeightRegularSize(JobsWidth(10));
                    }));/// 一行的数据
                }
            }));
        }return self.excelData;
    };
}
```

## 4、调用

```objective-c
FMMyBetOrderDetailModel *model = FMMyBetOrderDetailModel.byData(responseModel.data);
self.excelView.update(self.configExcelDataBy(model));
```

