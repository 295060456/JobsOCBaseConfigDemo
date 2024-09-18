//
//  NSObject+Network.m
//  FM
//
//  Created by User on 9/18/24.
//

#import "NSObject+Network.h"

@implementation NSObject (Network)
#pragma mark —— 示例代码
/// 普通的单个请求
-(void)loadCacheData:(jobsByIDBlock _Nullable)successBlock{
    GetCustomerContactApi *api = GetCustomerContactApi.initByParameters(nil);
    self.handleErr(api);
    // self.tipsByApi(self);
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        /// 以下是我们需要的值
        JobsResponseModel *responseModel = JobsResponseModel.byData(request.responseObject);
        if(responseModel.code == HTTPResponseCodeSuccess){
            if(successBlock) successBlock(responseModel);
        }
    } failure:^(YTKBaseRequest *request) {
        NSLog(@"failed");
    }];
}
/// 多请求の同步请求
-(void)sendBatchRequest:(jobsByIDBlock _Nullable)successBlock{
    GetImageApi *a = GetImageApi.initByParameters(nil);
    GetImageApi *b = GetImageApi.initByParameters(nil);
    GetImageApi *c = GetImageApi.initByParameters(nil);
    GetUserInfoApi *d = GetUserInfoApi.initByParameters(nil);
    YTKBatchRequest *batchRequest = [YTKBatchRequest.alloc initWithRequestArray:@[a, b, c, d]];
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
        NSLog(@"failed");
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
-(jobsByIDBlock)tipsByApi{
    return ^(JobsBaseApi *_Nullable api){
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

-(jobsByIDBlock)handleErr{
    return ^(JobsBaseApi *_Nullable api){
        if ([api loadCacheWithError:nil]) {
            NSDictionary *json = api.responseJSONObject;
            NSLog(@"json = %@", json);
        }
    };
}

@end
