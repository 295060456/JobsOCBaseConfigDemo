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
    JobsLog(@"%@",JobsLocalFunc);
    self.jobsToastMsg(JobsInternationalization(@"检查者出栈"));
}

-(void)loadView{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jobsToastMsg(JobsInternationalization(@"检查者进栈"));
    self.view.backgroundColor = JobsRandomColor;
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    JobsLog(@"%@",JobsLocalFunc);
}
@end
