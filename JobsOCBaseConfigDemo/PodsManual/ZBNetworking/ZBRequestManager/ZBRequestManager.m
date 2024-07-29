//
//  ZBRequestManager.m
//  ZBNetworkingDemo
//
//  Created by NQ UEC on 2017/8/17.
//  Copyright © 2017年 Suzhibin. All rights reserved.
//

#import "ZBRequestManager.h"
#import "ZBCacheManager.h"
#import "ZBURLRequest.h"
#import "NSString+ZBURLEncoding.h"

NSString *const _response =@"_response";
NSString *const _isCache =@"_isCache";
NSString *const _cacheKey =@"_cacheKey";
NSString *const _filePath =@"_filePath";
NSString *const zb_downloadTempPath =@"AppTempDownload";
NSString *const zb_downloadPath =@"AppDownload";
@implementation ZBRequestManager

#pragma mark - 公共配置
+ (void)setupBaseConfig:(void(^)(ZBConfig *config))block{
    ZBConfig *config=[[ZBConfig alloc]init];
    config.consoleLog=NO;
    block ? block(config) : nil;
    [[ZBRequestEngine defaultEngine] setupBaseConfig:config];
}
#pragma mark - 插件
+ (void)setRequestProcessHandler:(ZBRequestProcessBlock)requestHandler{
    [ZBRequestEngine defaultEngine].requestProcessHandler=requestHandler;
}

+ (void)setResponseProcessHandler:(ZBResponseProcessBlock)responseHandler{
    [ZBRequestEngine defaultEngine].responseProcessHandler = responseHandler;
}

+ (void)setErrorProcessHandler:(ZBErrorProcessBlock)errorHandler{
    [ZBRequestEngine defaultEngine].errorProcessHandler=errorHandler;
}

#pragma mark - 配置请求
+ (NSUInteger)requestWithConfig:(ZBRequestConfigBlock _Nonnull )config delegate:(id<ZBURLRequestDelegate>_Nonnull)delegate{
    return [self requestWithConfig:config progress:nil success:nil failure:nil finished:nil delegate:delegate];
}

+ (NSUInteger)requestWithConfig:(ZBRequestConfigBlock)config success:(ZBRequestSuccessBlock)success{
    return [self requestWithConfig:config progress:nil success:success failure:nil finished:nil];
}

+ (NSUInteger)requestWithConfig:(ZBRequestConfigBlock)config failure:(ZBRequestFailureBlock)failure{
    return [self requestWithConfig:config progress:nil success:nil failure:failure finished:nil];
}

+ (NSUInteger)requestWithConfig:(ZBRequestConfigBlock)config finished:(ZBRequestFinishedBlock)finished{
    return [self requestWithConfig:config progress:nil success:nil failure:nil finished:finished];
}

+ (NSUInteger)requestWithConfig:(ZBRequestConfigBlock)config success:(ZBRequestSuccessBlock)success failure:(ZBRequestFailureBlock)failure{
    return [self requestWithConfig:config progress:nil success:success failure:failure finished:nil];
}

+ (NSUInteger)requestWithConfig:(ZBRequestConfigBlock _Nonnull )config  success:(ZBRequestSuccessBlock _Nullable )success failure:(ZBRequestFailureBlock _Nullable )failure finished:(ZBRequestFinishedBlock _Nullable )finished{
    return [self requestWithConfig:config progress:nil success:success failure:failure finished:finished];
}

+ (NSUInteger)requestWithConfig:(ZBRequestConfigBlock)config progress:(ZBRequestProgressBlock)progress success:(ZBRequestSuccessBlock)success failure:(ZBRequestFailureBlock)failure{
    return [self requestWithConfig:config progress:progress success:success failure:failure finished:nil];
}

+ (NSUInteger)requestWithConfig:(ZBRequestConfigBlock)config progress:(ZBRequestProgressBlock)progress success:(ZBRequestSuccessBlock)success failure:(ZBRequestFailureBlock)failure finished:(ZBRequestFinishedBlock)finished{
    return [self requestWithConfig:config progress:progress success:success failure:failure finished:finished delegate:nil];
}

+ (NSUInteger)requestWithConfig:(ZBRequestConfigBlock)config progress:(ZBRequestProgressBlock)progress success:(ZBRequestSuccessBlock)success failure:(ZBRequestFailureBlock)failure finished:(ZBRequestFinishedBlock)finished delegate:(id<ZBURLRequestDelegate>)delegate{
    ZBURLRequest *request=[[ZBURLRequest alloc]init];
    config ? config(request) : nil;
    return [self checkRequest:request progress:progress success:success failure:failure finished:finished delegate:delegate];
}

#pragma mark - 配置批量请求
+ (ZBBatchRequest *)requestBatchWithConfig:(ZBBatchRequestConfigBlock)config delegate:(id<ZBURLRequestDelegate>_Nonnull)delegate{
    return [self requestBatchWithConfig:config progress:nil success:nil failure:nil finished:nil delegate:delegate];
}

+ (ZBBatchRequest *)requestBatchWithConfig:(ZBBatchRequestConfigBlock)config success:(ZBRequestSuccessBlock)success failure:(ZBRequestFailureBlock)failure finished:(ZBBatchRequestFinishedBlock)finished{
    return [self requestBatchWithConfig:config progress:nil success:success failure:failure finished:finished];
}

+ (ZBBatchRequest *)requestBatchWithConfig:(ZBBatchRequestConfigBlock)config progress:(ZBRequestProgressBlock)progress success:(ZBRequestSuccessBlock)success failure:(ZBRequestFailureBlock)failure finished:(ZBBatchRequestFinishedBlock)finished{
    return [self requestBatchWithConfig:config progress:progress success:success failure:failure finished:finished delegate:nil];
}

+ (ZBBatchRequest *)requestBatchWithConfig:(ZBBatchRequestConfigBlock)config progress:(ZBRequestProgressBlock)progress success:(ZBRequestSuccessBlock)success failure:(ZBRequestFailureBlock)failure finished:(ZBBatchRequestFinishedBlock)finished delegate:(id<ZBURLRequestDelegate>)delegate{
    ZBBatchRequest *batchRequest=[[ZBBatchRequest alloc]init];
    config ? config(batchRequest) : nil;
    if (batchRequest.requestArray.count==0)return nil;
    [batchRequest.responseArray removeAllObjects];
    [batchRequest.requestArray enumerateObjectsUsingBlock:^(ZBURLRequest *request , NSUInteger idx, BOOL *stop) {
        [batchRequest.responseArray addObject:[NSNull null]];
        [self checkRequest:request progress:progress success:success failure:failure finished:^(id responseObject, NSError *error,ZBURLRequest *request) {
            [batchRequest onFinishedRequest:request response:responseObject error:error finished:finished];
        }delegate:delegate];
    }];
    return batchRequest;
}

#pragma mark - 校验请求
+ (NSUInteger)checkRequest:(ZBURLRequest *)request progress:(ZBRequestProgressBlock)progress success:(ZBRequestSuccessBlock)success failure:(ZBRequestFailureBlock)failure finished:(ZBRequestFinishedBlock)finished delegate:(id<ZBURLRequestDelegate>)delegate{
    
    [self configBaseWithRequest:request progress:progress success:success failure:failure finished:finished delegate:delegate];
    
    if(request.parameters==nil){
        request.parameters= [NSMutableDictionary dictionary];
    }
    
    id obj=nil;
    if ([ZBRequestEngine defaultEngine].requestProcessHandler) {
        [ZBRequestEngine defaultEngine].requestProcessHandler(request,&obj);
        if (obj) {
            [self successWithResponse:nil responseObject:obj request:request];
            return 0;
        }
    }
    return [self checkAgainRequest:request];
}

+ (NSUInteger)checkAgainRequest:(ZBURLRequest *)request{
    if(request==nil){
        NSLog(@"\n------------ZBNetworking------error info------begin------\n - 请求中止，请求对象request = nil - \n- Abort request,request = nil -\n------------ZBNetworking------error info-------end-------");
        return 0;
    }
    [[ZBRequestEngine defaultEngine] reconfigureUrlWithRequest:request];
    
    if ([request.url isEqualToString:@""]){
        NSDictionary * userInfo = @{NSLocalizedDescriptionKey:@"request.url 或 request.server + request.path不能为空"};
        NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorUnsupportedURL userInfo:userInfo];
        [self failureWithError:error request:request];
        return 0;
    }
    
    NSURLSessionTask * task=[[ZBRequestEngine defaultEngine]objectRequestForkey:request.url];
    if (request.apiType==ZBRequestTypeKeepFirst&&task) {
        return 0;
    }
    if (request.apiType==ZBRequestTypeKeepLast&&task) {
        [self cancelRequest:task.taskIdentifier];
    }
    
    NSUInteger identifier=[self sendRequest:request];
    [[ZBRequestEngine defaultEngine]setRequestObject:request.task forkey:request.url];
    return identifier;
}

#pragma mark - 发起请求
+ (NSUInteger)sendRequest:(ZBURLRequest *)request{
    if (request.methodType==ZBMethodTypeUpload) {
       return [self sendUploadRequest:request];
    }else if (request.methodType==ZBMethodTypeDownLoad){
       return [self sendDownLoadRequest:request];
    }else{
       return [self sendHTTPRequest:request];
    }
}

+ (NSUInteger)sendUploadRequest:(ZBURLRequest *)request{
    return [[ZBRequestEngine defaultEngine] uploadWithRequest:request progress:^(NSProgress * _Nonnull uploadProgress) {
        if (request.delegate&&[request.delegate respondsToSelector:@selector(requestProgress:)]) {
            [request.delegate requestProgress:uploadProgress];
        }
        request.progressBlock?request.progressBlock(uploadProgress):nil;
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        [self successWithResponse:task.response responseObject:responseObject request:request];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self failureWithError:error request:request];
    }];
}

+ (NSUInteger)sendHTTPRequest:(ZBURLRequest *)request{
    if (request.apiType==ZBRequestTypeRefresh||request.apiType==ZBRequestTypeRefreshMore||request.apiType==ZBRequestTypeKeepFirst||request.apiType==ZBRequestTypeKeepLast) {
        return [self dataTaskWithHTTPRequest:request];
    }else{
        NSString *key = [self keyWithParameters:request];
        if ([[ZBCacheManager sharedInstance]cacheExistsForKey:key]&&request.apiType==ZBRequestTypeCache){
            [self getCacheDataForKey:key request:request];
            return 0;
        }else{
            return [self dataTaskWithHTTPRequest:request];
        }
    }
}

+ (NSUInteger)dataTaskWithHTTPRequest:(ZBURLRequest *)request{
    return [[ZBRequestEngine defaultEngine]dataTaskWithMethod:request progress:^(NSProgress * _Nonnull zb_progress) {
        if (request.delegate&&[request.delegate respondsToSelector:@selector(requestProgress:)]) {
            [request.delegate requestProgress:zb_progress];
        }
        request.progressBlock ? request.progressBlock(zb_progress) : nil;
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        [self successWithResponse:task.response responseObject:responseObject request:request];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self failureWithError:error request:request];
    }];
}

+ (NSUInteger)sendDownLoadRequest:(ZBURLRequest *)request{
    if (request.downloadState==ZBDownloadStateStart) {
        [[ZBCacheManager sharedInstance]createDirectoryAtPath:[self AppDownloadPath]];
        return [self downloadStartWithRequest:request];
    }else{
        return [self downloadStopWithRequest:request];
    }
}

+ (NSUInteger)downloadStartWithRequest:(ZBURLRequest*)request{
    NSString *AppDownloadTempPath=[self AppDownloadTempPath];
    NSData *resumeData;
    if ([[ZBCacheManager sharedInstance]cacheExistsForKey:request.url inPath:AppDownloadTempPath]) {
        resumeData=[[ZBCacheManager sharedInstance]getCacheDataForKey:request.url inPath:AppDownloadTempPath];
    }
    return [[ZBRequestEngine defaultEngine] downloadWithRequest:request resumeData:resumeData savePath:[self AppDownloadPath] progress:^(NSProgress * _Nullable downloadProgress) {
        if (request.delegate&&[request.delegate respondsToSelector:@selector(requestProgress:)]) {
            [request.delegate requestProgress:downloadProgress];
        }
        request.progressBlock?request.progressBlock(downloadProgress):nil;
    }completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        if (error) {
            [self failureWithError:error request:request];
        }else{
            [self successWithResponse:response responseObject:[filePath path] request:request];
            if ([[ZBCacheManager sharedInstance]cacheExistsForKey:request.url inPath:AppDownloadTempPath]) {
                [[ZBCacheManager sharedInstance]clearCacheForkey:request.url inPath:AppDownloadTempPath completion:nil];
            }
        }
    }];
}

+ (NSUInteger)downloadStopWithRequest:(ZBURLRequest*)request{
    NSURLSessionTask * task=[[ZBRequestEngine defaultEngine]objectRequestForkey:request.url];
    NSURLSessionDownloadTask *downloadTask=(NSURLSessionDownloadTask *)task;
    if(downloadTask){
        [downloadTask cancelByProducingResumeData:^(NSData *resumeData) {
            NSString *AppDownloadTempPath=[self AppDownloadTempPath];
            [[ZBCacheManager sharedInstance]createDirectoryAtPath:AppDownloadTempPath];
            [[ZBCacheManager sharedInstance] storeContent:resumeData forKey:request.url inPath:AppDownloadTempPath isSuccess:^(BOOL isSuccess) {
                [self printDownloadStoreIsSuccess:isSuccess request:request];
            }];
        }];
        [request setTask:downloadTask];
        [request setIdentifier:downloadTask.taskIdentifier];
    }else{
        [self printDownloadFailureRequest:request];
    }
    return request.identifier;
}

#pragma mark - 取消请求
+ (void)cancelRequest:(NSUInteger)identifier{
    [[ZBRequestEngine defaultEngine]cancelRequestByIdentifier:identifier];
}

+ (void)cancelBatchRequest:(ZBBatchRequest *)batchRequest{
    if (batchRequest.requestArray.count>0) {
        [batchRequest.requestArray enumerateObjectsUsingBlock:^(ZBURLRequest * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.identifier>0) {
                [self cancelRequest:obj.identifier];
            }
        }];
    }
}

+ (void)cancelAllRequest{
    [[ZBRequestEngine defaultEngine]cancelAllRequest];
}

#pragma mark - 其他配置
+ (void)configBaseWithRequest:(ZBURLRequest *)request progress:(ZBRequestProgressBlock)progress success:(ZBRequestSuccessBlock)success failure:(ZBRequestFailureBlock)failure finished:(ZBRequestFinishedBlock)finished delegate:(id<ZBURLRequestDelegate>)delegate{
    [[ZBRequestEngine defaultEngine] configBaseWithRequest:request progressBlock:progress successBlock:success failureBlock:failure finishedBlock:finished delegate:delegate];
}

+ (NSString *)keyWithParameters:(ZBURLRequest *)request{
    id newParameters;
    if (request.filtrationCacheKey.count>0) {
        newParameters=[ZBRequestTool formaParameters:request.parameters filtrationCacheKey:request.filtrationCacheKey];
    }else{
        newParameters = request.parameters;
    }
    NSString *key=[NSString zb_stringEncoding:[NSString zb_urlString:request.url appendingParameters:newParameters]];
    if(key){
        [request setValue:key forKey:_cacheKey];
    }
    return key;
}

+ (void)storeObject:(NSObject *)object request:(ZBURLRequest *)request{
    [[ZBCacheManager sharedInstance] storeContent:object forKey:request.cacheKey isSuccess:nil];
}

+ (id)responsetSerializerConfig:(ZBURLRequest *)request responseObject:(id)responseObject{
    if (request.responseSerializer==ZBHTTPResponseSerializer||request.responseSerializer==ZBXMLResponseSerializer||request.responseSerializer==ZBPlistResponseSerializer||request.methodType==ZBMethodTypeDownLoad||![responseObject isKindOfClass:[NSData class]]) {
        return responseObject;
    }else{
        NSError *serializationError = nil;
        NSData *data = (NSData *)responseObject;
        // Workaround for behavior of Rails to return a single space for `head :ok` (a workaround for a bug in Safari), which is not interpreted as valid input by NSJSONSerialization.
        // See https://github.com/rails/rails/issues/1742
        BOOL isSpace = [data isEqualToData:[NSData dataWithBytes:" " length:1]];
        if (data.length > 0 && !isSpace) {
            id result=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&serializationError];
            return result;
        } else {
            return nil;
        }
    }
}

+ (void)successWithResponse:(NSURLResponse *)response responseObject:(id)responseObject request:(ZBURLRequest *)request{
    if(response){
        [request setValue:response forKey:_response];
    }
    [request setValue:@(NO) forKey:_isCache];
    id result=[self responsetSerializerConfig:request responseObject:responseObject];
    if ([ZBRequestEngine defaultEngine].responseProcessHandler) {
        NSError *processError = nil;
        id newResult =[ZBRequestEngine defaultEngine].responseProcessHandler(request, result,&processError);
        if (newResult) {
            result = newResult;
        }
        if (processError) {
            [self failureWithError:processError request:request];
            return;
        }
    }
    
    if (request.apiType == ZBRequestTypeRefreshAndCache||request.apiType == ZBRequestTypeCache) {
        if (request.responseSerializer == ZBJSONResponseSerializer||request.responseSerializer == ZBHTTPResponseSerializer){
            [self storeObject:responseObject request:request];
        }else{
            [self printCacheSerializerWithRequest:request];
        }
    }
    [self successWithCacheCallbackForResult:result forRequest:request];
}

+ (void)failureWithError:(NSError *)error request:(ZBURLRequest *)request{
    [self printfailureInfoWithError:error request:request];
    if ([ZBRequestEngine defaultEngine].errorProcessHandler) {
        [ZBRequestEngine defaultEngine].errorProcessHandler(request, error);
    }
    if (request.retryCount > 0) {
        request.retryCount --;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            /**
             request.timeoutInterval=0
             重连请求 防止触发 AFNetworking  kvo监控timeoutInterva 崩溃
             */
            request.timeoutInterval=0;
            [self checkAgainRequest:request];
        });
        return;
    }
    [self failureCallbackForError:error forRequest:request];
}

+ (void)getCacheDataForKey:(NSString *)key request:(ZBURLRequest *)request{
    [[ZBCacheManager sharedInstance]getCacheDataForKey:key value:^(NSData *data,NSString *filePath) {
        [self printCacheInfoWithkey:key filePath:filePath request:request];
        if(filePath){
            [request setValue:filePath forKey:_filePath];
        }
        [request setValue:@(YES) forKey:_isCache];
        id result=[self responsetSerializerConfig:request responseObject:data];
        if ([ZBRequestEngine defaultEngine].responseProcessHandler) {
            NSError *processError = nil;
            id newResult =[ZBRequestEngine defaultEngine].responseProcessHandler(request, result,&processError);
            if (newResult) {
                result = newResult;
            }
        }
        [self successWithCacheCallbackForResult:result forRequest:request];
    }];
}

+ (void)successWithCacheCallbackForResult:(id)result forRequest:(ZBURLRequest *)request{
    if (request.delegate&&[request.delegate respondsToSelector:@selector(requestSuccess:responseObject:)]) {
        [request.delegate requestSuccess:request responseObject:result];
    }
    if (request.delegate&&[request.delegate respondsToSelector:@selector(requestFinished:responseObject:error:)]) {
        [request.delegate requestFinished:request responseObject:result error:nil];
    }
    request.successBlock?request.successBlock(result, request):nil;
    request.finishedBlock?request.finishedBlock(result, nil,request):nil;
    [request cleanAllCallback];
    [[ZBRequestEngine defaultEngine] removeRequestForkey:request.url];
}

+ (void)failureCallbackForError:(NSError *)error forRequest:(ZBURLRequest *)request{
    if (request.delegate&&[request.delegate respondsToSelector:@selector(requestFailed:error:)]) {
        [request.delegate requestFailed:request error:error];
    }
    if (request.delegate&&[request.delegate respondsToSelector:@selector(requestFinished:responseObject:error:)]) {
        [request.delegate requestFinished:request responseObject:nil error:error];
    }
    request.failureBlock?request.failureBlock(error):nil;
    request.finishedBlock?request.finishedBlock(nil,error,request):nil;
    [request cleanAllCallback];
    [[ZBRequestEngine defaultEngine] removeRequestForkey:request.url];
}
#if !TARGET_OS_WATCH
#pragma mark - 获取网络状态
+ (BOOL)isNetworkReachable{
    return [ZBRequestEngine defaultEngine].networkReachability != 0;
}

+ (BOOL)isNetworkWiFi{
    return [ZBRequestEngine defaultEngine].networkReachability == 2;
}

+ (ZBNetworkReachabilityStatus)networkReachability{
    return [[ZBRequestEngine defaultEngine]networkReachability];
}

+ (void)setReachabilityStatusChangeBlock:(void (^)(ZBNetworkReachabilityStatus status))block{
    [[ZBRequestEngine defaultEngine]setReachabilityStatusChangeBlock:block];
}
#endif
#pragma mark - 下载获取文件
+ (NSString *)getDownloadFileForKey:(NSString *)key{
    return [[ZBCacheManager sharedInstance]getDiskFileForKey:[key lastPathComponent] inPath:[self AppDownloadPath]];
}

+ (NSString *)AppDownloadPath{
    return [[[ZBCacheManager sharedInstance] ZBKitPath]stringByAppendingPathComponent:zb_downloadPath];
}

+ (NSString *)AppDownloadTempPath{
    return [[[ZBCacheManager sharedInstance] ZBKitPath]stringByAppendingPathComponent:zb_downloadTempPath];
}

#pragma mark - 打印log
+ (void)printCacheInfoWithkey:(NSString *)key filePath:(NSString *)filePath request:(ZBURLRequest *)request{
    if (request.consoleLog==YES) {
        NSString *responseStr=request.responseSerializer==ZBHTTPResponseSerializer ?@"HTTP":@"JOSN";
        if ([filePath isEqualToString:@"memoryCache"]) {
            NSLog(@"\n------------ZBNetworking------cache info------begin------\n-cachekey-:%@\n-cacheFileSource-:%@\n-responseSerializer-:%@\n-filtrationCacheKey-:%@\n------------ZBNetworking------cache info-------end-------",key,filePath,responseStr,request.filtrationCacheKey);
        }else{
            NSLog(@"\n------------ZBNetworking------cache info------begin------\n-cachekey-:%@\n-cacheFileSource-:%@\n-cacheFileInfo-:%@\n-responseSerializer-:%@\n-filtrationCacheKey-:%@\n------------ZBNetworking------cache info-------end-------",key,filePath,[[ZBCacheManager sharedInstance] getDiskFileAttributesWithFilePath:filePath],responseStr,request.filtrationCacheKey);
        }
    }
}

+ (void)printfailureInfoWithError:(NSError *)error request:(ZBURLRequest *)request{
    if (request.consoleLog==YES) {
        NSLog(@"\n------------ZBNetworking------error info------begin------\n-URLAddress-:%@\n-retryCount-:%ld\n-error code-:%ld\n-error info-:%@\n------------ZBNetworking------error info-------end-------",request.url,request.retryCount,error.code,error.localizedDescription);
    }
}

+ (void)printCacheSerializerWithRequest:(ZBURLRequest *)request{
    if (request.consoleLog==YES) {
        NSString *responseStr =[[ZBRequestEngine defaultEngine] responseStrWithRequest:request];
        NSLog(@"\n------------ZBNetworking------cache serializer info------begin------\n- 数据响应格式为%@ 不支持缓存- \n-The data response format Caching is not supported-\n------------ZBNetworking------cache serializer info-------end-------",responseStr);
    }
}

+ (void)printDownloadStoreIsSuccess:(BOOL)isSuccess request:(ZBURLRequest *)request{
    if (request.consoleLog==YES) {
        if(isSuccess==YES){
            NSLog(@"\n------------ZBNetworking------download info------begin------\n暂停下载请求，成功保存当前已下载文件进度\n-URLAddress-:%@\n-downloadFileDirectory-:%@\n------------ZBNetworking------download info-------end-------",request.url,[self AppDownloadTempPath]);
        }else{
            NSLog(@"\n------------ZBNetworking------download info------begin------\n暂停下载请求，当前已下载文件保存失败\n-URLAddress-:%@\n-downloadFileDirectory-:%@\n------------ZBNetworking------download info-------end-------",request.url,[self AppDownloadTempPath]);
        }
    }
}

+ (void)printDownloadFailureRequest:(ZBURLRequest *)request{
    if (request.consoleLog==YES) {
        NSLog(@"\n------------ZBNetworking------download info------begin------\n downloadTask对象为nil，无法暂停下载请求\n-URLAddress-:%@\n------------ZBNetworking------download info-------end-------",request.url);
    }
}
@end
