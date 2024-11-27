//
//  JobsTBVHeaderFooterView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/30.
//

#import "JobsTBVHeaderFooterView.h"

@interface JobsTBVHeaderFooterView ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)BaseButton *subTitleBtn;

@end

@implementation JobsTBVHeaderFooterView
@synthesize viewModel = _viewModel;
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
#pragma mark —— BaseViewProtocol
/// 由具体的子类进行覆写
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model ? : UIViewModel.new;
        self.titleLab.alpha = 1;
        self.subTitleBtn.alpha = 1;
        self.contentView.backgroundColor = self.viewModel.bgCor;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)heightForHeaderInSection{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(46);
    };
}
#pragma mark —— 一些公共方法
-(UILabel *)getTitleLab{
    return self.titleLab;
}

-(BaseButton *)getSubTitleBtn{
    return self.subTitleBtn;
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(self.viewModel.textModel.offsetXForEach);
                make.top.bottom.equalTo(self);
            }];
        });
    }
    
    if (self.viewModel.textModel.attributedTitle) {
        _titleLab.attributedText = self.viewModel.textModel.attributedTitle;
    }else{
        _titleLab.text = self.viewModel.textModel.text;
        _titleLab.font = self.viewModel.textModel.font;
        _titleLab.textColor = self.viewModel.textModel.textCor;
        _titleLab.textAlignment = self.viewModel.textModel.textAlignment;
        _titleLab.makeLabelByShowingType(self.viewModel.textModel.labelShowingType);/// 一行显示。不定宽、定高、定字体。宽度自适应 【单行：ByFont】
    }return _titleLab;
}

-(BaseButton *)subTitleBtn{
    if (!_subTitleBtn) {
        _subTitleBtn = BaseButton.new;
        [self addSubview:_subTitleBtn];
        [_subTitleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(self.viewModel.subTextModel.offsetXForEach);
            make.top.bottom.equalTo(self);
        }];
    }
    
    _subTitleBtn.jobsResetBtnImage(self.viewModel.image);
    _subTitleBtn.jobsResetBtnBgImage(self.viewModel.bgImage);
    _subTitleBtn.jobsResetBtnTitle(self.viewModel.subTextModel.text);
    _subTitleBtn.jobsResetBtnTitleCor(self.viewModel.subTextModel.textCor);
    _subTitleBtn.jobsResetBtnNormalAttributedTitle(self.viewModel.subTextModel.attributedTitle);
    
    _subTitleBtn.selectedImage(self.viewModel.selectedImage_);
    _subTitleBtn.selectedBackgroundImage(self.viewModel.bgSelectedImage);
    _subTitleBtn.selectedTitle(self.viewModel.subTextModel.text);
    _subTitleBtn.selectedTitleColor(self.viewModel.subTextModel.textCor);
    _subTitleBtn.selectedAttributedTitle(self.viewModel.subTextModel.attributedTitle);
    
    _subTitleBtn.jobsResetBtnTitleFont(self.viewModel.subTextModel.font);
    _subTitleBtn.titleAlignment = self.viewModel.subTextModel.textAlignment;
    _subTitleBtn.lineBreakMode = self.viewModel.subTextModel.lineBreakMode;
    
    _subTitleBtn.makeBtnTitleByShowingType(self.viewModel.labelShowingType);
    
    _subTitleBtn.jobsResetImagePlacement_Padding(self.viewModel.buttonEdgeInsetsStyle,self.viewModel.imageTitleSpace);
    return _subTitleBtn;
}

@end
