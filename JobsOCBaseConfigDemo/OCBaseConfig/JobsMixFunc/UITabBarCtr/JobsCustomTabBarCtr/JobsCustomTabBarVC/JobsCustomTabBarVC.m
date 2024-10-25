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
    JobsRemoveNotification(self);
    NSLog(@"%@",JobsLocalFunc);
}

static JobsCustomTabBarVC *JobsCustomTabBarVCInstance = nil;
static dispatch_once_t JobsCustomTabBarVCOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&JobsCustomTabBarVCOnceToken, ^{
        if(!JobsCustomTabBarVCInstance){
            JobsCustomTabBarVCInstance = [super allocWithZone:NULL].init;
        }
    });return JobsCustomTabBarVCInstance;
}
/// 单例的销毁
+(void)destroyInstance{
    JobsCustomTabBarVCOnceToken = 0;
    JobsCustomTabBarVCInstance = nil;
}
/// 防止外部使用 alloc/init 等创建新实例
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedManager];
}
/// 防止外部调用copy
-(instancetype)copyWithZone:(NSZone *)zone{
    return self;
}
/// 防止外部调用mutableCopy
-(instancetype)mutableCopyWithZone:(NSZone *)zone{
    return self;
}

-(void)loadView{
    [super loadView];
    self.viewControllers = AppDelegate.viewCtrlMutArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
//    self.view.backgroundColor = JobsGreenColor;
    self.customTabBar.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    extern NSUInteger DefaultIndex;
    self.selectedIndex = DefaultIndex;
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
#pragma mark —— 一些公有方法
- (void)customSelectIndex:(NSUInteger)index {
    self.selectedIndex = index;
    /// TODO 系统的 UITabBarController 的切换方法没有暴露出来，但是实际情况是最好监控这个方法的运行机制，所以期望有一个高仿系统 self.selectedIndex 切换的逻辑
    NSLog(@"");
}
#pragma mark —— LazyLoad
-(JobsCustomTabBar *)customTabBar{
    if(!_customTabBar){
        _customTabBar = NSObject.makeCustomTabBarBy(self.view);
    }return _customTabBar;
}

@end
