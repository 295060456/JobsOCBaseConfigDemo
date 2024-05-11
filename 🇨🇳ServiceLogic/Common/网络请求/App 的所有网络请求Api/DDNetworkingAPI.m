//
//  NetworkingAPI.m
//  DouYin
//
//  Created by Jobs on 2020/9/24.
//

#import "DDNetworkingHeader.h"
/*
 * 只定义successBlock处理我们想要的最正确的答案,并向外抛出
 * 错误在内部处理不向外抛出
 */
@implementation DDNetworkingAPI
/// 【只有Body参数、不需要错误回调】
+(void)requestApi:(NSString *_Nonnull)requestApi
       parameters:(id _Nullable)parameters
     successBlock:(jobsByIDBlock _Nullable)successBlock{
    
    NSLog(@"接口名：%@，请求参数打印 %@",requestApi,parameters);
    
    {
        NSMutableArray *paramMutArr = NSMutableArray.array;
        
        if (!parameters) {
            parameters = NSDictionary.dictionary;
        }
        
        [paramMutArr addObject:parameters];
        
        if (successBlock) {
            [paramMutArr addObject:successBlock];
        }

        NSString *funcName = [requestApi stringByAppendingString:@":successBlock:"];
        [NSObject methodName:funcName
                   targetObj:(DDNetworkingAPI *)self
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
        
        if (!parameters) {
            parameters = NSDictionary.dictionary;
        }
        
        if (parameters) {
            [paramMutArr addObject:parameters];
        }
        
        if (successBlock) {
            [paramMutArr addObject:successBlock];
        }
        
        if (failureBlock) {
            [paramMutArr addObject:failureBlock];
        }

        NSString *funcName = [requestApi stringByAppendingString:@":successBlock:failureBlock:"];
        [NSObject methodName:funcName
                   targetObj:(DDNetworkingAPI *)self
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
    }else{
        paramMutArr = NSMutableArray.array;
    }
    
    if (successBlock) {
        [paramMutArr addObject:successBlock];
    }
    
    if (failureBlock) {
        [paramMutArr addObject:failureBlock];
    }
    
    NSString *funcName = [requestApi stringByAppendingString:@":uploadImageDatas:successBlock:failureBlock:"];
    [NSObject methodName:funcName
               targetObj:(DDNetworkingAPI *)self
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
    }else{
        paramMutArr = NSMutableArray.array;
    }
    
    if (successBlock) {
        [paramMutArr addObject:successBlock];
    }
    
    if (failureBlock) {
        [paramMutArr addObject:failureBlock];
    }
    
    NSString *funcName = [requestApi stringByAppendingString:@":uploadVideo:successBlock:failureBlock:"];
    [NSObject methodName:funcName
               targetObj:(DDNetworkingAPI *)self
             paramarrays:paramMutArr];
}
/// 请求成功的处理代码
+(void)networkingSuccessHandleWithData:(DDResponseModel *_Nullable)responseObject
                               request:(ZBURLRequest *_Nullable)request
                          successBlock:(jobsByIDBlock _Nullable)successBlock
                          failureBlock:(jobsByIDBlock _Nullable)failureBlock{

    if ([responseObject isKindOfClass:DDResponseModel.class]) {
        // 公共请求错误直接抛出
        if (responseObject.code == HTTPResponseCodeSuccess) {
            NSLog(@"请求成功");
            if (successBlock) successBlock(responseObject);
        }else{// 请求成功但是因为未登录、被踢线下等涉及到用户token的原因导致的失败
            [DDNetworkingAPI handleError:responseObject];
            if (failureBlock) failureBlock(responseObject);
        }
    }else{
        NSLog(@"responseObject 不是 DDResponseModel类型");
    }
}
#pragma mark —— 错误处理
+(void)handleError:(id)error{
    if ([error isKindOfClass:NSError.class]) {
        NSError *err = (NSError *)error;
        NSLog(@"%@",err.description);
        [WHToast jobsToastErrMsg:err.description];
    }else if ([error isKindOfClass:DDResponseModel.class]){
        DDResponseModel *responseModel = (DDResponseModel *)error;
        NSLog(@"code = %lu",(unsigned long)responseModel.code);
        extern BOOL xhLaunchAdShowFinish;
        switch (responseModel.code) {
            case HTTPResponseCodeServeError:{// 服务器异常
                [WHToast jobsToastErrMsg:Internationalization(@"Server Exception")];
            }break;
            case HTTPResponseCodeLoginDate:{// 登录已过期，请重新登录 DDResponseModel
                if (xhLaunchAdShowFinish) {
                    if (self.isLogin) {
                        [WHToast jobsToastErrMsg:Internationalization(@"Login has expired. Please log in again")];
                        [self logOut];
                    }[self forcedLogin];
                }
                JobsPostNotification(退出登录,@(NO));
                [NSNotificationCenter.defaultCenter postNotificationName:退出登录 object:@(NO)];
            }break;
            case HTTPResponseCodeAuthorizationFailure:{// 授权失败
                [WHToast jobsToastErrMsg:Internationalization(@"Authorization failure")];
            }break;
            case HTTPResponseCodeLeakTime:{// 限定时间内超过请求次数
                [WHToast jobsToastErrMsg:Internationalization(@"The requests exceeded within a specified time")];
            }break;
            case HTTPResponseCodeRiskOperation:{// 风险操作
                [WHToast jobsToastErrMsg:Internationalization(@"Risk operation")];
            }break;
            case HTTPResponseCodeNoSettingTransactionPassword:{// 未设置交易密码
                [WHToast jobsToastErrMsg:Internationalization(@"No transaction password is set")];
            }break;
            case HTTPResponseCodeOffline:{// 帐号已在其他设备登录
                if (xhLaunchAdShowFinish) {
                    [WHToast jobsToastErrMsg:Internationalization(@"The account has been logged in to another device")];
                    if (self.isLogin) {
                        /// 清除本地的用户数据，并转向登录页面
                        [self logOut];
                    }
                    [self toLogin];
                }
            }break;
                
            default:{
                if ([error isKindOfClass:DDResponseModel.class]) {
                    DDResponseModel *model = (DDResponseModel *)error;
                    [WHToast jobsToastErrMsg:model.msg];
                }
            }break;
        }
    }else return;
}

@end
