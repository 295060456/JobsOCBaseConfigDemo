//
//  FMTermsOfUseView.m
//  FMNormal
//
//  Created by Jobs on 2025/5/2.
//

#import "FMTermsOfUseView.h"

@interface FMTermsOfUseView ()

@end

@implementation FMTermsOfUseView
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_termsOfUseViewOnceToken = 0;
    static_termsOfUseView = nil;
}

static FMTermsOfUseView *static_termsOfUseView = nil;
static dispatch_once_t static_termsOfUseViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_termsOfUseViewOnceToken, ^{
        static_termsOfUseView = FMTermsOfUseView.new;
    });return static_termsOfUseView;
}
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
    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerAllCorners
                                        cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
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
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.backgroundColor = JobsWhiteColor;
        self.viewModel = model;
        self.label.alpha = 1;
//        self.webView.alpha = 1;
        self.pdfView.alpha = 1;
        self.button.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(325), JobsWidth(420));
    };
}

-(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return self.class.viewSizeByModel(data);
    };
}
#pragma mark —— lazyLoad
@synthesize label = _label;
-(UILabel *)label{
    if (!_label) {
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"Terms Of USE".tr)
                .byFont(bayonRegular(JobsWidth(20)))
                .byTextCor(JobsCor(@"#8A93A1E5"))
                .byTextAlignment(NSTextAlignmentCenter);
            [self.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.top.equalTo(self).offset(JobsWidth(5));
            }];label.makeLabelByShowingType(UILabelShowingType_03);
        });
    }return _label;
}
@synthesize pdfView = _pdfView;
-(__kindof PDFView *)pdfView{
    if(!_pdfView){
        @jobs_weakify(self)
        _pdfView = jobsMakePDFView(^(__kindof PDFView * _Nullable view) {
            @jobs_strongify(self)
            view.autoScales = YES;
            view.document = PDFDocument.byURL([NSBundle.mainBundle URLForResource:@"Terms of Use" withExtension:@"pdf"]);
            [self.addSubview(view) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.top.equalTo(self.label.mas_bottom).offset(JobsWidth(10));
                make.size.mas_equalTo(CGSizeMake(JobsWidth(290), JobsWidth(300)));
            }];
        });
    }return _pdfView;
}
@synthesize button = _button;
-(__kindof UIButton *)button{
    if(!_button){
        @jobs_weakify(self)
        _button = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(1)
            .jobsResetBtnBgImage(@"小弹窗确认按钮背景图".img)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(bayonRegular(JobsWidth(18)))
            .jobsResetBtnTitle(@"Agree".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if(self.objBlock) self.objBlock(@"");
                [self tf_hide:nil];
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        [self.addSubview(_button) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.pdfView.mas_bottom).offset(JobsWidth(10));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(264), JobsWidth(44)));
            make.centerX.equalTo(self);
        }];
    }return _button;
}

@end
