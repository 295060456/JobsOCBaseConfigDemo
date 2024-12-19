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
    return ^__kindof UIViewController <BaseViewControllerProtocol>*_Nullable(__kindof WKWebView *_Nonnull webView){
        @jobs_strongify(self)
        UIViewController <BaseViewControllerProtocol>*vc = (UIViewController *)self.class.new;
        vc.webView = webView;
        vc.view.addSubview(webView);
        webView.frame = vc.view.bounds;
        return vc;
    };
}

-(void)dealloc{
    JobsNotificationCenter.remove(self);
    JobsLog(@"%@",JobsLocalFunc);
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
    JobsLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    JobsLog(@"");
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
