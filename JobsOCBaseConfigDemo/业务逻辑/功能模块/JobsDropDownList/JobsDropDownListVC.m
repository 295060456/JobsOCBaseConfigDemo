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
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UISwitch *switcher;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*listViewData;
@property(nonatomic,strong)UIColor *cor;
@property(nonatomic,assign)JobsDropDownListViewDirection dropDownListViewDirection;

@end

@implementation JobsDropDownListVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    JobsRemoveNotification(self);;
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
        // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
    //    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsYellowColor;
    [self setGKNav];
    [self setGKNavBackBtn];
    
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
-(UIButton *)btn{
    if (!_btn) {
        _btn = UIButton.new;
        _btn.normalTitle = JobsInternationalization(@"点击按钮弹出下拉列表");
        _btn.titleFont = UIFontWeightRegularSize(12);
        _btn.normalTitleColor = JobsWhiteColor;
        @jobs_weakify(self)
        [_btn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
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
            }return nil;
        }];
        _btn.backgroundColor = UIColor.orangeColor;
        [_btn buttonAutoWidthByFont];

        [self.view addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
        }];
        [_btn layoutIfNeeded];
        [_btn cornerCutToCircleWithCornerRadius:JobsWidth(8)];
    }return _btn;
}

-(UISwitch *)switcher{
    if (!_switcher) {
        _switcher = UISwitch.new;
        [self.view addSubview:_switcher];
        _switcher.selected = NO;
        _switcher.thumbTintColor = _switcher.selected ? self.cor : HEXCOLOR(0xB0B0B0);
        _switcher.tintColor = UIColor.whiteColor;
        _switcher.onTintColor = HEXCOLOR(0xFFFCF7);
        _switcher.backgroundColor = UIColor.whiteColor;
        [_switcher cornerCutToCircleWithCornerRadius:31 / 2];
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
//            toast(x.selected ? JobsInternationalization(@"打开解锁"):JobsInternationalization(@"关闭解锁"));
            self.dropDownListViewDirection = x.selected;
            self->_btn.normalTitle = x.selected ? JobsInternationalization(@"点击按钮弹出上拉列表") : JobsInternationalization(@"点击按钮弹出下拉列表");
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

        for (int i = 1; i <= 9; i++) {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = JobsInternationalization([NSString stringWithFormat:@"0%d",i]);
            viewModel.subTextModel.text = JobsInternationalization([NSString stringWithFormat:@"00%d",i]);
            
            [_listViewData addObject:viewModel];
        }
        
    }return _listViewData;
}

@end
