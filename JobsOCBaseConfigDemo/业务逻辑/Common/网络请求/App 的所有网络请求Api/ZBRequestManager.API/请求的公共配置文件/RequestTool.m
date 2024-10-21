//
//  RequestTool.m
//  ZBNetworkingDemo
//
//  Created by Suzhibin on 2020/6/2.
//  Copyright © 2020 Suzhibin. All rights reserved.
//

#import "RequestTool.h"

@implementation RequestTool
/** 写在前面
 *  1、所有请求都需要在headers里面添加处理过的userAgent
    2、进app的时候，服务器会根据设备返回一个token，再请求其他接口的时候，需要将这个token做为Authorization键值对，加在请求的headers里面
 */
+(jobsByRequestToolBlock _Nullable)setupPublicParametersBy{
    return ^(RequestTool *_Nullable requestTool){
#pragma mark —— 公共配置
        /**
         基础配置
         需要在请求之前配置，设置后所有请求都会带上 此基础配置
         */
        JobsUserModel *f = self.readUserInfo();
        NSString *timeString = [NSString stringWithFormat:@"%.2f",NSDate.date.timeIntervalSince1970];
        NSMutableDictionary *parameters = jobsMakeMutDic(^(__kindof NSMutableDictionary *_Nullable data) {
            data[@"timeString"] = timeString;//时间戳
        });
        NSMutableDictionary *headers = jobsMakeMutDic(^(__kindof NSMutableDictionary *_Nullable data) {
            data[@"authorization"] = f.token;
            switch (requestTool.languageType) {
                case HTTPRequestHeaderLanguageEn://英文
                    data[@"language"] = @"en_US";
                    break;
                case HTTPRequestHeaderLanguageCN://中文
                    data[@"language"] = @"zh_CN";
                    break;
                default:
                    break;
            }
        });
#pragma mark —— userAgent authorizationss
        NSString *userAgent = [AFRequestSerializer() valueForHTTPHeaderField:@"User-Agent"];
        if(![userAgent containsString:@",dv:"]) {
    //        NSString *newUserAgent = [NSString stringWithFormat:@"%@,dv:%@",userAgent,[KeychainIDFA deviceID]];
    ////        [AFHTTPSessionManager.manager.requestSerializer setValue:newuserAgent forHTTPHeaderField:@"User-Agent"];
    //        headers[@"User-Agent"] = newUserAgent;
        }
#pragma mark —— Token
        if (isValue(f.token)) [AFRequestSerializer() setValue:f.token forHTTPHeaderField:@"authorization"];
        [ZBRequestManager setupBaseConfig:^(ZBConfig *_Nullable config) {
            config.baseServer = This.BaseUrl;//如果同一个环境，有多个域名 不要设置baseURL
            config.parameters = parameters;//公共参数
            // filtrationCacheKey因为时间戳是变动参数，缓存key需要过滤掉 变动参数,如果 不使用缓存功能 或者 没有变动参数 则不需要设置。
            config.filtrationCacheKey = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                data.add(@"timeString");
            });
            config.headers = headers;//请求头
            config.requestSerializer = ZBHTTPRequestSerializer; //全局设置 请求格式 默认JSON
            config.responseSerializer = ZBJSONResponseSerializer; //全局设置 响应格式 默认JSON
            config.timeoutInterval = 15;//超时时间  优先级 小于 单个请求重新设置
//            config.retryCount = 2;//请求失败 所有请求重新连接次数
            config.consoleLog = YES;//开log
            config.userInfo = jobsMakeMutDic(^(__kindof NSMutableDictionary *_Nullable data) {
                [data setValue:@"ZBNetworking" forKey:@"info"];//请求的信息，可以用来注释和判断使用
            });
            //添加新的响应数据类型
            config.responseContentTypes = jobsMakeMutArr(^(__kindof NSMutableArray *_Nullable data) {
                data.add(@"text/aaa");
                data.add(@"text/bbb");
//                内部已存在的响应数据类型
//                text/html
//                application/json
//                text/json
//                text/plain
//                text/javascript
//                text/xml
//                image/*
//                multipart/form-data
//                application/octet-stream
//                application/zip
            });
    }];
#pragma mark —— 插件机制
    /**
       插件机制
       自定义 所有 请求,响应,错误 处理逻辑的方法

       比如 1.自定义缓存逻辑 感觉ZBNetworking缓存不好，想使用yycache 等
           2.自定义响应逻辑 服务器会在成功回调里做 返回code码的操作
           3.一个应用有多个服务器地址，可在此进行配置
           4.统一loading 等UI处理
           5. ......
       */
        /// 预处理 请求
        [ZBRequestManager setRequestProcessHandler:^(ZBURLRequest *_Nullable request,
                                                     id _Nullable __autoreleasing *_Nullable setObject) {
             NSLog(@"请求之前");
            //比如 我们可以根据参数寻找一个业务的请求 ，给改该请求做一个替换响应数据的操作
            if ([request.userInfo[@"tag"] isEqualToString:@"7777"]) {
                if (request.apiType != ZBRequestTypeCache) {
//            ⚠️setObject 赋值 就会走成功回调
//            如判断内的请求包含keep请求，keep功能将受影响
//            request.keepType=ZBResponseKeepFirst
//            request.keepType=ZBResponseKeepLast
//            都不会不起作用了。所有请求都会成功了。
                    *setObject = jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data1) {
                        [data1 setValue:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data2) {
                            data2.add(jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data3) {
                                [data3 setValue:@"400" forKey:@"errorCode"];
                            }));
                        }) forKey:@"authors"];
                        [data1 setValue:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data2) {
                            data2.add(jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data3) {
                                [data3 setValue:@"400" forKey:@"errorCode"];
                            }));
                        }) forKey:@"videos"];
                    });
                }
            }
        }];
        /// 预处理 响应：在这里过滤错误信息，外层最终得到我们想要的核心数据
        [ZBRequestManager setResponseProcessHandler:^id(ZBURLRequest *_Nullable request,
                                                        id _Nullable responseObject,
                                                        NSError *_Nullable __autoreleasing *_Nullable error) {
            NSLog(@"成功回调 数据返回之前");
            if ([responseObject isKindOfClass:NSDictionary.class]) {
                NSDictionary *dataDic = (NSDictionary *)responseObject;
                JobsResponseModel *model = JobsResponseModel.byDataDic(dataDic);
    //            [request.userInfo[@"info"] isEqualToString:@"ViewController_1"]
                return model;
            }else{
                return nil;
            }
        }];
        /// 预处理 错误
        [ZBRequestManager setErrorProcessHandler:^(ZBURLRequest *_Nullable request,
                                                   NSError __autoreleasing *_Nullable error){
            if (error.code == NSURLErrorCancelled){
                NSLog(@"请求取消❌------------------");
            }else if (error.code == NSURLErrorTimedOut){
                NSLog(@"请求超时");
            }else{
                NSLog(@"请求失败");
            }
        }];
#pragma mark —— 证书设置
        /**
         证书设置：
         ZBRequestEngine 继承AFHTTPSessionManager，所需其他设置 可以使用[ZBRequestEngine defaultEngine] 自行设置
         */
        NSString *name = JobsInternationalization(@"");
        if (name.length > 0) {
            // 先导入证书
            NSString *cerPath = name.add(@"cer").pathForResourceWithFullName;//证书的路径
            NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
            AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
            // 如果需要验证自建证书(无效证书)，需要设置为YES，默认为NO;
            securityPolicy.allowInvalidCertificates = YES;
            // 是否需要验证域名，默认为YES;
            securityPolicy.validatesDomainName = NO;
            securityPolicy.pinnedCertificates = [NSSet.alloc initWithObjects:cerData, nil];
            ZBRequestEngine.defaultEngine.securityPolicy = securityPolicy;
        }
    };
}

@end

