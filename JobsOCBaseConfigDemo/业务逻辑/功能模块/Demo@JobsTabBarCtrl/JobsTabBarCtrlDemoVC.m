//
//  JobsTabBarCtrlDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 12/4/25.
//

#import "JobsTabBarCtrlDemoVC.h"

@interface JobsTabBarCtrlDemoVC ()

Prop_strong()JobsTabBarCtrl *tabCtrl;
Prop_strong()NSMutableArray <__kindof UIButton*>*buttons;

@end

@implementation JobsTabBarCtrlDemoVC

- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];

    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel.backBtnTitleModel.text = @"返回".tr;
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = @"JobsTabBarCtrl@横滑 Demo（>5 个按钮）";
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.bgImage = @"新首页的底图".img;
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = @"导航栏左侧底图".img;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.tabCtrl.view.byVisible(YES);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tabCtrl.view.frame = self.view.bounds;
}

-(JobsTabBarCtrl *)tabCtrl{
    if(!_tabCtrl){
        @jobs_weakify(self)
        _tabCtrl = jobsMakeTabBarCtrl(^(__kindof JobsTabBarCtrl * _Nullable ctrl) {
            @jobs_strongify(self)
            ctrl
                .bySwipeEnabled(YES)
                .byHorizontalOnly(YES)
                .bySuppressChildVerticalScrolls(YES)
                .byBarBackgroundColor(JobsLightGrayColor)
                .byCustomBarHeight(nil)
                .byBarBottomOffset(0)
                .byBarBackgroundImage(nil)
                .byContentInset(UIEdgeInsetsMake(6, 12, 6, 12))
                .byEqualSpacing(10)
                .byLockUnitToMaxEqualCount(YES)
                .byAutoRelayoutForBoundsChange(YES);
            [ctrl byEqualVisibleRangeFrom:2 to:5];
            [ctrl onButtonsLayoutedWeakOwner:^(JobsTabBarCtrl *owner,
                                               NSArray<UIButton *> *btns) {
                if (btns.count > 2) {
                    UIButton *centerBtn = btns[2];
                    CGRect f = centerBtn.frame;
                    f.origin.y -= 24.0;
                    centerBtn.frame = f;
                    centerBtn.layer.cornerRadius = 14.0;
                    centerBtn.layer.masksToBounds = YES;
                }
            }];
            [ctrl setDataSourceWithButtons:self.buttons controllers:self.buildControllers];
            [self addChildViewController:ctrl];
            [self.view addSubview:ctrl.view];
            ctrl.view.frame = self.view.bounds;
            [ctrl didMoveToParentViewController:self];
        });
    }return _tabCtrl;
}
#pragma mark - 构建按钮 / 控制器
-(NSMutableArray<__kindof UIButton *> *)buttons{
    if(!_buttons){
        _buttons = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
            arr.add(UIButton.jobsInit()
                    .bgColorBy(JobsWhiteColor)
                    .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
                    .jobsResetImagePadding(1)
                    .jobsResetBtnImage(@"house".img)
                    .jobsResetBtnBgImage(@"house.fill".img)
                    .jobsResetBtnTitleCor(JobsWhiteColor)
                    .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                    .jobsResetBtnTitle(@"APPLY NOW".tr)
                    .onClickBy(^(UIButton *x){
                        JobsLog(@"");
                    })
                    .onLongPressGestureBy(^(id data){
                        JobsLog(@"");
                    }))
            .add(UIButton.jobsInit()
                    .bgColorBy(JobsWhiteColor)
                    .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
                    .jobsResetImagePadding(1)
                    .jobsResetBtnImage(@"tag".img)
                    .jobsResetBtnBgImage(@"tag.fill".img)
                    .jobsResetBtnTitleCor(JobsWhiteColor)
                    .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                    .jobsResetBtnTitle(@"APPLY NOW".tr)
                    .onClickBy(^(UIButton *x){
                        JobsLog(@"");
                    })
                    .onLongPressGestureBy(^(id data){
                        JobsLog(@"");
                    }))
            .add(UIButton.jobsInit()
                    .bgColorBy(JobsWhiteColor)
                    .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
                    .jobsResetImagePadding(1)
                    .jobsResetBtnImage(@"creditcard".img)
                    .jobsResetBtnBgImage(@"creditcard.fill".img)
                    .jobsResetBtnTitleCor(JobsWhiteColor)
                    .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                    .jobsResetBtnTitle(@"APPLY NOW".tr)
                    .onClickBy(^(UIButton *x){
                        JobsLog(@"");
                    })
                    .onLongPressGestureBy(^(id data){
                        JobsLog(@"");
                    }))
            .add(UIButton.jobsInit()
                    .bgColorBy(JobsWhiteColor)
                    .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
                    .jobsResetImagePadding(1)
                    .jobsResetBtnImage(@"person.2".img)
                    .jobsResetBtnBgImage(@"person.2.fill".img)
                    .jobsResetBtnTitleCor(JobsWhiteColor)
                    .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                    .jobsResetBtnTitle(@"APPLY NOW".tr)
                    .onClickBy(^(UIButton *x){
                        JobsLog(@"");
                    })
                    .onLongPressGestureBy(^(id data){
                        JobsLog(@"");
                    }))
            .add(UIButton.jobsInit()
                    .bgColorBy(JobsWhiteColor)
                    .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
                    .jobsResetImagePadding(1)
                    .jobsResetBtnImage(@"sparkles".img)
                    .jobsResetBtnBgImage(@"sparkles".img)
                    .jobsResetBtnTitleCor(JobsWhiteColor)
                    .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                    .jobsResetBtnTitle(@"APPLY NOW".tr)
                    .onClickBy(^(UIButton *x){
                        JobsLog(@"");
                    })
                    .onLongPressGestureBy(^(id data){
                        JobsLog(@"");
                    }))
            .add(UIButton.jobsInit()
                    .bgColorBy(JobsWhiteColor)
                    .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
                    .jobsResetImagePadding(1)
                    .jobsResetBtnImage(@"message".img)
                    .jobsResetBtnBgImage(@"message.fill".img)
                    .jobsResetBtnTitleCor(JobsWhiteColor)
                    .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                    .jobsResetBtnTitle(@"APPLY NOW".tr)
                    .onClickBy(^(UIButton *x){
                        JobsLog(@"");
                    })
                    .onLongPressGestureBy(^(id data){
                        JobsLog(@"");
                    }))
            .add(UIButton.jobsInit()
                    .bgColorBy(JobsWhiteColor)
                    .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
                    .jobsResetImagePadding(1)
                    .jobsResetBtnImage(@"person.crop.circle".img)
                    .jobsResetBtnBgImage(@"person.crop.circle.fill".img)
                    .jobsResetBtnTitleCor(JobsWhiteColor)
                    .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                    .jobsResetBtnTitle(@"APPLY NOW".tr)
                    .onClickBy(^(UIButton *x){
                        JobsLog(@"");
                    })
                    .onLongPressGestureBy(^(id data){
                        JobsLog(@"");
                    }));
        });
    }return _buttons;
}

-(NSArray<UIViewController *> *)buildControllers {
    return @[
        ViewController_1.new,
        ViewController_2.new,
        ViewController_3.new,
        ViewController_4.new,
        ViewController_5.new,
    ];
}

@end
