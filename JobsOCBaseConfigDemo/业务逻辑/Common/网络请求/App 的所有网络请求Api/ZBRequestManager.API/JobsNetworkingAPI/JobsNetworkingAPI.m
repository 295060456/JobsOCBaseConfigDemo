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
    
    {
        NSMutableArray *paramMutArr = NSMutableArray.array;
        
        if (!parameters) parameters = NSDictionary.dictionary;
        paramMutArr.add(parameters);
        if (successBlock) paramMutArr.add(successBlock);

        NSString *funcName = requestApi.add(@":successBlock:");
        [NSObject methodName:funcName
                   targetObj:(JobsNetworkingAPI *)self
                 paramarrays:paramMutArr];
    }
}
///【只有Body参数、需要错误回调的】
+(void)requestApi:(NSString *_Nonnull)requestApi
       parameters:(id _Nullable)parameters
     successBlock:(jobsByIDBlock _Nullable)successBlock
     failureBlock:(jobsByIDBlock _Nullable)failureBlock{
    
    NSLog(@"接口名：%@，请求参数打印 %@",requestApi,parameters);
    
    {
        NSMutableArray *paramMutArr = NSMutableArray.array;
        
        if (!parameters) parameters = NSDictionary.dictionary;
        if (parameters) paramMutArr.add(parameters);
        if (successBlock) paramMutArr.add(successBlock);
        if (failureBlock) paramMutArr.add(failureBlock);
        
        NSString *funcName = requestApi.add(@":successBlock:failureBlock:");
        [NSObject methodName:funcName
                   targetObj:(JobsNetworkingAPI *)self
                 paramarrays:paramMutArr];
    }
}
#pragma mark —— 特殊的上传文件的网络请求
/// 上传【图片】文件的网络请求 POST
+(void)requestApi:(NSString *_Nonnull)requestApi
uploadImagesParamArr:(NSArray *_Nullable)uploadImagesParamArr
     successBlock:(jobsByIDBlock _Nullable)successBlock
     failureBlock:(jobsByIDBlock _Nullable)failureBlock{

    NSMutableArray *paramMutArr = nil;
    
    if (uploadImagesParamArr) {
        paramMutArr = [NSMutableArray arrayWithArray:uploadImagesParamArr];
    }else paramMutArr = NSMutableArray.array;
    
    if (successBlock) paramMutArr.add(successBlock);
    if (failureBlock) paramMutArr.add(failureBlock);
    
    NSString *funcName = requestApi.add(@":uploadImageDatas:successBlock:failureBlock:");
    [NSObject methodName:funcName
               targetObj:(JobsNetworkingAPI *)self
             paramarrays:paramMutArr];
}
/// 上传【视频】文件的网络请求 POST
+(void)requestApi:(NSString *_Nonnull)requestApi
uploadVideosParamArr:(NSArray *_Nullable)uploadVideosParamArr
     successBlock:(jobsByIDBlock _Nullable)successBlock
     failureBlock:(jobsByIDBlock _Nullable)failureBlock{
    
    NSMutableArray *paramMutArr = nil;
    
    if (uploadVideosParamArr) {
        paramMutArr = [NSMutableArray arrayWithArray:uploadVideosParamArr];
    }else paramMutArr = NSMutableArray.array;
    
    if (successBlock) paramMutArr.add(successBlock);
    if (failureBlock) paramMutArr.add(failureBlock);
    
    NSString *funcName = requestApi.add(@":uploadVideo:successBlock:failureBlock:");;
    [NSObject methodName:funcName
               targetObj:(JobsNetworkingAPI *)self
             paramarrays:paramMutArr];
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
            [JobsNetworkingAPI handleError:responseObject];
            if (failureBlock) failureBlock(responseObject);
        }
    }else NSLog(@"responseObject 不是 JobsResponseModel类型");
}
#pragma mark —— 错误处理
+(void)handleError:(id)error{
    if ([error isKindOfClass:NSError.class]) {
        NSError *err = (NSError *)error;
        NSLog(@"%@",err.description);
        self.jobsToastErrMsg(err.description);
    }else if ([error isKindOfClass:JobsResponseModel.class]){
        JobsResponseModel *responseModel = (JobsResponseModel *)error;
        NSLog(@"code = %lu",(unsigned long)responseModel.code);
        switch (responseModel.code) {
            case HTTPResponseCodeServeError:{// 服务器异常
                self.jobsToastErrMsg(JobsInternationalization(@"Server Exception"));
            }break;
            case HTTPResponseCodeLoginDate:{// 登录已过期，请重新登录 JobsResponseModel
                JobsPostNotification(退出登录成功,@(NO));
            }break;
            case HTTPResponseCodeAuthorizationFailure:{// 授权失败
                self.jobsToastErrMsg(JobsInternationalization(@"Authorization failure"));
            }break;
            case HTTPResponseCodeLeakTime:{// 限定时间内超过请求次数
                self.jobsToastErrMsg(JobsInternationalization(@"The requests exceeded within a specified time"));
            }break;
            case HTTPResponseCodeRiskOperation:{// 风险操作
                self.jobsToastErrMsg(JobsInternationalization(@"Risk operation"));
            }break;
            case HTTPResponseCodeNoSettingTransactionPassword:{// 未设置交易密码
                self.jobsToastErrMsg(JobsInternationalization(@"No transaction password is set"));
            }break;
            case HTTPResponseCodeOffline:{// 帐号已在其他设备登录
                
            }break;
                
            default:{
                if ([error isKindOfClass:JobsResponseModel.class]) {
                    JobsResponseModel *model = (JobsResponseModel *)error;
                    self.jobsToastErrMsg(model.msg);
                }
            }break;
        }
    }else return;
}

@end
