//
//  JobsNavBar.m
//  FM
//
//  Created by User on 7/24/24.
//

#import "JobsNavBar.h"

#ifndef NavBarConfig
#define NavBarConfig self.navBarConfig
#endif /* NavBarConfig */

#ifndef BackBtnModel
#define BackBtnModel NavBarConfig.backBtnModel
#endif /* BackBtnModel */

#ifndef CloseBtnModel
#define CloseBtnModel NavBarConfig.closeBtnModel
#endif /* CloseBtnModel */

@interface JobsNavBar ()
/// UI
@property(nonatomic,strong)BaseButton *backBtn;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)BaseButton *closeBtn;
/// Data
@property(nonatomic,copy)JobsNavBarBackBtnClickAction backBtnClickAction;
@property(nonatomic,copy)JobsNavBarCloseBtnClickAction closeBtnClickAction;

@end

@implementation JobsNavBar
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    /// 内部指定圆切角
//    [self layoutSubviewsCutCnrByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
//                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if (self.navBarConfig.bgImage) {
            self.image = self.navBarConfig.bgImage;
        }else{
            self.backgroundColor = self.navBarConfig.bgCor;
        }
        self.titleLab.alpha = 1;
        self.backBtn.alpha = 1;
        self.closeBtn.alpha = 1;
        [self layoutIfNeeded];
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
//+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
//    return CGSizeZero;
//}

-(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(self.width), JobsWidth(35));
}
#pragma mark —— 一些公有方法
-(BaseButton *)getBackBtn{
    return self.backBtn;
}

-(UILabel *)getTitleLab{
    return self.titleLab;
}

-(BaseButton *)getCloseBtn{
    return self.closeBtn;
}

-(void)actionNavBarBackBtnClickBlock:(JobsNavBarBackBtnClickAction)objectBlock{
    self.backBtnClickAction = objectBlock;
}
    
-(void)actionNavBarCloseBtnClickBlock:(JobsNavBarCloseBtnClickAction)objectBlock{
    self.closeBtnClickAction = objectBlock;
}
#pragma mark —— lazyLoad
-(JobsNavBarConfig *)navBarConfig{
    if(!_navBarConfig){
        _navBarConfig = JobsNavBarConfig.new;
    }
    [_navBarConfig actionObjectBlock:^(id _Nullable data) {
        if([data isKindOfClass:UIButton.class]){
            UIButton *btn = (UIButton *)data;
            if(btn.tag == 123){
                if(self.closeBtnClickAction)self.closeBtnClickAction(btn);
            }else if (btn.tag == 456){
                if(self.backBtnClickAction)self.backBtnClickAction(btn);
            }else{}
        }
    }];return _navBarConfig;
}

-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = UILabel.new;
        _titleLab.text = NavBarConfig.title;
        if(NavBarConfig.attributedTitle){
            _titleLab.attributedText = NavBarConfig.attributedTitle;
        }
        _titleLab.font = NavBarConfig.font;
        _titleLab.textColor = NavBarConfig.titleCor;
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.height.mas_equalTo(self.height);
        }];
        _titleLab.makeLabelByShowingType(UILabelShowingType_03);
        [self layoutIfNeeded];
        NSLog(@"");
    }return _titleLab;
}

-(BaseButton *)backBtn{
    if(!_backBtn){
        JobsNavBarConfig *navBarConfig = self.navBarConfig;
        NSLog(@"%@",navBarConfig);
        _backBtn = [BaseButton.alloc jobsInitBtnByConfiguration:BackBtnModel.btnConfiguration
                                                     background:BackBtnModel.background
                                     buttonConfigTitleAlignment:BackBtnModel.buttonConfigTitleAlignment
                                                  textAlignment:BackBtnModel.textAlignment
                                               subTextAlignment:BackBtnModel.subTextAlignment
                                                    normalImage:BackBtnModel.normalImage
                                                 highlightImage:BackBtnModel.highlightImage
                                                attributedTitle:BackBtnModel.attributedTitle
                                        selectedAttributedTitle:BackBtnModel.selectedAttributedTitle
                                             attributedSubtitle:BackBtnModel.attributedSubtitle
                                                          title:BackBtnModel.title
                                                       subTitle:BackBtnModel.subTitle
                                                      titleFont:BackBtnModel.titleFont
                                                   subTitleFont:BackBtnModel.subTitleFont
                                                       titleCor:BackBtnModel.titleCor
                                                    subTitleCor:BackBtnModel.subTitleCor
                                             titleLineBreakMode:BackBtnModel.titleLineBreakMode
                                          subtitleLineBreakMode:BackBtnModel.subtitleLineBreakMode
                                            baseBackgroundColor:BackBtnModel.baseBackgroundColor
                                                backgroundImage:BackBtnModel.backgroundImage
                                                   imagePadding:BackBtnModel.imagePadding
                                                   titlePadding:BackBtnModel.titlePadding
                                                 imagePlacement:BackBtnModel.imagePlacement
                                     contentHorizontalAlignment:BackBtnModel.contentHorizontalAlignment
                                       contentVerticalAlignment:BackBtnModel.contentVerticalAlignment
                                                  contentInsets:BackBtnModel.contentInsets
                                              cornerRadiusValue:BackBtnModel.cornerRadiusValue
                                                roundingCorners:BackBtnModel.roundingCorners
                                           roundingCornersRadii:BackBtnModel.roundingCornersRadii
                                                 layerBorderCor:BackBtnModel.layerBorderCor
                                                    borderWidth:BackBtnModel.borderWidth
                                                  primaryAction:BackBtnModel.primaryAction
                                     longPressGestureEventBlock:BackBtnModel.longPressGestureEventBlock
                                                clickEventBlock:BackBtnModel.clickEventBlock];
        _backBtn.tag = 456;
        [self addSubview:_backBtn];
        [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(18));
            make.centerY.equalTo(self);
            NSLog(@"%f",self.navBarConfig.backBtnModel.btn_offset_x);
            make.left.equalTo(self).offset(self.navBarConfig.backBtnModel.btn_offset_x ? : JobsWidth(20));
        }];
        _backBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
    }return _backBtn;
}

-(BaseButton *)closeBtn{
    if(!_closeBtn){
        JobsNavBarConfig *navBarConfig = self.navBarConfig;
        NSLog(@"%@",navBarConfig);
        _closeBtn = [BaseButton.alloc jobsInitBtnByConfiguration:CloseBtnModel.btnConfiguration
                                                      background:CloseBtnModel.background
                                      buttonConfigTitleAlignment:CloseBtnModel.buttonConfigTitleAlignment
                                                   textAlignment:CloseBtnModel.textAlignment
                                                subTextAlignment:CloseBtnModel.subTextAlignment
                                                     normalImage:CloseBtnModel.normalImage
                                                  highlightImage:CloseBtnModel.highlightImage
                                                 attributedTitle:CloseBtnModel.attributedTitle
                                         selectedAttributedTitle:CloseBtnModel.selectedAttributedTitle
                                              attributedSubtitle:CloseBtnModel.attributedSubtitle
                                                           title:CloseBtnModel.title
                                                        subTitle:CloseBtnModel.subTitle
                                                       titleFont:CloseBtnModel.titleFont
                                                    subTitleFont:CloseBtnModel.subTitleFont
                                                        titleCor:CloseBtnModel.titleCor
                                                     subTitleCor:CloseBtnModel.subTitleCor
                                              titleLineBreakMode:CloseBtnModel.titleLineBreakMode
                                           subtitleLineBreakMode:CloseBtnModel.subtitleLineBreakMode
                                             baseBackgroundColor:CloseBtnModel.baseBackgroundColor
                                                 backgroundImage:CloseBtnModel.backgroundImage
                                                    imagePadding:CloseBtnModel.imagePadding
                                                    titlePadding:CloseBtnModel.titlePadding
                                                  imagePlacement:CloseBtnModel.imagePlacement
                                      contentHorizontalAlignment:CloseBtnModel.contentHorizontalAlignment
                                        contentVerticalAlignment:CloseBtnModel.contentVerticalAlignment
                                                   contentInsets:CloseBtnModel.contentInsets
                                               cornerRadiusValue:CloseBtnModel.cornerRadiusValue
                                                 roundingCorners:CloseBtnModel.roundingCorners
                                            roundingCornersRadii:CloseBtnModel.roundingCornersRadii
                                                  layerBorderCor:CloseBtnModel.layerBorderCor
                                                     borderWidth:CloseBtnModel.borderWidth
                                                   primaryAction:CloseBtnModel.primaryAction
                                      longPressGestureEventBlock:CloseBtnModel.longPressGestureEventBlock
                                                 clickEventBlock:CloseBtnModel.clickEventBlock];
        _closeBtn.tag = 123;
        [self addSubview:_closeBtn];
        [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(22), JobsWidth(22)));
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(-(self.navBarConfig.closeBtnModel.btn_offset_x ? : JobsWidth(15)));
        }];
    }return _closeBtn;
}

@end
