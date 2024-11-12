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
@property(nonatomic,strong)JobsExcelConfigureViewModel *viewModel_;

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
        if(data) self.viewModel_ = data;
        self->itemW = self.viewModel_.itemW;
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
        _bgImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.image = JobsIMG(@"投注记录");
            [self addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self);
                make.left.equalTo(self);
                make.width.mas_equalTo(self->itemW);
                make.height.mas_equalTo(self.viewModel_.itemH);
            }];
        });
    }return _bgImageView;
}

-(BaseButton *)titleBtn{
    if(!_titleBtn){
        _titleBtn = BaseButton.initByButtonModel(self.viewModel_.data_00);
        [self.bgImageView addSubview:_titleBtn];
        [_titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self);
            make.width.mas_equalTo(itemW);
            make.height.mas_equalTo(self.viewModel_.itemH);
        }];
    }return _titleBtn;
}

- (JobsExcelLeftListView *)leftListView{
    if (!_leftListView) {
        @jobs_weakify(self)
        _leftListView = jobsMakeExcelLeftListView(^(__kindof JobsExcelLeftListView * _Nullable leftListView) {
            @jobs_strongify(self)
            [self addSubview:leftListView];
            [leftListView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleBtn.mas_bottom).offset(0);
                make.left.equalTo(self);
                make.width.mas_equalTo(self->itemW);
                make.bottom.equalTo(self);
            }];
            leftListView.jobsRichViewByModel(self.viewModel_);
            [leftListView.racDisposable dispose];// 取消之前的订阅，避免多次重复订阅
            leftListView.racDisposable = [RACObserve(leftListView.excelConfigureData, VerticalScrollValue)
                subscribeNext:^(NSValue *scrollValue) {
                @jobs_strongify(self)
                self.contentView.tableView.contentOffset = scrollValue.CGPointValue;
            }];
        });
    }return _leftListView;
}

-(JobsExcelTopHeadView *)headView{
    if (!_headView) {
        @jobs_weakify(self)
        _headView = jobsMakeExcelTopHeadView(^(__kindof JobsExcelTopHeadView * _Nullable topHeadView) {
            @jobs_strongify(self)
            [self addSubview:topHeadView];
            [topHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleBtn);
                make.left.equalTo(self.titleBtn.mas_right).offset(0);
                make.right.equalTo(self);
                make.height.equalTo(self.titleBtn);
            }];
            topHeadView.jobsRichViewByModel(self.viewModel_);
            [topHeadView.racDisposable dispose];// 取消之前的订阅，避免多次重复订阅
            topHeadView.racDisposable = [RACObserve(topHeadView.excelConfigureData, HorizontalScrollValue) subscribeNext:^(id _Nullable x) {
                @jobs_strongify(self)
                self.contentView.configureContentOffSet([x CGPointValue]);
            }];
        });
    }return _headView;
}

-(JobsExcelContentView *)contentView{
    if (!_contentView) {
        @jobs_weakify(self)
        _contentView = jobsMakeExcelContentView(^(__kindof JobsExcelContentView * _Nullable contentView) {
            @jobs_strongify(self)
            [self addSubview:contentView];
            [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.leftListView);
                make.left.equalTo(self.headView);
                make.right.equalTo(self);
                make.bottom.equalTo(self);
            }];
            contentView.jobsRichViewByModel(self.viewModel_);
            [contentView.excelConfigureData.verticalScrollSignal subscribeNext:^(NSValue *value) {
                @jobs_strongify(self)
                self.leftListView.tableView.contentOffset = value.CGPointValue;
            }];
            [contentView.excelConfigureData.horizontalScrollSignal subscribeNext:^(NSValue *value) {
                @jobs_strongify(self)
                self.headView.collectionView.contentOffset = value.CGPointValue;
            }];
        });
    }return _contentView;
}

-(JobsExcelConfigureViewModel *)viewModel_{
    if(!_viewModel_){
        _viewModel_ = jobsMakeExcelConfigureViewModel(^(JobsExcelConfigureViewModel * _Nullable data) {
            
        });
    }return _viewModel_;
}

@end
