//
//  JobsDebugVC.m
//  FM
//
//  Created by User on 9/9/24.
//

#import "JobsDebugVC.h"

@interface JobsDebugVC ()

@end

@implementation JobsDebugVC

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)dealloc{
    JobsRemoveNotification(self);
    if (JobsDebug) {
        toast(JobsInternationalization(@"成功销毁了控制器").add(NSStringFromClass(self.class)));
        NSLog(@"%@",JobsLocalFunc);
        PrintRetainCount(self)
    }
}

-(void)loadView{
    [super loadView];
    self.UIViewControllerLifeCycle(JobsLocalFunc);
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.UIViewControllerLifeCycle(JobsLocalFunc);
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.UIViewControllerLifeCycle(JobsLocalFunc);
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.UIViewControllerLifeCycle(JobsLocalFunc);
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.UIViewControllerLifeCycle(JobsLocalFunc);
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.UIViewControllerLifeCycle(JobsLocalFunc);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.UIViewControllerLifeCycle(JobsLocalFunc);
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.UIViewControllerLifeCycle(JobsLocalFunc);
}
#pragma mark —— 一些私有方法
/// 用于检测UIViewController的生命周期
-(jobsByStringBlock)UIViewControllerLifeCycle{
    @jobs_weakify(self)
    return ^(NSString *_Nullable lifeCycle) {
        @jobs_strongify(self)
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.data = nil;
        viewModel.requestParams = lifeCycle;
        if(self.objectBlock) self.objectBlock(viewModel);
    };
}
#pragma mark —— lazyLoad

@end
