//
//  JobsBasePopupView.m
//  Casino
//
//  Created by Jobs on 2021/12/11.
//

#import "JobsBasePopupView.h"

@interface JobsBasePopupView ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UILabel *subTitleLab;
@property(nonatomic,strong)UIButton *btn1;
@property(nonatomic,strong)UIButton *btn2;
/// Data

@end

@implementation JobsBasePopupView

-(instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        if (model) {
            if (self.viewModel.bgImage) {
                self.backgroundImageView.image = self.viewModel.bgImage;
            }else{
                self.backgroundColor = self.viewModel.bgCor;
            }
            
            self.titleLab.text = self.viewModel.textModel.text;
            self.subTitleLab.text = self.viewModel.subTextModel.text;
            self.btn1.alpha = 1;
            self.btn2.alpha = 1;
            
            self.titleLab.labelAutoWidthByFont();
            self.subTitleLab.labelAutoWidthByFont();
        }
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(id _Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH() - JobsWidth(30), JobsWidth(210));
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.font = self.viewModel.textModel.font;
        _titleLab.textColor = self.viewModel.textModel.textCor;
        _titleLab.textAlignment = self.viewModel.textModel.textAlignment;
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(JobsWidth(50));
        }];
    }return _titleLab;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        _subTitleLab = UILabel.new;
        _subTitleLab.font = self.viewModel.subTextModel.font;
        _subTitleLab.textColor = self.viewModel.subTextModel.textCor;
        _subTitleLab.textAlignment = self.viewModel.subTextModel.textAlignment;
        [self addSubview:_subTitleLab];
        [_subTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(5));
        }];
    }return _subTitleLab;
}

-(UIButton *)btn1{
    if (!_btn1) {
        _btn1 = UIButton.new;
        _btn1.tag = 666;
        _btn1.titleFont(UIFontWeightRegularSize(14));
        _btn1.normalImage(self.viewModel.image);
        _btn1.normalBackgroundImage(JobsIMG(@"弹窗取消按钮背景图"));
        _btn1.normalTitleColor(HEXCOLOR(0x502600));
        _btn1.normalTitle(JobsInternationalization(@"Cancel"));
        @jobs_weakify(self)
        [_btn1 jobsBtnClickEventBlock:^id(id data) {
            @jobs_strongify(self)
            if(self.objectBlock) self.objectBlock(self->_btn1);
            return nil;
        }];
        [self addSubview:_btn1];
        [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(110), JobsWidth(44)));
            make.left.equalTo(self).offset(JobsWidth(20));
            make.bottom.equalTo(self).offset(-JobsWidth(25));
        }];
    }return _btn1;
}

-(UIButton *)btn2{
    if (!_btn2) {
        _btn2 = UIButton.new;
        _btn2.tag = 999;
        _btn2.titleFont(UIFontWeightRegularSize(14));
        _btn2.normalImage(self.viewModel.image);
        _btn2.normalBackgroundImage(JobsIMG(@"弹窗确定按钮背景图"));
        _btn2.normalTitleColor(HEXCOLOR(0x502600));
        _btn2.normalTitle(JobsInternationalization(@"Sure"));
        [_btn2 jobsBtnClickEventBlock:^id(id data) {
            if(self.objectBlock) self.objectBlock(self.btn2);
            return nil;
        }];
        [self addSubview:_btn2];
        [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(110), JobsWidth(44)));
            make.right.equalTo(self).offset(JobsWidth(-20));
            make.bottom.equalTo(self).offset(-JobsWidth(25));
        }];
    }return _btn2;
}

@end
