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
    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
//    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    /// 下列配置一般体现在 AppDelegate
    @jobs_weakify(self)
    jobsMakeYTKNetworkConfig(^(__kindof YTKNetworkConfig * _Nullable data) {
        @jobs_strongify(self)
        data.baseUrl = This.BaseUrl;
        data.cdnUrl = @"";
        //data.urlFilters = nil;
        //data.cacheDirPathFilters = nil;
        data.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        data.debugLogEnabled = YES;
        data.sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration;
        [data addUrlFilter:[YTKUrlArgumentsFilter filterWithArguments:@{@"version": self.appVersion}]];
    });
}

- (void)viewDidLoad {///
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsYellowColor;
    self.makeNavByAlpha(1);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    @jobs_weakify(self)
    /// 普通的单个请求
    [self loadCacheData:^(JobsResponseModel *_Nullable responseModel) {
        
    }];
    /// 多请求の同步请求
    [self sendBatchRequest:^(YTKBatchRequest *_Nullable batchRequest) {
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
    }];
    /// 多请求の链式请求。链式请求的结果集体现在<YTKChainRequestDelegate>
    [self sendChainRequest:^(YTKChainRequest *_Nullable chainReq) {
        @jobs_strongify(self)
        chainReq.delegate = self;
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— YTKChainRequestDelegate
-(void)chainRequestFinished:(YTKChainRequest *)chainRequest{
    NSLog(@"all requests are done");
//    chainRequest.requestArray;
//    chainRequest.requestAccessories;
    YTKBaseRequest *resultRequest = chainRequest.requestArray.lastObject;
    [self request:resultRequest successBlock:^(JobsResponseModel *_Nullable responseModel){
//        self.dataMutArr2 = GetDepositDiscountActivityRecordModel.byData(responseModel.data);
        NSLog(@"");
    }];
}

-(void)chainRequestFailed:(YTKChainRequest *)chainRequest
        failedBaseRequest:(YTKBaseRequest*)request{
    JobsResponseModel *responseModel = JobsResponseModel.byData(request.responseObject);
    self.jobsHandelNoSuccess(request);
    NSLog(@"请求失败");
}
#pragma mark —— lazyLoad

@end
