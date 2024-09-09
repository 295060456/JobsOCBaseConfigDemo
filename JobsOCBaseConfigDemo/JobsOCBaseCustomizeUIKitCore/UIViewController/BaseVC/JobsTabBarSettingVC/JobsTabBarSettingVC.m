//
//  JobsTabBarSettingVC.m
//  FM
//
//  Created by User on 9/9/24.
//

#import "JobsTabBarSettingVC.h"

@interface JobsTabBarSettingVC ()

@end

@implementation JobsTabBarSettingVC

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)dealloc{
    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
}

-(void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
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
    /// 只有是在Tabbar管理的，不含导航的根控制器才开启手势（点语法会有 Property access result unused警告）
    self.isRootVC ? self.tabBarOpenPan() : self.tabBarClosePan();
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— lazyLoad

@end
