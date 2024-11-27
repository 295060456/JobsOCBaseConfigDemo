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
@property(nonatomic,strong)BaseButton *btn1;
@property(nonatomic,strong)BaseButton *btn2;
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
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
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
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH() - JobsWidth(30), JobsWidth(210));
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.font = self.viewModel.textModel.font;
            label.textColor = self.viewModel.textModel.textCor;
            label.textAlignment = self.viewModel.textModel.textAlignment;
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.top.equalTo(self).offset(JobsWidth(50));
            }];
        });
    }return _titleLab;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        @jobs_weakify(self)
        _subTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.font = self.viewModel.subTextModel.font;
            label.textColor = self.viewModel.subTextModel.textCor;
            label.textAlignment = self.viewModel.subTextModel.textAlignment;
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(5));
            }];
        });
    }return _subTitleLab;
}

-(BaseButton *)btn1{
    if (!_btn1) {
        _btn1 = BaseButton
            .initByStyle4(JobsInternationalization(@"Cancel"),
                          UIFontWeightRegularSize(14),
                          HEXCOLOR(0x502600),
                          self.viewModel.image,
                          JobsIMG(@"弹窗取消按钮背景图"),
                          NSDirectionalRectEdgeNone)
            .onClick(^(UIButton *x){
                if(self.objectBlock) self.objectBlock(x);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        _btn1.tag = 666;
        [self addSubview:_btn1];
        [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(110), JobsWidth(44)));
            make.left.equalTo(self).offset(JobsWidth(20));
            make.bottom.equalTo(self).offset(-JobsWidth(25));
        }];
    }return _btn1;
}

-(BaseButton *)btn2{
    if (!_btn2) {
        @jobs_weakify(self)
        _btn2 = BaseButton
            .initByStyle4(JobsInternationalization(@"Sure"),
                          UIFontWeightRegularSize(14),
                          HEXCOLOR(0x502600),
                          self.viewModel.image,
                          JobsIMG(@"弹窗确定按钮背景图"),
                          NSDirectionalRectEdgeNone)
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if(self.objectBlock) self.objectBlock(x);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        _btn2.tag = 999;
        [self addSubview:_btn2];
        [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(110), JobsWidth(44)));
            make.right.equalTo(self).offset(JobsWidth(-20));
            make.bottom.equalTo(self).offset(-JobsWidth(25));
        }];
    }return _btn2;
}

@end
