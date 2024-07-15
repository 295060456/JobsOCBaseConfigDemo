//
//  JobsCustomTabBarVC.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/13/24.
//

#import "JobsCustomTabBarVC.h"

#import "ViewController@1.h"
#import "ViewController@2.h"
#import "ViewController@3.h"
#import "ViewController@4.h"
#import "ViewController@5.h"

@interface JobsCustomTabBarVC ()

@property(nonatomic,strong)JobsCustomTabBar *customTabBar;

@end

@implementation JobsCustomTabBarVC

-(void)dealloc{
    JobsRemoveNotification(self);;
    NSLog(@"%@",JobsLocalFunc);
}

static JobsCustomTabBarVC *JobsCustomTabBarVCInstance = nil;
static dispatch_once_t JobsCustomTabBarVCOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&JobsCustomTabBarVCOnceToken, ^{
        JobsCustomTabBarVCInstance = [super allocWithZone:NULL].init;
    });return JobsCustomTabBarVCInstance;
}
/// 单例的销毁
+(void)destroyInstance{
    JobsCustomTabBarVCOnceToken = 0;
    JobsCustomTabBarVCInstance = nil;
}
/// 防止外部使用 alloc/init 等创建新实例
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    dispatch_once(&JobsCustomTabBarVCOnceToken, ^{
        JobsCustomTabBarVCInstance = [super allocWithZone:zone];
    });return JobsCustomTabBarVCInstance;
}

-(instancetype)copyWithZone:(NSZone *)zone{
    return self;
}

-(instancetype)mutableCopyWithZone:(NSZone *)zone{
    return self;
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
