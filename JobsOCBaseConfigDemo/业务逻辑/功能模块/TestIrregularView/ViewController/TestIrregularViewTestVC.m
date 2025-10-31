//
//  TestIrregularViewTestVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/8.
//

#import "TestIrregularViewTestVC.h"

@interface TestIrregularViewTestVC ()

@end

@implementation TestIrregularViewTestVC

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
    
    [self view1]; //右斜边梯形
    [self view2]; //平行四边形
    [self view3]; //左斜边梯形
    [self view4]; //六角形
    [self view5]; //对折形状
    [self view6]; //箭头
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
/// 右斜边梯形
-(void)view1{
    IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        int R = (arc4random() % 256) ;
        int G = (arc4random() % 256) ;
        int B = (arc4random() % 256) ;
        x.backgroundColor = RGB_COLOR(R, G, B);
    }];
    /// 添加路径关键点array
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(0.f, 0.f)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(120, 0.f)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(120 *3/4, 50)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(0.f, 120)));
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(100);
        make.size.mas_offset(CGSizeMake(120, 50));
    }];
}
/// 平行四边形
-(void)view2{
    IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(120, 100, 120, 50);
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        int R = (arc4random() % 256) ;
        int G = (arc4random() % 256) ;
        int B = (arc4random() % 256) ;
        x.backgroundColor = RGB_COLOR(R, G, B);
    }];
    /// 添加路径关键点array
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(0.f, 50.f)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(120 / 4, 0.f)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(120, 0)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(120 * 3 / 4, 50)));
    [self.view addSubview:btn];
}
/// 左斜边梯形
-(void)view3{
    IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(220, 100, 120, 50);
    btn.backgroundColor = [UIColor cyanColor];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        int R = (arc4random() % 256) ;
        int G = (arc4random() % 256) ;
        int B = (arc4random() % 256) ;
        x.backgroundColor = RGB_COLOR(R, G, B);
    }];[self.view addSubview:btn];
    /// 添加路径关键点array
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(120 / 4, 50.f)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(120, 0.f)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(120, 50)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(0, 50)));
}
/// 六角形
- (void)view4{
    IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 200, 150, 150);
    btn.backgroundColor = [UIColor purpleColor];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        int R = (arc4random() % 256) ;
        int G = (arc4random() % 256) ;
        int B = (arc4random() % 256) ;
        x.backgroundColor = RGB_COLOR(R, G, B);
    }];[self.view addSubview:btn];
    /// 添加路径关键点array
    float viewWidth = btn.frame.size.width;
    
    CGPoint point1 = CGPointMake((sin(M_1_PI / 180 * 60)) * (viewWidth / 2), (viewWidth / 4));
    CGPoint point2 = CGPointMake((viewWidth / 2), 0);
    CGPoint point3 = CGPointMake(viewWidth - ((sin(M_1_PI / 180 * 60)) * (viewWidth / 2)),
                                 (viewWidth / 4));
    CGPoint point4 = CGPointMake(viewWidth - ((sin(M_1_PI / 180 * 60)) * (viewWidth / 2)),
                                 (viewWidth / 2) + (viewWidth / 4));
    CGPoint point5 = CGPointMake((viewWidth / 2), viewWidth);
    CGPoint point6 = CGPointMake((sin(M_1_PI / 180 * 60)) * (viewWidth / 2),
                                 (viewWidth / 2) + (viewWidth / 4));
    /// 添加路径关键点array
    btn.pointMutArr.add(NSValue.byPoint(point1));
    btn.pointMutArr.add(NSValue.byPoint(point2));
    btn.pointMutArr.add(NSValue.byPoint(point3));
    btn.pointMutArr.add(NSValue.byPoint(point4));
    btn.pointMutArr.add(NSValue.byPoint(point5));
    btn.pointMutArr.add(NSValue.byPoint(point6));
}
/// 对折形状
-(void)view5{
    IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(200, 200, 150, 150);
    btn.backgroundColor = [UIColor brownColor];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        int R = (arc4random() % 256) ;
        int G = (arc4random() % 256) ;
        int B = (arc4random() % 256) ;
        x.backgroundColor = RGB_COLOR(R, G, B);
    }];[self.view addSubview:btn];
    /// 添加路径关键点array
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(0.f, 0.f)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(150, 0)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(0, 150)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(150, 150)));
}
/// 箭头
-(void)view6 {
    IrregularBtn * btn = [IrregularBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 380, 330, 150);
    btn.backgroundColor = [UIColor magentaColor];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        int R = (arc4random() % 256) ;
        int G = (arc4random() % 256) ;
        int B = (arc4random() % 256) ;
        x.backgroundColor = RGB_COLOR(R, G, B);
    }];[self.view addSubview:btn];
    /// 添加路径关键点array
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(0, 150)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(330 * 2 / 3, 150 / 3)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(330 * 2 / 3, 0)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(330, 150 / 2)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(330 * 2 / 3, 150)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(330 * 2 / 3, 150 * 2 / 3)));
    btn.pointMutArr.add(NSValue.byPoint(CGPointMake(0, 150 * 2 / 3)));
}

@end

