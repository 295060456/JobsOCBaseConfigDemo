//
//  JobsStatusBarSetttingVC.m
//  FM
//
//  Created by User on 9/9/24.
//

#import "JobsStatusBarSetttingVC.h"

@interface JobsStatusBarSetttingVC ()

@end

@implementation JobsStatusBarSetttingVC
#pragma mark —— BaseViewControllerProtocol
BaseViewControllerProtocol_synthesize
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

-(void)viewWillAppear:(BOOL)animated {
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
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    self.restoreStatusBarCor(nil);
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
/**
 iOS 状态栏颜色的修改
 【全局修改】
  1、在Info.plist里面加入如下键值对：
     1.1、View controller-based status bar appearance : NO
     1.2、Status bar style : Light Content

  2、UIApplication.sharedApplication.statusBarStyle = UIStatusBarStyleLightContent;// iOS 13 后方法被标注废弃

  1.2 和 2 任意选一个即可

 【局部修改】
  1、在Info.plist里面加入如下键值对：
  View controller-based status bar appearance ： YES //全局是NO、局部是YES
  2、@ interface BaseNavigationVC : UINavigationController
     2.1、在 BaseNavigationVC.m里面写入：
     - (UIViewController *)childViewControllerForStatusBarStyle {
             return self.topViewController;
     }
     2.2、在具体的需要修改的VC.m里面写入：
     -(UIStatusBarStyle)preferredStatusBarStyle{
         return UIStatusBarStyleLightContent;
     }
 */
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
#pragma mark —— 一些公有方法<BaseViewControllerProtocol>
/// 恢复状态栏颜色
-(jobsByCorBlock _Nonnull)restoreStatusBarCor{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable cor) {
        @jobs_strongify(self)
        if (@available(iOS 13.0, *)) {
            if (!NSObject.mainWindow().subviews.containsObject(self.statusBar)) {
                [self.statusBar removeFromSuperview];
            }
            if(!cor) cor = JobsWhiteColor;
            self.statusBar.backgroundColor = cor;
        } else {
            self.changeStatusBarCor(JobsClearColor);
        }
    };
}
/// 更新状态栏颜色为自定义的颜色
-(jobsByCorBlock _Nonnull)updateStatusBarCor{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable cor) {
        @jobs_strongify(self)
        if(!cor)cor = JobsRedColor;
        if (@available(iOS 13.0, *)) {
            if (!self.view.subviews.containsObject(self.statusBar)) {
                [self.view addSubview:self.statusBar];
            }self.statusBar.backgroundColor = cor;
        } else {
            self.changeStatusBarCor(cor);
        }
    };
}
#pragma mark —— 一些私有方法
-(jobsByCorBlock)changeStatusBarCor{
    return ^(UIColor *_Nullable data){
        UIView *statusBar = [UIApplication.sharedApplication.valueForKey(@"statusBarWindow") valueForKey:@"statusBar"];
        if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
            statusBar.backgroundColor = data;
        }[self setNeedsStatusBarAppearanceUpdate];// 手动触发 preferredStatusBarStyle 更新状态栏颜色
    };
}
#pragma mark —— lazyLoad
-(UIView *)statusBar{
    if (!_statusBar) {
        _statusBar = [UIView.alloc initWithFrame:jobsGetMainWindowWithSize().windowScene.statusBarManager.statusBarFrame];
    }return _statusBar;
}

@end
