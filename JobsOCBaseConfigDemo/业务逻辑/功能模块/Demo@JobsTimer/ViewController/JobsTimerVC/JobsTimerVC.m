//
//  JobsTimerVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/20.
//

#import "JobsTimerVC.h"

@interface JobsTimerVC ()
/// UI
Prop_strong()UIButton <TimerProtocol>*countDownBtn;
Prop_strong()JobsCountdownView *countdownView;
Prop_strong()NSMutableArray <UIButton *>*btnMutArr;
/// Data
Prop_strong()NSMutableArray <NSString *>*btnTitleMutArr;

@end

@implementation JobsTimerVC

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
    [self.countDownBtn.timer stop];
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
    self.countDownBtn.alpha = 1;
    self.countdownView.alpha = 1;
    
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
        return nil;
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.countDownBtn.timer start];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.countDownBtn.timer stop];
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
-(UIButton<TimerProtocol> *)countDownBtn{
    if (!_countDownBtn) {
        @jobs_weakify(self)
        _countDownBtn = (UIButton<TimerProtocol> *)UIButton.jobsInit()
            .onClickBy(^(__kindof UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
                data.layerCor = HEXCOLOR(0xAE8330);
                data.jobsWidth = 0.5f;
                data.cornerRadiusValue = 25 / 2;
            }));
        [self.view.addSubview(_countDownBtn) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(25));
            make.center.equalTo(self.view);
        }];
    }return _countDownBtn;
}

-(NSMutableArray<__kindof UIButton *>*)btnMutArr{
    if (!_btnMutArr) {
        _btnMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIButton *>*_Nullable data) {
            for (NSString *title in self.btnTitleMutArr) {
                UIButton *btn = BaseButton
                    .initByStyle3(title,
                                  nil,
                                  JobsBlackColor,
                                  @"弹窗取消按钮背景图".img)
                .bgColorBy(JobsWhiteColor)
                .onClickBy(^(UIButton *btn){
                    btn.selected = !btn.selected;
                    btn.jobsResetBtnBgImage(btn.selected ? @"弹窗取消按钮背景图".img : @"弹窗取消按钮背景图".img);
                    
                    btn.jobsResetBtnLayerBorderCor(HEXCOLOR(0xAE8330));/// 重设Btn的描边线段的颜色
                    btn.jobsResetBtnLayerBorderWidth(0.5f);/// 重设Btn的描边线段的宽度
                    btn.jobsResetBtnCornerRadiusValue(JobsWidth(8));/// 重设Btn的圆切角
                    
                }).onLongPressGestureBy(^(id data){
                    JobsLog(@"");
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
            data.add(JobsInternationalization(@"开始"))
            .add(JobsInternationalization(@"暂停"))
            .add(JobsInternationalization(@"继续"))
            .add(JobsInternationalization(@"结束"));
        });
    }return _btnTitleMutArr;
}

-(JobsCountdownView *)countdownView{
    if (!_countdownView) {
        _countdownView = JobsCountdownView.new;
        _countdownView.jobsRichViewByModel(nil);
        [self.view.addSubview(_countdownView) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.size.mas_equalTo(JobsCountdownView.viewSizeByModel(nil));
        }];
    }return _countdownView;
}

@end
