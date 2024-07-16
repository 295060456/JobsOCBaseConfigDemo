//
//  PopUpVC.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/7/6.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsPopUpVC.h"

@interface JobsPopUpVC ()

@end

@implementation JobsPopUpVC

- (void)dealloc {
    NSLog(@"%@",JobsLocalFunc);
}
#pragma mark - Lifecycle
-(instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

-(void)loadView{
    [super loadView];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = JobsRedColor;
    self.isHiddenNavigationBar = YES;//禁用系统的导航栏
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.view.mj_y = self.popUpHeight;// 只能用present方式退出界面，否则无效
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
#pragma mark —— lazyLoad
-(CGFloat)popUpHeight{
    if (_popUpHeight == 0) {
        _popUpHeight = 200;//默认弹出高度300
    }return _popUpHeight;
}

@end
