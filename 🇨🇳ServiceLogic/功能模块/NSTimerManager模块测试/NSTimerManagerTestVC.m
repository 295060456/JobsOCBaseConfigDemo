//
//  NSTimerManagerTestVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/24.
//

#import "NSTimerManagerTestVC.h"

@interface NSTimerManagerTestVC ()
/// UI
@property(nonatomic,strong)UILabel *valueLab;
@property(nonatomic,strong)NSMutableArray <UIButton *>*btnMutArr;
/// Data
@property(nonatomic,strong)NSTimerManager *nsTimerManager;
@property(nonatomic,strong)NSMutableArray <NSString *>*btnTitleMutArr;
// SEL是不可以保存到array数组中去的
@end

@implementation NSTimerManagerTestVC

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
        self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        self.viewModel.textModel.text = JobsInternationalization(@"NSTimerManager模块测试");
//        self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
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
    
    [self test_masonry_horizontal_fixSpace];
    self.valueLab.alpha = 1;
    
    @jobs_weakify(self)
    /// 开始
    [self.btnMutArr[0] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        [self reloadBtn:data];
        [self.nsTimerManager nsTimeStartSysAutoInRunLoop];
        return nil;
    }];
    /// 暂停
    [self.btnMutArr[1] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        [self reloadBtn:data];
        [self.nsTimerManager nsTimePause];
        return nil;
    }];
    /// 继续
    [self.btnMutArr[2] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        [self reloadBtn:data];
        [self.nsTimerManager nsTimecontinue];
        return nil;
    }];
    /// 结束
    [self.btnMutArr[3] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        [self reloadBtn:data];
        [self.nsTimerManager nsTimeDestroy];
        self.nsTimerManager = nil;
        self.valueLab.text = @"";
        return nil;
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 一些私有方法
-(void)reloadBtn:(UIButton *)button{
    for (UIButton *btn in self.btnMutArr) {
        btn.selected = NO;
    }
    button.selected = !button.selected;
}

-(void)test_masonry_horizontal_fixSpace {
    /// 实现masonry水平固定间隔方法
    [self.btnMutArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                                withFixedSpacing:30
                                     leadSpacing:10
                                     tailSpacing:10];
    /// 设置array的垂直方向的约束
    [self.btnMutArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(10));
        make.height.mas_equalTo(JobsWidth(30));
    }];
}
#pragma mark —— LazyLoad
-(NSTimerManager *)nsTimerManager{
    if (!_nsTimerManager) {
        _nsTimerManager = NSTimerManager.new;
        /// 以下2种模式任选一种
        {/// 顺时针模式
            _nsTimerManager.timerStyle = TimerStyle_clockwise;
        }
        
//        {/// 逆时针模式
//            _nsTimerManager.timerStyle = TimerStyle_anticlockwise;
//            _nsTimerManager.anticlockwiseTime = 100;
//        }
        
        _nsTimerManager.timeInterval = .5f;
        @jobs_weakify(self)
        [_nsTimerManager actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:TimerProcessModel.class]) {
                TimerProcessModel *model = (TimerProcessModel *)data;
                NSLog(@"❤️❤️❤️❤️❤️%f",model.data.anticlockwiseTime);
                self.valueLab.text = [NSString stringWithFormat:@"%.2f",model.data.anticlockwiseTime];
            }
        }];
    }return _nsTimerManager;
}

-(UILabel *)valueLab{
    if (!_valueLab) {
        _valueLab = UILabel.new;
        _valueLab.backgroundColor = HEXCOLOR(0xAE8330);
        [self.view addSubview:_valueLab];
        [_valueLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(20));
            make.center.equalTo(self.view);
        }];
        [_valueLab makeLabelByShowingType:UILabelShowingType_03];
    }return _valueLab;
}

-(NSMutableArray<UIButton *> *)btnMutArr{
    if (!_btnMutArr) {
        _btnMutArr = NSMutableArray.array;
        for (NSString *title in self.btnTitleMutArr) {
            UIButton *btn = UIButton.new;
            btn.normalTitle = title;
            btn.normalTitleColor = JobsBlackColor;
            btn.normalBackgroundImage = JobsIMG(@"弹窗取消按钮背景图");
            btn.selectedBackgroundImage = JobsIMG(@"弹窗取消按钮背景图");
            [btn cornerCutToCircleWithCornerRadius:JobsWidth(8)];
            [btn layerBorderCor:HEXCOLOR(0xAE8330) andBorderWidth:0.5f];
            [self.view addSubview:btn];
            [_btnMutArr addObject:btn];
        }
    }return _btnMutArr;
}

-(NSMutableArray<NSString *> *)btnTitleMutArr{
    if (!_btnTitleMutArr) {
        _btnTitleMutArr = NSMutableArray.array;
        [_btnTitleMutArr addObject:JobsInternationalization(@"开始")];
        [_btnTitleMutArr addObject:JobsInternationalization(@"暂停")];
        [_btnTitleMutArr addObject:JobsInternationalization(@"继续")];
        [_btnTitleMutArr addObject:JobsInternationalization(@"结束")];
    }return _btnTitleMutArr;
}

@end
