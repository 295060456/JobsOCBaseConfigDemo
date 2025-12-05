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
                .bySwipeEnabled(YES)                            // 是否允许内容区域左右滑动
                .byHorizontalOnly(YES)                          // 只允许横向翻页（默认 YES）
                .bySuppressChildVerticalScrolls(YES)            // 可选：对子 VC 内滚动视图禁用纵向滚动
                .byBarBackgroundColor(JobsLightGrayColor)
                .byCustomBarHeight(nil)                         // TabBar 高度；nil 表示用默认：49 + safeAreaBottom
                .byBarBottomOffset(0)                           // 距底部上移量（>0 上移）
                .byBarBackgroundImage(nil)                      // TabBar 背景图
                .byContentInset(UIEdgeInsetsMake(6, 12, 6, 12))
                .byEqualSpacing(10)                             // 按钮间距（2~5 等分时）
                .byLockUnitToMaxEqualCount(YES)                 // >max(默认5) 时是否仍按“max 等分”的单元宽度布局
                .byAutoRelayoutForBoundsChange(YES);            // 旋转 / 尺寸变化时是否自动重排按钮
            [ctrl byEqualVisibleRangeFrom:2 to:5];              // 2 ~ 5 个按钮时，一屏内等分，不滚动；超过 5 个按钮时，每个按钮宽度算成“5 等分的宽度”，多出来的靠 UIScrollView 滚动解决
            /// 安全监听点“按钮布局完成后”的回调@解决设定某个按钮的垂直凸起
            [ctrl onButtonsLayoutedWeakOwner:^(JobsTabBarCtrl *owner,
                                               NSArray<UIButton *> *btns) {
                if (btns.count > 2) {
                    btns[2].jobsResetBtnCornerRadiusValue(14).resetOriginYByOffset(-24.0);
                }
            }];
            [ctrl setDataSourceByButtons:jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
                @jobs_strongify(self)
                arr.add(UIButton.jobsInit()
                        .bgColorBy(JobsClearColor)
                        .jobsResetImagePlacement(NSDirectionalRectEdgeBottom)
                        .jobsResetImagePadding(5)
                        .jobsResetBtnImage(@"house".sys_img)
    //                    .jobsResetBtnBgImage(@"house.fill".sys_img)
                        .jobsResetBtnTitleCor(JobsRandomCor(1))
                        .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                        .jobsResetBtnTitle(@"首页".tr)
                        .onClickBy(^(UIButton *x){
                            JobsLog(@"");
                        })
                        .onLongPressGestureBy(^(id data){
                            JobsLog(@"");
                        }))
                .add(UIButton.jobsInit()
                        .bgColorBy(JobsClearColor)
                        .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
                        .jobsResetImagePadding(5)
                        .jobsResetBtnImage(@"tag".sys_img)
    //                    .jobsResetBtnBgImage(@"tag.fill".sys_img)
                        .jobsResetBtnTitleCor(JobsRandomCor(1))
                        .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                        .jobsResetBtnTitle(@"优惠".tr)
                        .onClickBy(^(UIButton *x){
                            JobsLog(@"");
                        })
                        .onLongPressGestureBy(^(id data){
                            JobsLog(@"");
                        }))
                .add(UIButton.jobsInit()
                        .bgColorBy(JobsClearColor)
                        .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
                        .jobsResetImagePadding(5)
                        .jobsResetBtnImage(@"creditcard".sys_img)
    //                    .jobsResetBtnBgImage(@"creditcard.fill".sys_img)
                        .jobsResetBtnTitleCor(JobsRandomCor(1))
    //                    .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
    //                    .jobsResetBtnTitle(@"钱包".tr)
                        .jobsResetBtnNormalAttributedTitle(self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                            data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                                @jobs_strongify(self)
                                data1.font = UIFontWeightRegularSize(14);
                                data1.textCor = @"#666666".cor;
                                data1.targetString = @"您".tr;
                                data1.paragraphStyle = self.jobsParagraphStyleCenter;
                            }))
                            .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                                @jobs_strongify(self)
                                data1.font = UIFontWeightRegularSize(14);
                                data1.textCor = @"#BA9B77".cor;
                                data1.targetString = @"好".tr;
                                data1.paragraphStyle = self.jobsParagraphStyleCenter;
                            }));
                        })))
                        .onClickBy(^(UIButton *x){
                            JobsLog(@"");
                            [x pp_addBadgeWithText:@"11"];
                        })
                        .onLongPressGestureBy(^(id data){
                            JobsLog(@"");
                        }))
                .add(UIButton.jobsInit()
                        .bgColorBy(JobsClearColor)
                        .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
                        .jobsResetImagePadding(5)
                        .jobsResetBtnImage(@"person.2".sys_img)
    //                    .jobsResetBtnBgImage(@"person.2.fill".sys_img)
                        .jobsResetBtnTitleCor(JobsRandomCor(1))
                        .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                        .jobsResetBtnTitle(@"APPLY NOW".tr)
                        .onClickBy(^(UIButton *x){
                            JobsLog(@"");
                        })
                        .onLongPressGestureBy(^(id data){
                            JobsLog(@"");
                        }))
                .add(UIButton.jobsInit()
                        .bgColorBy(JobsClearColor)
                        .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
                        .jobsResetImagePadding(5)
                        .jobsResetBtnImage(@"sparkles".sys_img)
    //                    .jobsResetBtnBgImage(@"sparkles".sys_img)
                        .jobsResetBtnTitleCor(JobsRandomCor(1))
                        .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                        .jobsResetBtnTitle(@"我的".tr)
                        .onClickBy(^(UIButton *x){
                            JobsLog(@"");
                        })
                        .onLongPressGestureBy(^(id data){
                            JobsLog(@"");
                        }))
                .add(UIButton.jobsInit()
                        .bgColorBy(JobsClearColor)
                        .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
                        .jobsResetImagePadding(5)
                        .jobsResetBtnImage(@"message".sys_img)
    //                    .jobsResetBtnBgImage(@"message.fill".sys_img)
                        .jobsResetBtnTitleCor(JobsRandomCor(1))
                        .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                        .jobsResetBtnTitle(@"信息".tr)
                        .onClickBy(^(UIButton *x){
                            JobsLog(@"");
                        })
                        .onLongPressGestureBy(^(id data){
                            JobsLog(@"");
                        }))
                .add(UIButton.jobsInit()
                        .bgColorBy(JobsClearColor)
                        .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
                        .jobsResetImagePadding(5)
                        .jobsResetBtnImage(@"person.crop.circle".sys_img)
    //                    .jobsResetBtnBgImage(@"person.crop.circle.fill".sys_img)
                        .jobsResetBtnTitleCor(JobsRandomCor(1))
                        .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                        .jobsResetBtnTitle(@"游戏".tr)
                        .onClickBy(^(UIButton *x){
                            JobsLog(@"");
                        })
                        .onLongPressGestureBy(^(id data){
                            JobsLog(@"");
                        }));
            })
                             controllers:jobsMakeMutArr(^(__kindof NSMutableArray<UIViewController *> * _Nullable arr) {
                arr.add(ViewController_1.new.navCtrl)
                .add(ViewController_2.new.navCtrl)
                .add(ViewController_3.new.navCtrl)
                .add(ViewController_4.new.navCtrl)
                .add(ViewController_5.new.navCtrl);
            })];

            [self addChildViewController:ctrl];
            [self.view addSubview:ctrl.view];
            ctrl.view.frame = self.view.bounds;
            [ctrl didMoveToParentViewController:self];
        });
    }return _tabCtrl;
}

@end
