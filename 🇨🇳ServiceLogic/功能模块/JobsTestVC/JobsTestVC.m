//
//  JobsTestVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/3.
//

#import "JobsTestVC.h"

@interface JobsTestVC ()

@end

@implementation JobsTestVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    [NSNotificationCenter.defaultCenter removeObserver:self];
}

-(void)loadView{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(JobsInternationalization(@""));
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(JobsInternationalization(@""));
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

@end
