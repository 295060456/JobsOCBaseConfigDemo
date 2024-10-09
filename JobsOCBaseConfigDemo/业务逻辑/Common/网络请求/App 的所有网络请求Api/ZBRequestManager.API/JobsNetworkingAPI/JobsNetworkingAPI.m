//
//  NetworkingAPI.m
//  DouYin
//
//  Created by Jobs on 2020/9/24.
//

#import "JobsNetworkingHeader.h"
/*
 * 只定义successBlock处理我们想要的最正确的答案,并向外抛出
 * 错误在内部处理不向外抛出
 */
@implementation JobsNetworkingAPI
/// 【只有Body参数、不需要错误回调】
+(void)requestApi:(NSString *_Nonnull)requestApi
       parameters:(id _Nullable)parameters
     successBlock:(jobsByIDBlock _Nullable)successBlock{
    NSLog(@"接口名：%@，请求参数打印 %@",requestApi,parameters);
    [NSObject methodName:requestApi.add(@":successBlock:")
               targetObj:(JobsNetworkingAPI *)self
             paramarrays:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        if (parameters) data.add(parameters);
        if (successBlock) data.add(successBlock);
    })];
}
///【只有Body参数、需要错误回调的】
+(void)requestApi:(NSString *_Nonnull)requestApi
       parameters:(id _Nullable)parameters
     successBlock:(jobsByIDBlock _Nullable)successBlock
     failureBlock:(jobsByIDBlock _Nullable)failureBlock{
    NSLog(@"接口名：%@，请求参数打印 %@",requestApi,parameters);
    [NSObject methodName:requestApi.add(@":successBlock:failureBlock:")
               targetObj:(JobsNetworkingAPI *)self
             paramarrays:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        if (parameters) data.add(parameters);
        if (successBlock) data.add(successBlock);
        if (failureBlock) data.add(failureBlock);
    })];
}
#pragma mark —— 特殊的上传文件的网络请求
/// 上传【图片】文件的网络请求 POST
+(void)requestApi:(NSString *_Nonnull)requestApi
uploadImagesParamArr:(NSArray *_Nullable)uploadImagesParamArr
     successBlock:(jobsByIDBlock _Nullable)successBlock
     failureBlock:(jobsByIDBlock _Nullable)failureBlock{
    [NSObject methodName:requestApi.add(@":uploadImageDatas:successBlock:failureBlock:")
               targetObj:(JobsNetworkingAPI *)self
             paramarrays:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        if(uploadImagesParamArr) [data addObjectsFromArray:uploadImagesParamArr];
        if (successBlock) data.add(successBlock);
        if (failureBlock) data.add(failureBlock);
    })];
}
/// 上传【视频】文件的网络请求 POST
+(void)requestApi:(NSString *_Nonnull)requestApi
uploadVideosParamArr:(NSArray *_Nullable)uploadVideosParamArr
     successBlock:(jobsByIDBlock _Nullable)successBlock
     failureBlock:(jobsByIDBlock _Nullable)failureBlock{
    [NSObject methodName:requestApi.add(@":uploadVideo:successBlock:failureBlock:")
               targetObj:(JobsNetworkingAPI *)self
             paramarrays:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        if(uploadVideosParamArr) [data addObjectsFromArray:uploadVideosParamArr];
        if (successBlock) data.add(successBlock);
        if (failureBlock) data.add(failureBlock);
    })];
}
/// 请求成功的处理代码
+(void)networkingSuccessHandleWithData:(JobsResponseModel *_Nullable)responseObject
                               request:(ZBURLRequest *_Nullable)request
                          successBlock:(jobsByIDBlock _Nullable)successBlock
                          failureBlock:(jobsByIDBlock _Nullable)failureBlock{
    if ([responseObject isKindOfClass:JobsResponseModel.class]) {
        // 公共请求错误直接抛出
        if (responseObject.code == HTTPResponseCodeSuccess) {
            NSLog(@"请求成功");
            if (successBlock) successBlock(responseObject);
        }else{// 请求成功但是因为未登录、被踢线下等涉及到用户token的原因导致的失败
            JobsNetworkingAPI.handleError(responseObject);
            if (failureBlock) failureBlock(responseObject);
        }
    }else NSLog(@"responseObject 不是 JobsResponseModel类型");
}
#pragma mark —— 错误处理
+(jobsByIDBlock _Nonnull)handleError{
    return ^(id _Nullable error){
        if ([error isKindOfClass:NSError.class]) {
            NSError *err = (NSError *)error;
            NSLog(@"%@",err.description);
            self.jobsToastErrMsg(err.description);
        }else if ([error isKindOfClass:JobsResponseModel.class]){
            JobsResponseModel *responseModel = (JobsResponseModel *)error;
            NSLog(@"code = %lu",(unsigned long)responseModel.code);
            switch (responseModel.code) {
                case HTTPResponseCodeServeError:{// 服务器异常
                    self.jobsToastErrMsg(JobsInternationalization(@"服务器异常"));
                }break;
                case HTTPResponseCodeNoToken:{// 令牌不能为空
                    self.jobsToastErrMsg(JobsInternationalization(@"令牌不能为空"));
                }break;
                case HTTPResponseCodeLoginFailed:{// 登录失败：账密错误
                    self.jobsToastErrMsg(JobsInternationalization(@"登录失败：账密错误"));
                }break;
                case HTTPResponseCodeTokenExpire:{// 登录已过期，请重新登录
                    JobsPostNotification(退出登录成功,@(NO));
                    self.jobsToastErrMsg(JobsInternationalization(@"登录已过期，请重新登录"));
                }break;
                case HTTPResponseCodeAuthorizationFailure:{// 授权失败
                    self.jobsToastErrMsg(JobsInternationalization(@"授权失败"));
                }break;
                case HTTPResponseCodeLeakTime:{// 限定时间内超过请求次数
                    self.jobsToastErrMsg(JobsInternationalization(@"限定时间内超过请求次数"));
                }break;
                case HTTPResponseCodeRiskOperation:{// 风险操作
                    self.jobsToastErrMsg(JobsInternationalization(@"风险操作"));
                }break;
                case HTTPResponseCodeNoSettingTransactionPassword:{// 未设置交易密码
                    self.jobsToastErrMsg(JobsInternationalization(@"未设置交易密码"));
                }break;
                case HTTPResponseCodeOffline:{// 账号已在其他设备登录
                    self.jobsToastErrMsg(JobsInternationalization(@"账号已在其他设备登录t"));
                }break;
                    
                default:{
                    if ([error isKindOfClass:JobsResponseModel.class]) {
                        JobsResponseModel *model = (JobsResponseModel *)error;
                        self.jobsToastErrMsg(model.msg);
                    }
                }break;
            }
        }else return;
    };
}

@end
