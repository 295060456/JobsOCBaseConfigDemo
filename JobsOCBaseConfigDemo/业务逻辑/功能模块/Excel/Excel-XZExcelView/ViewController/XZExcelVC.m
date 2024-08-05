//
//  XZExcelVC.m
//  FM
//
//  Created by User on 8/5/24.
//

#import "XZExcelVC.h"

@interface XZExcelVC ()

@property(nonatomic,strong)XZExcelView *excelView;

@end

@implementation XZExcelVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);;
}

- (instancetype)init{
    if (self = [super init]) {
        NSLog(@"");
    }return self;
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
        self.viewModel.textModel.text = JobsInternationalization(@"相关功能列表");
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
        // self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
        self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
        self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsRandomColor;
//    self.setGKNav(nil);
//    self.setGKNavBackBtn(nil);
//    self.gk_navigationBar.jobsVisible = NO;
    
    self.makeNavBarConfig(nil,nil);
    self.navBar.alpha = 1;
    
    self.excelView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.gk_navigationBar.hidden = YES;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— LazyLoad
-(XZExcelView *)excelView{
    if(!_excelView){
        _excelView = XZExcelView.new;
        _excelView.backgroundColor = JobsYellowColor;
        [self.view addSubview:_excelView];
        [_excelView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(JobsRealWidth() / 2, JobsRealHeight() / 2));
        }];
    }return _excelView;
}

@end
