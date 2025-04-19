//
//  NSTimerManagerTestVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/24.
//

#import "NSTimerManagerTestVC.h"

@interface NSTimerManagerTestVC ()
/// UI
Prop_strong()UILabel *valueLab;
Prop_copy()NSMutableArray <__kindof UIButton *>*btnMutArr;
/// Data
Prop_strong()NSTimerManager *nsTimerManager;
Prop_copy()NSMutableArray <NSString *>*btnTitleMutArr;
// SEL是不可以保存到array数组中去的
@end

@implementation NSTimerManagerTestVC

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
    self.viewModel.textModel.text = JobsInternationalization(@"NSTimerManager模块测试");
//        self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
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
    
    self.makeNavByAlpha(1);
    
    [self test_masonry_horizontal_fixSpace];
    self.valueLab.alpha = 1;
    
    @jobs_weakify(self)
    /// 开始
    [self.btnMutArr[0] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        [self reloadBtn:data];
        self.nsTimerManager.nsTimeStartSysAutoInRunLoop();
        return nil;
    }];
    /// 暂停
    [self.btnMutArr[1] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        [self reloadBtn:data];
        self.nsTimerManager.nsTimePause();
        return nil;
    }];
    /// 继续
    [self.btnMutArr[2] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        [self reloadBtn:data];
        self.nsTimerManager.nsTimecontinue();
        return nil;
    }];
    /// 结束
    [self.btnMutArr[3] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        [self reloadBtn:data];
        self.nsTimerManager.nsTimeDestroy();
        self.nsTimerManager = nil;
        self.valueLab.text = JobsInternationalization(@"");
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
    }button.selected = !button.selected;
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
        _nsTimerManager = jobsMakeTimerManager(^(NSTimerManager * _Nullable data) {
            /// 以下2种模式任选一种
            {/// 顺时针模式
                data.timerStyle = TimerStyle_clockwise;
            }
            
    //        {/// 逆时针模式
    //            _nsTimerManager.timerStyle = TimerStyle_anticlockwise;
    //            _nsTimerManager.anticlockwiseTime = 100;
    //        }
            
            data.timeInterval = .5f;
            @jobs_weakify(self)
            [data actionObjBlock:^(id data) {
                @jobs_strongify(self)
                if ([data isKindOfClass:UIButtonModel.class]) {
                    UIButtonModel *model = (UIButtonModel *)data;
                    JobsLog(@"❤️❤️❤️❤️❤️%f",model.timerManager.anticlockwiseTime);
                    self.valueLab.text = [NSString stringWithFormat:@"%.2f",model.timerManager.anticlockwiseTime];
                }
            }];
        });
    }return _nsTimerManager;
}

-(UILabel *)valueLab{
    if (!_valueLab) {
        @jobs_weakify(self)
        _valueLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.backgroundColor = HEXCOLOR(0xAE8330);
            [self.view addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(JobsWidth(20));
                make.center.equalTo(self.view);
            }];label.makeLabelByShowingType(UILabelShowingType_03);
        });
    }return _valueLab;
}

-(NSMutableArray <__kindof UIButton *>*)btnMutArr{
    if (!_btnMutArr) {
        @jobs_weakify(self)
        _btnMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIButton *>* _Nullable data) {
            @jobs_strongify(self)
            for (NSString *title in self.btnTitleMutArr) {
                UIButton *btn = UIButton.new;
                btn.jobsResetBtnTitle(title);
                btn.jobsResetBtnTitleCor(JobsBlackColor);
                btn.jobsResetBtnBgImage(JobsIMG(@"弹窗取消按钮背景图"));
                btn.selectedStateBackgroundImageBy(JobsIMG(@"弹窗取消按钮背景图"));
                btn.cornerCutToCircleWithCornerRadius(JobsWidth(8));
                btn.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
                    data.layerCor = HEXCOLOR(0xAE8330);
                    data.jobsWidth = 0.5f;
                }));
                [self.view addSubview:btn];
                data.add(btn);
            }
        });
    }return _btnMutArr;
}

-(NSMutableArray<NSString *> *)btnTitleMutArr{
    if (!_btnTitleMutArr) {
        _btnTitleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            data.add(JobsInternationalization(@"开始"));
            data.add(JobsInternationalization(@"暂停"));
            data.add(JobsInternationalization(@"继续"));
            data.add(JobsInternationalization(@"结束"));
        });
    }return _btnTitleMutArr;
}

@end
