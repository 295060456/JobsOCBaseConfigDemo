//
//  NSObject+Network.h
//  FM
//
//  Created by User on 9/18/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "DefineConstString.h" /// 常量字符串的定义
#import "MacroDef_Func.h"
#import "JobsDefineAllEnumHeader.h"            // 此文件用来存储记录全局的一些枚举

#import "URLManager.h"
#import "NSObject+Data.h"
#import "NSObject+Extras.h"
#import "NSURLRequest+Extra.h"

#import "YTKNetworkToolsHeader.h" /// 猿题库的网络框架工具
#import "GetImageApi.h"
#import "GetUserInfoApi.h"
#import "RegisterApi.h"
#import "UploadImageApi.h"
#import "GetCustomerContactApi.h"
#import "JobsNetworkingHeader.h" /// Api
#import "DAO.h"/// 数据模型层

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<AFNetworking/AFURLRequestSerialization.h>)
#import <AFNetworking/AFURLRequestSerialization.h>
#else
#import "AFURLRequestSerialization.h"
#endif

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

/// 后端接口返回数据按照标准格式（msg、code、data）进行解析，取出有用字段（data）
NS_INLINE JobsResponseModel *_Nullable JobsMapResponseModelBy(YTKBaseRequest *_Nonnull request){
    JobsPrintURLRequest(request.originalRequest);
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
  successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
///【请求已经成功，但是服务器抛异常】处理非HTTPResponseCodeSuccess 的 HTTPResponseCode
-(void)jobsHandelHTTPResponseCode:(HTTPResponseCode)responseCode
                      actionBlock:(jobsByNSIntegerBlock _Nullable)actionBlock;
///【请求失败】请求失败的处理
-(jobsByIDBlock _Nonnull)jobsHandelFailure;
///【请求错误】请求错误的处理
-(jobsByYTKRequestBlock _Nonnull)handleErr;
/// 仅仅打印请求体：request.requestTask
-(JobsHandelNoSuccessBlock _Nonnull)jobsHandelNoSuccess;
/// Tips封装
-(jobsByIDBlock _Nonnull)tipsByApi;
#pragma mark —— 示例代码
/// 普通的单个请求
-(void)loadCacheData:(jobsByResponseModelBlock _Nullable)successBlock;
/// 多请求の同步请求
-(void)sendBatchRequest:(jobsByYTKBatchRequestBlock _Nullable)successBlock;
/// 多请求の链式请求。链式请求的结果集体现在<YTKChainRequestDelegate>
-(void)sendChainRequest:(jobsByYTKChainRequestBlock _Nullable)successBlock;
#pragma mark —— 获取短信验证码
/// 发送短信验证码@POST
/// 會檢查账户是否已凍結
/// ❤️可以用于：注册、修改密码...❤️
/// 被凍結的錯誤碼  :
/// {
///     "code":500,
///     "msg":"Your account has freeze",
///     "data":null
/// }
-(void)getCodeByBodyParameters:(FMDoorModel *_Nullable)bodyParameters
                  successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
/// 发送短信验证码@POST
/// 會檢查账户是否已凍結
/// ❤️只能用于登录❤️
-(void)getSmsCodeByBodyParameters:(NSDictionary *_Nullable)bodyParameters
                     successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— ❤️短信验证码登录❤️
/// 仅仅是拿到用户Token。如果有錯誤（用户账户被封禁） 不會拋錯
-(void)loginByTelAndCodeByBodyParameters:(FMDoorModel *_Nullable)bodyParameters
                            successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 账密登录【仅仅是拿到用户Token】
/**
 【开发环境】
 用户名：Jobs295060456
 电话号码：09668536375
 验证码：888
 密码：Jobs123456
 
 【开发环境】
 用户名：dev028
 电话号码：55555445576
 验证码：888
 密码：123456

 【UAT】
 用户名：dev023
 电话号码：77255445233
 验证码： 888
 密码：Jobs29506045^
 */
/// 仅仅是拿到用户Token
-(void)loginByAccAndPwdByBodyParameters:(FMDoorModel *_Nullable)bodyParameters
                           successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 获取会员个人信息（以拿到用户信息为真正的登录成功的标志）
-(void)getMemberInfo:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 游戏大厅喜爱的游戏-添加@POST
-(void)likeByBodyParameters:(FMLikeModel *_Nullable)bodyParameters
               successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 游戏大厅喜爱的游戏-删除@POST
-(void)unLikeByBodyParameters:(FMLikeModel *_Nullable)bodyParameters
                 successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 用户登出@POST
-(void)fm_logout:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 查询广告列表-支持游客：APP首页右下3Banner@GET
-(void)getAds:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 查询广告列表-支持游客:活动推广专区@GET
-(void)promotionAdsDataByURLParameters:(NSString *_Nullable)urlParameters
                          successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 用户提交KYC认证@POST
-(void)kyc_submitByBodyParameters:(KYCModel *_Nullable)bodyParameters
                     successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 用户提交个人信息@POST
-(void)kyc_info_submitByBodyParameters:(FMKYCInfoModel *_Nullable)bodyParameters
                          successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 菲站APP首页:受欢迎的游戏列表查询@POST
/// 用于首页
-(void)get_hot_game_listByBodyParameters:(FMHotGameListModel *_Nullable)bodyParameters
                            successBlock:(jobsByIDBlock _Nullable)successBlock;
#pragma mark —— 菲站首页:受欢迎的游戏列表查询@POST
/// 用于收藏
-(void)get_hot_popularGames_listByBodyParameters:(NSDictionary *_Nullable)bodyParameters
                                    successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 查询广告列表(支持游客):首页天顶轮播大Banner@GET
-(void)bannerData:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 跑马灯信息查询【建议前端每20s-30s可以刷新请求一次】@GET
-(void)annunciationData:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 查询广告列表-支持游客:活动推广专区@GET
-(void)promotionAdsInfoList:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 游戏导航列表：缓存1分钟@GET
-(void)gameHomeBarList:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 查询用户123存款活动的在途订单数量@POST
/// 每个存款渠道，有各自对应的优惠信息
-(void)queryInTransit123DepositOrdersCountByURLParameters:(NSString *_Nullable)urlParameters
                                             successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 获取好友邀请规则（邀请人数）@GET
-(void)getInviteTerms:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 收益统计@POST
-(void)inviteBetAwardStatistic:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 站内信全部变为已读【建议前端每5s刷新一次】@PUT
-(void)letterAllRead:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 站内信全部删除@PUT
-(void)letterAllDelete:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 站内信删除@PUT
-(void)letterDelete:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 是否有未读站内信【建议前端每5s刷新一次】@POST
-(void)letterHasUnRead:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 站内信记录查询@POST
-(void)queryLetterConfigSendListByBodyParameters:(FMInboxModel *_Nullable)bodyParameters
                                    successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 站内信变为已读@PUT
-(void)letterToRead:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 邀请好友链接@GET
-(void)getReferralCode:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 获取会员KYC信息@GET
-(void)getKYCInfo:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 存款优惠活动信息@POST❤️链式请求❤️
-(void)depositDiscountActivityRecordByURLParameters:(NSString *_Nullable)urlParameters
                                       successBlock:(jobsByYTKChainRequestBlock _Nullable)successBlock;
#pragma mark —— 获取支付渠道@GET
-(void)fundDPChannelList:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— H5/APP 游戏导航列表：缓存10分钟 (仅适用于H5、App端)@GET
-(void)game_home_bar_mobile:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 前端- 查询所有场馆提供的游戏列表 (仅适用于H5、App端)@POST
-(void)game_home_sub_mobileByBodyParameters:(FMGameHomeSubMobileModel *_Nullable)bodyParameters
                               successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 菲站首页- 查询游戏收藏列表 仅适用于app端
-(void)game_home_favoriteGamesByBodyParameters:(FMGameHomeSubMobileModel *_Nullable)bodyParameters
                                  successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 获取会员与转账场馆余额：缓存3秒@POST
-(void)game_fund_walletByBodyParameters:(NSDictionary *_Nullable)bodyParameters
                           successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 使用手机号注册。注册成功，当即登录@POST
-(void)user_auth_mobileRegisterByBodyParameters:(FMDoorModel *_Nullable)bodyParameters
                                   successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 在未登录的情况下进行密码重置@POST
/// 1、在未登录的情况下，获取手机验证码成功以后取得一个临时的修改密码专属的用户Token，再进行下一步操作
-(void)getSmsCodeOnUpdatePassword_1_ByBodyParameters:(FMDoorModel *_Nullable)bodyParameters
                                        successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 在未登录的情况下进行密码重置@POST
/// 2、在上一步操作成功（取得一个临时的修改密码专属的用户Token）以后，此时加入最新修改的密码进行修改
-(void)getSmsCodeOnUpdatePassword_2_ByBodyParameters:(FMDoorModel *_Nullable)bodyParameters
                                        successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 在登录的情况下进行密码重置@POST
-(void)updatePasswordOnLoginByBodyParameters:(FMDoorModel *_Nullable)bodyParameters
                                successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 查询会员资金明细@POST
-(void)reportTradeByBodyParameters:(FMReportTradeModel *_Nullable)bodyParameters
                      successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 获取会员的银行卡列表@GET
-(void)userBankcardList:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 获取会员电子钱包列表@GET
-(void)userEWalletsList:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 拉取会员可用的提现通道列表@GET
-(void)wdChannelList:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 查询我的游戏注单@POST
-(void)myGameBetOrderSum:(FMMyGameBetOrderSumModel *_Nullable)bodyParameters
            successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 查询我的游戏注单详情@POST
-(void)gameBetOrderMyBetDetailByBodyParameters:(FMMyBetOrderDetailModel *_Nullable)bodyParameters
                                  successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 获取游戏场馆大类信息@GET
-(void)getTopGameLobbyListByURLParameters:(NSString *_Nullable)urlParameters
                             successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 获取游戏url@POST
-(void)getTopGameLobbyListByLobbyId:(NSString *)lobbyId
                       successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 查询用户KYC认证信息详情@GET
-(void)getMemberKYCDetailByUserId:(NSString *)userId
                     successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 获取客服@POST
-(void)getOnlineService:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 教程列表@POST
-(void)getTutorialByTutorialType:(FMTutorialType)type
                    successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 教程子项列表@POST
-(void)getTutorialItemByTutorialID:(NSInteger)tutorialID
                      successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 上传KYC的图片@POST
-(void)uploadKYCImage:(NSData *)image
         successBlock:(jobsByResponseModelBlock _Nullable)successBlock;

@end

NS_ASSUME_NONNULL_END
