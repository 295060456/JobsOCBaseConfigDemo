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
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
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
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsRealWidth() - 100, JobsRealHeight() / 2);
}

-(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return [self.class viewSizeWithModel:nil];
}
#pragma mark —— lazyLoad
-(UIImageView *)bgImageView{
    if(!_bgImageView){
        _bgImageView = UIImageView.new;
        _bgImageView.image = JobsIMG(@"投注记录");
        [self addSubview:_bgImageView];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self);
            make.width.mas_equalTo(itemW);
            make.height.mas_equalTo(self.viewModel_.itemH);
        }];
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
        _leftListView = JobsExcelLeftListView.new;
        [self addSubview:_leftListView];
        [_leftListView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleBtn.mas_bottom).offset(0);
            make.left.equalTo(self);
            make.width.mas_equalTo(itemW);
            make.bottom.equalTo(self);
        }];
        _leftListView.jobsRichElementsInViewWithModel(self.viewModel_);
    }return _leftListView;
}

- (JobsExcelTopHeadView *)headView{
    if (!_headView) {
        _headView = JobsExcelTopHeadView.new;
        [self addSubview:_headView];
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleBtn);
            make.left.equalTo(self.titleBtn.mas_right).offset(0);
            make.right.equalTo(self);
            make.height.equalTo(self.titleBtn);
        }];
        _headView.jobsRichElementsInViewWithModel(self.viewModel_);
    }return _headView;
}

- (JobsExcelContentView *)contentView{
    if (!_contentView) {
        _contentView = JobsExcelContentView.new;
        [self addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.leftListView);
            make.left.equalTo(self.headView);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
        }];
        _contentView.jobsRichElementsInViewWithModel(self.viewModel_);
    }return _contentView;
}

-(JobsExcelConfigureViewModel *)viewModel_{
    if(!_viewModel_){
        _viewModel_ = JobsExcelConfigureViewModel.new;
    }return _viewModel_;
}

@end
