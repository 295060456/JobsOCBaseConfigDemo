//
//  JobsDropDownListVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/26.
//

#import "JobsDropDownListVC.h"

@interface JobsDropDownListVC ()
/// UI
@property(nonatomic,strong)JobsDropDownListView *dropDownListView;
@property(nonatomic,strong)BaseButton *btn;
@property(nonatomic,strong)UISwitch *switcher;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*listViewData;
@property(nonatomic,strong)UIColor *cor;
@property(nonatomic,assign)JobsDropDownListViewDirection dropDownListViewDirection;

@end

@implementation JobsDropDownListVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
    [self endDropDownListView];
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
    [_dropDownListView dropDownListViewDisappear:nil];
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
            .bgColor(JobsWhiteColor)
            .cornerRadiusValue(JobsWidth(8))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
                NSLog(@"AAA = %@",self.dropDownListView);
                x.selected = !x.selected;
                if (x.selected) {
                    /// ❤️只能让它执行一次❤️
                    self.dropDownListView = [self motivateFromView:x
                                     jobsDropDownListViewDirection:self.dropDownListViewDirection
                                                              data:self.listViewData
                                                motivateViewOffset:JobsWidth(5)
                                                       finishBlock:^(UIViewModel *data) {
                        NSLog(@"data = %@",data);
                    }];
                }else{
                    [self endDropDownListView];
                }
            }).onLongPressGesture(^(id data){
                NSLog(@"按钮的长按事件触发");
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
        [_switcher layerBorderCor:_switcher.selected ? self.cor : HEXCOLOR(0xB0B0B0) andBorderWidth:JobsWidth(1)];
        @jobs_weakify(self)
        [_switcher jobsSwitchClickEventBlock:^(UISwitch *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            self.btn.selected = !self.btn.selected;
            [self endDropDownListView];
            x.thumbTintColor = x.selected ? self.cor : HEXCOLOR(0xB0B0B0);
            [x layerBorderCor:x.selected ? self.cor : HEXCOLOR(0xB0B0B0) andBorderWidth:JobsWidth(1)];
            toast(x.selected ? JobsInternationalization(@"打开解锁"):JobsInternationalization(@"关闭解锁"));
            self.dropDownListViewDirection = x.selected;
            self.btn.jobsResetBtnTitle(x.selected ? JobsInternationalization(@"点击按钮弹出上拉列表") : JobsInternationalization(@"点击按钮弹出下拉列表"));
        }];
    }return _switcher;
}

-(UIColor *)cor{
    if (!_cor) {
        _cor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xE9C65D),HEXCOLOR(0xDDAA3A)]]
                                   startPoint:CGPointZero
                                     endPoint:CGPointZero
                                       opaque:NO
                               targetViewRect:CGRectMake(0, 0, 51, 31)];
    }return _cor;
}

-(NSMutableArray<UIViewModel *> *)listViewData{
    if (!_listViewData) {
        _listViewData = NSMutableArray.new;
        for (int i = 1; i <= 3; i++) {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = @"0".add(toStringByInt(i));
            viewModel.subTextModel.text = @"00".add(toStringByInt(i));
            _listViewData.add(viewModel);
        }
    }return _listViewData;
}

@end
