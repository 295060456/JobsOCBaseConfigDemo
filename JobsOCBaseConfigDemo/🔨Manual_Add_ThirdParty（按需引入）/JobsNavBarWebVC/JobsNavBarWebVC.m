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
    }else if ([self.requestParams isKindOfClass:NSString.class]){
        self.URL = (NSString *)self.requestParams;
    }else{}
    
    self.setupNavigationBarHidden = YES;
    
    {
        self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"     ");
        self.viewModel.textModel.textCor = JobsCor(@"333333");
        self.viewModel.textModel.text = JobsInternationalization(@"Deposit");
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    //    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
        self.viewModel.navBgCor = JobsWhiteColor;
//        self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsYellowColor;
    self.makeNavByAlpha(1);
    self.webView.loadRequest(self.URL.URLRequest);
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
#pragma mark —— WKScriptMessageHandler
/// JS 回调 Objective-C 方法
- (void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message {
    if (message.name.isEqualToString(@"mayapay")) {
        NSLog(@"收到 JS 消息：%@", message.body);
        if ([message.name isEqualToString:@"mayapay"]) {
            NSString *urlString = message.body;
//            self.jobsOpenURL(urlString);
//            self.comingToPushVCByRequestParams(JobsNavBarWebVC.new,urlString);
        }
    }
}
#pragma mark —— lazyLoad
/// BaseViewControllerProtocol
@synthesize webView = _webView;
-(WKWebView *)webView {
    if (!_webView) {
//        _webView = self.makeWebViewByURL(self.urlString.jobsUrl);
        
        /// JS 回调 Objective-C 方法
        _webView = WKWebView.initBy(jobsMakeWebViewConfiguration(^(__kindof WKWebViewConfiguration * _Nullable config) {
            config.userContentController = jobsMakeUserContentController(^(__kindof WKUserContentController * _Nullable data) {
                [data addScriptMessageHandler:self name:@"mayapay"]; // handler 名字
            });
        }));
        _webView.navigationDelegate = self; // 设置代理监听网页加载状态
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
            make.top.equalTo(self.gk_navigationBar.mas_bottom);
            make.left.right.bottom.equalTo(self.view);
        }];
    }return _webView;
}

@end
