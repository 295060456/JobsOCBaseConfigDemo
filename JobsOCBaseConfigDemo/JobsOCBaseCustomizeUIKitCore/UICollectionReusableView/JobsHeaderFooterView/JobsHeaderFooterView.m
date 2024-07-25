//
//  JobsHeaderFooterView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/25.
//

#import "JobsHeaderFooterView.h"

@interface JobsHeaderFooterView ()
/// UI
@property(nonatomic,strong)BaseButton *titleBtn;
@property(nonatomic,strong)BaseButton *subTitleBtn;
/// Data
@property(nonatomic,strong)UIViewModel *titleModel;
@property(nonatomic,strong)UIViewModel *subTitleModel;

@end

@implementation JobsHeaderFooterView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
#pragma mark —— BaseViewProtocol
/// 由具体的子类进行覆写
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeZero;
}
/// 由具体的子类进行覆写
-(void)richElementsInViewWithModel:(NSMutableArray <UIViewModel *>*_Nullable)model{
    if(model.count){
        self.titleModel = model[0];
    }
    
    if(model.count >= 2){
        self.subTitleModel = model[1];
    }
    
    if(self.titleModel) self.titleBtn.alpha = 1;
    if(self.subTitleModel) self.subTitleBtn.alpha = 1;
}
#pragma mark —— 一些公共方法
-(BaseButton *)getTitleBtn{
    return self.titleBtn;
}

-(BaseButton *)getSubTitleBtn{
    return self.subTitleBtn;
}
#pragma mark —— lazyLoad
-(BaseButton *)titleBtn{
    if (!_titleBtn) {
        @jobs_weakify(self)
        _titleBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                      background:nil
                                      buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                   textAlignment:NSTextAlignmentCenter
                                                subTextAlignment:NSTextAlignmentCenter
                                                     normalImage:nil
                                                  highlightImage:nil
                                                 attributedTitle:nil
                                         selectedAttributedTitle:nil
                                              attributedSubtitle:nil
                                                           title:nil
                                                        subTitle:nil
                                                       titleFont:nil
                                                    subTitleFont:nil
                                                        titleCor:nil
                                                     subTitleCor:nil
                                              titleLineBreakMode:NSLineBreakByWordWrapping
                                           subtitleLineBreakMode:NSLineBreakByWordWrapping
                                             baseBackgroundColor:nil
                                                 backgroundImage:nil
                                                    imagePadding:JobsWidth(0)
                                                    titlePadding:JobsWidth(0)
                                                  imagePlacement:NSDirectionalRectEdgeNone
                                      contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                        contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                   contentInsets:jobsSameDirectionalEdgeInsets(0)
                                               cornerRadiusValue:JobsWidth(0)
                                                 roundingCorners:UIRectCornerAllCorners
                                            roundingCornersRadii:CGSizeZero
                                                  layerBorderCor:nil
                                                     borderWidth:JobsWidth(0)
                                                   primaryAction:nil
                                      longPressGestureEventBlock:nil
                                                 clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        [self addSubview:_titleBtn];
        [_titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(self.viewModel.textModel.offsetXForEach);
            make.top.bottom.equalTo(self);
        }];
    }
    
    _titleBtn.jobsResetBtnTitle(self.titleModel.textModel.text);
    _titleBtn.jobsResetSubtitle((self.titleModel.subTextModel.text));
    _titleBtn.jobsResetImagePadding(self.titleModel.imageTitleSpace);
    _titleBtn.jobsResetTitlePadding(self.titleModel.titleSpace);
    _titleBtn.jobsResetBtnImage(self.titleModel.image);
    _titleBtn.jobsResetTitleLineBreakMode(self.titleModel.subTextModel.lineBreakMode);
    _titleBtn.jobsResetSubTitleLineBreakMode(self.titleModel.subTextModel.lineBreakMode);
    _titleBtn.jobsResetImagePlacement(self.titleModel.buttonEdgeInsetsStyle);
    _titleBtn.jobsResetTitleBaseForegroundColor(self.titleModel.textModel.textCor);
    _titleBtn.jobsResetBtnBgCor((self.titleModel.bgCor));
    [_titleBtn jobsSetBtnTitleFont:self.titleModel.textModel.font btnTitleCor:self.titleModel.textModel.textCor];
    _titleBtn.makeBtnLabelByShowingType(self.titleModel.textModel.labelShowingType);

    /// 富文本的优先级最高，不括起来上述的设置无效
    if(self.titleModel.textModel.attributedText){
        _titleBtn.jobsResetAttributedTitle(self.titleModel.textModel.attributedText);
    }
    
    if(self.titleModel.subTextModel.attributedText){
        _titleBtn.jobsResetAttributedSubtitle(self.titleModel.subTextModel.attributedText);
    }return _titleBtn;
}

-(BaseButton *)subTitleBtn{
    if (!_subTitleBtn) {
        _subTitleBtn = BaseButton.new;
        @jobs_weakify(self)
        _subTitleBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                         background:nil
                                         buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                      textAlignment:NSTextAlignmentCenter
                                                   subTextAlignment:NSTextAlignmentCenter
                                                        normalImage:nil
                                                     highlightImage:nil
                                                    attributedTitle:nil
                                            selectedAttributedTitle:nil
                                                 attributedSubtitle:nil
                                                              title:nil
                                                           subTitle:nil
                                                          titleFont:nil
                                                       subTitleFont:nil
                                                           titleCor:nil
                                                        subTitleCor:nil
                                                 titleLineBreakMode:NSLineBreakByWordWrapping
                                              subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                baseBackgroundColor:nil
                                                    backgroundImage:nil
                                                       imagePadding:JobsWidth(0)
                                                       titlePadding:JobsWidth(0)
                                                     imagePlacement:NSDirectionalRectEdgeNone
                                         contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                           contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                      contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                  cornerRadiusValue:JobsWidth(0)
                                                    roundingCorners:UIRectCornerAllCorners
                                               roundingCornersRadii:CGSizeZero
                                                     layerBorderCor:nil
                                                        borderWidth:JobsWidth(0)
                                                      primaryAction:nil
                                         longPressGestureEventBlock:nil
                                                    clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        [self addSubview:_subTitleBtn];
        [_subTitleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(self.viewModel.subTextModel.offsetXForEach);
            make.top.bottom.equalTo(self);
        }];
    }
    
    _subTitleBtn.jobsResetBtnTitle(self.subTitleModel.textModel.text);
    _subTitleBtn.jobsResetSubtitle((self.subTitleModel.subTextModel.text));
    _subTitleBtn.jobsResetImagePadding(self.subTitleModel.imageTitleSpace);
    _subTitleBtn.jobsResetTitlePadding(self.subTitleModel.titleSpace);
    _subTitleBtn.jobsResetBtnImage(self.subTitleModel.image);
    _subTitleBtn.jobsResetTitleLineBreakMode(self.subTitleModel.subTextModel.lineBreakMode);
    _subTitleBtn.jobsResetSubTitleLineBreakMode(self.subTitleModel.subTextModel.lineBreakMode);
    _subTitleBtn.jobsResetImagePlacement(self.subTitleModel.buttonEdgeInsetsStyle);
    _subTitleBtn.jobsResetTitleBaseForegroundColor(self.subTitleModel.textModel.textCor);
    _subTitleBtn.jobsResetBtnBgCor((self.subTitleModel.bgCor));
    [_subTitleBtn jobsSetBtnTitleFont:self.subTitleModel.textModel.font btnTitleCor:self.subTitleModel.textModel.textCor];
    _subTitleBtn.makeBtnLabelByShowingType(self.subTitleModel.textModel.labelShowingType);
    /// 富文本的优先级最高，不括起来上述的设置无效
    if(self.subTitleModel.textModel.attributedText){
        _subTitleBtn.jobsResetAttributedTitle(self.subTitleModel.textModel.attributedText);
    }
    
    if(self.subTitleModel.subTextModel.attributedText){
        _subTitleBtn.jobsResetAttributedSubtitle(self.subTitleModel.subTextModel.attributedText);
    }return _subTitleBtn;
}

@end
