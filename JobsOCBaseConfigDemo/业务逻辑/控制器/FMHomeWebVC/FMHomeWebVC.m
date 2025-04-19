//
//  FMHomeWebVC.m
//  FMOnlyH5
//
//  Created by Admin on 7/3/2025.
//

#import "FMHomeWebVC.h"
/**
 
 产品：https://www.bsports.ph/
 UAT：https://bsports.net.ph
 测试：https://www.sports3333.com
 开发：https://www.sports5555.com
 
 */
@interface FMHomeWebVC ()

Prop_strong()UIImageView *launchImageView; /// 启动画面
Prop_strong()UIActivityIndicatorView *loadingIndicator; /// 加载指示器
Prop_copy()NSString *urlString;

@end

@implementation FMHomeWebVC

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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsWhiteColor;

    self.launchImageView.alpha = 1;
    [self.loadingIndicator startAnimating];
    self.webView.alpha = 1;
    self.view.bringSubviewToFront(self.launchImageView); /// 确保启动图在最上层
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNeedsStatusBarAppearanceUpdate];
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
#pragma mark —— WKScriptMessageHandler
/// JS 回调 Objective-C 方法
- (void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message {
    if (message.name.isEqualToString(@"iOSBridge")) {
        NSLog(@"收到 JS 消息：%@", message.body);
    }
    // JS 中调用：window.webkit.messageHandlers.iOSBridge.postMessage("Hello iOS");
}
#pragma mark —— WKNavigationDelegate
/// 网页开始加载
- (void)webView:(WKWebView *)webView
didStartProvisionalNavigation:(WKNavigation *)navigation {
    self.launchImageView.hidden = NO;
    [self.loadingIndicator startAnimating];
}
/// 网页加载完成
- (void)webView:(WKWebView *)webView
didFinishNavigation:(WKNavigation *)navigation {
    @jobs_weakify(self)
    [UIView animateWithDuration:0.5 animations:^{
        @jobs_strongify(self)
        self.launchImageView.alpha = 0;
    } completion:^(BOOL finished) {
        @jobs_strongify(self)
        [self.launchImageView removeFromSuperview];
        [self.loadingIndicator stopAnimating];
        [self.loadingIndicator removeFromSuperview];
    }];
}
/// 网页加载失败
- (void)webView:(WKWebView *)webView
didFailProvisionalNavigation:(WKNavigation *)navigation
      withError:(NSError *)error {
    NSLog(@"网页加载失败: %@", error.localizedDescription);
    [self.loadingIndicator stopAnimating];
}
#pragma mark —— LazyLoad
-(NSString *)urlString{
    if(!_urlString){
//        _urlString = @"https://www.bsports.ph/"; /// 产品
        _urlString = @"https://bsports.net.ph"; /// UAT
//        _urlString = @"https://www.sports3333.com"; /// 测试
//        _urlString = @"https://www.sports5555.com"; /// 开发
    }return _urlString;
}
/// BaseViewControllerProtocol
@synthesize webView = _webView;
-(WKWebView *)webView {
    if (!_webView) {
//        _webView = self.makeWebViewByURL(self.urlString.jobsUrl); 
        
        /// JS 回调 Objective-C 方法
        _webView = WKWebView.initBy(jobsMakeWebViewConfiguration(^(__kindof WKWebViewConfiguration * _Nullable config) {
            config.userContentController = jobsMakeUserContentController(^(__kindof WKUserContentController * _Nullable data) {
                [data addScriptMessageHandler:self name:@"iOSBridge"]; // handler 名字
            });
        }));
        _webView.navigationDelegate = self; // 设置代理监听网页加载状态
        _webView.loadRequest(self.urlString.URLRequest);
        /// 从 Objective-C 调用 JavaScript 方法
        [_webView evaluateJavaScript:@"navigator.userAgent"
                   completionHandler:^(id result, NSError *error) {
            if (!error && [result isKindOfClass:NSString.class]) {
                NSLog(@"User-Agent: %@", result);
                NSString *ua = [NSString stringWithFormat:@"%@",result];
                self->_webView.customUserAgent = ua.add(@"iOS/Mobile");
            } else {
                NSLog(@"获取 User-Agent 失败: %@", error.localizedDescription);
            }
        }];
        self.view.addSubview(_webView);
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(self.view).offset(JobsStatusBarHeight());
        }];
    }return _webView;
}

-(UIImageView *)launchImageView{
    if(!_launchImageView){
        @jobs_weakify(self)
        _launchImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.frame = self.view.bounds;
            imageView.image = JobsIMG(@"1242x2688");
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            self.view.addSubview(imageView);
        });
    }return _launchImageView;
}

-(UIActivityIndicatorView *)loadingIndicator{
    if(!_loadingIndicator){
        _loadingIndicator = [UIActivityIndicatorView.alloc initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
        _loadingIndicator.center = self.view.center;
        self.view.addSubview(self.loadingIndicator);
    }return _loadingIndicator;
}

@end
