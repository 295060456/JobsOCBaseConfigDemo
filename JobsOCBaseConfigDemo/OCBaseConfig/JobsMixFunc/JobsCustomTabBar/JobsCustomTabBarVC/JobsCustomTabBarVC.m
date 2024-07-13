//
//  JobsCustomTabBarVC.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/13/24.
//

#import "JobsCustomTabBarVC.h"

@interface JobsCustomTabBarVC ()

@property(nonatomic,strong)JobsCustomTabBar *customTabBar;

@end

@implementation JobsCustomTabBarVC

-(void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    self.view.backgroundColor = JobsGreenColor;
    self.customTabBar.alpha = 1;
    id f = JobsCustomTabBarConfig.sharedManager.viewControllers;
    self.viewControllers = JobsCustomTabBarConfig.sharedManager.viewControllers;
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

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— LazyLoad
-(JobsCustomTabBar *)customTabBar{
    if(!_customTabBar){
        _customTabBar = JobsCustomTabBar.new;
        _customTabBar.backgroundColor = JobsRedColor;
        [self.view addSubview:_customTabBar];
        [_customTabBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.view.width);
            make.height.mas_equalTo(JobsCustomTabBarConfig.sharedManager.tabBarHeight);
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view);
        }];
//        _customTabBar.frame = CGRectMake(0,
//                                         self.view.frame.size.height - JobsCustomTabBarConfig.sharedManager.tabBarHeight,
//                                         self.view.frame.size.width,
//                                         JobsCustomTabBarConfig.sharedManager.tabBarHeight);
    }return _customTabBar;
}

@end
