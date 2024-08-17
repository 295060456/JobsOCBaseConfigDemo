//
//  XZExcelView.m
//  XZExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "XZExcelView.h"

@interface XZExcelView()
/// UI
@property(nonatomic,strong)UILabel *titleL;
@property(nonatomic,strong)LeftListView *leftListView;
@property(nonatomic,strong)TopHeadView *headView;
@property(nonatomic,strong)XZExcelContentView *contentView;
@property(nonatomic,strong)UIImageView *bgImageView;
/// Data
@property(nonatomic,strong)XZExcelConfigureViewModel *viewModel_;

@end

@implementation XZExcelView{
    CGFloat itemW;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        itemW = self.viewModel_.itemW;
        
        self.bgImageView.alpha = 1;
        self.titleL.alpha = 1;
        self.headView.alpha = 1;
        self.leftListView.alpha = 1;
        self.contentView.alpha = 1;
    }return self;
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

- (UILabel *)titleL{
    if (!_titleL) {
        _titleL = UILabel.new;
        _titleL.text = self.viewModel_.contentStr_00;
        _titleL.textColor = JobsWhiteColor;
        _titleL.textAlignment = NSTextAlignmentCenter;
        _titleL.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
        [self.bgImageView addSubview:_titleL];
        [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self);
            make.width.mas_equalTo(itemW);
            make.height.mas_equalTo(self.viewModel_.itemH);
        }];
    }return _titleL;
}

- (LeftListView *)leftListView{
    if (!_leftListView) {
        _leftListView = LeftListView.new;
        [self addSubview:_leftListView];
        [_leftListView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleL.mas_bottom).offset(0);
            make.left.equalTo(self);
            make.width.mas_equalTo(itemW);
            make.bottom.equalTo(self);
        }];
        _leftListView.jobsRichElementsInViewWithModel(self.viewModel_);
    }return _leftListView;
}

- (TopHeadView *)headView{
    if (!_headView) {
        _headView = TopHeadView.new;
        [self addSubview:_headView];
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleL);
            make.left.equalTo(self.titleL.mas_right).offset(0);
            make.right.equalTo(self);
            make.height.equalTo(self.titleL);
        }];
        _headView.jobsRichElementsInViewWithModel(self.viewModel_);
    }return _headView;
}

- (XZExcelContentView *)contentView{
    if (!_contentView) {
        _contentView = XZExcelContentView.new;
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

-(XZExcelConfigureViewModel *)viewModel_{
    if(!_viewModel_){
        _viewModel_ = XZExcelConfigureViewModel.new;
    }return _viewModel_;
}

@end
