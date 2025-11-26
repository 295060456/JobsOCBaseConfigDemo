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
Prop_strong()NSMutableArray <__kindof UIButton *>*btnMutArr;
/// Data
Prop_strong()JobsTimer *timer;
Prop_strong()NSMutableArray <NSString *>*btnTitleMutArr;
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
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel.backBtnTitleModel.text = @"返回".tr;
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = @"NSTimerManager模块测试".tr;
//        self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
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
    
    self.makeNavByAlpha(1);
    
    [self test_masonry_horizontal_fixSpace];
    self.valueLab.alpha = 1;
    
    @jobs_weakify(self)
    /// 开始
    [self.btnMutArr[0] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        [self reloadBtn:data];
        [self.timer start];
        return nil;
    }];
    /// 暂停
    [self.btnMutArr[1] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        [self reloadBtn:data];
        [self.timer pause];
        return nil;
    }];
    /// 继续
    [self.btnMutArr[2] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        [self reloadBtn:data];
        [self.timer resume];
        return nil;
    }];
    /// 结束
    [self.btnMutArr[3] jobsBtnClickEventBlock:^id(UIButton *data) {
        @jobs_strongify(self)
        [self reloadBtn:data];
        [self.timer stop];
        self.valueLab.text = @"".tr;
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
-(JobsTimer *)timer{
    if (!_timer) {
        @jobs_weakify(self)
        _timer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            timer
            /// 必须配置的项
                .byTimerType(JobsTimerTypeNSTimer)           // 计时器核心选择
                .byTimerStyle(TimerStyle_anticlockwise)          // 正计时模式
                .byTimeInterval(1)                           // 跳动步长（频率间距）
                .byStartTime(10)                        // ✅ 总时长
                .byTimeSecIntervalSinceDate(3)               // dispatch_after 延迟（这里等价 0）
                .byQueue(dispatch_get_main_queue())
                .byOnTick(^(CGFloat time){
                    @jobs_strongify(self)
                    JobsLog(@"正在倒计时...");
                    self.valueLab.byText([NSString stringWithFormat:@"%f",time]);
                    if (self.objBlock) self.objBlock(timer);
                })
                .byOnFinish(^(__kindof JobsTimer * _Nullable t){
                    @jobs_strongify(self)
                    JobsLog(@"倒计时结束...");
                    if (self.objBlock) self.objBlock(timer);
                });
            /// 这些是内部状态初始化，不暴露成 DSL 也可以
            timer.accumulatedElapsed = 0;   // 已经流逝的时间（总 elapsed，单位秒）
            timer.lastStartDate      = nil; // 最近一次 start/resume 的时间点（支持 pause/resume）
        });
    }return _timer;
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
                btn.jobsResetBtnBgImage(@"弹窗取消按钮背景图".img);
                btn.selectedStateBackgroundImageBy(@"弹窗取消按钮背景图".img);
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
            data.add(@"开始".tr);
            data.add(@"暂停".tr);
            data.add(@"继续".tr);
            data.add(@"结束".tr);
        });
    }return _btnTitleMutArr;
}

@end
