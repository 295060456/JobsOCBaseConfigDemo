//
//  JobsMonitorVC.m
//  FM
//
//  Created by User on 9/9/24.
//

#import "JobsMonitorVC.h"

@interface JobsMonitorVC ()

@end

@implementation JobsMonitorVC

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)dealloc{
    JobsRemoveNotification(self);
    [self.view endEditing:YES];
}

-(void)loadView{
    [super loadView];
    self.jobsBackBlock = ^id _Nullable(id _Nullable data) {
        NSLog(@"退出页面的逻辑");
        return nil;
    };
}

-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"SSS = %ld",(long)self.getDeviceOrientation);
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— 在 当前控制器 中适配横屏
/// 适配横屏
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
- (BOOL)shouldAutorotate {
    return YES;
}
#pragma clang diagnostic pop
/// 当前控制器支持的屏幕旋转方向（在具体的控制器子类进行覆写）
/// iPad设备上，默认返回值UIInterfaceOrientationMaskAllButUpSideDwon
/// iPhone设备上，默认返回值是UIInterfaceOrientationMaskAll
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}
/// 设置进入界面默认支持的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [super preferredInterfaceOrientationForPresentation];
}
#pragma mark —— 一些公有方法
-(jobsByVoidBlock _Nonnull)语言切换的监听{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        [self addNotificationName:JobsLanguageSwitchNotification
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                NSLog(@"SSS = %d",b.boolValue);
            }NSLog(@"通知传递过来的 = %@",notification.object);
        }];
    };
}

-(jobsByVoidBlock _Nonnull)设备方向的监听{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        [self addNotificationName:UIDeviceOrientationDidChangeNotification
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                NSLog(@"SSS = %d",b.boolValue);
            }NSLog(@"通知传递过来的 = %@",notification.object);
            switch (UIDevice.currentDevice.orientation) {
                    // 处理竖屏方向的逻辑
                case UIDeviceOrientationPortrait:/// 设备竖直向上，Home 按钮在下方
                    NSLog(@"系统通知：↓");
                    break;
                case UIDeviceOrientationPortraitUpsideDown:/// 设备竖直向下，Home 按钮在上方
                    NSLog(@"系统通知：↑");
                    break;
                    // 处理横屏方向的逻辑
                case UIDeviceOrientationLandscapeLeft:/// 设备水平，Home 按钮在右侧
                    NSLog(@"系统通知：→");
                    break;
                case UIDeviceOrientationLandscapeRight:/// 设备水平，Home 按钮在左侧
                    NSLog(@"系统通知：←");
                    break;
                default:
                    break;
            }
        }];
    };
}
#pragma mark —— lazyLoad

@end
