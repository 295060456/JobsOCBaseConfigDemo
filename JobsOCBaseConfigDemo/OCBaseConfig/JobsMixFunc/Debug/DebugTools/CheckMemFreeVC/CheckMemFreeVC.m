//
//  CheckMemFreeVC.m
//  DouDong-II
//
//  Created by Jobs on 2021/3/5.
//

#import "CheckMemFreeVC.h"

@interface CheckMemFreeVC ()

@end

@implementation CheckMemFreeVC

-(void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    [WHToast jobsToastMsg:@"检查者出栈"];
}

-(void)loadView{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [WHToast jobsToastMsg:@"检查者进栈"];
    self.view.backgroundColor = JobsRandomColor;
    NSLog(@"%@",JobsLocalFunc);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%@",JobsLocalFunc);
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%@",JobsLocalFunc);
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"%@",JobsLocalFunc);
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"%@",JobsLocalFunc);
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"%@",JobsLocalFunc);
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"%@",JobsLocalFunc);
}
@end
