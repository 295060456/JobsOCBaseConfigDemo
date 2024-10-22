//
//  TransparentRegionVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/8.
//

#import "TransparentRegionVC.h"

@interface TransparentRegionVC ()

//@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UILabel *label;

@end

@implementation TransparentRegionVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
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
- (void)addArc {
    //中间镂空的矩形框
    CGRect myRect =CGRectMake(100,100,200,200);

    //背景
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:[UIScreen mainScreen].bounds cornerRadius:0];
    //镂空
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:myRect];
    [path appendPath:circlePath];
    [path setUsesEvenOddFillRule:YES];

    CAShapeLayer *fillLayer = [CAShapeLayer layer];
    fillLayer.path = path.CGPath;
    fillLayer.fillRule = kCAFillRuleEvenOdd;
    fillLayer.fillColor = [UIColor whiteColor].CGColor;
    fillLayer.opacity = 0.5;
    [self.view.layer addSublayer:fillLayer];
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize scrollView = _scrollView;
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = UIScrollView.new;
        _scrollView.backgroundColor = [UIColor redColor];
        _scrollView.contentSize = CGSizeMake(JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT() * 2);
        [self.view addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self.view);
        }];
    }return _scrollView;
}

-(UILabel *)label{
    if (!_label) {
        _label = UILabel.new;
        _label.text = JobsInternationalization(@"iOS-UIView设置阴影效果");
        _label.frame = CGRectMake(100, 400, 200, 200);
        _label.backgroundColor = JobsYellowColor;
        _label.layer.shadowColor = JobsBlueColor.CGColor;//阴影颜色
        _label.layer.shadowOpacity = 0.8;//阴影透明度，默认为0，如果不设置的话看不到阴影，切记，这是个大坑
        _label.layer.shadowOffset = CGSizeMake(0, 0);//设置偏移量
        _label.layer.cornerRadius = 9.0;
        _label.layer.shadowRadius = 9.0;
        //参数依次为大小，设置四个角圆角状态，圆角曲度
        _label.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:_label.bounds byRoundingCorners:5 cornerRadii:CGSizeMake(0, 0)].CGPath;
        [self.scrollView addSubview:_label];
    }return _label;
}

@end
