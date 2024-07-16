//
//  JobsOCBaseConfigTestPopupView.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/5/12.
//

#import "JobsOCBaseConfigTestPopupView.h"

@interface JobsOCBaseConfigTestPopupView ()
/// UI
@property(nonatomic,strong)BaseButton *containerView;
@property(nonatomic,strong)UIButton *testPopupViewSureBtn;
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
+(instancetype)sharedInstance{
    dispatch_once(&static_testPopupViewOnceToken, ^{
        static_popupView01 = JobsOCBaseConfigTestPopupView.new;
    });return static_popupView01;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = UIColor.whiteColor;
        self.backgroundImageView.image = JobsIMG(@"测试弹窗的背景图");
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    self.containerView.alpha = 1;
    self.testPopupViewSureBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(327), JobsWidth(226));
}
#pragma mark —— lazyLoad
-(BaseButton *)containerView{
    if(!_containerView){
        @jobs_weakify(self)
        _containerView = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                           background:nil
                                                       titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                        textAlignment:NSTextAlignmentCenter
                                                     subTextAlignment:NSTextAlignmentCenter
                                                          normalImage:nil
                                                       highlightImage:nil
                                                      attributedTitle:nil
                                              selectedAttributedTitle:nil
                                                   attributedSubtitle:nil
                                                                title:self.viewModel.textModel.text.nullString ? JobsInternationalization(@"测试弹窗"): self.viewModel.textModel.text
                                                             subTitle:self.viewModel.subTextModel.text.nullString ? JobsInternationalization(@"相关信息"): self.viewModel.textModel.text
                                                            titleFont:UIFontWeightBoldSize(20)
                                                         subTitleFont:nil
                                                             titleCor:UIColor.redColor
                                                          subTitleCor:nil
                                                   titleLineBreakMode:NSLineBreakByWordWrapping
                                                subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                  baseBackgroundColor:UIColor.whiteColor
                                                         imagePadding:JobsWidth(0)
                                                            titlePadding:JobsWidth(8)
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
        [self addSubview:_containerView];
        [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_containerView.jobsSize);
            make.center.equalTo(self);
        }];
    }return _containerView;
}

-(UIButton *)testPopupViewSureBtn{
    if (!_testPopupViewSureBtn) {
        _testPopupViewSureBtn = UIButton.new;
        _testPopupViewSureBtn.normalBackgroundImage = JobsIMG(@"测试弹窗的确定按钮");
        _testPopupViewSureBtn.selectedBackgroundImage = JobsIMG(@"测试弹窗的确定按钮");
        _testPopupViewSureBtn.normalTitle = JobsInternationalization(@"确定");
        _testPopupViewSureBtn.normalTitleColor = JobsBlackColor;
        _testPopupViewSureBtn.titleFont = UIFontWeightRegularSize(18);
        [self addSubview:_testPopupViewSureBtn];
        [_testPopupViewSureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(JobsWidth(-15));
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(190), JobsWidth(40)));
        }];
        @jobs_weakify(self)
        [_testPopupViewSureBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            [self tf_hide];
            if(self.objectBlock) self.objectBlock(x);
            return nil;
        }];
    }return _testPopupViewSureBtn;
}

@end
