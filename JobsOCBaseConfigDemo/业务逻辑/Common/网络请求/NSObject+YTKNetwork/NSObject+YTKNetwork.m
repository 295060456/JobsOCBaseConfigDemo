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
    GetCustomerContactApi *api = GetCustomerContactApi.initByParameters(nil);
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
    GetImageApi *a = GetImageApi.initByParameters(nil);
    GetImageApi *b = GetImageApi.initByParameters(nil);
    GetImageApi *c = GetImageApi.initByParameters(nil);
    GetUserInfoApi *d = GetUserInfoApi.initByParameters(nil);
    YTKBatchRequest *batchRequest = [YTKBatchRequest.alloc initWithRequestArray:@[a, b, c, d]];
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
        a.responseObject;
        b.responseObject;
        c.responseObject;
        user.responseObject;
    } failure:^(YTKBatchRequest *batchRequest) {
        @jobs_strongify(self)
        self.jobsHandelFailure(batchRequest.failedRequest);
    }];
}
/// 多请求の链式请求。链式请求的结果集体现在<YTKChainRequestDelegate>
-(void)sendChainRequest:(jobsByIDBlock _Nullable)successBlock{
    RegisterApi *reg = RegisterApi.initByParameters(nil);
    YTKChainRequest *chainReq = YTKChainRequest.new;
    [chainReq addRequest:reg
                callback:^(YTKChainRequest *chainRequest,
                           YTKBaseRequest *baseRequest) {
        
        RegisterApi *result = (RegisterApi *)baseRequest;
        /// 在链式请求中，下一个请求的参数来源于上一个请求的结果
        GetUserInfoApi *api = GetUserInfoApi.initByParameters(@{@"KKK":result.userId});
        [chainRequest addRequest:api callback:nil];
    }];
//    chainReq.delegate = self;
    if(successBlock) successBlock(chainReq);
    [chainReq start];// start to send request
}
#pragma mark —— 一些公有设置
-(jobsByIDBlock _Nonnull)jobsHandelFailure{
    @jobs_weakify(self)
    return ^(YTKBaseRequest *request){
        @jobs_strongify(self)
        self.printURLSessionRequestMessage(request.requestTask);
        NSLog(@"error = %@",request.error);
    };
}

-(jobsByNSIntegerBlock _Nonnull)jobsHandelNoSuccess{
    @jobs_weakify(self)
    return ^(HTTPResponseCode data){
        @jobs_strongify(self)
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
                /// 登录已过期，请重新登录
            case HTTPResponseCodeLoginDate:{
                NSLog(@"登录已过期，请重新登录");
                toast(JobsInternationalization(@"登录已过期，请重新登录"));
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
                /// Token 过期
            case HTTPResponseCodeTokenExpire:{
                NSLog(@"Token 过期");
                toast(JobsInternationalization(@"Token 过期"));
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
            NSLog(@"json = %@", json);
        }
    };
}

@end
