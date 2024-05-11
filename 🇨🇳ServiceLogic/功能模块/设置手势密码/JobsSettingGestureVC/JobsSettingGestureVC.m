//
//  JobsSettingGestureVC.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/24.
//

#import "JobsSettingGestureVC.h"

@interface JobsSettingGestureVC ()

@property(nonatomic,strong)UILabel *topLineLab;

@end

@implementation JobsSettingGestureVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    [NSNotificationCenter.defaultCenter removeObserver:self];
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    
    {
        self.viewModel.backBtnTitleModel.text = Internationalization(@"返回");
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
//        self.viewModel.textModel.text = Internationalization(@"設置手勢密碼");
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
    self.topLineLab.alpha = 1;
    [self 重定义父类控件的距离];
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
#pragma mark —— 一些公有方法
-(CGSize)getTopLineLabSize{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(2));
}
#pragma mark —— 私有方法
-(void)重定义父类控件的距离{
    UIImageView *headIcon = self.valueForKeyBlock(@"headIcon");/// 账户头像
    ZLGestureLockIndicator *gestureLockIndicator = self.valueForKeyBlock(@"gestureLockIndicator");
    UILabel *statusLabel = self.valueForKeyBlock(@"statusLabel");
    UILabel *nameLabel = self.valueForKeyBlock(@"nameLabel");/// 账户名
    UIButton *otherAcountBtn = self.valueForKeyBlock(@"otherAcountBtn");/// 其他账户登录按钮
    UIButton *forgetPswBtn = self.valueForKeyBlock(@"forgetPswBtn");/// 忘记手势密码按钮
    
    nameLabel.jobsVisible = NO;
    headIcon.jobsVisible = NO;
    otherAcountBtn.jobsVisible = NO;
    forgetPswBtn.jobsVisible = NO;
    
    CGFloat offset = JobsNavigationBarAndStatusBarHeight(nil) + JobsWidth(2);
    
    headIcon.y += JobsWidth(offset);
    gestureLockIndicator.y += JobsWidth(offset);
    statusLabel.y += JobsWidth(offset);
    nameLabel.y += JobsWidth(offset);
}
#pragma mark —— lazyLoad
-(UILabel *)topLineLab{
    if (!_topLineLab) {
        _topLineLab = UILabel.new;
        _topLineLab.backgroundColor = HEXCOLOR(0xF8DA87);
        [self.view addSubview:_topLineLab];
        [_topLineLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(2)));
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.gk_navigationBar.mas_bottom);
        }];
    }return _topLineLab;
}

@end

