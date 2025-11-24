//
//  JobsTimerVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/20.
//

#import "JobsTimerVC.h"

@interface JobsTimerVC ()
/// UI
Prop_strong()NSMutableArray <UIButton *>*btnMutArr;
Prop_strong()JobsCountdownView *countdownView;
Prop_strong()UIButton *countdownBtn;   // 倒计时按钮
/// Data
Prop_strong()NSMutableArray <NSString *>*btnTitleMutArr;

@end

@implementation JobsTimerVC

- (void)dealloc{
    /// 定时器完全移除以后，才会走dealloc方法
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
    
    self.view.backgroundColor = JobsMagentaColor;
    self.makeNavByAlpha(1);
    
    [self test_masonry_horizontal_fixSpace];
    self.countdownView.byVisible(YES);
    self.countdownBtn.byVisible(YES);
    @jobs_weakify(self)
    /// 开始
    [self.btnMutArr[0] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        [self.countdownView.timer start];
        return nil;
    }];
    /// 暂停
    [self.btnMutArr[1] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        [self.countdownView.timer pause];
        return nil;
    }];
    /// 继续
    [self.btnMutArr[2] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        [self.countdownView.timer resume];
        return nil;
    }];
    /// 结束
    [self.btnMutArr[3] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        [self.countdownView.timer stop];
        [self.countdownView refreshData];
        return nil;
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateTimerControlButtons];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.countdownView.timer stop];
    self.countdownBtn.timerDestroy();
}
#pragma mark —— 一些私有方法
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
/// Timer UI 状态同步
-(void)updateTimerControlButtons {
    id<TimerProtocol> timer = self.countdownView.timer;
    if (!timer || self.btnMutArr.count < 4) return;

    UIButton *startBtn  = self.btnMutArr[0];
    UIButton *pauseBtn  = self.btnMutArr[1];
    UIButton *resumeBtn = self.btnMutArr[2];
    UIButton *stopBtn   = self.btnMutArr[3];

    BOOL isRunning = timer.isRunning;
    BOOL isPaused  = timer.isPaused;
    BOOL isStop    = timer.isStop || (!isRunning && !isPaused); // Idle / Finished / Canceled 都算“非运行”

    // 规则：
    // - Idle / Finished / Canceled：只允许“开始”
    // - Running：允许“暂停 / 结束”，禁止“开始 / 继续”
    // - Paused：允许“继续 / 结束”，禁止“开始 / 暂停”

    // 开始按钮：只有在非运行、非暂停（Idle / Finished / Canceled）时可点
    startBtn.userInteractionEnabled = isStop;
    startBtn.alpha = startBtn.userInteractionEnabled ? 1.0 : 0.5;

    // 暂停按钮：只有 Running 时可点
    pauseBtn.userInteractionEnabled = isRunning;
    pauseBtn.alpha = pauseBtn.userInteractionEnabled ? 1.0 : 0.5;

    // 继续按钮：只有 Paused 时可点
    resumeBtn.userInteractionEnabled = isPaused;
    resumeBtn.alpha = resumeBtn.userInteractionEnabled ? 1.0 : 0.5;

    // 结束按钮：Running / Paused 都可点
    stopBtn.userInteractionEnabled = (isRunning || isPaused);
    stopBtn.alpha = stopBtn.userInteractionEnabled ? 1.0 : 0.5;
}
#pragma mark —— lazyLoad
-(NSMutableArray<__kindof UIButton *>*)btnMutArr{
    if (!_btnMutArr) {
        @jobs_weakify(self)
        _btnMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIButton *>*_Nullable data) {
            @jobs_strongify(self)
            for (NSString *title in self.btnTitleMutArr) {
                UIButton *btn = BaseButton
                    .initByStyle3(title,
                                  nil,
                                  JobsBlackColor,
                                  @"弹窗取消按钮背景图".img)
                .bgColorBy(JobsWhiteColor)
                .onClickBy(^(UIButton *btn){
                    @jobs_strongify(self)
//                    btn.selected = !btn.selected;
                    [self updateTimerControlButtons];
                }).onLongPressGestureBy(^(id data){
                    JobsLog(@"");
                })
                .jobsResetBtnCornerRadiusValue(JobsWidth(18))
                .jobsResetBtnLayerBorderCor(HEXCOLOR(0xAE8330))
                .jobsResetBtnLayerBorderWidth(0.5f);
                [self.view addSubview:btn];
                data.add(btn);
            }
        });
    }return _btnMutArr;
}

-(NSMutableArray<NSString *> *)btnTitleMutArr{
    if (!_btnTitleMutArr) {
        _btnTitleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            data.add(JobsInternationalization(@"开始"))
            .add(JobsInternationalization(@"暂停"))
            .add(JobsInternationalization(@"继续"))
            .add(JobsInternationalization(@"结束"));
        });
    }return _btnTitleMutArr;
}
/// 内含定时器
-(JobsCountdownView *)countdownView{
    if (!_countdownView) {
        _countdownView = JobsCountdownView.new;
        _countdownView.jobsRichViewByModel(nil);// 启动定时器
        [self.view.addSubview(_countdownView) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.size.mas_equalTo(JobsCountdownView.viewSizeByModel(nil));
        }];
    }return _countdownView;
}
/// ★ 倒计时按钮，使用 UIButton+JobsTimer 的封装
/// 内含定时器
-(UIButton *)countdownBtn{
    if (!_countdownBtn) {
        @jobs_weakify(self)
        _countdownBtn = jobsMakeButton(^(__kindof UIButton * _Nullable btn) {//
            @jobs_strongify(self)
            self.view.addSubview
            (
             /// 基础 UI
             btn.jobsResetBtnBgCor(HEXCOLOR(0xAE8330))
                .jobsResetBtnTitle(JobsInternationalization(@"获取验证码"))
                .jobsResetBtnTitleCor(JobsWhiteColor)
                .jobsResetBtnTitleFont(UIFontWeightRegularSize(24))
                /// Timer 配置（UIButton+Timer 提供的属性）
                .byTimerStyle(TimerStyle_anticlockwise)  // 倒计时模式
                .byStartTime(8)                          // 总时长 8 秒
                .byTimeInterval(1)
                .byClickWhenTimerCycle(YES)               // 计时器运行期间：禁止点击
                .byOnTick(^(CGFloat time){
                    btn.jobsResetBtnTitle([NSString stringWithFormat:@"%d",(int)ceil(time)].add(JobsSpace).add(@"秒"));
                })
                .byOnFinish(^(JobsTimer *_Nullable timer){
                    btn.jobsResetBtnTitle(JobsInternationalization(@"获取验证码"));
                })
                /// 点击开始倒计时
                .onClickBy(^(UIButton *x){
                    x.startTimer();
                })
                .jobsResetBtnCornerRadiusValue(JobsWidth(18))
             )
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.centerX.equalTo(self.view);
                make.top.equalTo(self.countdownView.mas_bottom).offset(JobsWidth(12));
                make.height.mas_equalTo(JobsWidth(80));
                make.width.mas_equalTo(JobsWidth(180));
            });
        });
    }return _countdownBtn;
}

@end
