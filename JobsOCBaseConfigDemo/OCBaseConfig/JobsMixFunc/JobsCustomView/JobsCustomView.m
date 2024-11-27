//
//  JobsCustomView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/25.
//

#import "JobsCustomView.h"

@interface JobsCustomView ()
/// UI
@property(nonatomic,strong)UIImageView *indicatorIMGV;
@property(nonatomic,strong)UILabel *tipsLab;
@property(nonatomic,strong)UIButton *cancelBtn;
@property(nonatomic,strong)UIButton *sureBtn;
@property(nonatomic,strong)BaseView *containFromView;/// fromDatePickerView的承接视图
@property(nonatomic,strong)BaseView *containToView;/// toDatePickerView的承接视图
@property(nonatomic,strong)BRDatePickerView *fromDatePickerView;
@property(nonatomic,strong)BRDatePickerView *toDatePickerView;
@property(nonatomic,strong)UILabel *segmentationLine;
@property(nonatomic,strong)UIColor *cancelBtnBgCor;
@property(nonatomic,strong)UIColor *sureBtnBgCor;
@property(nonatomic,assign)CGSize btnSize;
/// Data

@end

@implementation JobsCustomView
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_customViewOnceToken = 0;
    static_customView = nil;
}

static JobsCustomView *static_customView = nil;
static dispatch_once_t static_customViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_customViewOnceToken, ^{
        static_customView = JobsCustomView.new;
    });return static_customView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = JobsRedColor;
    }return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.btnSize = CGSizeMake(JobsWidth(160), JobsWidth(40));
        self.viewModel = model;
        MakeDataNull
        self.indicatorIMGV.alpha = 1;
        self.segmentationLine.alpha = 1;
        
        [self.fromDatePickerView addPickerToView:self.containFromView];
        [self.toDatePickerView addPickerToView:self.containToView];
        self.tipsLab.alpha = 1;
        self.cancelBtn.alpha = 1;
        self.sureBtn.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(100 + 28 + 199));
    };
}
#pragma mark —— lazyLoad
-(UIImageView *)indicatorIMGV{
    if (!_indicatorIMGV) {
        @jobs_weakify(self)
        _indicatorIMGV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.image = JobsIMG(@"起止");
            self.addSubview(imageView);
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(56), JobsWidth(196)));
                make.left.equalTo(self).offset(JobsWidth(16));
                make.top.equalTo(self).offset(JobsWidth(27));
            }];
        });
    }return _indicatorIMGV;
}

-(UILabel *)segmentationLine{
    if (!_segmentationLine) {
        @jobs_weakify(self)
        _segmentationLine = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.backgroundColor = HEXCOLOR(0xEAEBED);
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.indicatorIMGV);
                make.right.equalTo(self).offset(-JobsWidth(16));
                make.size.mas_equalTo(CGSizeMake(JobsWidth(263), JobsWidth(1)));
            }];
        });
    }return _segmentationLine;
}

-(BaseView *)containFromView{
    if (!_containFromView) {
        @jobs_weakify(self)
        _containFromView = jobsMakeBaseView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view.backgroundColor = JobsRandomColor;
            view.frame = CGRectMake(JobsWidth(100),
                                    JobsWidth(44),
                                    JobsWidth(263),
                                    JobsWidth(196 / 2));
    //        view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            self.addSubview(view);
        });
    }return _containFromView;
}

-(BaseView *)containToView{
    if (!_containToView) {
        @jobs_weakify(self)
        _containToView = jobsMakeBaseView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view.backgroundColor = JobsRandomColor;
            view.frame = CGRectMake(JobsWidth(100),
                                    JobsWidth(44 + 196 / 2),
                                    JobsWidth(263),
                                    JobsWidth(196 / 2));
    //        view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            self.addSubview(view);
        });
    }return _containToView;
}

-(BRDatePickerView *)fromDatePickerView{
    if (!_fromDatePickerView) {
        _fromDatePickerView = self.makeDatePickerView(nil);
    }return _fromDatePickerView;
}

-(BRDatePickerView *)toDatePickerView{
    if (!_toDatePickerView) {
        _toDatePickerView = self.makeDatePickerView(nil);
    }return _toDatePickerView;
}

-(UILabel *)tipsLab{
    if (!_tipsLab) {
        @jobs_weakify(self)
        _tipsLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = JobsInternationalization(@"當前支持查詢最近30天的投注記錄");
            label.font = UIFontWeightRegularSize(12);
            label.textColor = HEXCOLOR(0x757575);
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.indicatorIMGV.mas_bottom).offset(JobsWidth(20));
                make.left.equalTo(self).offset(JobsWidth(19));
            }];label.makeLabelByShowingType(UILabelShowingType_03);
        });
    }return _tipsLab;
}

-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = UIButton.new;
        _cancelBtn.jobsResetBtnTitle(JobsInternationalization(@"取消"));
        _cancelBtn.jobsResetBtnTitleCor(HEXCOLOR(0xB0B0B0));
        _cancelBtn.backgroundColor = self.cancelBtnBgCor;
        [self addSubview:_cancelBtn];
        [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.btnSize);
            make.bottom.equalTo(self).offset(JobsWidth(-16));
            make.left.equalTo(self).offset(JobsWidth(16));
        }];
        _cancelBtn.cornerCutToCircleWithCornerRadius(self.btnSize.height / 2);
        [_cancelBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            toast(x.titleForNormalState);
            return nil;
        }];
    }return _cancelBtn;
}

-(UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = UIButton.new;
        _sureBtn.jobsResetBtnTitle(JobsInternationalization(@"确定"));
        _sureBtn.jobsResetBtnTitleCor(JobsBlackColor);
        _sureBtn.backgroundColor = self.sureBtnBgCor;
        [self addSubview:_sureBtn];
        [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.btnSize);
            make.bottom.equalTo(self).offset(JobsWidth(-16));
            make.right.equalTo(self).offset(JobsWidth(-16));
        }];
        _sureBtn.cornerCutToCircleWithCornerRadius(self.btnSize.height / 2);
        [_sureBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            toast(x.titleForNormalState);
            return nil;
        }];
    }return _sureBtn;
}

-(UIColor *)cancelBtnBgCor{
    if (!_cancelBtnBgCor) {
        _cancelBtnBgCor = [UIColor gradientCorDataMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            arr.add(HEXCOLOR(0xE7E7E7));
            arr.add(HEXCOLOR((0xDDDADA)));
        })
                                              startPoint:CGPointZero
                                                endPoint:CGPointZero
                                                  opaque:NO
                                          targetViewRect:CGRectMake(0,
                                                                    0,
                                                                    self.btnSize.width,
                                                                    self.btnSize.height)];

        
    }return _cancelBtnBgCor;
}

-(UIColor *)sureBtnBgCor{
    if (!_sureBtnBgCor) {
        _sureBtnBgCor = [UIColor gradientCorDataMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            arr.add(HEXCOLOR(0xF2E4A3));
            arr.add(HEXCOLOR((0xF2CC78)));
        })
                                            startPoint:CGPointZero
                                              endPoint:CGPointZero
                                                opaque:NO
                                        targetViewRect:CGRectMake(0,
                                                                  0,
                                                                  self.btnSize.width,
                                                                  self.btnSize.height)];
    }return _sureBtnBgCor;
}

@end
