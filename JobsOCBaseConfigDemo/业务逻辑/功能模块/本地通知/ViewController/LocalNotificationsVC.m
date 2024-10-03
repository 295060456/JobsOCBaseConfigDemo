//
//  CtrlClipboardCueVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import "LocalNotificationsVC.h"

@interface LocalNotificationsVC ()
/// UI
@property(nonatomic,strong)BaseButton *btn;
/// Data

@end

@implementation LocalNotificationsVC

- (void)dealloc{
    JobsRemoveNotification(self);
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
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
    self.btn.alpha = 1;
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
#pragma mark —— lazyLoad
-(BaseButton *)btn{
    if(!_btn){
        @jobs_weakify(self)
        _btn = BaseButton.jobsInit()
            .bgColor(JobsWhiteColor)
            .jobsResetBtnTitleCor(JobsCor(@"#333333"))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(18)))
            .jobsResetBtnTitle(JobsInternationalization(@"点我"))
            .jobsResetBtnSubTitle(JobsInternationalization(@"出推送通知"))
            .jobsResetTitlePadding(JobsWidth(10))
            .jobsResetBtnCornerRadiusValue(JobsWidth(8))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                if (self.objectBlock) self.objectBlock(x);
                [JobsMakeLocalNotification.new triggerLocalNotification:JobsLocalNotificationModel.new];
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self.view addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(60)));
        }];
        _btn.makeBtnTitleByShowingType(UILabelShowingType_03);
    }return _btn;
}

@end
