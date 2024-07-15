//
//  JobsCommentVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/10.
//

#import "JobsCommentVC.h"

@interface JobsCommentVC ()

@property(nonatomic,strong)UIButton *contactCustomerServiceBtn;// 联系客服按钮

@end

@implementation JobsCommentVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    JobsRemoveNotification(self);;
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    
    self.setupNavigationBarHidden = YES;
    
    {
        self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
    //    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setGKNav];
    [self setGKNavBackBtn];
    
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
    [jobsCommentCoreVC actionObjectBlock:^(id data) {
//            @jobs_strongify(self)
        NSLog(@"您点击了关注");
    }];

    [self comingToPresentVC:jobsCommentCoreVC
              requestParams:JobsInternationalization(@"")];
}
#pragma mark —— lazyLoad
-(UIButton *)contactCustomerServiceBtn{
    if (!_contactCustomerServiceBtn) {
        _contactCustomerServiceBtn = UIButton.new;
        _contactCustomerServiceBtn.normalImage = JobsIMG(JobsInternationalization(@"zaixiankefu_en"));
        _contactCustomerServiceBtn.selectedImage = JobsIMG(JobsInternationalization(@"zaixiankefu_en"));
        @jobs_weakify(self)
        [_contactCustomerServiceBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            [self makeJobsCommentCoreVC];
            return nil;
        }];
        [self.view addSubview:_contactCustomerServiceBtn];
        [_contactCustomerServiceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(230), JobsWidth(50)));
            make.center.equalTo(self.view);
        }];
    }return _contactCustomerServiceBtn;
}

@end
