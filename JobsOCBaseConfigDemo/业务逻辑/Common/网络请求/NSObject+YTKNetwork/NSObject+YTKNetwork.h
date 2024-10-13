//
//  NSObject+Network.h
//  FM
//
//  Created by User on 9/18/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "DefineConstString.h"
#import "MacroDef_Func.h"
#import "JobsDefineAllEnumHeader.h"

#import "URLManager.h"
#import "NSObject+Data.h"
#import "NSObject+Extras.h"

#import "YTKNetworkToolsHeader.h" /// 猿题库的网络框架工具
#import "GetImageApi.h"
#import "GetUserInfoApi.h"
#import "RegisterApi.h"
#import "UploadImageApi.h"
#import "GetCustomerContactApi.h"
#import "JobsNetworkingHeader.h" /// Api
#import "DAO.h"/// 数据模型层

/// 后端接口返回数据按照标准格式（msg、code、data）进行解析，取出有用字段（data）
NS_INLINE JobsResponseModel *_Nullable JobsMapResponseModelBy(YTKBaseRequest *_Nonnull request){
    return JobsResponseModel.byData(request.responseObject);
}

#ifndef JobsResponseData
#define JobsResponseData JobsMapResponseModelBy(request).data
#endif /*JobsResponseData*/

#ifndef JobsSolveData
#define JobsSolveData(DATA) DATA.byData(JobsResponseData)
#endif /*JobsSolveData*/

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (YTKNetwork)<YTKChainRequestDelegate>
#pragma mark —— 一些公有设置
/// successData传nil：对总数据源进行标准格式解析后对外返回 JobsResponseModel
/// successData传JobsSolveData(AModel)：对总数据源进行标准格式解析以后，再进行一层关于AModel的解析后对外返回
-(void)request:(YTKBaseRequest *)request /// 总数据源
   successData:(id _Nullable)successData /// 本层对success的解析数据
   actionBlock:(jobsByResponseModelBlock _Nullable)actionBlock /// 本层对success的解析回调
  successBlock:(jobsByResponseModelBlock _Nullable)successBlock /// 外层对success的解析回调
     failBlock:(jobsByVoidBlock _Nullable)failBlock;
-(void)request:(YTKBaseRequest *)request
  successBlock:(jobsByIDBlock _Nullable)successBlock;
-(jobsByIDBlock _Nonnull)jobsHandelFailure;
-(JobsHandelNoSuccessBlock _Nonnull)jobsHandelNoSuccess;
-(jobsByIDBlock _Nonnull)tipsByApi;
-(jobsByIDBlock _Nonnull)handleErr;
#pragma mark —— 示例代码
/// 普通的单个请求
-(void)loadCacheData:(jobsByIDBlock _Nullable)successBlock;
/// 多请求の同步请求
-(void)sendBatchRequest:(jobsByIDBlock _Nullable)successBlock;
/// 多请求の链式请求。链式请求的结果集体现在<YTKChainRequestDelegate>
-(void)sendChainRequest:(jobsByIDBlock _Nullable)successBlock;

@end

NS_ASSUME_NONNULL_END
