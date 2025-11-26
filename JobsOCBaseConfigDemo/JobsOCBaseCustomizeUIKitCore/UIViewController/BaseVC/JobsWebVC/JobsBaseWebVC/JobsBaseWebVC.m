//
//  JobsWebVC.m
//  FMNormal
//
//  Created by Jobs on 2025/5/9.
//

#import "JobsBaseWebVC.h"

@interface JobsBaseWebVC ()

@end

@implementation JobsBaseWebVC

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

- (instancetype)init{
    if (self = [super init]) {
        JobsLog(@"");
    }return self;
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    
    self.setupNavigationBarHidden = YES;
    
    {
        self.viewModel.backBtnTitleModel.text = @"".tr;
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        self.viewModel.textModel.text = @"".tr;
        self.viewModel.textModel.font = UIFontWeightRegularSize(JobsWidth(18));
        
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    //    self.viewModel.bgImage = @"启动页SLOGAN".img;
        self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
//        self.viewModel.navBgImage = @"导航栏左侧底图".img;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = @"#FF0000".cor;
    self.makeNavByConfig(self.makeNav0ByTitle(self.viewModel.textModel.text));
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
#pragma mark —— 一些公共方法
/// TODO
#pragma mark —— BaseViewProtocol
/// makeNormaleWebView
/// self.webView.loadRequest(self.urlString.URLRequest);
+(JobsRetVCByWebViewBlock _Nonnull)initByWebView{
    @jobs_weakify(self)
    return ^__kindof UIViewController <BaseViewControllerProtocol>*_Nullable(__kindof WKWebView *_Nonnull webView){
        @jobs_strongify(self)
        UIViewController <BaseViewControllerProtocol>*vc = (UIViewController *)self.class.new;
        @jobs_weakify(vc)
        vc.webView = webView;
        vc.view.addSubview(webView)
            .setMasonryBy(^(MASConstraintMaker *_Nonnull make){
                @jobs_strongify(vc)
                make.edges.equalTo(vc.view);
        }).on();
        webView.loadRequest(webView.url.URLRequest);/// 创建即加载
        return vc;
    };
}
#pragma mark —— WKScriptMessageHandler
/// JS 回调 Objective-C 方法
- (void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message {
    if(self.objBlock) self.objBlock(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
        data.userContentCtrl = userContentController;
        data.scriptMsg = message;
    }));
}
#pragma mark —— WKNavigationDelegate
/// 网页开始加载
- (void)webView:(WKWebView *)webView
didStartProvisionalNavigation:(WKNavigation *)navigation {
    [self.activityIndicatorView startAnimating];
}
/// 网页加载完成
- (void)webView:(WKWebView *)webView
didFinishNavigation:(WKNavigation *)navigation {
    @jobs_weakify(self)
    [UIView animateWithDuration:0.5 animations:^{
//        @jobs_strongify(self)
    } completion:^(BOOL finished) {
        @jobs_strongify(self)
        [self.activityIndicatorView stopAnimating];
        [self.activityIndicatorView removeFromSuperview];
    }];
}
/// 加载网页失败（如无法连接、找不到页面）
- (void)webView:(WKWebView *)webView
didFailProvisionalNavigation:(WKNavigation *)navigation
      withError:(NSError *)error {
    NSLog(@"网页加载失败: %@", error.localizedDescription);
    [self.activityIndicatorView stopAnimating];
}
#pragma mark —— LazyLoad
@synthesize activityIndicatorView = _activityIndicatorView;
-(UIActivityIndicatorView *)activityIndicatorView{
    if(!_activityIndicatorView){
        _activityIndicatorView = self.view.addSubview(UIActivityIndicatorView.initBy(UIActivityIndicatorViewStyleLarge));
        _activityIndicatorView.center = self.view.center;
    }return _activityIndicatorView;
}

@end
