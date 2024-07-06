//
//  ViewController.m
//  Layout
//
//  Created by 上帝的宠儿 on 2022/6/8.
//

#import "CXBVC.h"

@implementation CXBVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    CGRect frame = fitTop(100, 80, 200, 200);
    UIView *take = [[UIView alloc]initWithFrame:frame];
    take.backgroundColor = UIColor.redColor;
    [self.view addSubview:take];
    
    frame = fitHor(20, 20, 100, 60);
    UIView *sub = [[UIView alloc]initWithFrame:frame];
    sub.backgroundColor = UIColor.greenColor;
    [take addSubview:sub];
    
    frame = CGRectMake(0, 0, take.w_ - hs(50), hs(120));
    UIView *v = [[UIView alloc]initWithFrame:frame];
    v.backgroundColor = UIColor.yellowColor;
    [take addSubview:v];
    
    take.resetSize(CGSizeMake(300, 500));
    
}


@end
