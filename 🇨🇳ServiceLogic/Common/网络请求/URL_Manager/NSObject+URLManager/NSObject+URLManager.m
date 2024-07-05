//
//  NSObject+URLManager.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/12/10.
//  Copyright © 2020 MonkeyKingVideo. All rights reserved.
//

#import "NSObject+URLManager.h"

//JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_DevEnviron_Cambodia_Main;/// 柬埔寨（主要）开发环境
JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_DevEnviron_Cambodia_Minor;/// 柬埔寨（次要）开发环境
//JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_DevEnviron_China_Mainland;/// 中国大陆开发环境
//JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_TestEnviron;/// 测试环境
//JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_ProductEnviron;/// 生产环境
//JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_UATEnviron;/// UAT环境

@implementation NSObject (URLManager)
 
-(URLManagerModel *)url:(NSString *)url
               funcName:(NSString *)funcName{
    URLManagerModel *managerModel = URLManagerModel.new;
    managerModel.url = url;
    managerModel.funcName = funcName;
    return managerModel;
}
#pragma mark —— BaseURL
-(NSString *)BaseUrl{
    switch (networkingEnvir) {
        case JobsNetworkingEnvir_DevEnviron_Cambodia_Main:{
            /// 柬埔寨（主要）开发环境
            return @"http://okeexx.cn:9200".urlProtect;
//            return @"154.204.57.237:9200";
//            return @"192.168.10.77:9200";
        }break;
        case JobsNetworkingEnvir_DevEnviron_Cambodia_Minor:{
            /// 柬埔寨的开发环境(次要)，因为某些代码未合并，柬埔寨的开发环境临时用测试环境替代
            return @"http://116.212.138.46:9200".urlProtect;
        }break;
        case JobsNetworkingEnvir_DevEnviron_China_Mainland:{
            /// 中国大陆开发环境
            return @"http://47.243.60.31:9200".urlProtect;
        }break;
        case JobsNetworkingEnvir_TestEnviron:{
            /// 测试环境
            return JobsInternationalization(@"").urlProtect;
        }break;
        case JobsNetworkingEnvir_ProductEnviron:{
            /// 生产环境
            return JobsInternationalization(@"").urlProtect;
        }break;
        default:
            return JobsInternationalization(@"").urlProtect;
            break;
    }
}

-(NSString *)BaseUrl_H5{
    switch (networkingEnvir) {
        case JobsNetworkingEnvir_DevEnviron_Cambodia_Main:{
            /// 柬埔寨（主要）开发环境
            return JobsInternationalization(@"");
        }break;
        case JobsNetworkingEnvir_DevEnviron_Cambodia_Minor:{
            /// 柬埔寨的开发环境(次要)，因为某些代码未合并，柬埔寨的开发环境临时用测试环境替代
            return JobsInternationalization(@"");
        }break;
        case JobsNetworkingEnvir_DevEnviron_China_Mainland:{
            /// 中国大陆开发环境
            return JobsInternationalization(@"");
        }break;
        case JobsNetworkingEnvir_TestEnviron:{
            /// 测试环境
            return JobsInternationalization(@"");
        }break;
        case JobsNetworkingEnvir_ProductEnviron:{
            /// 生产环境
            return JobsInternationalization(@"");
        }break;
        default:
            return JobsInternationalization(@"");
            break;
    }
}
#pragma mark —— App接口示例
-(URLManagerModel *)appInterfaceTesting{
    return [NSObject url:@"http://172.24.135.14:8000/Downloads/CommentData.json"//@"http://172.24.135.12/CommentData.json"
                funcName:NSStringFromSelector(_cmd)];
}
#pragma mark —— GoldenF游戏厅
/// 查询当前登录用户PG/CQ9余额
-(URLManagerModel *)goldenFGetBalanceGET{
    return [NSObject url:@"​/golednf​/getBalance".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 查询当前登录用户PG/CQ9余额
-(URLManagerModel *)goldenFGetBalanceApiGET{
    return [NSObject url:@"​​/golednf​/getBalanceApi".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 查询WM,PG,CQ9维护状态的游戏
-(URLManagerModel *)goldenFMaintenanceGameListGET{
    return [NSObject url:@"​​​/golednf​/maintenanceGameList".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 一键回收当前登录用户PG/CQ9余额
-(URLManagerModel *)goldenFoneKeyRecoverGET{
    return [NSObject url:@"​​​/golednf​/oneKeyRecover".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 一键回收用户PG/CQ9余额外部接口
-(URLManagerModel *)goldenFoneKeyRecoverApiGET{
    return [NSObject url:@"​​​​/golednf​/oneKeyRecoverApi".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 开游戏
-(URLManagerModel *)goldenFopenGamePOST{
    return [NSObject url:@"​​​​​/golednf​/openGame".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// PG游戏试玩,CQ9不支持试玩
-(URLManagerModel *)goldenFopenGameDemoPOST{
    return [NSObject url:@"​​​​​​/golednf​/openGameDemo".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
#pragma mark —— WM游戏厅
/// 查询当前登录用户WM余额
-(URLManagerModel *)wmGetWmBalanceGET{
    return [NSObject url:@"/wm/getWmBalance".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 查询用户WM余额外部接口
-(URLManagerModel *)wmGetWmBalanceApiGET{
    return [NSObject url:@"/wm​/getWmBalanceApi".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 一键回收当前登录用户WM余额
-(URLManagerModel *)wmOneKeyRecoverGET{
    return [NSObject url:@"/wm​/oneKeyRecover".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 一键回收用户WM余额外部接口
-(URLManagerModel *)wmOneKeyRecoverApiGET{
    return [NSObject url:@"/wm/oneKeyRecoverApi".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 开游戏
-(URLManagerModel *)wmOpenGamePOST{
    return [NSObject url:@"/wm/openGame".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
#pragma mark —— 代理中心
/// 业绩查询
-(URLManagerModel *)proxyCentreFindAchievementListGET{
    return [NSObject url:@"/proxyCentre/findAchievementList".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 查询今日，昨日，本周佣金
-(URLManagerModel *)proxyCentreGetCommissionGET{
    return [NSObject url:@"/proxyCentre/getCommission".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 我的团队
-(URLManagerModel *)proxyCentreMyTeamGET{
    return [NSObject url:@"/proxyCentre/myTeam".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 代理报表
-(URLManagerModel *)proxyCentreProxyReportGET{
    return [NSObject url:@"/proxyCentre/proxyReport".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 用户领取分润金额
-(URLManagerModel *)proxyCentreReceiveShareProfitGET{
    return [NSObject url:@"/proxyCentre/receiveShareProfit".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
#pragma mark —— 公告中心
/// 公告/活动
-(URLManagerModel *)noticeNewestGET{
    return [NSObject url:@"/notice/newest".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
#pragma mark —— 客服中心
/// 客服联系方式
-(URLManagerModel *)customerContactGET{
    return [NSObject url:@"/customer/contact".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
#pragma mark —— 平台配置中心
/// 检查人人代开关
-(URLManagerModel *)platformConfigCheckPeopleProxySwitchGET{
    return [NSObject url:@"​/platformConfig​/checkPeopleProxySwitch".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 检查平台维护开关
-(URLManagerModel *)platformConfigCheckPlatformMaintenanceSwitchGET{
    return [NSObject url:@"​/platformConfig​/checkPlatformMaintenanceSwitch".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 获取客服脚本编码
-(URLManagerModel *)platformConfigGetCustomerCodeGET{
    return [NSObject url:@"/platformConfig/getCustomerCode".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 获取人人代三级分佣比例
-(URLManagerModel *)platformConfigGetPeopleProportionGET{
    return [NSObject url:@"​/platformConfig​/getPeopleProportion".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
#pragma mark —— 应用版本控制
/// 获取Android最新下载链接
-(URLManagerModel *)downloadStationGetAndroidDownloadUrlGET{
    return [NSObject url:@"/downloadStation/getAndroidDownloadUrl".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// Android最新版本检查
-(URLManagerModel *)downloadStationGetAndroidNewestVersionGET{
    return [NSObject url:@"/downloadStation/getAndroidNewestVersion".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 获取文件服务器地址
-(URLManagerModel *)downloadStationGetFileServerUrlGET{
    return [NSObject url:@"/downloadStation/getFileServerUrl".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 获取iOS最新下载链接
-(URLManagerModel *)downloadStationGetIosDownloadUrlGET{
    return [NSObject url:@"/downloadStation/getIosDownloadUrl".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// iOS最新版本检查
-(URLManagerModel *)downloadStationGetIosNewestVersionGET{
    return [NSObject url:@"/downloadStation/getIosNewestVersion".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 获取移动端logo
-(URLManagerModel *)downloadStationGetLogImageUrlAppGET{
    return [NSObject url:@"/downloadStation/getLogImageUrlApp".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 获取PC端logo
-(URLManagerModel *)downloadStationGetLogImageUrlPcGET{
    return [NSObject url:@"​/downloadStation​/getLogImageUrlPc".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 获取移动端登录注册页面logo
-(URLManagerModel *)downloadStationGetLoginRegisterLogImageUrlAppGET{
    return [NSObject url:@"​/downloadStation/getLoginRegisterLogImageUrlApp".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 获取金钱符号
-(URLManagerModel *)downloadStationGetMoneySymbolGET{
return [NSObject url:@"​/downloadStation/getMoneySymbol".urlProtect
            funcName:NSStringFromSelector(_cmd)];
}
/// 推广域名
-(URLManagerModel *)downloadStationGetSpreadUrlGET{
    return [NSObject url:@"/downloadStation/getSpreadUrl".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 获取网站Icon
-(URLManagerModel *)downloadStationGetWebsiteIconGET{
    return [NSObject url:@"​/downloadStation​/getWebsiteIcon".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 网页版链接
-(URLManagerModel *)downloadStationGetWebUrlGET{
    return [NSObject url:@"​/downloadStation/getWebUrl".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
#pragma mark —— 洗码
/// 用户洗码列表
-(URLManagerModel *)washCodeGetListGET{
    return [NSObject url:@"/washCode/getList".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 用户领取洗码
-(URLManagerModel *)washCodeReceiveWashCodeGET{
    return [NSObject url:@"/washCode/receiveWashCode".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
#pragma mark —— 测试
/// 批量发送分润MQ
-(URLManagerModel *)testSendMqGET{
    return [NSObject url:@"/test/sendMq".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 发送消息到TG机器人
-(URLManagerModel *)testSendMsgToTelegramBotGET{
    return [NSObject url:@"​/test​/sendMsgToTelegramBot".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
#pragma mark —— 用户中心
/// 银行列表
-(URLManagerModel *)bankcardBanklistGET{
    return [NSObject url:@"​/bankcard/banklist".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 用户增加银行卡
-(URLManagerModel *)bankcardBoundPOST{
    return [NSObject url:@"/bankcard/bound".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 根据ID删除银行卡
-(URLManagerModel *)bankcardDeleteBankCardByIdGET{
    return [NSObject url:@"/bankcard/deleteBankCardById".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 根据ID设置默认银行卡
-(URLManagerModel *)bankcardSetDefaultBankCardByIdPOST{
    return [NSObject url:@"/bankcard/setDefaultBankCardById".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 直接开户
-(URLManagerModel *)userDirectOpenAccountPOST{
    return [NSObject url:@"/user/directOpenAccount".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 获取当前用户人人代推广链接
-(URLManagerModel *)userEveryoneSpreadGET{
    return [NSObject url:@"/user/everyoneSpread".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 获取当前用户的余额,打码量,可提现金额,洗码金额,分润金额
-(URLManagerModel *)userGetMoneyGET{
    return [NSObject url:@"/user/getMoney".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 获取当前用户的基本信息(不包含 余额，打码量，可提现金额,洗码金额)
-(URLManagerModel *)userInfoGET{
    return [NSObject url:@"/user​/info".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 登录用户修改信息
-(URLManagerModel *)userUpdateUserInfoPOST{
    return [NSObject url:@"/user/updateUserInfo".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// web端登录用户修改信息
-(URLManagerModel *)userWebUpdateUserInfoPOST{
    return [NSObject url:@"/user​/webUpdateUserInfo".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 获取用户已绑定银行卡
-(URLManagerModel *)withdrawBanklistGET{
    return [NSObject url:@"/withdraw​/banklist".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 提款提交
-(URLManagerModel *)withdrawSubmitPOST{
    return [NSObject url:@"/withdraw/submit".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 当前登录用户修改登录密码
-(URLManagerModel *)withdrawUpdateLoginPasswordPOST{
    return [NSObject url:@"/withdraw/updateLoginPassword".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 当前登录用户修改取款密码
-(URLManagerModel *)withdrawUpdateWithdrawPasswordPOST{
    return [NSObject url:@"/withdraw​/updateWithdrawPassword".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
#pragma mark —— 认证中心
/// 谷歌图形验证码
-(URLManagerModel *)authCaptchaGET{
    return [NSObject url:@"/auth/captcha".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 校验邀请码
-(URLManagerModel *)authCheckInviteCodeGET{
    return [NSObject url:@"/auth/checkInviteCode".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 开发者通过此令牌调试接口。不可用于正式请求
-(URLManagerModel *)authGetJwtTokenGET{
    return [NSObject url:@"/auth/getJwtToken".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 查询注册通道状态
-(URLManagerModel *)authGetRegisterStatusGET{
    return [NSObject url:@"/auth/getRegisterStatus".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 通过手机号获取验证码
-(URLManagerModel *)authGetVerificationCodeGET{
    return [NSObject url:@"/auth/getVerificationCode".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 帐密登陆.谷歌验证码
-(URLManagerModel *)authLoginAPOST{
    return [NSObject url:@"/auth/loginA".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 前台用户注册
-(URLManagerModel *)authRegisterPOST{
    return [NSObject url:@"/auth/register".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 服务健康状态监测
-(URLManagerModel *)authServiceHealthCheckGET{
    return [NSObject url:@"/auth/serviceHealthCheck".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 推广用户注册
-(URLManagerModel *)authSpreadRegisterPOST{
    return [NSObject url:@"/auth/spreadRegister".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
#pragma mark —— 资金中心
/// 用户资金详情
-(URLManagerModel *)accountChangeAccountChangeListGET{
    return [NSObject url:@"/accountChange​/accountChangeList".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 用户充值列表
-(URLManagerModel *)chargeOrderChargeOrderListGET{
    return [NSObject url:@"/chargeOrder​/chargeOrderList".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 充值订单流水详情
-(URLManagerModel *)rechargeTurnoverFindPageGET{
    return [NSObject url:@"/rechargeTurnover/findPage".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 提现列表
-(URLManagerModel *)withdrawWithdrawListGET{
    return [NSObject url:@"/withdraw/withdrawList".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
#pragma mark —— 轮播图
/// 轮播图.返回的URL为相对路径。需加上项目域名访问
-(URLManagerModel *)picLunboGET{
    return [NSObject url:@"/pic/lunbo".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
#pragma mark —— 银行卡线下充值
/// 收款银行卡列表
-(URLManagerModel *)chargeCollectBankcardsGET{
    return [NSObject url:@"/charge/collect_bankcards".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}
/// 提交充值
-(URLManagerModel *)chargeSubmitPOST{
    return [NSObject url:@"/charge/submit".urlProtect
                funcName:NSStringFromSelector(_cmd)];
}

@end
