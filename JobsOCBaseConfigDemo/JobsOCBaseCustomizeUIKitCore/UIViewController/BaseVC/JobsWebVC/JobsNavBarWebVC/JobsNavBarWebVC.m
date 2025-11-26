//
//  JobsNavBarWebVC.m
//  FMOnlyH5
//
//  Created by Admin on 8/4/2025.
//

#import "JobsNavBarWebVC.h"

@interface JobsNavBarWebVC ()

Prop_copy()NSString *URL;

@end

@implementation JobsNavBarWebVC

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
    }else if ([self.requestParams isKindOfClass:NSString.class]){
        self.URL = (NSString *)self.requestParams;
    }else{}
    
    self.setupNavigationBarHidden = YES;
    
    {
        self.viewModel.backBtnTitleModel.text = @"     ".tr;
        self.viewModel.textModel.textCor = @"333333".cor;
        self.viewModel.textModel.text = @"".tr;
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    //    self.viewModel.bgImage = @"启动页SLOGAN".img;
        self.viewModel.navBgCor = JobsWhiteColor;
//        self.viewModel.navBgImage = @"导航栏左侧底图".img;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsWhiteColor;
    self.makeGKNavByConfig(self.makeNav0ByTitle(self.viewModel.textModel.text));
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
        vc.webView = webView;
        vc.view.addSubview(webView)
            .byRemake(^(MASConstraintMaker *_Nonnull make){
                make.top.equalTo(vc.gk_navigationBar.mas_bottom);
                make.left.right.bottom.equalTo(vc.view);
        });
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
/// 决定是否允许一个导航行为（例如：用户点击链接、JS 跳转等）
-(void)webView:(WKWebView *)webView
decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction
decisionHandler:(WKNavigationDelegateBlock2 _Nonnull)decisionHandler{
    // decisionHandler(WKNavigationActionPolicyAllow); // 允许加载
    // decisionHandler(WKNavigationActionPolicyCancel); // 拒绝加载
}
/// 同上，但支持根据网页偏好设置返回更详细的控制选项（iOS 14+）
-(void)webView:(WKWebView *)webView
decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction
   preferences:(WKWebpagePreferences *)preferences
decisionHandler:(WKNavigationDelegateBlock3 _Nonnull)decisionHandler{
    // 可设置网页偏好，如是否允许 JavaScript
}
/// 决定是否允许一个响应（如页面返回的数据）继续导航
-(void)webView:(WKWebView *)webView
decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse
decisionHandler:(WKNavigationDelegateBlock1 _Nonnull)decisionHandler{
    // decisionHandler(WKNavigationResponsePolicyAllow); // 允许响应
    // decisionHandler(WKNavigationResponsePolicyCancel); // 拒绝响应
}
/// 开始加载网页时调用（刚开始请求）
-(void)webView:(WKWebView *)webView
didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    
}
/// 收到服务器跳转请求时调用（如 302 重定向）
-(void)webView:(WKWebView *)webView
didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    
}
/// 加载网页失败（如无法连接、找不到页面）
-(void)webView:(WKWebView *)webView
didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation
     withError:(NSError *)error {
    
}
/// 网页内容开始返回时调用（DOM 开始加载）
-(void)webView:(WKWebView *)webView
didCommitNavigation:(null_unspecified WKNavigation *)navigation {
    
}
/// 网页加载完成
-(void)webView:(WKWebView *)webView
didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    
}
/// 导航失败（一般是网页中途出错，比如 JS 异常等）
-(void)webView:(WKWebView *)webView
didFailNavigation:(null_unspecified WKNavigation *)navigation
     withError:(NSError *)error {
    
}
/// 处理身份验证（如 HTTPS 证书验证）
-(void)webView:(WKWebView *)webView
didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler {
    
}
/// web 内容进程被系统终止（崩溃或内存压力）
-(void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    
}
/// 是否允许继续使用过时的 TLS 协议（iOS 14+，安全性相关）
-(void)webView:(WKWebView *)webView
authenticationChallenge:(NSURLAuthenticationChallenge *)challenge
shouldAllowDeprecatedTLS:(jobsByBOOLBlock _Nonnull)decisionHandler {
    
}
/// 某个导航行为变成了下载操作（例如：点击了文件链接）
-(void)webView:(WKWebView *)webView
navigationAction:(WKNavigationAction *)navigationAction
didBecomeDownload:(WKDownload *)download {
    
}
/// 某个响应变成了下载（如服务器返回了文件类型）
-(void)webView:(WKWebView *)webView
navigationResponse:(WKNavigationResponse *)navigationResponse
didBecomeDownload:(WKDownload *)download {
    
}
/// 是否跳转到某个历史记录项（支持即时返回）
-(void)webView:(WKWebView *)webView
shouldGoToBackForwardListItem:(WKBackForwardListItem *)backForwardListItem
willUseInstantBack:(BOOL)willUseInstantBack
completionHandler:(jobsByBOOLBlock _Nonnull)completionHandler {
    
}
#pragma mark —— lazyLoad

@end
