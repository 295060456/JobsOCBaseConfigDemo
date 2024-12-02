//
//  SomeViewController.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/3/24.
//

#import "JobsViewNavigatorTestVC.h"

@interface JobsViewNavigatorTestVC ()

@property(nonatomic,strong)JobsPushView *pushView;
@property(nonatomic,strong)BaseButton *btn;

@end

@implementation JobsViewNavigatorTestVC

- (void)dealloc{
    JobsNotificationCenter.remove(self);
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = JobsInternationalization(@"让 UIView 像 UINavigationController 一样支持 push 和 pop");
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.bgImage = JobsIMG(@"新首页的底图");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
//    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsRandomColor;
    self.makeNavByAlpha(1);
//    [self.bgImageView removeFromSuperview];
    self.btn.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.updateStatusBarCor(JobsOrangeColor);/// 在具体子类实现，不要写在父类
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    self.restoreStatusBarCor(nil);
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
///// pushNewView
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UIView *newView = [[UIView alloc] initWithFrame:self.view.bounds];
//    newView.backgroundColor = [UIColor redColor];
//    [self.navigator pushView:newView animated:YES];
//
//}
//
//- (void)popCurrentView {
//    [self.navigator popViewAnimated:YES];
//}


#pragma mark —— lazyLoad
-(BaseButton *)btn{
    if(!_btn){
        @jobs_weakify(self)
        _btn = BaseButton.jobsInit()
            .bgColor(JobsOrangeColor)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(12))
            .jobsResetBtnTitle(JobsInternationalization(@"点击按钮push出view"))
            .jobsResetBtnCornerRadiusValue(JobsWidth(8))
            .jobsResetBtnLayerBorderWidth(JobsWidth(1))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
                
    //            JobsViewNavigator *navigator = JobsViewNavigator.new;
    //            navigator.frame = self.view.bounds;
    //            self.pushView.navigator = navigator;
    //            [self.view addSubview:navigator];
    //            navigator.pushView(self.pushView,YES);
                
//                self.view.configViewNavigatorByPushview(self.pushView);
//                self.view.navigator.pushView(self.pushView,YES);
                
                self.view.pushTo(self.pushView);
                
    //            self.pushView.configViewNavigatorBySuperview(self.view);
    //            self.view.navigator.pushView(self.pushView,YES);
                
    //            self.configViewNavigatorBySuperviewAndView(self.view,self.pushView);
    //            self.view.navigator.pushView(self.pushView,YES);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self.view addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.height.mas_equalTo(JobsWidth(30));
        }];
        _btn.makeBtnTitleByShowingType(UILabelShowingType_03);
    }return _btn;
}

-(JobsPushView *)pushView{
    if(!_pushView){
        _pushView = JobsPushView.new;
        _pushView.frame = self.view.bounds;
        _pushView.backgroundColor = JobsRandomColor;
        _pushView.jobsRichViewByModel(nil);
    }return _pushView;
}

@end
