//
//  NSObject+YTKNetwork.m
//  FM
//
//  Created by User on 9/18/24.
//

#import "NSObject+YTKNetwork.h"

@implementation NSObject (YTKNetwork)
#pragma mark —— 示例代码
/// 普通的单个请求
-(void)loadCacheData:(jobsByIDBlock _Nullable)successBlock{
    GetCustomerContactApi *api = GetCustomerContactApi.init;
    api.byURLParameters(nil);
    api.byBodyParameters(nil);
    self.handleErr(api);
    // self.tipsByApi(self);
    @jobs_weakify(self)
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        /// 以下是我们需要的值
        JobsResponseModel *responseModel = JobsResponseModel.byData(request.responseObject);
        if(responseModel.code == HTTPResponseCodeSuccess){
            if(successBlock) successBlock(responseModel);
        }
    } failure:^(YTKBaseRequest *request) {
        @jobs_strongify(self)
        self.jobsHandelFailure(request);
    }];
}
/// 多请求の同步请求
-(void)sendBatchRequest:(jobsByIDBlock _Nullable)successBlock{
    YTKBatchRequest *batchRequest = [YTKBatchRequest.alloc initWithRequestArray:jobsMakeMutArr(^(__kindof NSMutableArray <YTKRequest *>*_Nullable data) {
        data.add(GetImageApi.initByBodyParameters(nil));
        data.add(GetImageApi.initByBodyParameters(nil));
        data.add(GetImageApi.initByBodyParameters(nil));
        data.add(GetUserInfoApi.initByBodyParameters(nil));
    })];
    @jobs_weakify(self)
    [batchRequest startWithCompletionBlockWithSuccess:^(YTKBatchRequest *batchRequest) {
        NSLog(@"succeed");
        if(successBlock) successBlock(batchRequest);
        NSArray *requests = batchRequest.requestArray;
        GetImageApi *a = (GetImageApi *)requests[0];
        GetImageApi *b = (GetImageApi *)requests[1];
        GetImageApi *c = (GetImageApi *)requests[2];
        GetUserInfoApi *user = (GetUserInfoApi *)requests[3];
        ///deal with requests result ...
        NSLog(@"%@, %@, %@, %@", a, b, c, user);
        /// 以下是我们需要的值
//        a.responseObject;
//        b.responseObject;
//        c.responseObject;
//        user.responseObject;
    } failure:^(YTKBatchRequest *batchRequest) {
        @jobs_strongify(self)
        self.jobsHandelFailure(batchRequest.failedRequest);
    }];
}
/// 多请求の链式请求。链式请求的结果集体现在<YTKChainRequestDelegate>
-(void)sendChainRequest:(jobsByIDBlock _Nullable)successBlock{
    RegisterApi *api = RegisterApi.init;
    api.byURLParameters(nil);
    api.byBodyParameters(nil);
    YTKChainRequest *chainReq = YTKChainRequest.new;
    [chainReq addRequest:api
                callback:^(YTKChainRequest *chainRequest,
                           YTKBaseRequest *baseRequest) {
        RegisterApi *result = (RegisterApi *)baseRequest;
        /// 在链式请求中，下一个请求的参数来源于上一个请求的结果
        GetUserInfoApi *api2 = GetUserInfoApi.init;
        api2.byURLParameters(nil);
        api2.byBodyParameters(jobsMakeMutDic(^(__kindof NSMutableDictionary *_Nullable data) {
            [data setValue:result.userId forKey:@"KKK"];
        }));
        [chainRequest addRequest:api2 callback:nil];
    }];
    chainReq.delegate = self;
    if(successBlock) successBlock(chainReq);
    [chainReq start];// start to send request
}
#pragma mark —— 一些公有设置
-(void)request:(YTKBaseRequest *)request /// 总数据源
successDataBlock:(JobsReturnIDByResponseModelBlock _Nullable)successDataBlock /// 本层对success的解析数据
   actionBlock:(jobsByResponseModelBlock _Nullable)actionBlock /// 本层对success的解析回调
  successBlock:(jobsByResponseModelBlock _Nullable)successBlock /// 外层对success的解析回调
     failBlock:(jobsByVoidBlock _Nullable)failBlock{ /// 失败解析回调
    JobsResponseModel *responseModel = JobsResponseModel.byData(request.responseObject);
    if(responseModel.code == HTTPResponseCodeSuccess){
        id data = successDataBlock ? successDataBlock(responseModel) : nil;
        if(successBlock) successBlock(data ? data : responseModel);
        if(actionBlock) actionBlock(responseModel);
    }else{
        self.jobsHandelNoSuccess(responseModel.code,request);
        if(failBlock) failBlock();
    }
}

-(void)request:(YTKBaseRequest *)request
  successBlock:(jobsByIDBlock _Nullable)successBlock{
    [self request:request
 successDataBlock:nil
      actionBlock:nil
     successBlock:successBlock
        failBlock:nil];
}

-(jobsByIDBlock _Nonnull)jobsHandelFailure{
    @jobs_weakify(self)
    return ^(YTKBaseRequest *request){
        @jobs_strongify(self)
        self.printURLSessionRequestMessage(request.requestTask);
        NSLog(@"error = %@",request.error);
    };
}

-(JobsHandelNoSuccessBlock _Nonnull)jobsHandelNoSuccess{
    @jobs_weakify(self)
    return ^(HTTPResponseCode data,YTKBaseRequest *_Nonnull request){
        @jobs_strongify(self)
        self.printURLSessionRequestMessage(request.requestTask);
        switch (data) {
                /// 服务器异常
            case HTTPResponseCodeServeError:{
                NSLog(@"服务器异常");
                toast(JobsInternationalization(@"服务器异常"));
            }break;
                /// 令牌不能为空
            case HTTPResponseCodeNoToken:{
                NSLog(@"令牌不能为空");
                self.toLogin();
                toast(JobsInternationalization(@"令牌不能为空"));
            }break;
                /// 登录失败：账密错误
            case HTTPResponseCodeLoginFailed:{
                NSLog(@"登录失败：账密错误");
                toast(JobsInternationalization(@"登录失败：账密错误"));
            }break;
                /// 授权失败
            case HTTPResponseCodeAuthorizationFailure:{
                NSLog(@"授权失败");
                toast(JobsInternationalization(@"授权失败"));
            }break;
                /// 限定时间内超过请求次数
            case HTTPResponseCodeLeakTime:{
                NSLog(@"限定时间内超过请求次数");
                toast(JobsInternationalization(@"限定时间内超过请求次数"));
            }break;
                /// 风险操作
            case HTTPResponseCodeRiskOperation:{
                NSLog(@"风险操作");
                toast(JobsInternationalization(@"风险操作"));
            }break;
                /// 未设置交易密码
            case HTTPResponseCodeNoSettingTransactionPassword:{
                NSLog(@"未设置交易密码");
                toast(JobsInternationalization(@"未设置交易密码"));
            }break;
                /// 账号已在其他设备登录
            case HTTPResponseCodeOffline:{
                NSLog(@"账号已在其他设备登录");
                toast(JobsInternationalization(@"账号已在其他设备登录"));
            }break;
                /// Token 过期：登录已过期，请重新登录
            case HTTPResponseCodeTokenExpire:{
                NSLog(@"Token 过期");
                self.tokenExpire();
            }break;
                
            default:
                break;
        }
    };
}

-(jobsByIDBlock _Nonnull)tipsByApi{
    @jobs_weakify(self)
    return ^(JobsBaseApi *_Nullable api){
        @jobs_strongify(self)
        api.animatingText = JobsInternationalization(JobsInternationalization(@"正在加载"));
        if([self isKindOfClass:UIView.class]){
            UIView *view = (UIView *)self;
            api.animatingView = view;
        }
        if([self isKindOfClass:UIViewController.class]){
            UIViewController *vc = (UIViewController *)self;
            api.animatingView = vc.view;
        }
    };
}

-(jobsByIDBlock _Nonnull)handleErr{
    return ^(JobsBaseApi *_Nullable api){
        if ([api loadCacheWithError:nil]) {
            NSDictionary *json = api.responseJSONObject;
//            NSLog(@"可以 = %@", api.parameters);
//            NSLog(@"打断点 = %@", [json decodeUnicodeLog]);
        }
    };
}
#pragma mark —— YTKChainRequestDelegate
-(void)chainRequestFinished:(YTKChainRequest *)chainRequest{
    NSLog(@"all requests are done");
//    chainRequest.requestArray;
//    chainRequest.requestAccessories;
    YTKBaseRequest *resultRequest = chainRequest.requestArray.lastObject;
    [self request:resultRequest successBlock:^(JobsResponseModel *_Nullable responseModel){
        NSLog(@"");
    }];
}

-(void)chainRequestFailed:(YTKChainRequest *)chainRequest
        failedBaseRequest:(YTKBaseRequest *)request{
    JobsResponseModel *responseModel = JobsResponseModel.byData(request.responseObject);
    self.jobsHandelNoSuccess(responseModel.code,request);
    NSLog(@"请求失败");
}
#pragma mark —— 查询广告列表-支持游客：APP首页右下3Banner【GET】
-(void)getAds:(jobsByIDBlock _Nullable)successBlock{
    FM_promotion_advertise_api *api = FM_promotion_advertise_api.init;
    api.byURLParameters(nil);
    api.byBodyParameters(nil);
    self.handleErr(api);
    // self.tipsByApi(self);
    @jobs_weakify(self)
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        @jobs_strongify(self)
        [self request:request successBlock:successBlock];
    } failure:^(YTKBaseRequest *request) {
        @jobs_strongify(self)
        self.jobsHandelFailure(request);
    }];
}
#pragma mark —— 用户登出【POST】
-(void)fm_logout:(jobsByIDBlock _Nullable)successBlock{
    FM_user_logout_api *api = FM_user_logout_api.init;
    api.byURLParameters(nil);
    api.byBodyParameters(nil);
    self.handleErr(api);
    // self.tipsByApi(self);
    @jobs_weakify(self)
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        @jobs_strongify(self)
        [self request:request successBlock:successBlock];
    } failure:^(YTKBaseRequest *request) {
        @jobs_strongify(self)
        self.jobsHandelFailure(request);
    }];
}
#pragma mark —— 存款优惠活动信息【POST】
-(void)depositDiscountActivityRecordByURLParameters:(NSString *)urlParameters
                                       successBlock:(jobsByIDBlock _Nullable)successBlock{
    FM_GetKYCInfo_api *api = FM_GetKYCInfo_api.init;
    api.byURLParameters(nil);
    api.byBodyParameters(nil);
    YTKChainRequest *chainReq = YTKChainRequest.new;
    [chainReq addRequest:api
                callback:^(YTKChainRequest *chainRequest,
                           YTKBaseRequest *baseRequest) {
        FM_GetKYCInfo_api *result = (FM_GetKYCInfo_api *)baseRequest;
        /// 在链式请求中，下一个请求的参数来源于上一个请求的结果
        FM_getDepositDiscountActivityRecord_api *api2 = FM_getDepositDiscountActivityRecord_api.init;
        api2.byURLParameters(@"?kyc=".add(result.kyc));
        api2.byBodyParameters(nil);
        [chainRequest addRequest:api2 callback:nil];
    }];
    chainReq.delegate = self;
    if(successBlock) successBlock(chainReq);
    [chainReq start];// start to send request
}

@end
