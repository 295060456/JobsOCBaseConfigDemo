//
//  JobsTimerVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/20.
//

#import "JobsTimerVC.h"

@interface JobsTimerVC ()
/// UI
@property(nonatomic,strong)UIButton *countDownBtn;
@property(nonatomic,strong)JobsCountdownView *countdownView;
@property(nonatomic,strong)NSMutableArray <UIButton *>*btnMutArr;
/// Data
@property(nonatomic,strong)ButtonTimerConfigModel *btnTimerConfigModel;
@property(nonatomic,strong)NSMutableArray <NSString *>*btnTitleMutArr;

@end

@implementation JobsTimerVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
    self.countDownBtn.timerDestroy();
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
    
    self.view.backgroundColor = JobsMagentaColor;
    self.makeNavByAlpha(1);
    
    [self test_masonry_horizontal_fixSpace];
    self.countDownBtn.alpha = 1;
    self.countdownView.alpha = 1;
    
    @jobs_weakify(self)
    /// 开始
    [self.btnMutArr[0] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        self.countDownBtn.startTimer();
        return nil;
    }];
    /// 暂停
    [self.btnMutArr[1] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        self.countDownBtn.timerSuspend();
        return nil;
    }];
    /// 继续
    [self.btnMutArr[2] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        self.countDownBtn.timerContinue();
        return nil;
    }];
    /// 结束
    [self.btnMutArr[3] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        self.countDownBtn.timerDestroy();
        return nil;
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.countDownBtn.timerContinue();
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.countDownBtn.timerSuspend();
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
#pragma mark —— lazyLoad
-(UIButton *)countDownBtn{
    if (!_countDownBtn) {
        @jobs_weakify(self)
        _countDownBtn = [UIButton.alloc initWithConfig:self.btnTimerConfigModel
                            longPressGestureEventBlock:nil
                                       clickEventBlock:nil]
            .onClick(^(UIButton *x){
                x.startTimer();//选择时机、触发启动
                NSLog(@"🪓🪓🪓🪓🪓 = 获取验证码");
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self.view addSubview:_countDownBtn];
        [_countDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(25));
            make.center.equalTo(self.view);
        }];
        _countDownBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
        [_countDownBtn actionObjectBlock:^(id data) {
//            @jobs_strongify(self)
            if ([data isKindOfClass:TimerProcessModel.class]) {
                TimerProcessModel *model = (TimerProcessModel *)data;
                NSLog(@"❤️❤️❤️❤️❤️%f",model.data.anticlockwiseTime);
            }
        }];
    }return _countDownBtn;
}

-(ButtonTimerConfigModel *)btnTimerConfigModel{
    if (!_btnTimerConfigModel) {
        _btnTimerConfigModel = jobsMakeButtonTimerConfigModel(^(__kindof ButtonTimerConfigModel * _Nullable data) {
            /// 一些通用的设置
            data.jobsSize = CGSizeMake(JobsWidth(100), JobsWidth(25));
            data.count = 5;
            data.showTimeType = ShowTimeType_SS;//时间显示风格
            data.countDownBtnType = TimerStyle_anticlockwise;/// 逆时针模式（倒计时模式）
            data.cequenceForShowTitleRuningStrType = CequenceForShowTitleRuningStrType_tail;
            data.labelShowingType = UILabelShowingType_03;/// 一行显示。不定宽、定高、定字体。宽度自适应 【单行：ByFont】
            /// 计时器未开始【静态值】
            data.readyPlayValue.layerBorderWidth = 0.1;
            data.readyPlayValue.layerCornerRadius = JobsWidth(8);
            data.readyPlayValue.bgCor = JobsYellowColor;
            data.readyPlayValue.layerBorderCor = JobsBrownColor;
            data.readyPlayValue.textCor = JobsBlueColor;
            data.readyPlayValue.text = JobsInternationalization(@"获取验证码");
            data.readyPlayValue.font = UIFontWeightMediumSize(13);
            /// 计时器进行中【动态值】
            data.runningValue.bgCor = JobsCyanColor;
            data.runningValue.text = JobsInternationalization(Title12);
            data.runningValue.layerBorderCor = JobsRedColor;
            data.runningValue.textCor = JobsBlackColor;
            /// 计时器结束【静态值】
            data.endValue.bgCor = JobsYellowColor;
            data.endValue.text = JobsInternationalization(@"哈哈哈哈");
            data.endValue.layerBorderCor = JobsPurpleColor;
            data.endValue.textCor = JobsBlackColor;
        });
    }return _btnTimerConfigModel;
}

-(NSMutableArray<__kindof UIButton *>*)btnMutArr{
    if (!_btnMutArr) {
        _btnMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIButton *>*_Nullable data) {
            for (NSString *title in self.btnTitleMutArr) {
                UIButton *btn = BaseButton
                    .initByStyle3(title,
                                  nil,
                                  JobsBlackColor,
                                  JobsIMG(@"弹窗取消按钮背景图"))
                .bgColor(JobsWhiteColor)
                .onClick(^(UIButton *btn){
                    btn.selected = !btn.selected;
                    btn.jobsResetBtnBgImage(btn.selected ? JobsIMG(@"弹窗取消按钮背景图") : JobsIMG(@"弹窗取消按钮背景图"));
                    
                    btn.jobsResetBtnLayerBorderCor(HEXCOLOR(0xAE8330));/// 重设Btn的描边线段的颜色
                    btn.jobsResetBtnLayerBorderWidth(0.5f);/// 重设Btn的描边线段的宽度
                    btn.jobsResetBtnCornerRadiusValue(JobsWidth(8));/// 重设Btn的圆切角
                    
                }).onLongPressGesture(^(id data){
                    NSLog(@"");
                })
                .layerByBorderCor(HEXCOLOR(0xAE8330))
                .layerByBorderWidth(0.5f)
                .cornerCutToCircleWithCornerRadius(JobsWidth(8));

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

-(JobsCountdownView *)countdownView{
    if (!_countdownView) {
        _countdownView = JobsCountdownView.new;
        _countdownView.jobsRichViewByModel(nil);
        [self.view addSubview:_countdownView];
        [_countdownView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.size.mas_equalTo(JobsCountdownView.viewSizeByModel(nil));
        }];
    }return _countdownView;
}

@end
