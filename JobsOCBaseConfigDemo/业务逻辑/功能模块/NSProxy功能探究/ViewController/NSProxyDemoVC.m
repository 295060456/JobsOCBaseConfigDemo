//
//  NSProxyDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/7/2.
//

#import "NSProxyDemoVC.h"

@interface NSProxyDemoVC ()

@end

@implementation NSProxyDemoVC

-(void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

-(instancetype)init{
    if (self = [super init]) {
        JobsLog(@"");
    }return self;
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.setupNavigationBarHidden = YES;
    {
        self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        self.viewModel.textModel.text = JobsInternationalization(@"探究 NSProxy");
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

-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.demo1();
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)demo1{
    return ^(){
        // 创建 Proxy
        MyProxy *proxy = MyProxy.proxy;
        // 添加多个目标对象（支持多播）
        proxy.addTargetBy(RealServiceA.new);
        proxy.addTargetBy(RealServiceB.new);
        // 强转为协议类型（或用 id<MyService>）
        id<MyService> service = (id<MyService>)proxy;
        [service doSomething]; // 发给 A 和 B，同时打印调用日志
    };
}

-(jobsByVoidBlock _Nonnull)demo2{
    return ^(){
        MyProxy *proxy = MyProxy.proxy;
        proxy.addWeakTargetBy(Person.new);
        [(id)proxy setJobsName:@"JobsHi"];
    };
}

@end
