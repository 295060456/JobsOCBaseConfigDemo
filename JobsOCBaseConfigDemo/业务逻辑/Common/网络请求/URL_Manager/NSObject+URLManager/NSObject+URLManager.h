//
//  NSObject+URLManager.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/12/10.
//  Copyright © 2020 MonkeyKingVideo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLManagerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (URLManager)

#pragma mark —— BaseURL
-(NSString *)BaseUrl;
-(NSString *)BaseUrl_H5;
#pragma mark —— App接口示例
-(URLManagerModel *)appInterfaceTesting;
#pragma mark —— GoldenF游戏厅
/// 查询当前登录用户PG/CQ9余额
-(URLManagerModel *)goldenFGetBalanceGET;
/// 查询当前登录用户PG/CQ9余额
-(URLManagerModel *)goldenFGetBalanceApiGET;
/// 查询WM,PG,CQ9维护状态的游戏
-(URLManagerModel *)goldenFMaintenanceGameListGET;
/// 一键回收当前登录用户PG/CQ9余额
-(URLManagerModel *)goldenFoneKeyRecoverGET;
/// 一键回收用户PG/CQ9余额外部接口
-(URLManagerModel *)goldenFoneKeyRecoverApiGET;
/// 开游戏
-(URLManagerModel *)goldenFopenGamePOST;
/// PG游戏试玩,CQ9不支持试玩
-(URLManagerModel *)goldenFopenGameDemoPOST;
#pragma mark —— WM游戏厅
/// 查询当前登录用户WM余额
-(URLManagerModel *)wmGetWmBalanceGET;
/// 查询用户WM余额外部接口
-(URLManagerModel *)wmGetWmBalanceApiGET;
/// 一键回收当前登录用户WM余额
-(URLManagerModel *)wmOneKeyRecoverGET;
/// 一键回收用户WM余额外部接口
-(URLManagerModel *)wmOneKeyRecoverApiGET;
/// 开游戏
-(URLManagerModel *)wmOpenGamePOST;
#pragma mark —— 代理中心
/// 业绩查询
-(URLManagerModel *)proxyCentreFindAchievementListGET;
/// 查询今日，昨日，本周佣金
-(URLManagerModel *)proxyCentreGetCommissionGET;
/// 我的团队
-(URLManagerModel *)proxyCentreMyTeamGET;
/// 代理报表
-(URLManagerModel *)proxyCentreProxyReportGET;
/// 用户领取分润金额
-(URLManagerModel *)proxyCentreReceiveShareProfitGET;
#pragma mark —— 公告中心
/// 公告/活动
-(URLManagerModel *)noticeNewestGET;
#pragma mark —— 客服中心
/// 客服联系方式
-(URLManagerModel *)customerContactGET;
#pragma mark —— 平台配置中心
/// 检查人人代开关
-(URLManagerModel *)platformConfigCheckPeopleProxySwitchGET;
/// 检查平台维护开关
-(URLManagerModel *)platformConfigCheckPlatformMaintenanceSwitchGET;
/// 获取客服脚本编码
-(URLManagerModel *)platformConfigGetCustomerCodeGET;
/// 获取人人代三级分佣比例
-(URLManagerModel *)platformConfigGetPeopleProportionGET;
#pragma mark —— 应用版本控制
/// 获取Android最新下载链接
-(URLManagerModel *)downloadStationGetAndroidDownloadUrlGET;
/// Android最新版本检查
-(URLManagerModel *)downloadStationGetAndroidNewestVersionGET;
/// 获取文件服务器地址
-(URLManagerModel *)downloadStationGetFileServerUrlGET;
/// 获取iOS最新下载链接
-(URLManagerModel *)downloadStationGetIosDownloadUrlGET;
/// iOS最新版本检查
-(URLManagerModel *)downloadStationGetIosNewestVersionGET;
/// 获取移动端logo
-(URLManagerModel *)downloadStationGetLogImageUrlAppGET;
/// 获取PC端logo
-(URLManagerModel *)downloadStationGetLogImageUrlPcGET;
/// 获取移动端登录注册页面logo
-(URLManagerModel *)downloadStationGetLoginRegisterLogImageUrlAppGET;
/// 获取金钱符号
-(URLManagerModel *)downloadStationGetMoneySymbolGET;
/// 推广域名
-(URLManagerModel *)downloadStationGetSpreadUrlGET;
/// 获取网站Icon
-(URLManagerModel *)downloadStationGetWebsiteIconGET;
/// 网页版链接
-(URLManagerModel *)downloadStationGetWebUrlGET;
#pragma mark —— 洗码
/// 用户洗码列表
-(URLManagerModel *)washCodeGetListGET;
/// 用户领取洗码
-(URLManagerModel *)washCodeReceiveWashCodeGET;
#pragma mark —— 测试
/// 批量发送分润MQ
-(URLManagerModel *)testSendMqGET;
/// 发送消息到TG机器人
-(URLManagerModel *)testSendMsgToTelegramBotGET;
#pragma mark —— 用户中心
/// 银行列表
-(URLManagerModel *)bankcardBanklistGET;
/// 用户增加银行卡
-(URLManagerModel *)bankcardBoundPOST;
/// 根据ID删除银行卡
-(URLManagerModel *)bankcardDeleteBankCardByIdGET;
/// 根据ID设置默认银行卡
-(URLManagerModel *)bankcardSetDefaultBankCardByIdPOST;
/// 直接开户
-(URLManagerModel *)userDirectOpenAccountPOST;
/// 获取当前用户人人代推广链接
-(URLManagerModel *)userEveryoneSpreadGET;
/// 获取当前用户的余额,打码量,可提现金额,洗码金额,分润金额
-(URLManagerModel *)userGetMoneyGET;
/// 获取当前用户的基本信息(不包含 余额，打码量，可提现金额,洗码金额)
-(URLManagerModel *)userInfoGET;
/// 登录用户修改信息
-(URLManagerModel *)userUpdateUserInfoPOST;
/// web端登录用户修改信息
-(URLManagerModel *)userWebUpdateUserInfoPOST;
/// 获取用户已绑定银行卡
-(URLManagerModel *)withdrawBanklistGET;
/// 提款提交
-(URLManagerModel *)withdrawSubmitPOST;
/// 当前登录用户修改登录密码
-(URLManagerModel *)withdrawUpdateLoginPasswordPOST;
/// 当前登录用户修改取款密码
-(URLManagerModel *)withdrawUpdateWithdrawPasswordPOST;
#pragma mark —— 认证中心
/// 谷歌图形验证码
-(URLManagerModel *)authCaptchaGET;
/// 校验邀请码
-(URLManagerModel *)authCheckInviteCodeGET;
/// 开发者通过此令牌调试接口。不可用于正式请求
-(URLManagerModel *)authGetJwtTokenGET;
/// 查询注册通道状态
-(URLManagerModel *)authGetRegisterStatusGET;
/// 通过手机号获取验证码
-(URLManagerModel *)authGetVerificationCodeGET;
/// 帐密登陆.谷歌验证码
-(URLManagerModel *)authLoginAPOST;
/// 前台用户注册
-(URLManagerModel *)authRegisterPOST;
/// 服务健康状态监测
-(URLManagerModel *)authServiceHealthCheckGET;
/// 推广用户注册
-(URLManagerModel *)authSpreadRegisterPOST;
#pragma mark —— 资金中心
/// 用户资金详情
-(URLManagerModel *)accountChangeAccountChangeListGET;
/// 用户充值列表
-(URLManagerModel *)chargeOrderChargeOrderListGET;
/// 充值订单流水详情
-(URLManagerModel *)rechargeTurnoverFindPageGET;
/// 提现列表
-(URLManagerModel *)withdrawWithdrawListGET;
#pragma mark —— 轮播图
/// 轮播图.返回的URL为相对路径。需加上项目域名访问
-(URLManagerModel *)picLunboGET;
#pragma mark —— 银行卡线下充值
/// 收款银行卡列表
-(URLManagerModel *)chargeCollectBankcardsGET;
/// 提交充值
-(URLManagerModel *)chargeSubmitPOST;

@end

NS_ASSUME_NONNULL_END

