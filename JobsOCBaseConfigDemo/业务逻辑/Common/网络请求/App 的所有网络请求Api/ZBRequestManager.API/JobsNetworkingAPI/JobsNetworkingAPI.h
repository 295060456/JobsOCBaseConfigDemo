//
//  JobsNetworkingAPI.h
//  DouYin
//
//  Created by Jobs on 2020/9/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "RequestTool.h"
#import "NSObject+Extras.h"
#import "JobsResponseModel.h"
/**
 公共配置
 插件机制
 证书设置
 */
#define JobsNetworkingPrepare JobsLog(@"当前是否有网：%d 状态：%ld",ZBRequestManager.isNetworkReachable,ZBRequestManager.networkReachability);\
DataManager.sharedManager.tag = ReuseIdentifier.add(@"_").add(NSStringFromSelector(_cmd));\

NS_ASSUME_NONNULL_BEGIN

@interface JobsNetworkingAPI : NSObject
#pragma mark —— 普通的网络请求
/// 【只有Body参数、不需要错误回调】
+(void)requestApi:(NSString *_Nonnull)requestApi
       parameters:(id _Nullable)parameters
     successBlock:(jobsByIDBlock _Nullable)successBlock;
///【只有Body参数、需要错误回调的】
+(void)requestApi:(NSString *_Nonnull)requestApi
       parameters:(id _Nullable)parameters
     successBlock:(jobsByIDBlock _Nullable)successBlock
     failureBlock:(jobsByIDBlock _Nullable)failureBlock;
#pragma mark —— 特殊的上传文件的网络请求
/// 上传【图片】文件的网络请求
+(void)requestApi:(NSString *_Nonnull)requestApi
uploadImagesParamArr:(NSArray *_Nullable)uploadImagesParamArr
     successBlock:(jobsByIDBlock _Nullable)successBlock
     failureBlock:(jobsByIDBlock _Nullable)failureBlock;
/// 上传【视频】文件的网络请求
+(void)requestApi:(NSString *_Nonnull)requestApi
uploadVideosParamArr:(NSArray *_Nullable)uploadVideosParamArr
     successBlock:(jobsByIDBlock _Nullable)successBlock
     failureBlock:(jobsByIDBlock _Nullable)failureBlock;
/// 请求成功的处理代码
+(void)networkingSuccessHandleWithData:(JobsResponseModel *_Nullable)responseObject
                               request:(ZBURLRequest *_Nullable)request
                          successBlock:(jobsByIDBlock _Nullable)successBlock
                          failureBlock:(jobsByIDBlock _Nullable)failureBlock;
#pragma mark —— 错误处理
+(jobsByIDBlock _Nonnull)handleError;

@end

NS_ASSUME_NONNULL_END

/**
 调用示例：【一般的网络请求，只带body参数，最多也就是自定义header】
 -(void)networking_messageSecondClassListGET{
     JobsLog(@"当前是否有网：%d 状态：%ld",[ZBRequestManager isNetworkReachable],(long)[ZBRequestManager networkReachability]);
     DataManager.sharedManager.tag = [ReuseIdentifier stringByAppendingString:NSStringFromSelector(_cmd)];
     RequestTool *config = RequestTool.new
     config.languageType = HTTPRequestHeaderLanguageCN;
     RequestTool.setupPublicParametersBy(config);;//公共配置、插件机制、证书设置
     @jobs_weakify(self)
     NSDictionary *parameters = @{};
     [JobsNetworkingAPI requestApi:NSObject.messageSecondClassListGET.funcName
                      parameters:parameters
                    successBlock:^(id data) {
         @jobs_strongify(self)
     }failureBlock:^(id data) {
         @jobs_strongify(self)
     }];
 }
 
 /// 邀请好友
 +(void)userInfoInviteFriendPOST:(id)parameters
                    successBlock:(jobsByIDBlock _Nullable)successBlock{
 //    NSDictionary *parameterss = @{};
 //    NSDictionary *headers = @{};
     
     [ZBRequestManager requestWithConfig:^(ZBURLRequest * _Nullable request) {

         request.server = This.BaseUrl;
         request.url = [request.server stringByAppendingString:NSObject.userInfoInviteFriendPOST.url];
         
         JobsLog(@"request.URLString = %@",request.url);
         
         request.methodType = ZBMethodTypePOST;//默认为GET
         request.apiType = ZBRequestTypeRefresh;//（默认为ZBRequestTypeRefresh 不读取缓存，不存储缓存）
         request.parameters = parameters;//与公共配置 Parameters 兼容
 //        request.headers = headers;//与公共配置 Headers 兼容
         request.retryCount = 1;//请求失败 单次请求 重新连接次数 优先级大于 全局设置，不影响其他请求设置
         request.timeoutInterval = 10;//默认30 //优先级 高于 公共配置,不影响其他请求设置
         if (isValue(DataManager.sharedManager.tag)) {
             request.userInfo = @{@"info":DataManager.sharedManager.tag};//与公共配置 UserInfo 不兼容 优先级大于 公共配置
         };//与公共配置 UserInfo 不兼容 优先级大于 公共配置
         
         {
 //            request.filtrationCacheKey = @[JobsInternationalization(@"")];//与公共配置 filtrationCacheKey 兼容
 //            request.requestSerializer = ZBJSONRequestSerializer; //单次请求设置 请求格式 默认JSON，优先级大于 公共配置，不影响其他请求设置
 //            request.responseSerializer = ZBJSONResponseSerializer; //单次请求设置 响应格式 默认JSON，优先级大于 公共配置,不影响其他请求设置
            
 /// 多次请求同一个接口 保留第一次或最后一次请求结果 只在请求时有用  读取缓存无效果。默认ZBResponseKeepNone 什么都不做。使用场景是在 重复点击造成的 多次请求，如发帖，评论，搜索等业务
 //            request.keepType=ZBResponseKeepNone;
         }//一些临时的其他的配置
         
     }progress:^(NSProgress * _Nullable progress){
         JobsLog(@"进度 = %f",progress.fractionCompleted * 100);
     }success:^(id  _Nullable responseObject,
                ZBURLRequest * _Nullable request){
         if (successBlock) {
             successBlock(responseObject);
         }
     }failure:^(NSError * _Nullable error){
         JobsLog(@"error = %@",error);
     }finished:^(id  _Nullable responseObject,
                 NSError * _Nullable error,
                 ZBURLRequest * _Nullable request){
         JobsLog(@"请求完成 userInfo:%@",request.userInfo);
     }];
 }
 
 **/

/**
调用示例：【特殊的网络请求：可以body里面携带参数，也可以自定义header，并且表单模式post传输data数据】
/// 帖子图片上传 POST
-(void)networking_postUploadImagePOST{
 JobsLog(@"当前是否有网：%d 状态：%ld",[ZBRequestManager isNetworkReachable],(long)[ZBRequestManager networkReachability]);
 DataManager.sharedManager.tag = [ReuseIdentifier stringByAppendingString:NSStringFromSelector(_cmd)];

 RequestTool *config = RequestTool.new
 config.languageType = HTTPRequestHeaderLanguageCN;
 RequestTool.setupPublicParametersBy(config);;//公共配置、插件机制、证书设置
 
 @jobs_weakify(self)
 NSDictionary *parameters = @{};
 [JobsNetworkingAPI requestApi:NSObject.postUploadImagePOST.funcName
        uploadImagesParamArr:@[parameters,
                               self.photosImageMutArr]
                successBlock:^(id data) {
     @jobs_strongify(self)
     JobsLog(@"data = %@",data);
 }
                failureBlock:^(id data) {
     @jobs_strongify(self)
     JobsLog(@"data = %@",data);
 }];
}
 
+(void)postUploadImagePOST:(id)parameters
       uploadImageDatas:(NSMutableArray<UIImage *> *)uploadImageDatas
           successBlock:(jobsByIDBlock _Nullable)successBlock
           failureBlock:(jobsByIDBlock _Nullable)failureBlock{
 
 NSMutableArray *uploadDatas = NSMutableArray.array;
 for (int i = 0; i < uploadImageDatas.count; i++) {
     UIImage *image = uploadImageDatas[i];
     NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
     NSInteger time = NSDate.date.timeIntervalSince1970 * 1000;
     NSString *fileName = [NSString stringWithFormat:@"%ld_%u.jpeg",time,arc4random() / 1000];
     ZBUploadData *zbdata = [ZBUploadData formDataWithName:@"file"
                                                  fileName:fileName
                                                  mimeType:@"image/jpeg"
                                                  fileData:imageData];
     [uploadDatas addObject:zbdata];
 }
 [ZBRequestManager requestWithConfig:^(ZBURLRequest * request) {
     request.server = This.BaseUrl;
     request.url = [request.server stringByAppendingString:NSObject.postUploadImagePOST.url];
     JobsLog(@"request.URLString = %@",request.url);
     request.methodType = ZBMethodTypeUpload;
     request.apiType = ZBRequestTypeRefresh;//（默认为ZBRequestTypeRefresh 不读取缓存，不存储缓存）
//        request.parameters = parameters;//与公共配置 Parameters 兼容
//        request.headers = headers;//与公共配置Headers 兼容
     request.retryCount = 1;//请求失败 单次请求 重新连接次数 优先级大于 全局设置，不影响其他请求设置
     request.timeoutInterval = 120;//默认30 //优先级 高于 公共配置,不影响其他请求设置
     request.requestSerializer = ZBHTTPRequestSerializer;
     request.uploadDatas = uploadDatas;
     if (isValue(DataManager.sharedManager.tag)) {
         request.userInfo = @{@"info":DataManager.sharedManager.tag};//与公共配置 UserInfo 不兼容 优先级大于 公共配置
     };//与公共配置 UserInfo 不兼容 优先级大于 公共配置
 } progress:^(NSProgress * _Nullable progress) {
     JobsLog(@"onProgress: %.2f", 100.f * progress.completedUnitCount/progress.totalUnitCount);
 } success:^(id  responseObject,ZBURLRequest * request) {
     JobsLog(@"responseObject: %@", responseObject);
     if (successBlock) {
         successBlock(responseObject);
     }
 } failure:^(NSError * _Nullable error) {
     JobsLog(@"error: %@", error);
     if (failureBlock) {
         failureBlock(error);
     }
 }];
}
 
 **/

/**
调用示例：【特殊的网络请求：可以body里面携带参数，也可以自定义header，并且表单模式post传输data数据】
/// 帖子视频上传 POST
-(void)networking_postuploadVideoPOST{
 JobsLog(@"当前是否有网：%d 状态：%ld",[ZBRequestManager isNetworkReachable],(long)[ZBRequestManager networkReachability]);
 DataManager.sharedManager.tag = [ReuseIdentifier stringByAppendingString:NSStringFromSelector(_cmd)];

 RequestTool *config = RequestTool.new
 config.languageType = HTTPRequestHeaderLanguageCN;
 RequestTool.setupPublicParametersBy(config);;//公共配置、插件机制、证书设置
 
 @jobs_weakify(self)
 NSDictionary *parameters = @{};
 
 extern NSString *postuploadVideoPOST;
 extern NSString *preproccess;
 
 [JobsNetworkingAPI requestApi:NSObject.postuploadVideoPOST.funcName
        uploadVideosParamArr:@[parameters,
                               self.videosData]
                successBlock:^(id data) {
     @jobs_strongify(self)
     JobsLog(@"data = %@",data);
 }
                failureBlock:^(id data) {
     @jobs_strongify(self)
     JobsLog(@"data = %@",data);
 }];
}

 NSString *postuploadVideoPOST;
 +(void)postuploadVideoPOST:(id)parameters
                uploadVideo:(NSMutableArray <NSData *>*)videoDatas
               successBlock:(jobsByIDBlock _Nullable)successBlock
               failureBlock:(jobsByIDBlock _Nullable)failureBlock{
     NSMutableArray *uploadDatas = NSMutableArray.array;
     for (int i = 0; i < videoDatas.count; i++) {
         NSInteger time = NSDate.date.timeIntervalSince1970 * 1000;
         NSString *fileName = [NSString stringWithFormat:@"%ld_%u.mp4", time, arc4random() / 1000];

         ZBUploadData *zbdata = [ZBUploadData formDataWithName:@"file"
                                                      fileName:fileName
                                                      mimeType:@"video/mp4"
                                                      fileData:videoDatas[i]];
         
     //    ZBUploadData *zbdata = [ZBUploadData formDataWithName:@"file"
     //                                                 fileName:fileName
     //                                                 mimeType:@"video/mp4"
     //                                                  fileURL:videoURL];
         [uploadDatas addObject:zbdata];
     }
     
     [ZBRequestManager requestWithConfig:^(ZBURLRequest * request) {
         request.server = This.BaseUrl;
         request.url = [request.server stringByAppendingString:NSObject.postuploadVideoPOST.url];
         JobsLog(@"request.URLString = %@",request.url);
         request.methodType = ZBMethodTypeUpload;
         request.apiType = ZBRequestTypeRefresh;//（默认为ZBRequestTypeRefresh 不读取缓存，不存储缓存）
 //        request.parameters = parameters;//与公共配置 Parameters 兼容
 //        request.headers = headers;//与公共配置Headers 兼容
         request.retryCount = 1;//请求失败 单次请求 重新连接次数 优先级大于 全局设置，不影响其他请求设置
         request.timeoutInterval = 120;//默认30 //优先级 高于 公共配置,不影响其他请求设置
         request.requestSerializer = ZBHTTPRequestSerializer;
         request.uploadDatas = uploadDatas;
         if (isValue(DataManager.sharedManager.tag)) {
             request.userInfo = @{@"info":DataManager.sharedManager.tag};//与公共配置 UserInfo 不兼容 优先级大于 公共配置
         };//与公共配置 UserInfo 不兼容 优先级大于 公共配置
     } progress:^(NSProgress * _Nullable progress) {
         JobsLog(@"onProgress: %.2f", 100.f * progress.completedUnitCount/progress.totalUnitCount);
         [WHToast toastLoadingMsg:@"视频上传中...请稍后"];
     } success:^(id  responseObject,ZBURLRequest * request) {
         JobsLog(@"responseObject: %@", responseObject);
         [WHToast toastHide];
         if (successBlock) {
             successBlock(responseObject);
         }
     } failure:^(NSError * _Nullable error) {
         JobsLog(@"error: %@", error);
         [WHToast toastHide];
         if (failureBlock) {
             failureBlock(error);
         }
     }];
 }
 **/

//if ([responseObject isKindOfClass:NSDictionary.class]) {
//    NSDictionary *dataDic = (NSDictionary *)responseObject;
//    JobsResponseModel *model = [JobsResponseModel mj_objectWithKeyValues:dataDic];
//    // 公共请求错误直接抛出
//    if (model.code != HTTPResponseCodeSuccess) {
//        self.jobsToastMsg(model.msg);
//    }else{
//        if (successBlock) {
//            successBlock(model);
//        }
//    }
//}else{
//        self.jobsToastMsg(JobsInternationalization(@"异常接口").add(NSObject.userInfoSelectVideoCountPOST.funcName));
//}

/**
 
 -(void)基础的网络请求示例{
     [AFHTTPSessionManager.manager GET:@"http://172.24.135.12/CommentData.json"
                            parameters:nil
                               headers:nil
                              progress:^(NSProgress * _Nonnull downloadProgress) {
     } success:^(NSURLSessionDataTask * _Nonnull task,
                 id  _Nullable responseObject) {
         JobsLog(@"%@",responseObject);
     } failure:^(NSURLSessionDataTask * _Nullable task,
                 NSError * _Nonnull error) {
         JobsLog(@"%@",error);
     }];
 }
 
 */

/**
 
 -(void)获取本地json文件数据:(BOOL)isLoadMore{
     NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
     NSData *data = [NSData dataWithContentsOfFile:path];
     NSError *err = nil;
     NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data
                                                  options:NSJSONReadingAllowFragments
                                                    error:&err];
     JobsLog(@"");
 }
 
 **/
