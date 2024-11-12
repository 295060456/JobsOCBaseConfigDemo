//
//  JobsExcelView.m
//  JobsExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import "JobsExcelView.h"

@interface JobsExcelView()
/// UI
@property(nonatomic,strong)BaseButton *titleBtn;
@property(nonatomic,strong)JobsExcelLeftListView *leftListView;
@property(nonatomic,strong)JobsExcelTopHeadView *headView;
@property(nonatomic,strong)JobsExcelContentView *contentView;
@property(nonatomic,strong)UIImageView *bgImageView;
/// Data
@property(nonatomic,strong)JobsExcelConfigureViewModel *excelConfigureDatas;

@end

@implementation JobsExcelView{
    CGFloat itemW;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {

    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsExcelConfigureViewModel *_Nullable data) {
        @jobs_strongify(self)
        if(data) self.excelConfigureDatas = data;
        self->itemW = self.excelConfigureDatas.itemW;
        self.bgImageView.alpha = 1;
        self.titleBtn.alpha = 1;
        self.headView.alpha = 1;
        self.leftListView.alpha = 1;
        self.contentView.alpha = 1;
    };
}

-(jobsByIDBlock _Nonnull)update{
    @jobs_weakify(self)
    return ^(JobsExcelConfigureViewModel *_Nullable data) {
        @jobs_strongify(self)
        self.headView.jobsRichViewByModel(data);
        self.leftListView.jobsRichViewByModel(data);
        self.contentView.jobsRichViewByModel(data);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsRealWidth() - JobsWidth(100), JobsRealHeight() / 2);
    };
}
#pragma mark —— lazyLoad
-(UIImageView *)bgImageView{
    if(!_bgImageView){
        @jobs_weakify(self)
        _bgImageView = jobsMakeImageView(^(__kindof UIImageView *_Nullable imageView) {
            @jobs_strongify(self)
            imageView.image = JobsIMG(@"投注记录");
            [self addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self);
                make.left.equalTo(self);
                make.width.mas_equalTo(self->itemW);
                make.height.mas_equalTo(self.excelConfigureDatas.itemH);
            }];
        });
    }return _bgImageView;
}

-(BaseButton *)titleBtn{
    if(!_titleBtn){
        _titleBtn = BaseButton.initByButtonModel(self.excelConfigureDatas.data_00);
        [self.bgImageView addSubview:_titleBtn];
        [_titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self);
            make.width.mas_equalTo(itemW);
            make.height.mas_equalTo(self.excelConfigureDatas.itemH);
        }];
    }return _titleBtn;
}

- (JobsExcelLeftListView *)leftListView{
    if (!_leftListView) {
        @jobs_weakify(self)
        _leftListView = JobsExcelLeftListView.new;
        [self addSubview:_leftListView];
        [_leftListView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleBtn.mas_bottom).offset(0);
            make.left.equalTo(self);
            make.width.mas_equalTo(self->itemW);
            make.bottom.equalTo(self);
        }];
        _leftListView.jobsRichViewByModel(self.excelConfigureDatas);
        [_leftListView.racDisposable dispose];// 取消之前的订阅，避免多次重复订阅
        _leftListView.racDisposable = [RACObserve(_leftListView.excelConfigureData, VerticalScrollValue)
            subscribeNext:^(NSValue *scrollValue) {
            @jobs_strongify(self)
            self.contentView.tableView.contentOffset = scrollValue.CGPointValue;
        }];
    }return _leftListView;
}

-(JobsExcelTopHeadView *)headView{
    if (!_headView) {
        @jobs_weakify(self)
        _headView = JobsExcelTopHeadView.new;
        [self addSubview:_headView];
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleBtn);
            make.left.equalTo(self.titleBtn.mas_right).offset(0);
            make.right.equalTo(self);
            make.height.equalTo(self.titleBtn);
        }];
        _headView.jobsRichViewByModel(self.excelConfigureDatas);
        [_headView.racDisposable dispose];// 取消之前的订阅，避免多次重复订阅
        _headView.racDisposable = [RACObserve(_headView.excelConfigureData, HorizontalScrollValue) subscribeNext:^(id _Nullable x) {
            @jobs_strongify(self)
            self.contentView.configureContentOffSet([x CGPointValue]);
        }];
    }return _headView;
}

-(JobsExcelContentView *)contentView{
    if (!_contentView) {
        @jobs_weakify(self)
        _contentView = JobsExcelContentView.new;
        [self addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.leftListView);
            make.left.equalTo(self.headView);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
        }];
        _contentView.jobsRichViewByModel(self.excelConfigureDatas);
        [_contentView.excelConfigureData.verticalScrollSignal subscribeNext:^(NSValue *value) {
            @jobs_strongify(self)
            self.leftListView.tableView.contentOffset = value.CGPointValue;
        }];
        [_contentView.excelConfigureData.horizontalScrollSignal subscribeNext:^(NSValue *value) {
            @jobs_strongify(self)
            self.headView.collectionView.contentOffset = value.CGPointValue;
        }];
    }return _contentView;
}

-(JobsExcelConfigureViewModel *)excelConfigureDatas{
    if(!_excelConfigureDatas){
        _excelConfigureDatas = jobsMakeExcelConfigureViewModel(^(JobsExcelConfigureViewModel * _Nullable data) {
            
        });
    }return _excelConfigureDatas;
}

@end
