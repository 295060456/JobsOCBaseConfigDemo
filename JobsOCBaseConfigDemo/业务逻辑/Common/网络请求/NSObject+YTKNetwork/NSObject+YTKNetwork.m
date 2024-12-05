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
-(void)loadCacheData:(jobsByResponseModelBlock _Nullable)successBlock{
    GetCustomerContactApi *api = GetCustomerContactApi.new;
    api.byURLParameters(nil); /// 添加URL参数
    api.byBodyParameters(nil); /// 添加Body参数
    api.byHeaderParameters(nil); /// 添加Header参数
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
        if(self) self.jobsHandelFailure(request);
    }];
}
/// 多请求の同步请求
-(void)sendBatchRequest:(jobsByYTKBatchRequestBlock _Nullable)successBlock{
    YTKBatchRequest *batchRequest = YTKBatchRequest.initByRequestArray(jobsMakeMutArr(^(__kindof NSMutableArray <__kindof YTKRequest *>*_Nullable data) {
        data.add(GetImageApi.initByBodyParameters(nil));
        data.add(GetImageApi.initByBodyParameters(nil));
        data.add(GetImageApi.initByBodyParameters(nil));
        data.add(GetUserInfoApi.initByBodyParameters(nil));
    }));
    @jobs_weakify(self)
    [batchRequest startWithCompletionBlockWithSuccess:^(YTKBatchRequest *batchRequest) {
        NSLog(@"succeed");
        if(successBlock) successBlock(batchRequest);
        NSArray <__kindof YTKRequest *>*requests = batchRequest.requestArray;
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
-(void)sendChainRequest:(jobsByYTKChainRequestBlock _Nullable)successBlock{
    RegisterApi *api = RegisterApi.init;
    api.byURLParameters(nil); /// 添加URL参数
    api.byBodyParameters(nil); /// 添加Body参数
    api.byHeaderParameters(nil); /// 添加Header参数
    YTKChainRequest *chainReq = YTKChainRequest.new;
    [chainReq addRequest:api
                callback:^(YTKChainRequest *chainRequest,
                           YTKBaseRequest *baseRequest) {
        RegisterApi *result = (RegisterApi *)baseRequest;
        /// 在链式请求中，下一个请求的参数来源于上一个请求的结果
        GetUserInfoApi *api2 = GetUserInfoApi.init;
        api2.byURLParameters(nil);
        api2.byBodyParameters(jobsMakeMutDic(^(__kindof NSMutableDictionary *_Nullable data) {
            if(result.userId) [data setValue:result.userId forKey:@"KKK"];
        })); /// 添加Body参数
        [chainRequest addRequest:api2 callback:nil];
    }];
    chainReq.delegate = self;
    if(successBlock) successBlock(chainReq);
    [chainReq start];// start to send request
}
#pragma mark —— 一些公有设置
/// successData传nil：对总数据源进行标准格式解析后对外返回 JobsResponseModel
/// successData传JobsSolveData(AModel)：对总数据源进行标准格式解析以后，再进行一层关于AModel的解析后对外返回
-(void)request:(YTKBaseRequest *)request /// 总数据源
   successData:(id _Nullable)successData /// 本层对success的解析数据
   actionBlock:(jobsByResponseModelBlock _Nullable)actionBlock /// 本层对success的解析回调
  successBlock:(jobsByResponseModelBlock _Nullable)successBlock /// 外层对success的解析回调
     failBlock:(jobsByVoidBlock _Nullable)failBlock{ /// 失败解析回调
    /// 解析+处理HTTPResponseCode
    JobsResponseModel *responseModel = JobsMapResponseModelBy(request);
    /// 打印Body参数
    NSLog(@"%@",request.parameters.jsonString);
    if(responseModel.code == HTTPResponseCodeSuccess){
        if(successBlock) successBlock(successData ? : responseModel);
        if(actionBlock) actionBlock(responseModel);
    }else{
        /// 仅仅打印请求体：request.requestTask
        self.jobsHandelNoSuccess(request);
        if(failBlock) failBlock();
    }
}

-(void)request:(YTKBaseRequest *)request
  successBlock:(jobsByResponseModelBlock _Nullable)successBlock{
    [self request:request
      successData:nil
      actionBlock:nil
     successBlock:successBlock
        failBlock:nil];
}
///【请求已经成功，但是服务器抛异常】处理非HTTPResponseCodeSuccess 的 HTTPResponseCode
-(void)jobsHandelHTTPResponseCode:(HTTPResponseCode)responseCode
                      actionBlock:(jobsByNSIntegerBlock _Nullable)actionBlock{
    switch (responseCode) {
        /// 服务器异常
        case HTTPResponseCodeServeError:{
            NSLog(@"服务器异常");
            toast(JobsInternationalization(@"服务器异常"));
        }break;
        /// 令牌不能为空
        case HTTPResponseCodeNoToken:{
            self.toLogin();
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
        /// 手机号码不存在
        case HTTPResponseCodePhoneNumberNotExist:{
            NSLog(@"手机号码不存在");
            toast(JobsInternationalization(@"手机号码不存在"));
        }break;
        case HTTPResponseCodeAccountLocked:{
            NSLog(@"账户被锁");
            toast(JobsInternationalization(@"账户被锁，请联系系统管理员"));
        }break;
        /// 服务器返500可能会有很多其他的业务场景定义
        case HTTPResponseCodeNoOK:{
            if(actionBlock) actionBlock(responseCode);
        }break;
        default:
            break;
    }
}
///【请求失败】请求失败的处理
-(jobsByIDBlock _Nonnull)jobsHandelFailure{
    @jobs_weakify(self)
    return ^(YTKBaseRequest *request){
        @jobs_strongify(self)
        /// 解析+处理HTTPResponseCode
        JobsResponseModel *responseModel = JobsMapResponseModelBy(request);
        /// 打印请求体
        self.printURLSessionRequestMessage(request.requestTask);
        NSLog(@"error = %@",request.error);
        NSLog(@"responseModel = %@",responseModel);
    };
}
///【请求错误】请求错误的处理
-(jobsByYTKRequestBlock _Nonnull)handleErr{
    return ^(__kindof YTKRequest *_Nullable request){
        NSLog(@"打印请求头: %@", request.requestHeaderFieldValueDictionary);
        if ([request loadCacheWithError:nil]) {
            NSDictionary *json = request.responseJSONObject;
//            NSLog(@"可以 = %@", api.parameters);
//            NSLog(@"打断点 = %@", [json decodeUnicodeLog]);
        }
    };
}
/// 仅仅打印请求体：request.requestTask
-(JobsHandelNoSuccessBlock _Nonnull)jobsHandelNoSuccess{
    @jobs_weakify(self)
    return ^(__kindof YTKBaseRequest *_Nonnull request){
        @jobs_strongify(self)
        NSLog(@"%@",request.parameters);
        /// 打印请求体
        self.printURLSessionRequestMessage(request.requestTask);
    };
}
/// Tips封装
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
    self.jobsHandelNoSuccess(request);
    NSLog(@"请求失败");
}
#pragma mark —— 查询广告列表-支持游客：APP首页右下3Banner【GET】
-(void)getAds:(jobsByResponseModelBlock _Nullable)successBlock{
    FM_promotion_advertise_api *api = FM_promotion_advertise_api.new;
    api.byURLParameters(nil); /// 添加URL参数
    api.byBodyParameters(nil); /// 添加Body参数
    api.byHeaderParameters(nil); /// 添加Header参数
    self.handleErr(api);
    // self.tipsByApi(self);
    @jobs_weakify(self)
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        @jobs_strongify(self)
        [self request:request successBlock:successBlock];
    } failure:^(YTKBaseRequest *request) {
        @jobs_strongify(self)
        if(self) self.jobsHandelFailure(request);
    }];
}
#pragma mark —— 用户登出【POST】
-(void)fm_logout:(jobsByResponseModelBlock _Nullable)successBlock{
    FM_user_logout_api *api = FM_user_logout_api.new;
    api.byURLParameters(nil); /// 添加URL参数
    api.byBodyParameters(nil); /// 添加Body参数
    api.byHeaderParameters(nil); /// 添加Header参数
    self.handleErr(api);
    // self.tipsByApi(self);
    @jobs_weakify(self)
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        @jobs_strongify(self)
        [self request:request successBlock:successBlock];
    } failure:^(YTKBaseRequest *request) {
        @jobs_strongify(self)
        if(self) self.jobsHandelFailure(request);
    }];
}
#pragma mark —— 存款优惠活动信息【POST】
-(void)depositDiscountActivityRecordByURLParameters:(NSString *_Nullable)urlParameters
                                       successBlock:(jobsByYTKChainRequestBlock _Nullable)successBlock{
    FM_GetKYCInfo_api *api = FM_GetKYCInfo_api.new;
    api.byURLParameters(urlParameters);/// 添加URL参数
    api.byBodyParameters(nil); /// 添加Body参数
    api.byHeaderParameters(nil); /// 添加Header参数
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
/// 上传KYC的图片@POST
-(void)uploadKYCImage:(NSData *)image
         successBlock:(jobsByResponseModelBlock _Nullable)successBlock{
    FM_kyc_image_upload_api *api = FM_kyc_image_upload_api.new;
    self.handleErr(api);
    @jobs_weakify(self)
    [api.initBy(jobsMakeFileModel(^(__kindof JobsFileModel * _Nullable model) {
        model.file = image;
    })) startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        @jobs_strongify(self)
        JobsResponseModel *responseModel = JobsMapResponseModelBy(request);
        NSLog(@"");
        if(successBlock) successBlock(responseModel);
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        @jobs_strongify(self)
        NSLog(@"");
    }];
}

@end
