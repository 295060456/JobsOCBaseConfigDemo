//
//  JobsScrollLabelVC.m
//  FM
//
//  Created by Admin on 28/11/2024.
//

#import "JobsScrollLabelVC.h"

@interface JobsScrollLabelVC ()

@property(nonatomic,strong)RACDisposable *timerDisposable;

@end

@implementation JobsScrollLabelVC

-(void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

-(instancetype)init{
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
        self.viewModel.textModel.text = JobsInternationalization(@"滚动的Label");
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    //    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
        self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
        self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    }
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.method2();
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
-(jobsByVoidBlock _Nonnull)method1{
    @jobs_weakify(self)
    return ^(){
        // 启动滚动，设置每隔 0.1 秒滚动一次
        @jobs_strongify(self)
        self.timerDisposable = [jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = JobsInternationalization(@"-这是测试数据-");
            label.textColor = JobsRandomCor(1);
            label.backgroundColor = JobsCyanColor;
            self.view.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(self.view);
                make.size.mas_equalTo(CGSizeMake(JobsWidth(200), JobsWidth(20)));
            }];
        }) startRACTimerWithDuration:0.1 byBlock:^{
            // 可以在这里添加每次触发时需要执行的操作
            NSLog(@"Text has been scrolled.");
        }];
        // 当需要取消定时器时调用
        // [self.timerDisposable dispose];
    };
}

-(jobsByVoidBlock _Nonnull)method2{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = JobsInternationalization(@"-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据");
            label.textColor = JobsRandomCor(1);
            label.backgroundColor = JobsCyanColor;
            self.view.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(self.view);
                make.size.mas_equalTo(CGSizeMake(JobsWidth(200), JobsWidth(20)));
            }];self.view.refresh();
        }).startScrollingIfNeededWithInterval(0.02f);
    };
}

@end
