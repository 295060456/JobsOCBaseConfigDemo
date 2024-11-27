//
//  CasinoCustomerServiceView.m
//  Casino
//
//  Created by Jobs on 2021/12/24.
//

#import "CasinoCustomerServiceView.h"

@interface CasinoCustomerServiceView ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;// 标题
@property(nonatomic,strong)BaseButton *closeBtn;
@property(nonatomic,strong)BaseButton *contactCustomerServiceBtn;// 联系客服按钮
@property(nonatomic,strong)UILabel *subTitleLab;// 副标题
@property(nonatomic,strong)UIImageView *leftIMGV;
@property(nonatomic,strong)UIImageView *rightIMGV;
@property(nonatomic,strong)JobsHotLabelWithSingleLine *hl;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*hotLabelDataMutArr;
@property(nonatomic,strong)CasinoCustomerContactModel *customerContactModel;

@end

@implementation CasinoCustomerServiceView

static CasinoCustomerServiceView *static_customerServiceView = nil;
+(instancetype)sharedManager{
    @synchronized(self){
        if (!static_customerServiceView) {
            static_customerServiceView = CasinoCustomerServiceView.new;
        }
    }return static_customerServiceView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundImageView.image = JobsIMG(@"客服_背景图");
        [self customerContact];
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self customerContact];
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
// BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(NSMutableArray <UIViewModel *>*_Nullable model) {
        @jobs_strongify(self)
        self.titleLab.alpha = 1;
        self.contactCustomerServiceBtn.alpha = 1;
        self.closeBtn.alpha = 1;
        self.subTitleLab.alpha = 1;
        self.leftIMGV.alpha = 1;
        self.rightIMGV.alpha = 1;
        
        self.hotLabelDataMutArr = model;
        if (self.hotLabelDataMutArr.count) {
            self.hl.alpha = 1;
        }
    };
}

+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(NSArray <UIViewModel *>*_Nullable data){
        CGFloat h = JobsWidth(162) + JobsHotLabelWithSingleLine.viewSizeByModel(data).height + JobsWidth(70);
        return CGSizeMake(JobsWidth(345), h);
    };
}
#pragma mark —— 网络请求
/// 获取客服联系方式
-(void)customerContact{

}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = JobsInternationalization(Title10);
            label.textColor = HEXCOLOR(0x502600);
            label.font = [UIFont systemFontOfSize:JobsWidth(20)
                                               weight:UIFontWeightRegular];
            [label sizeToFit];
            self.backgroundImageView.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.top.equalTo(self).offset(JobsWidth(20));
            }];
        });
    }return _titleLab;
}

-(BaseButton *)contactCustomerServiceBtn{
    if (!_contactCustomerServiceBtn) {
        @jobs_weakify(self)
        _contactCustomerServiceBtn = BaseButton.jobsInit()
            .bgColor(JobsWhiteColor)
            .jobsResetBtnImage(JobsIMG(@"zaixiankefu_en"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                NSLog(@"返回登录");
                if (isNull(self.customerContactModel.onlineUrl.customerAccount)) {
                    [self customerContact];/// 获取客服联系方式
                }else{
                    self.jobsOpenURL(self.customerContactModel.onlineUrl.customerAccount);
                }
                [self endEditing:YES];
                if (self.objectBlock) self.objectBlock(x);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self.backgroundImageView addSubview:_contactCustomerServiceBtn];
        [_contactCustomerServiceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(150), JobsWidth(38)));
            make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(12));
            make.centerX.equalTo(self.titleLab);
        }];

    }return _contactCustomerServiceBtn;
}

-(BaseButton *)closeBtn{
    if (!_closeBtn) {
        @jobs_weakify(self)
        _closeBtn = BaseButton.jobsInit()
            .bgColor(JobsClearColor.colorWithAlphaComponent(0))
            .jobsResetBtnBgImage(JobsIMG(@"客服_关闭按钮"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self.backgroundImageView addSubview:_closeBtn];
        [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(24), JobsWidth(24)));
            make.right.equalTo(self).offset(JobsWidth(-20));
            make.top.equalTo(self).offset(JobsWidth(20));
        }];
    }return _closeBtn;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        @jobs_weakify(self)
        _subTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = JobsInternationalization(Title11);
            label.textAlignment = NSTextAlignmentCenter;
            label.numberOfLines = 0;
            label.textColor = HEXCOLOR(0x502600);
            label.font = UIFontWeightMediumSize(12);
            [label sizeToFit];
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.contactCustomerServiceBtn);
                make.top.equalTo(self.contactCustomerServiceBtn.mas_bottom).offset(JobsWidth(23));
                make.left.equalTo(self).offset(JobsWidth(15));
                make.right.equalTo(self).offset(JobsWidth(-15));
            }];
        });
    }return _subTitleLab;
}

-(JobsHotLabelWithSingleLine *)hl{
    if (!_hl) {
        _hl = JobsHotLabelWithSingleLine.new;
        _hl.backgroundColor = JobsClearColor;
        _hl.labelShowingType = UILabelShowingType_02;
        _hl.elementDefaultSize = CGSizeMake(JobsWidth(43), JobsWidth(43));
        [self actionForHotLabel:_hl];
        [self addSubview:_hl];
        [_hl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.subTitleLab.mas_bottom).offset(JobsWidth(13));
            make.size.mas_equalTo(JobsHotLabelWithSingleLine.viewSizeByModel(self.hotLabelDataMutArr));
        }];
        [self layoutIfNeeded];
        _hl.jobsRichViewByModel(self.hotLabelDataMutArr);
    }return _hl;
}

-(UIImageView *)leftIMGV{
    if (!_leftIMGV) {
        @jobs_weakify(self)
        _leftIMGV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.image = JobsIMG(@"客服_左线");
            self.addSubview(imageView);
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(51.6), JobsWidth(1)));
                make.centerY.equalTo(self.subTitleLab);
                make.right.equalTo(self.subTitleLab).offset(JobsWidth(-5));
            }];
        });
    }return _leftIMGV;
}

-(UIImageView *)rightIMGV{
    if (!_rightIMGV) {
        @jobs_weakify(self)
        _rightIMGV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.image = JobsIMG(@"客服_右线");
            self.addSubview(imageView);
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(51.6), JobsWidth(1)));
                make.centerY.equalTo(self.subTitleLab);
                make.left.equalTo(self.subTitleLab).offset(JobsWidth(5));
            }];
        });
    }return _rightIMGV;
}

@end
