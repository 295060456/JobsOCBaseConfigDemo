//
//  JobsOCBaseConfigTestPopupView.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/5/12.
//

#import "JobsOCBaseConfigTestPopupView.h"

@interface JobsOCBaseConfigTestPopupView ()
/// UI
Prop_strong()BaseButton *containerView;
Prop_strong()UIButton *testPopupViewSureBtn;
/// Data

@end

@implementation JobsOCBaseConfigTestPopupView
@synthesize viewModel = _viewModel;
#pragma mark —— 单例化和销毁
+(void)destroySingleton{
    static_testPopupViewOnceToken = 0;
    static_popupView01 = nil;
}

static JobsOCBaseConfigTestPopupView *static_popupView01 = nil;
static dispatch_once_t static_testPopupViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_testPopupViewOnceToken, ^{
        static_popupView01 = JobsOCBaseConfigTestPopupView.new;
    });return static_popupView01;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
        self.backgroundImageView.image = JobsIMG(@"测试弹窗的背景图");
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        self.containerView.alpha = 1;
        self.testPopupViewSureBtn.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
//    @jobs_weakify(self)
    return ^CGSize(id _Nullable data){
//        @jobs_strongify(self)
        return CGSizeMake(JobsWidth(327), JobsWidth(226));
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)containerView{
    if(!_containerView){
        @jobs_weakify(self)
        _containerView = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetTitlePadding(JobsWidth(8))
            .jobsResetBtnTitleCor(JobsRedColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(20))
            .jobsResetBtnTitle(isNull(self.viewModel.textModel.text) ? JobsInternationalization(@"测试弹窗"): self.viewModel.textModel.text)
            .jobsResetBtnSubTitle(isNull(self.viewModel.subTextModel.text) ? JobsInternationalization(@"相关信息"): self.viewModel.textModel.text)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        [self.addSubview(_containerView) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_containerView.jobsSize);
            make.center.equalTo(self);
        }];
    }return _containerView;
}

-(UIButton *)testPopupViewSureBtn{
    if (!_testPopupViewSureBtn) {
        @jobs_weakify(self)
        _testPopupViewSureBtn = UIButton.jobsInit()
        .jobsResetBtnBgImage(JobsIMG(@"测试弹窗的确定按钮"))
        .selectedStateBackgroundImageBy(JobsIMG(@"测试弹窗的确定按钮"))
        .jobsResetBtnTitle(JobsInternationalization(@"确定"))
        .jobsResetBtnTitleCor(JobsBlackColor)
        .jobsResetBtnTitleFont(UIFontWeightRegularSize(18))
        .onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            x.selected = !x.selected;
            [self tf_hide:nil];
            if(self.objBlock) self.objBlock(x);
        });
        [self.addSubview(_testPopupViewSureBtn) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(JobsWidth(-15));
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(190), JobsWidth(40)));
        }];
    }return _testPopupViewSureBtn;
}

@end
