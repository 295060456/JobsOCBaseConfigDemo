//
//  TransparentRegionVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/8.
//

#import "TransparentRegionVC.h"

@interface TransparentRegionVC ()

@property(nonatomic,strong)UILabel *label;

@end

@implementation TransparentRegionVC

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
//    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsYellowColor;
    self.makeNavByAlpha(1);
    
    self.scrollView.alpha = 1;
    self.label.alpha = 1;
    [self addArc];
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
-(void)addArc{
    /// 中间镂空的矩形框
    CGRect myRect =CGRectMake(100,100,200,200);
    /// 背景
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:UIScreen.mainScreen.bounds
                                                    cornerRadius:0];
    /// 镂空
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:myRect];
    [path appendPath:circlePath];
    [path setUsesEvenOddFillRule:YES];

    [self.view.layer addSublayer:jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable data) {
        data.path = path.CGPath;
        data.fillRule = kCAFillRuleEvenOdd;
        data.fillColor = JobsWhiteColor.CGColor;
        data.opacity = 0.5;
    })];
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize scrollView = _scrollView;
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        @jobs_weakify(self)
        _scrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            @jobs_strongify(self)
            scrollView.backgroundColor = [UIColor redColor];
            scrollView.contentSize = CGSizeMake(JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT() * 2);
            [self.view addSubview:scrollView];
            [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.bottom.equalTo(self.view);
            }];
        });
    }return _scrollView;
}

-(UILabel *)label{
    if (!_label) {
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = JobsInternationalization(@"iOS-UIView设置阴影效果");
            label.frame = CGRectMake(100, 400, 200, 200);
            label.backgroundColor = JobsYellowColor;
            label.layer.shadowColor = JobsBlueColor.CGColor;//阴影颜色
            label.layer.shadowOpacity = 0.8;//阴影透明度，默认为0，如果不设置的话看不到阴影，切记，这是个大坑
            label.layer.shadowOffset = CGSizeMake(0, 0);//设置偏移量
            label.layer.cornerRadius = 9.0;
            label.layer.shadowRadius = 9.0;
            //参数依次为大小，设置四个角圆角状态，圆角曲度
            label.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:label.bounds
                                                           byRoundingCorners:5
                                                                 cornerRadii:CGSizeMake(0, 0)].CGPath;
            [self.scrollView addSubview:label];
        });
    }return _label;
}

@end
