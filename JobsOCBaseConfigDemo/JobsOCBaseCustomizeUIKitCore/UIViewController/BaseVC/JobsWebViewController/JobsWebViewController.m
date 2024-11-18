//
//  JobsWebViewController.m
//  FM
//
//  Created by Admin on 18/11/2024.
//

#import "JobsWebViewController.h"

@interface JobsWebViewController ()

@end

@implementation JobsWebViewController

+(JobsReturnVCByWebViewBlock _Nonnull)initByWebView{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(__kindof WKWebView *_Nonnull webView){
        @jobs_strongify(self)
        UIViewController *vc = (UIViewController *)self.class.new;
        vc.view.addSubview(webView);
        webView.frame = vc.view.bounds;
        return vc;
    };
}

-(void)dealloc{
    JobsNotificationCenter.remove(self);
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
}

-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    self.restoreStatusBarCor(nil);
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}


@end
