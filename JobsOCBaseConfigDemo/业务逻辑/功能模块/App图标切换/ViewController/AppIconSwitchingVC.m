//
//  AppIconSwitchingVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs Hi on 6/19/24.
//

#import "AppIconSwitchingVC.h"

@interface AppIconSwitchingVC ()

@property(nonatomic,strong)BaseButton *switchBtn;

@end

@implementation AppIconSwitchingVC

- (void)dealloc{
    JobsRemoveNotification(self);
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.bgImage = JobsIMG(@"新首页的底图");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsRandomColor;
    self.makeNavByAlpha(1);
    self.switchBtn.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
//    [self changeAppIconToName:nil];
    [self changeAppIconToName:@"AlternateIcon1"];
}
#pragma mark —— 一些私有方法
-(void)changeAppIconToName:(NSString *)iconName {
    if (UIApplication.sharedApplication.supportsAlternateIcons) {
        [UIApplication.sharedApplication setAlternateIconName:iconName
                                            completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"Error changing app icon: %@", error.localizedDescription);
            }
        }];
    }
}
#pragma mark —— lazyLoad
-(BaseButton *)switchBtn{
    if(!_switchBtn){
        @jobs_weakify(self)
        _switchBtn = BaseButton.jobsInit()
            .bgColor(JobsWhiteColor)
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetTitlePadding(JobsWidth(10))
            .jobsResetBtnCornerRadiusValue(JobsWidth(8))
            .jobsResetBtnImage(JobsIMG(@"APPLY NOW"))
            .jobsResetBtnBgImage(JobsIMG(@"APPLY NOW"))
            .jobsResetBtnTitleCor(JobsCor(@"#333333"))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(JobsInternationalization(@"点击"))
            .jobsResetBtnSubTitle(JobsInternationalization(@"切换App图标"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
    //            x.selected = !x.selected;
    //            NSString *appIconToName = x.selected ? @"AlternateIcon2" : @"AlternateIcon1";
    //            [self changeAppIconToName:appIconToName];
                [self changeAppIconToName:@"AlternateIcon2"];
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self.view addSubview:_switchBtn];
        [_switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(100)));
            make.center.equalTo(self.view);
        }];
        _switchBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
    }return _switchBtn;
}

@end
