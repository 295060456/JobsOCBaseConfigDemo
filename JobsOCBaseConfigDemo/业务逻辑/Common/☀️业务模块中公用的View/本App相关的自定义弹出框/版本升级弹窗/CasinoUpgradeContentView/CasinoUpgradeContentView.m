//
//  CasinoUpgradeContentView.m
//  Casino
//
//  Created by Jobs on 2021/12/25.
//

#import "CasinoUpgradeContentView.h"

@interface CasinoUpgradeContentView ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UIButton *cancelBtn;
@property(nonatomic,strong)UIButton *sureBtn;
/// Data
@property(nonatomic,strong)JobsGetiOSNewestVersionModel *iOSNewestVersionModel;

@end

@implementation CasinoUpgradeContentView

-(instancetype)init{
    if (self = [super init]) {

    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsGetiOSNewestVersionModel *_Nullable model) {
        @jobs_strongify(self)
        self.iOSNewestVersionModel = model;
        self.titleLab.alpha = 1;
        
        if (self.iOSNewestVersionModel.isForced == JobsUpdateByUser) {
            self.cancelBtn.alpha = 1;
        }else if (self.iOSNewestVersionModel.isForced == JobsUpdateBySys){
            self.cancelBtn.alpha = 0;
        }
        self.sureBtn.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
        return CGSizeMake(JobsWidth(290), JobsWidth(133));
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.font = UIFontWeightMediumSize(14);
            label.textColor = HEXCOLOR(0x524740);
            label.text = JobsInternationalization(@"The existing new version needs to be updated. Are you sure to download it?");
            label.numberOfLines = 0;
            label.textAlignment = NSTextAlignmentCenter;
            label.makeLabelByShowingType(UILabelShowingType_03);
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.top.equalTo(self).offset(JobsWidth(5));
                make.left.equalTo(self).offset(JobsWidth(10));
                make.right.equalTo(self).offset(JobsWidth(-10));
            }];
        });
    }return _titleLab;
}

-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = UIButton.new;
        _cancelBtn.jobsResetBtnTitle(JobsInternationalization(@"Cancel"));
        _cancelBtn.jobsResetBtnTitleCor(HEXCOLOR(0x502600));
        _cancelBtn.jobsResetBtnTitleFont(UIFontWeightRegularSize(14));
        _cancelBtn.jobsResetBtnBgImage(JobsIMG(@"弹窗取消按钮背景图"));
        @jobs_weakify(self)
        [_cancelBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            if(self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        [self addSubview:_cancelBtn];
        [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(110), JobsWidth(44)));
            make.left.equalTo(self).offset(JobsWidth(20));
            make.bottom.equalTo(self).offset(-JobsWidth(20));
        }];
    }return _cancelBtn;
}

-(UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = UIButton.new;
        _sureBtn.jobsResetBtnTitle(JobsInternationalization(@"Sure"));
        _sureBtn.jobsResetBtnTitleCor(HEXCOLOR(0x502600));
        _sureBtn.jobsResetBtnBgImage(JobsIMG(@"弹窗确定按钮背景图"));
        _sureBtn.jobsResetBtnTitleFont(UIFontWeightRegularSize(14));
        @jobs_weakify(self)
        [_sureBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            if(self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        [self addSubview:_sureBtn];
        [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(110), JobsWidth(44)));
            make.bottom.equalTo(self).offset(-JobsWidth(20));
            if (self.iOSNewestVersionModel &&
                self.iOSNewestVersionModel.isForced == JobsUpdateBySys) {
                make.centerX.equalTo(self);
            }else{
                make.right.equalTo(self).offset(JobsWidth(-20));
            }
        }];
    }return _sureBtn;
}

@end
