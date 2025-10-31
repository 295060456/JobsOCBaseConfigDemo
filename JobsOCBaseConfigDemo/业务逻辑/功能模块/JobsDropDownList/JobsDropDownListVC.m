//
//  JobsDropDownListVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/26.
//

#import "JobsDropDownListVC.h"

@interface JobsDropDownListVC ()
/// UI
Prop_strong()JobsDropDownListView *dropDownListView;
Prop_strong()BaseButton *btn;
Prop_strong()UISwitch *switcher;
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*listViewData;
Prop_strong()UIColor *cor;
Prop_assign()JobsDropDownListViewDirection dropDownListViewDirection;

@end

@implementation JobsDropDownListVC

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
    [self endDropDownListView];
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
    self.view.backgroundColor = JobsYellowColor;
    self.makeNavByAlpha(1);
    self.btn.alpha = 1;
    self.switcher.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    /// 加在这里，否则要停顿一秒左右才移除
    [self endDropDownListView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self endDropDownListView];
}
#pragma mark —— 一些私有化方法
/// 移除掉这个下拉列表
-(void)endDropDownListView{
    _dropDownListView.dropDownListViewDisappear(nil);
    _dropDownListView = nil;
}
#pragma mark —— lazyLoad
-(BaseButton *)btn{
    if(!_btn){
        @jobs_weakify(self)
        _btn = BaseButton
            .initByStyle1(JobsInternationalization(@"点击按钮弹出下拉列表"),
                          UIFontWeightRegularSize(12),
                          JobsWhiteColor)
            .bgColorBy(JobsWhiteColor)
            .cornerRadiusValueBy(JobsWidth(8))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                JobsLog(@"AAA = %@",self.dropDownListView);
                x.selected = !x.selected;
                if (x.selected) {
                    /// ❤️只能让它执行一次❤️
                    self.dropDownListView = [self motivateFromView:x
                                     jobsDropDownListViewDirection:self.dropDownListViewDirection
                                                              data:self.listViewData
                                                motivateViewOffset:JobsWidth(5)
                                                       finishBlock:^(UIViewModel *data) {
                        JobsLog(@"data = %@",data);
                    }];
                }else{
                    [self endDropDownListView];
                }
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"按钮的长按事件触发");
            });
        [self.view addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
//            make.size.mas_equalTo(CGSizeMake(JobsWidth(120), JobsWidth(25)));
            make.height.mas_equalTo(JobsWidth(30));
        }];
        _btn.makeBtnTitleByShowingType(UILabelShowingType_03);
    }return _btn;
}

-(UISwitch *)switcher{
    if (!_switcher) {
        _switcher = UISwitch.new;
        _switcher.selected = NO;
        _switcher.thumbTintColor = _switcher.selected ? self.cor : HEXCOLOR(0xB0B0B0);
        _switcher.tintColor = JobsWhiteColor;
        _switcher.onTintColor = HEXCOLOR(0xFFFCF7);
        _switcher.backgroundColor = JobsWhiteColor;
        _switcher.cornerCutToCircleWithCornerRadius(31 / 2);
        [self.view addSubview:_switcher];
        [_switcher mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom);
            make.left.equalTo(self.view).offset(JobsWidth(16));
        }];
        _switcher.selected ? _switcher.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.layerCor = self.cor;
            data.jobsWidth = 1;
        })) : _switcher.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.layerCor = HEXCOLOR(0xB0B0B0);
            data.jobsWidth = 1;
        }));
        @jobs_weakify(self)
        [_switcher jobsSwitchClickEventBlock:^(UISwitch *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            self.btn.selected = !self.btn.selected;
            [self endDropDownListView];
            x.thumbTintColor = x.selected ? self.cor : HEXCOLOR(0xB0B0B0);
            x.selected ? x.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
                @jobs_strongify(self)
                data.layerCor = self.cor;
                data.jobsWidth = 1;
            })) : x.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
                data.layerCor = HEXCOLOR(0xB0B0B0);
                data.jobsWidth = 1;
            }));
            toast(x.selected ? JobsInternationalization(@"打开解锁"):JobsInternationalization(@"关闭解锁"));
            self.dropDownListViewDirection = x.selected;
            self.btn.jobsResetBtnTitle(x.selected ? JobsInternationalization(@"点击按钮弹出上拉列表") : JobsInternationalization(@"点击按钮弹出下拉列表"));
        }];
    }return _switcher;
}

-(UIColor *)cor{
    if (!_cor) {
        _cor = [UIColor gradientCorDataMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(HEXCOLOR(0xE9C65D));
            data.add(HEXCOLOR(0xDDAA3A));
        })
                                   startPoint:CGPointZero
                                     endPoint:CGPointZero
                                       opaque:NO
                               targetViewRect:CGRectMake(0, 0, 51, 31)];
    }return _cor;
}

-(NSMutableArray<UIViewModel *> *)listViewData{
    if (!_listViewData) {
        _listViewData = jobsMakeMutArr(^(__kindof NSMutableArray <UIViewModel *>*_Nullable data) {
            for (int i = 1; i <= 3; i++) {
                data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                    data1.textModel.text = @"0".add(toStringByInt(i));
                    data1.subTextModel.text = @"00".add(toStringByInt(i));
                }));
            }
        });
    }return _listViewData;
}

@end
