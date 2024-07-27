//
//  YTKNetworkStudyVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/2/19.
//

#import "YTKNetworkStudyVC.h"

@interface YTKNetworkStudyVC ()

@end

@implementation YTKNetworkStudyVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    JobsRemoveNotification(self);;
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    
    {
        self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    //    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
        self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
        self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    }

    /// 下列配置一般体现在Appdelegate
    YTKNetworkConfig *config = YTKNetworkConfig.sharedConfig;
    config.baseUrl = self.BaseUrl;
    config.cdnUrl = JobsInternationalization(@"");
    //config.urlFilters = nil;
    //config.cacheDirPathFilters = nil;
    config.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    config.debugLogEnabled = YES;
    config.sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration;
    
    YTKUrlArgumentsFilter *urlFilter = [YTKUrlArgumentsFilter filterWithArguments:@{@"version": self.appVersion}];
    [config addUrlFilter:urlFilter];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsYellowColor;
    [self setGKNav];
    self.setGKNavBackBtn(nil);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self loadCacheData];// OK
    [self sendBatchRequest];// OK
    [self sendChainRequest];// OK
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 网络请求
/// 普通的单个请求
-(void)loadCacheData{
    GetCustomerContactApi *api = [GetCustomerContactApi.alloc initWithParameters:nil];
    if ([api loadCacheWithError:nil]) {
        NSDictionary *json = [api responseJSONObject];
        NSLog(@"json = %@", json);
        // show cached data
    }

    api.animatingText = JobsInternationalization(@"正在加载");
    api.animatingView = self.view;

    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        NSLog(@"update ui");
        /// 以下是我们需要的值
        request.responseObject;
    } failure:^(YTKBaseRequest *request) {
        NSLog(@"failed");
    }];
}
/// 多请求の同步请求
-(void)sendBatchRequest{
    GetImageApi *a = [GetImageApi.alloc initWithParameters:nil];
    GetImageApi *b = [GetImageApi.alloc initWithParameters:nil];
    GetImageApi *c = [GetImageApi.alloc initWithParameters:nil];
    GetUserInfoApi *d = [GetUserInfoApi.alloc initWithParameters:nil];
    
    YTKBatchRequest *batchRequest = [YTKBatchRequest.alloc initWithRequestArray:@[a, b, c, d]];
    [batchRequest startWithCompletionBlockWithSuccess:^(YTKBatchRequest *batchRequest) {
        NSLog(@"succeed");
        NSArray *requests = batchRequest.requestArray;
        GetImageApi *a = (GetImageApi *)requests[0];
        GetImageApi *b = (GetImageApi *)requests[1];
        GetImageApi *c = (GetImageApi *)requests[2];
        GetUserInfoApi *user = (GetUserInfoApi *)requests[3];
        ///deal with requests result ...
        NSLog(@"%@, %@, %@, %@", a, b, c, user);
        
        /// 以下是我们需要的值
        a.responseObject;
        b.responseObject;
        c.responseObject;
        user.responseObject;
        
    } failure:^(YTKBatchRequest *batchRequest) {
        NSLog(@"failed");
    }];
}
/// 多请求の链式请求。链式请求的结果集体现在<YTKChainRequestDelegate>
-(void)sendChainRequest{
    RegisterApi *reg = [RegisterApi.alloc initWithParameters:nil];
    YTKChainRequest *chainReq = YTKChainRequest.new;
    @jobs_weakify(self)
    [chainReq addRequest:reg
                callback:^(YTKChainRequest *chainRequest,
                           YTKBaseRequest *baseRequest) {
        @jobs_strongify(self)
        RegisterApi *result = (RegisterApi *)baseRequest;
        /// 在链式请求中，下一个请求的参数来源于上一个请求的结果
        GetUserInfoApi *api = [GetUserInfoApi.alloc initWithParameters:@{@"KKK":result.userId}];
        [chainRequest addRequest:api callback:nil];
    }];
    chainReq.delegate = self;
    [chainReq start];// start to send request
}
#pragma mark —— YTKChainRequestDelegate
-(void)chainRequestFinished:(YTKChainRequest *)chainRequest{
    NSLog(@"all requests are done");
}

-(void)chainRequestFailed:(YTKChainRequest *)chainRequest
        failedBaseRequest:(YTKBaseRequest*)request{
    NSLog(@"some one of request is failed");
}
#pragma mark —— lazyLoad

@end
