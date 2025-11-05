//
//  JobsCommentVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/10.
//

#import "JobsCommentVC.h"

@interface JobsCommentVC ()

Prop_strong()UIButton *contactCustomerServiceBtn;// 联系客服按钮

@end

@implementation JobsCommentVC

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
//    self.viewModel.bgImage = @"启动页SLOGAN".img;
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = @"导航栏左侧底图".img;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.contactCustomerServiceBtn.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 一些私有方法
-(void)makeJobsCommentCoreVC{    //触发
    JobsCommentCoreVC *jobsCommentCoreVC = JobsCommentCoreVC.new;
//        @jobs_weakify(self)
    [jobsCommentCoreVC actionObjBlock:^(id data) {
//            @jobs_strongify(self)
        JobsLog(@"您点击了关注");
    }];
    self.comingToPresentVCByRequestParams(jobsCommentCoreVC,JobsInternationalization(@""));
}
#pragma mark —— lazyLoad
-(UIButton *)contactCustomerServiceBtn{
    if (!_contactCustomerServiceBtn) {
        @jobs_weakify(self)
        _contactCustomerServiceBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetBtnImage(@"zaixiankefu_en".img)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self makeJobsCommentCoreVC];
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        [self.view addSubview:_contactCustomerServiceBtn];
        [_contactCustomerServiceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(230), JobsWidth(50)));
            make.center.equalTo(self.view);
        }];
    }return _contactCustomerServiceBtn;
}

@end
