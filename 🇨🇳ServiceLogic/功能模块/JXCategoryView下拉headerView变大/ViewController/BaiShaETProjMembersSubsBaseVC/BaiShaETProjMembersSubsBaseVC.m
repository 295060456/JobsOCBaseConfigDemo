//
//  BaiShaETProjMembersSubsBaseVC.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/18.
//

#import "BaiShaETProjMembersSubsBaseVC.h"

@interface BaiShaETProjMembersSubsBaseVC ()

@end

@implementation BaiShaETProjMembersSubsBaseVC

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
        self.viewModel.textModel.text = Internationalization(@"");
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
    
    self.gk_navigationBar.jobsVisible = YES;
    
    self.topLineLab.alpha = 1;
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
#pragma mark —— lazyLoad
-(UILabel *)topLineLab{
    if (!_topLineLab) {
        _topLineLab = UILabel.new;
        _topLineLab.backgroundColor = HEXCOLOR(0xF8DA87);
        [self.view addSubview:_topLineLab];
        [_topLineLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(self.getTopLineLabSize.width, self.getTopLineLabSize.height));
            make.centerX.equalTo(self.view);
//            make.top.equalTo(self.gk_navigationBar.jobsVisible ? self.gk_navigationBar.mas_bottom : self.view);
            if (self.gk_navigationBar.jobsVisible) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
            }else{
                make.top.equalTo(self.view);
            }
        }];
    }return _topLineLab;
}

@end
