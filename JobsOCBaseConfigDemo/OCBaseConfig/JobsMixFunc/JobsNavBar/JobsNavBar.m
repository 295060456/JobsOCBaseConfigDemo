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
Prop_strong()BaseButton *backBtn;
Prop_strong()UILabel *titleLab;
Prop_strong()BaseButton *closeBtn;
/// Data
Prop_strong()JobsNavBarConfig *navBarConfig;

@end

@implementation JobsNavBar
/// AppToolsProtocol
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
//    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
//                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsNavBarConfig *_Nullable navBarConfig) {
        @jobs_strongify(self)
        if(navBarConfig) self.navBarConfig = navBarConfig;
        if (NavBarConfig.bgImage) {
            self.image = NavBarConfig.bgImage;
        }else self.backgroundColor = NavBarConfig.bgCor;
        self.titleLab.text = NavBarConfig.title;
        self.backBtn.alpha = 1;
        self.closeBtn.alpha = 1;
        self.refresh();
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
//+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
//    @jobs_weakify(self)
//    return ^CGSize(UIViewModel *_Nullable data){
//        @jobs_strongify(self)
//        return CGSizeMake(JobsWidth(self.data), JobsWidth(35));
//    };
//}

-(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
        return CGSizeMake(JobsWidth(self.width), JobsWidth(35));
//        return JobsNavBar.viewSizeByModel(data);
    };
}
#pragma mark —— BaseViewProtocol
-(void)actionNavBarBackBtnClickBlock:(jobsByBtnBlock _Nullable)objBlock{
    self.backBtnClickAction = objBlock;
}
    
-(void)actionNavBarCloseBtnClickBlock:(jobsByBtnBlock _Nullable)objBlock{
    self.closeBtnClickAction = objBlock;
}
#pragma mark —— lazyLoad
-(JobsNavBarConfig *)navBarConfig{
    if(!_navBarConfig){
        @jobs_weakify(self)
        _navBarConfig = jobsMakeNavBarConfig(^(__kindof JobsNavBarConfig * _Nullable data) {
            [data actionObjBlock:^(id _Nullable data) {
                @jobs_strongify(self)
                if([data isKindOfClass:UIButton.class]){
                    UIButton *btn = (UIButton *)data;
                    if(btn.tag == 123){
                        if(self.closeBtnClickAction)self.closeBtnClickAction(btn);
                    }else if (btn.tag == 456){
                        if(self.backBtnClickAction)self.backBtnClickAction(btn);
                    }else{}
                }
            }];
        });
    }return _navBarConfig;
}

-(UILabel *)titleLab{
    if(!_titleLab){
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            if(NavBarConfig.attributedTitle) label.attributedText = NavBarConfig.attributedTitle;
            label.text = NavBarConfig.title;
            label.font = NavBarConfig.font;
            label.textColor = NavBarConfig.titleCor;
            [self.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(self);
                make.height.mas_equalTo(self.height);
            }];label.makeLabelByShowingType(UILabelShowingType_03);
            self.refresh();
        });
    }return _titleLab;
}

-(BaseButton *)backBtn{
    if(!_backBtn){
        _backBtn = BaseButton.initByButtonModel(BackBtnModel);
        _backBtn.jobsVisible = !BackBtnModel.isInvisible;
        _backBtn.tag = 456;
        [self.addSubview(_backBtn) mas_makeConstraints:BackBtnModel.masonryBlock ? : ^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(18));
            make.centerY.equalTo(self);
            JobsLog(@"%f",self.navBarConfig.backBtnModel.jobsOffsetX);
            make.left.equalTo(self).offset(self.navBarConfig.backBtnModel.jobsOffsetX ? : JobsWidth(20));
        }];_backBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
    }return _backBtn;
}

-(BaseButton *)closeBtn{
    if(!_closeBtn){
        _closeBtn = BaseButton.initByButtonModel(CloseBtnModel);
        _closeBtn.jobsVisible = !CloseBtnModel.isInvisible;
        _closeBtn.tag = 123;
        [self.addSubview(_closeBtn) mas_makeConstraints:CloseBtnModel.masonryBlock ? : ^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(22), JobsWidth(22)));
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(-(self.navBarConfig.closeBtnModel.jobsOffsetX ? : JobsWidth(15)));
        }];
    }return _closeBtn;
}

@end
