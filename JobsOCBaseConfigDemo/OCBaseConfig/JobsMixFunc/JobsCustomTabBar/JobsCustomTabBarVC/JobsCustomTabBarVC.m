//
//  JobsCustomTabBarVC.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/13/24.
//

#import "JobsCustomTabBarVC.h"

@interface JobsCustomTabBarVC ()

@property (nonatomic, strong) JobsCustomTabBar *customTabBar;

@end

@implementation JobsCustomTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCustomTabBar];
}

- (void)setupCustomTabBar {
    JobsCustomTabBarConfig *config = [JobsCustomTabBarConfig sharedConfig];
    
    self.customTabBar = [[JobsCustomTabBar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - config.tabBarHeight, self.view.frame.size.width, config.tabBarHeight)];
    self.customTabBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    
    self.tabBar.hidden = YES;
    [self.view addSubview:self.customTabBar];
}


@end
