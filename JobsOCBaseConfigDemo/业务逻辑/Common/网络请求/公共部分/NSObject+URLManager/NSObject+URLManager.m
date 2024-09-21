//
//  NSObject+URLManager.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/12/10.
//  Copyright © 2020 MonkeyKingVideo. All rights reserved.
//

#import "NSObject+URLManager.h"

#ifndef JobsURL
#define JobsURL(URL) [NSObject url:(URL) funcName:NSStringFromSelector(_cmd)];
#endif

JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_DevEnviron;/// 开发环境
//JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_UATEnviron;/// UAT环境
//JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_ProductEnviron;/// 生产环境

/// 域名列表：
/// https://docs.google.com/spreadsheets/d/1Iijk6KwNVXMhuu5VeQXaWZhXogKnuj1Ms1V6dWmz_ik/edit?gid=0#gid=0
/// 体育接口文档：
/// http://16.163.191.190:8093/doc.html
/// http://16.163.191.190:8100/api/promotion/doc.html
/// http://16.163.191.190:8097/doc.html
/// http://16.163.191.190:8099/doc.html
/// http://16.163.191.190:9201/doc.html#/default/%E5%BB%A3%E5%91%8A%E7%AE%A1%E7%90%86%E6%8E%A5%E5%8F%A3/addUsingPOST_1
/// 接口文档会因为后端开发而同步，使用时务必进行确认
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
        case JobsNetworkingEnvir_DevEnviron:{
            /// 开发环境
            return @"https://www.sports5555.com".urlProtect;
        }break;
        case JobsNetworkingEnvir_UATEnviron:{
            /// UAT环境
            return @"https://bsports.net.ph".urlProtect;
        }break;
        case JobsNetworkingEnvir_ProductEnviron:{
            /// 生产环境
            return @"https://bsports.ph/".urlProtect;
        }break;
        default:
            return @"".urlProtect;
            break;
    }
}

-(NSString *)BaseUrl_Image{
    switch (networkingEnvir) {
        case JobsNetworkingEnvir_DevEnviron:{
            /// 开发环境
            return @"https://p.bzpicx.com".urlProtect;
        }break;
        case JobsNetworkingEnvir_UATEnviron:{
            /// UAT环境
            return @"https://p.bzpicx.com".urlProtect;
        }break;
        case JobsNetworkingEnvir_ProductEnviron:{
            /// 生产环境
            return @"https://p.bzpicx.com".urlProtect;
        }break;
        default:
            return @"https://p.bzpicx.com".urlProtect;
            break;
    }
}

-(NSString *)BaseUrl_H5{
    switch (networkingEnvir) {
        case JobsNetworkingEnvir_DevEnviron:{
            /// 开发环境
            return @"".urlProtect;
        }break;
        case JobsNetworkingEnvir_UATEnviron:{
            /// UAT环境
            return @"".urlProtect;
        }break;
        case JobsNetworkingEnvir_ProductEnviron:{
            /// 生产环境
            return @"".urlProtect;
        }break;
        default:
            return @"".urlProtect;
            break;
    }
}
#pragma mark —— App接口示例
-(URLManagerModel *)appInterfaceTesting{
    return JobsURL(@"http://172.24.135.14:8000/Downloads/CommentData.json") /// @"http://172.24.135.12/CommentData.json"
}
/// 来自 http://16.163.191.190:8093/doc.html
#pragma mark —— 主播管理接口
/// 获取主播详细信息【GET】
-(URLManagerModel *)get_presenter_getInfo_id:(NSString *)ID{
    NSString *url = @"/api/user/presenter/getInfo/{".add(ID).add(@"}");
    return JobsURL(url);
}
/// 根据会员ID查询主播信息【GET】
-(URLManagerModel *)get_presenter_getInfo2_memberId:(NSString *)memberId{
    NSString *url = @"/api/user/presenter/getInfo2/{".add(memberId).add(@"}");
    return JobsURL(url);
}
/// 查询主播信息列表【POST】
-(URLManagerModel *)post_presenter_list{
    return JobsURL(@"/api/user/presenter/list");
}
/// 修改主播信息【PUT】
-(URLManagerModel *)put_presenter_update{
    return JobsURL(@"/api/user/presenter/update");
}
#pragma mark —— 代理会员打包相关
/// 获取专属域名校验【GET】
-(URLManagerModel *)get_agentPackage_getCheckExclusiveDomain{
    return JobsURL(@"/api/member/agentPackage/getCheckExclusiveDomain");
}
/// 获取打包信息【GET】
-(URLManagerModel *)get_agentPackage_getPackageInfo{
    return JobsURL(@"/api/member/agentPackage/getPackageInfo");
}
#pragma mark —— 会员KYC相关
/// 获取会员KYC信息【GET】
-(URLManagerModel *)get_kyc_info{
    return JobsURL(@"/api/member/kyc/info/get");
}
/// 获取会员KYC信息【GET】
-(URLManagerModel *)get_kyc_info_getByUid{
    return JobsURL(@"/api/member/kyc/info/getByUid");
}
/// 用户提交KYC认证【POST】
-(URLManagerModel *)post_kyc_submit{
    return JobsURL(@"/api/member/kyc/submit");
}
/// KYC认证提醒【GET】
-(URLManagerModel *)get_kyc_verify_memberId:(NSString *)memberId{
    NSString *url = @"/api/member/kyc/verify/{".add(memberId).add(@"}");
    return JobsURL(url);
}
/// 用户提交个人信息【POST】
-(URLManagerModel *)post_personal_information_submit{
    return JobsURL(@"/api/member/personal/information/submit");
}
#pragma mark —— 会员vip
/// vip特权领取【POST】
-(URLManagerModel *)post_vip_getCoupon{
    return JobsURL(@"/api/member/vip/getCoupon");
}
/// 查询VIP特权专享【GET】
-(URLManagerModel *)get_vip_queryMemberRight_vipLevel{
    return JobsURL(@"/api/member/vip/queryMemberRight/{vipLevel}");
}
/// 查询VIP信息【GET】
-(URLManagerModel *)get_vip_queryMemberVip{
    return JobsURL(@"/api/member/vip/queryMemberVip");
}
/// 查询VIP信息详情【GET】
-(URLManagerModel *)get_vip_queryMemberVipDetail{
    return JobsURL(@"/api/member/vip/queryMemberVipDetail");
}
/// 查询VIP所有等级【GET】
-(URLManagerModel *)get_vip_queryMemberVipLevels{
    return JobsURL(@"/api/member/vip/queryMemberVipLevels");
}
/// 查询VIP所有优惠【GET】
-(URLManagerModel *)get_vip_queryMemberVipRebates{
    return JobsURL(@"/api/member/vip/queryMemberVipRebates");
}
/// 查询VIP所有权益【GET】
-(URLManagerModel *)get_vip_queryMemberVipRights{
    return JobsURL(@"/api/member/vip/queryMemberVipRights");
}
/// 查询VIP权益开启关闭配置【GET】
-(URLManagerModel *)get_vip_queryVipSwitchConfig{
    return JobsURL(@"/api/member/vip/queryVipSwitchConfig");
}
#pragma mark —— 会员收货地址
/// 会员收货地址删除【DELETE】
-(URLManagerModel *)delete_address_delete_id:(NSString *)ID{
    NSString *url = @"/api/member/address/delete/{".add(ID).add(@"}");
    return JobsURL(url);
}
/// 会员收货地址详情【GET】
-(URLManagerModel *)get_address_detail_id:(NSString *)ID{
    NSString *url = @"/api/member/address/detail/{".add(ID).add(@"}");
    return JobsURL(url);
}
/// 会员收货地址查询【GET】
-(URLManagerModel *)get_address_list{
    return JobsURL(@"/api/member/address/list");
}
/// 会员收货地址保存【POST】
-(URLManagerModel *)post_address_save{
    return JobsURL(@"/api/member/address/save");
}
/// 会员收货地址修改【POST】
-(URLManagerModel *)post_address_update{
    return JobsURL(@"/api/member/address/update");
}
#pragma mark —— 会员用户信息
/// 绑定邮箱【PUT】
-(URLManagerModel *)put_member_bindEmail{
    return JobsURL(@"/api/member/bind-email");
}
/// 绑定手机号【PUT】
-(URLManagerModel *)member_bindMobile_put{
    return JobsURL(@"/api/member/bind-mobile");
}
/// 获取会员个人信息【GET】
-(URLManagerModel *)get_member_get{
    return JobsURL(@"/api/member/get");
}
/// 获取会员个人信息【GET】
-(URLManagerModel *)get_member_getByMemberId{
    return JobsURL(@"/api/member/getByMemberId");
}
/// 更新会员信息【PUT】
-(URLManagerModel *)put_member_memberUpdateLock{
    return JobsURL(@"/api/member/memberUpdateLock");
}
/// 获取会员门店id【GET】
-(URLManagerModel *)get_member_queryMemberStoreId{
    return JobsURL(@"/api/member/queryMemberStoreId");
}
/// 刷新识别码【GET】
-(URLManagerModel *)get_member_refreshIdentityCode{
    return JobsURL(@"/api/member/refreshIdentityCode");
}
/// 修改会员头像【PUT】
-(URLManagerModel *)put_member_updateAvatar{
    return JobsURL(@"/api/member/update-avatar");
}
/// 修改会员生日【PUT】
-(URLManagerModel *)put_member_updateBirthday{
    return JobsURL(@"/api/member/update-birthday");
}
/// 修改会员昵称【PUT】
-(URLManagerModel *)put_member_updateNickname{
    return JobsURL(@"/api/member/update-nickname");
}
/// 修改会员密码【PUT】
-(URLManagerModel *)put_member_updatePassword{
    return JobsURL(@"/api/member/update-password");
}
/// 修改会员性别【PUT】
-(URLManagerModel *)put_member_updateSex{
    return JobsURL(@"/api/member/update-sex");
}
/// 更新会员信息【PUT】
-(URLManagerModel *)put_member_updateMemberInfo{
    return JobsURL(@"/api/member/updateMemberInfo");
}
/// 更新当前会员识别码【PUT】
-(URLManagerModel *)put_member_updateRandomIdentifiert{
    return JobsURL(@"/api/member/updateRandomIdentifier");
}
#pragma mark —— 会员用户认证
/// 账号密码登录【POST】
-(URLManagerModel *)post_user_auth_accountLogin{
    return JobsURL(@"/api/user/auth/account-login");
}
/// 账号密码注册【POST】
-(URLManagerModel *)post_user_auth_accountRegister{
    return JobsURL(@"/api/user/auth/account-register");
}
/// 校验登录校验码【POST】
-(URLManagerModel *)post_user_auth_check_login_verification{
    return JobsURL(@"/api/user/auth/check/login/verification");
}
/// 校验图片验证码【GET】
-(URLManagerModel *)get_user_auth_check_verification_result{
    return JobsURL(@"/api/user/auth/check/verification/result");
}
/// 获取访问图形校验码的站点类型（1为国外地址校验，2为国内地址校验）【GET】
-(URLManagerModel *)get_user_auth_get_verification_domainType{
    return JobsURL(@"/api/user/auth/get/verification/domainType");
}
/// 获取图片验证码【GET】
-(URLManagerModel *)get_user_auth_get_verification_image{
    return JobsURL(@"/api/user/auth/get/verification/image");
}
/// 玩家登录心跳【GET】
-(URLManagerModel *)get_user_auth_heartbeat{
    return JobsURL(@"/api/user/auth/heartbeat");
}
/// 用户登出【POST】
-(URLManagerModel *)post_user_auth_logout{
    return JobsURL(@"/api/user/auth/logout");
}
/// 手机登录【POST】
-(URLManagerModel *)post_user_auth_mobileLogin{
    return JobsURL(@"/api/user/auth/mobile-login");
}
/// 手机号登录--手机号校验【GET】
-(URLManagerModel *)get_user_auth_mobile_loginCheckByMobile:(NSString *)mobile phoneCode:(NSString *)phoneCode{
    NSString *url = @"/api/user/auth/mobile-loginCheckByMobile/{"
        .add(mobile)
        .add(@"/{")
        .add(phoneCode)
        .add(@"}");
    return JobsURL(url);
}
/// 使用手机号注册【POST】
-(URLManagerModel *)post_user_auth_mobileRegister{
    return JobsURL(@"/api/user/auth/mobile-register");
}
/// 手机号注册--验证码校验【GET】
-(URLManagerModel *)get_user_auth_mobile_registerCheckByCode:(NSString *)mobile smsCode:(NSString *)smsCode{
    NSString *url = @"/api/user/auth/mobile-registerCheckByCode/{"
        .add(mobile)
        .add(@"/{")
        .add(smsCode)
        .add(@"}");
    return JobsURL(url);
}
/// 手机号注册--手机校验【GET】
-(URLManagerModel *)get_user_auth_mobile_registerCheckByMobile:(NSString *)mobile phoneCode:(NSString *)phoneCode{
    NSString *url = @"/api/user/auth/mobile-registerCheckByMobile/{"
        .add(mobile)
        .add(@"/{")
        .add(phoneCode)
        .add(@"}");
    return JobsURL(url);
}
/// 手机号注册--自动生成账号【GET】
-(URLManagerModel *)get_user_auth_mobileRegisterCreatName{
    return JobsURL(@"/api/user/auth/mobile-registerCreatName");
}
/// 会员注册【POST】
-(URLManagerModel *)post_user_auth_ph_register_v1{
    return JobsURL(@"/api/user/auth/ph/register/v1");
}
/// 找回密码-三步走-[step 1.] check-account【POST】
-(URLManagerModel *)post_user_auth_resetPassword_checkAccount{
    return JobsURL(@"/api/user/auth/reset-password/check-account");
}
/// 找回密码-三步走-[step 2.] check-mobile【POST】
-(URLManagerModel *)post_user_auth_resetPassword_checkMobile{
    return JobsURL(@"/api/user/auth/reset-password/check-mobile");
}
/// 找回密码-三步走-[step 3.] update-password【POST】
-(URLManagerModel *)post_user_auth_resetPassword_updatePassword{
    return JobsURL(@"/api/user/auth/reset-password/update-password");
}
/// 刷新Token【POST】
-(URLManagerModel *)post_user_auth_tokenRefresh{
    return JobsURL(@"/api/user/auth/token-refresh");
}
#pragma mark —— 会员的虚拟币钱包地址管理
/// 已绑定手机号时绑定虚拟币钱包地址【POST】
-(URLManagerModel *)post_user_cryptocy_bind{
    return JobsURL(@"/api/user/cryptocy/bind");
}
/// 未绑定手机号时绑定虚拟币钱包地址【POST】
-(URLManagerModel *)post_user_cryptocy_bindWithPhone{
    return JobsURL(@"/api/user/cryptocy/bindWithPhone");
}
/// 检查会员是否绑定手机号【GET】
-(URLManagerModel *)get_user_cryptocy_checkMobile{
    return JobsURL(@"/api/user/cryptocy/check-mobile");
}
/// 删除虚拟币地址【DELETE】
-(URLManagerModel *)delete_user_cryptocy{
    return JobsURL(@"/api/user/cryptocy/delete");
}
/// 获取会员虚拟币钱包地址列表【GET】
-(URLManagerModel *)get_user_cryptocy_list{
    return JobsURL(@"/api/user/cryptocy/list");
}
/// 获取支持的虚拟币列表【GET】
-(URLManagerModel *)get_user_cryptocy_list_support{
    return JobsURL(@"/api/user/cryptocy/list/support");
}
#pragma mark —— 会员禁言记录接口
/// 根据状态查询会员禁言记录全量信息【GET】
-(URLManagerModel *)get_user_banLog_all_status:(NSString *)status{
    NSString *url = @"/api/user/banLog/all/{"
        .add(status)
        .add(@"}");
    return JobsURL(url);
}
/// 查询会员禁言详情【POST】
-(URLManagerModel *)post_user_banLog_banInfo{
    return JobsURL(@"/api/user/banLog/banInfo");
}
/// 批量解禁【POST】
-(URLManagerModel *)post_user_banLog_batchUntie{
    return JobsURL(@"/api/user/banLog/batchUntie");
}
/// 查询会员禁言记录列表【POST】
-(URLManagerModel *)post_user_banLog_list{
    return JobsURL(@"/api/user/banLog/list");
}
/// 新增会员禁言记录【POST】
-(URLManagerModel *)post_user_banLog_save{
    return JobsURL(@"/api/user/banLog/save");
}
/// 修改会员禁言记录【PUT】
-(URLManagerModel *)put_user_banLog_update{
    return JobsURL(@"/api/user/banLog/update");
}
#pragma mark —— 会员页面
/// 获取联系方式数据【GET】
-(URLManagerModel *)get_user_member_contact_info{
    return JobsURL(@"/api/user/member/contact/info");
}
/// 申请代理【POST】
-(URLManagerModel *)post_user_member_joinUs_create{
    return JobsURL(@"/api/user/member/joinUs/create");
}
/// 三方登录【POST】
-(URLManagerModel *)post_user_member_joinUs_createProxy{
    return JobsURL(@"/api/user/member/joinUs/createProxy");
}
/// 获取登录信息【POST】
-(URLManagerModel *)post_user_member_joinUs_get_login_info{
    return JobsURL(@"/api/user/member/joinUs/get/login/info");
}
/// 获取代理待审核数据【GET】
-(URLManagerModel *)get_user_member_joinUs_info{
    return JobsURL(@"/api/user/member/joinUs/info");
}
/// 清理登录【POST】
-(URLManagerModel *)post_user_member_joinUs_login_clean{
    return JobsURL(@"/api/user/member/joinUs/login/clean");
}
/// 获取首页登录状态joinus展示情况【GET】
-(URLManagerModel *)get_user_member_joinUs_status{
    return JobsURL(@"/api/user/member/joinUs/status");
}
#pragma mark —— 国家编码信息管理
/// 获取国家编码信息列表【GET】
-(URLManagerModel *)get_user_countrycode_list{
    return JobsURL(@"/api/user/countrycode/list");
}
#pragma mark —— 提供给游戏服务的Feign接口
/// 查询会员信息-根据memberId【GET】
-(URLManagerModel *)get_user_userforgame_memberinfo{
    return JobsURL(@"/api/user/userforgame/memberinfo");
}
/// 查询会员信息-根据memberName【GET】
-(URLManagerModel *)get_user_userforgame_memberinfoByName{
    return JobsURL(@"/api/user/userforgame/memberinfoByName");
}
/// 批量查询会员信息-根据memberNames【GET】
-(URLManagerModel *)get_user_userforgame_memberinfoByNames{
    return JobsURL(@"/api/user/userforgame/memberinfoByNames");
}
/// updateMemberInfo【POST】
-(URLManagerModel *)post_user_userforgame_memberinfoUpdate{
    return JobsURL(@"/api/user/userforgame/memberinfoUpdate");
}
#pragma mark —— 电子钱包管理
/// 绑定电子钱包【POST】
-(URLManagerModel *)post_user_eWallets_bind{
    return JobsURL(@"/api/user/eWallets/bind");
}
/// 删除电子钱包【GET】
-(URLManagerModel *)get_user_eWallets_delete{
    return JobsURL(@"/api/user/eWallets/delete");
}
/// 获取会员电子钱包列表【GET】
-(URLManagerModel *)get_user_eWallets_list{
    return JobsURL(@"/api/user/eWallets/list");
}
#pragma mark —— 短信验证码接口
/// 校验短信验证码【POST】
-(URLManagerModel *)post_user_verCode_check{
    return JobsURL(@"/api/user/verCode/check");
}
/// 检查验证码【POST】
-(URLManagerModel *)post_user_verCode_checkCodeEmail{
    return JobsURL(@"/api/user/verCode/checkCodeEmail");
}
/// 检查手机验证码【POST】
-(URLManagerModel *)post_user_verCode_checkCodeMobile{
    return JobsURL(@"/api/user/verCode/checkCodeMobile");
}
/// 发送短信验证码【POST】
-(URLManagerModel *)post_user_verCode_sendSms{
    return JobsURL(@"/api/user/verCode/sendSms");
}
#pragma mark —— 邀请好友
/// 领取奖励【POST】
-(URLManagerModel *)post_member_invite_drawAward{
    return JobsURL(@"/api/member/invite/drawAward");
}
/// 生成邀请码【GET】
-(URLManagerModel *)get_member_invite_generateReferralCode{
    return JobsURL(@"/api/member/invite/generateReferralCode");
}
/// 跑马灯【GET】
-(URLManagerModel *)get_member_invite_queryHorseRing{
    return JobsURL(@"/api/member/invite/queryHorseRing");
}
/// 邀请详情流水分成奖励列表【GET】
-(URLManagerModel *)get_member_invite_queryInviteBetAwardList{
    return JobsURL(@"/api/member/invite/queryInviteBetAwardList");
}
/// 查询邀请好友流水奖励配置【GET】
-(URLManagerModel *)get_member_invite_queryInviteBetConfig{
    return JobsURL(@"/api/member/invite/queryInviteBetConfig");
}
/// 邀请详情首存奖励列表【GET】
-(URLManagerModel *)get_member_invite_queryInviteDepAward{
    return JobsURL(@"/api/member/invite/queryInviteDepAward");
}
/// 查询邀请好友首存奖励配置【GET】
-(URLManagerModel *)get_member_invite_queryInviteDepConfig{
    return JobsURL(@"/api/member/invite/queryInviteDepConfig");
}
/// 邀请信息【GET】
-(URLManagerModel *)get_member_invite_queryInviteInfo{
    return JobsURL(@"/api/member/invite/queryInviteInfo");
}
/// 邀请详情累计发放金额和邀请人数【GET】
-(URLManagerModel *)get_member_invite_queryInviteInfoTotalAward{
    return JobsURL(@"/api/member/invite/queryInviteInfoTotalAward");
}
/// 查询邀请好友vip奖励配置【GET】
-(URLManagerModel *)get_member_invite_queryInviteVipConfig{
    return JobsURL(@"/api/member/invite/queryInviteVipConfig");
}
#pragma mark —— 邮箱验证码接口
/// 发送邮箱验证码【POST】
-(URLManagerModel *)post_user_verify_sendEmail{
    return JobsURL(@"/api/user/verify/sendEmail");
}
#pragma mark —— 银行信息管理
/// 已绑定手机号时绑定银行卡【POST】
-(URLManagerModel *)post_user_bankcard_bind{
    return JobsURL(@"/api/user/bankcard/bind");
}
/// 未绑定手机号时绑定银行卡【POST】
-(URLManagerModel *)post_user_bankcard_bindWithPhone{
    return JobsURL(@"/api/user/bankcard/bindWithPhone");
}
/// 获取会员卡数量【GET】
-(URLManagerModel *)get_user_bankcard_cardTotal{
    return JobsURL(@"/api/user/bankcard/cardTotal");
}
/// 绑卡前检查会员是否绑定手机号【GET】
-(URLManagerModel *)get_user_bankcard_checkMobile{
    return JobsURL(@"/api/user/bankcard/check-mobile");
}
/// 银行卡二要素校验【POST】
-(URLManagerModel *)post_user_bankcard_checkBankCardTripartiteHttp{
    return JobsURL(@"/api/user/bankcard/checkBankCardTripartiteHttp");
}
/// 删除银行卡【DELETE】
-(URLManagerModel *)delete_user_bankcard{
    return JobsURL(@"/api/user/bankcard/delete");
}
/// 获取会员的银行卡列表【GET】
-(URLManagerModel *)get_user_bankcard_list{
    return JobsURL(@"/api/user/bankcard/list");
}
/// 绑定银行卡【POST】
-(URLManagerModel *)post_user_bankcard_ph_bind{
    return JobsURL(@"/api/user/bankcard/ph/bind");
}
/// 来自 http://16.163.191.190:8097/doc.html
#pragma mark —— APP游戏首页娱乐城
/// 菲站APP首页- 受欢迎的游戏列表查询【POST】
-(URLManagerModel *)post_game_home_queryTopGamesList{
    return JobsURL(@"/api/game/home/app/queryTopGamesList");
}
#pragma mark —— CQ9电子游戏接口19
/// CheckPlayer【GET】
-(URLManagerModel *)get_CQ9_checkPlayer:(NSString *)playerName{
    NSString *url = @"api/game/callback/cq9/slot/player/check/{".add(playerName).add(@"}");
    return JobsURL(url);
}
/// getBalance【GET】
-(URLManagerModel *)get_CQ9_getBalance:(NSString *)playerName{
    NSString *url = @"/api/game/callback/cq9/slot/transaction/balance/{".add(playerName).add(@"}");
    return JobsURL(url);
}
/// bet【POST】
-(URLManagerModel *)post_CQ9_bet{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/bet");
}
/// credit【POST】
-(URLManagerModel *)post_CQ9_credit{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/credit");
}
/// debit【POST】
-(URLManagerModel *)post_CQ9_debit{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/debit");
}
/// EndRound【POST】
-(URLManagerModel *)post_CQ9_EndRound{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/endround");
}
/// refund【POST】
-(URLManagerModel *)post_CQ9_refund{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/refund");
}
/// rollin【POST】
-(URLManagerModel *)post_CQ9_rollin{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/rollin");
}
/// rollOut【POST】
-(URLManagerModel *)post_CQ9_rollOut{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/rollout");
}
/// takeAll【POST】
-(URLManagerModel *)post_CQ9_takeAll{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/takeall");
}
/// record【GET】
-(URLManagerModel *)get_CQ9_record:(NSString *)mtcode{
    NSString *url = @"/api/game/callback/cq9/slot/transaction/record/{".add(mtcode).add(@"}");
    return JobsURL(url);
}
/// payoff【POST】
-(URLManagerModel *)post_CQ9_payoff{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/user/payoff");
}
/// errorHtml【GET】
-(URLManagerModel *)get_CQ9_errorHtml{
    return JobsURL(@"/error");
}
/// errorHtml【POST】
-(URLManagerModel *)post_CQ9_errorHtml{
    return JobsURL(@"/error");
}
/// errorHtml【PUT】
-(URLManagerModel *)put_CQ9_errorHtml{
    return JobsURL(@"/error");
}
/// errorHtml【DELETE】
-(URLManagerModel *)delete_CQ9_errorHtml{
    return JobsURL(@"/error");
}
#pragma mark —— EVO真人游戏接口
/// balance【POST】
-(URLManagerModel *)post_EVO_balance{
    return JobsURL(@"/api/game/callback/evo/real/api/balance");
}
/// cancel【POST】
-(URLManagerModel *)post_EVO_cancel{
    return JobsURL(@"/api/game/callback/evo/real/api/cancel");
}
/// check【POST】
-(URLManagerModel *)post_EVO_check{
    return JobsURL(@"/api/game/callback/evo/real/api/check");
}
/// credit【POST】
-(URLManagerModel *)post_EVO_credit{
    return JobsURL(@"/api/game/callback/evo/real/api/credit");
}
/// debit【POST】
-(URLManagerModel *)post_EVO_debit{
    return JobsURL(@"/api/game/callback/evo/real/api/debit");
}
/// promo_payout【POST】
-(URLManagerModel *)post_EVO_promo_payout{
    return JobsURL(@"/api/game/callback/evo/real/api/promo_payout");
}
/// sid【POST】
-(URLManagerModel *)post_EVO_sid{
    return JobsURL(@"/api/game/callback/evo/real/api/sid");
}
#pragma mark —— FC电子游戏接口
/// activityReward【POST】
-(URLManagerModel *)post_FC_activityReward{
    return JobsURL(@"/api/game/callback/fc/slot/activity");
}
/// bet【POST】
-(URLManagerModel *)post_FC_bet{
    return JobsURL(@"/api/game/callback/fc/slot/bet");
}
/// betCancel【POST】
-(URLManagerModel *)post_FC_betCancel{
    return JobsURL(@"/api/game/callback/fc/slot/betCancel");
}
/// BetNInfo【POST】
-(URLManagerModel *)post_FC_betNInfo{
    return JobsURL(@"/api/game/callback/fc/slot/betInfo");
}
/// CancelBetNInfo【POST】
-(URLManagerModel *)post_FC_cancelBetNInfo{
    return JobsURL(@"/api/game/callback/fc/slot/cancelBetInfo");
}
/// 余额回调【POST】
-(URLManagerModel *)post_FC_getBalance{
    return JobsURL(@"/api/game/callback/fc/slot/getBalance");
}
/// settle【POST】
-(URLManagerModel *)post_FC_settle{
    return JobsURL(@"/api/game/callback/fc/slot/settle");
}
#pragma mark —— JDB
/// 捕鱼游戏接口【POST】
-(URLManagerModel *)post_JDB_fish{
    return JobsURL(@"/api/game/callback/jdb/fish");
}
/// 棋牌游戏接口【POST】
-(URLManagerModel *)post_JDB_poker{
    return JobsURL(@"/api/game/callback/jdb/poker");
}
/// 电子接口【POST】
-(URLManagerModel *)post_JDB_{
    return JobsURL(@"/api/game/callback/jdb");
}
/// 电子游戏接口【POST】
-(URLManagerModel *)post_JDB_slot{
    return JobsURL(@"/api/game/callback/jdb/slot");
}
#pragma mark —— JiLi
/// slot_auth【POST】
-(URLManagerModel *)post_JiLi_slot_auth{
    return JobsURL(@"/api/game/callback/jili/slot/auth");
}
/// slot_bet【POST】
-(URLManagerModel *)post_JiLi_slot_bet{
    return JobsURL(@"/api/game/callback/jili/slot/bet");
}
/// slot_cancelBet【POST】
-(URLManagerModel *)post_JiLi_slot_cancelBet{
    return JobsURL(@"/api/game/callback/jili/slot/cancelBet");
}
/// slot_cancelSessionBet【POST】
-(URLManagerModel *)post_JiLi_slot_cancelSessionBet{
    return JobsURL(@"/api/game/callback/jili/slot/cancelSessionBet");
}
/// slot_sessionBet【POST】
-(URLManagerModel *)post_JiLi_slot_sessionBet{
    return JobsURL(@"/api/game/callback/jili/slot/sessionBet");
}
#pragma mark —— KA电子游戏接口
/// balance【POST】
-(URLManagerModel *)post_KA_balance{
    return JobsURL(@"/api/game/callback/ka/balance");
}
/// credit【POST】
-(URLManagerModel *)post_KA_credit{
    return JobsURL(@"/api/game/callback/ka/credit");
}
/// end【POST】
-(URLManagerModel *)post_KA_end{
    return JobsURL(@"/api/game/callback/ka/end");
}
/// play【POST】
-(URLManagerModel *)post_KA_play{
    return JobsURL(@"/api/game/callback/ka/play");
}
/// revoke【POST】
-(URLManagerModel *)post_KA_revoke{
    return JobsURL(@"/api/game/callback/ka/revoke");
}
/// start【POST】
-(URLManagerModel *)post_KA_start{
    return JobsURL(@"/api/game/callback/ka/start");
}
#pragma mark —— PB体育游戏接口
/// ping【POST】
-(URLManagerModel *)post_PB_ping{
    return JobsURL(@"/api/game/callback/pingbo/sports/ping");
}
/// wagering⚠️【POST】
-(URLManagerModel *)post_PB_wagering{
    return JobsURL(@"/api/game/callback/pingbo/sports/{agentcode}/wagering/usercode/{usercode}/request/{requestid}");
}
#pragma mark —— PG电子游戏接口
/// cashAdjustment【POST】
-(URLManagerModel *)post_PG_cashAdjustment{
    return JobsURL(@"/api/game/callback/pg/slot/Cash/Adjustment");
}
/// cashGet【POST】
-(URLManagerModel *)post_PG_cashGet{
    return JobsURL(@"/api/game/callback/pg/slot/Cash/Get");
}
/// cashTransferInOut【POST】
-(URLManagerModel *)post_PG_cashTransferInOut{
    return JobsURL(@"/api/game/callback/pg/slot/Cash/TransferInOut");
}
/// verifySession【POST】
-(URLManagerModel *)post_PG_verifySession{
    return JobsURL(@"/api/game/callback/pg/slot/VerifySession");
}
#pragma mark —— 个人中心
/// 一键回收 返回中心钱包余额【POST】
-(URLManagerModel *)post_game_fund_collect{
    return JobsURL(@"/api/game/fund/collect");
}
/// 转入【POST】
-(URLManagerModel *)post_game_fund_transferIn{
    return JobsURL(@"/api/game/fund/transferIn");
}
/// 获取会员与转账场馆余额：缓存3秒【POST】
-(URLManagerModel *)post_game_fund_wallet{
    return JobsURL(@"/api/game/fund/wallet");
}
#pragma mark —— 全平台投注记录相关接口
/// 跟单记录【POST】
-(URLManagerModel *)post_game_bet_followList{
    return JobsURL(@"/api/game/bet/followList");
}
/// mageXcess审计【GET】
-(URLManagerModel *)get_game_bet_mageXcess_queryRecord{
    return JobsURL(@"/api/game/bet/mageXcess/queryRecord");
}
/// 根据传入的天数计算，返回超过days天数未登录的用户idlist【POST】
-(URLManagerModel *)post_game_bet_noLoginMemberIdList{
    return JobsURL(@"/api/game/bet/noLoginMemberIdList");
}
/// 按时间范围查询注单【POST】
-(URLManagerModel *)post_game_bet_orders{
    return JobsURL(@"/api/game/bet/orders");
}
/// 全平台投注记录列表【POST】
-(URLManagerModel *)post_game_bet_pageList{
    return JobsURL(@"/api/game/bet/pageList");
}
#pragma mark —— 场馆转入转出记录列表
/// 场馆转入转出记录列表【POST】
-(URLManagerModel *)post_game_pay_pageList{
    return JobsURL(@"/api/game/pay/pageList");
}
#pragma mark —— 子游戏数据导入测试
/// 游戏gameLobby数据导入【GET】
-(URLManagerModel *)get_game_pagcor_gameLobbyImport{
    return JobsURL(@"/api/game/pagcor/gameLobbyImport");
}
#pragma mark —— 对接PAGCOR的API
/// 游戏gameLobby数据导入【GET】
-(URLManagerModel *)get_game_pagcor_order_list{
    return JobsURL(@"/api/game/pagcor/order/list");
}
#pragma mark —— 数据同步相关
/// 同步厅方订单数据【POST】
-(URLManagerModel *)post_game_job_fetchBetOrders{
    return JobsURL(@"/api/game/job/fetchBetOrders");
}
/// 查询是否已经生成用户钱包【POST】
-(URLManagerModel *)post_game_syncData_checkExistWallet{
    return JobsURL(@"/api/game/syncData/checkExistWallet");
}
/// 同步用户钱包数据【POST】
-(URLManagerModel *)post_game_syncData_syncFundWallet{
    return JobsURL(@"/api/game/syncData/syncFundWallet");
}
#pragma mark —— 游戏数据统计
/// 统计注单流水稽核金额【POST】
-(URLManagerModel *)post_game_statis_queryAuditAmount{
    return JobsURL(@"/api/game/statis/queryAuditAmount");
}
/// 查询会员投注记录统计【POST】
-(URLManagerModel *)post_game_statis_queryBetByLobbyName{
    return JobsURL(@"/api/game/statis/queryBetByLobbyName");
}
/// 统计下注会员数&投注金额【POST】
-(URLManagerModel *)post_game_statis_queryBetInfoByAgent{
    return JobsURL(@"/api/game/statis/queryBetInfoByAgent");
}
/// 查询游戏投注记录【POST】
-(URLManagerModel *)post_game_statis_queryBetListByPage{
    return JobsURL(@"/api/game/statis/queryBetListByPage");
}
/// 查询投注会员详情【POST】
-(URLManagerModel *)post_game_statis_queryGameOrderBetByPage{
    return JobsURL(@"/api/game/statis/queryGameOrderBetByPage");
}
/// 统计会员输赢【POST】
-(URLManagerModel *)post_game_statis_queryProfit{
    return JobsURL(@"/api/game/statis/queryProfit");
}
/// 查询会员总输赢【POST】
-(URLManagerModel *)post_game_statis_queryUserProfitLoss{
    return JobsURL(@"/api/game/statis/queryUserProfitLoss");
}
/// 统计游戏有效投注额【POST】
-(URLManagerModel *)post_game_statis_queryValidBet{
    return JobsURL(@"/api/game/statis/queryValidBet");
}
/// 统计游戏有效投注额【POST】
-(URLManagerModel *)post_game_statis_queryValidBet2{
    return JobsURL(@"/api/game/statis/queryValidBet2");
}
#pragma mark —— 游戏首页娱乐城
/// 游戏导航列表：缓存1分钟【GET】
-(URLManagerModel *)get_game_home_bar_list{
    return JobsURL(@"/api/game/home/bar/list");
}
/// 游戏大厅喜爱的游戏-添加【POST】
-(URLManagerModel *)post_game_home_favoriteGames_add{
    return JobsURL(@"/api/game/home/favoriteGames/add");
}
/// 游戏大厅喜爱的游戏-删除【POST】
-(URLManagerModel *)post_game_home_favoriteGames_delete{
    return JobsURL(@"/api/game/home/favoriteGames/delete");
}
/// 菲站首页- 查询所有厂商提供的老虎机游戏收藏列表【POST】
-(URLManagerModel *)post_game_home_favoriteGames_query{
    return JobsURL(@"/api/game/home/favoriteGames/query");
}
/// 菲站游戏大厅-模糊查询【POST】
-(URLManagerModel *)post_game_home_gameZone_fuzzyQuery{
    return JobsURL(@"/api/game/home/gameZone/fuzzyQuery");
}
/// 菲站首页大厅场馆对应游戏列表-查询【POST】
-(URLManagerModel *)post_game_home_homeLobbyGame_query{
    return JobsURL(@"/api/game/home/homeLobbyGame/query");
}
/// 菲站首页大厅场馆对应累加资金-查询【POST】
-(URLManagerModel *)post_game_home_jackpotsGamesFunds_query{
    return JobsURL(@"/api/game/home/jackpotsGamesFunds/query");
}
/// 菲站热门游戏/百家乐/轮盘/21点-查询【POST】
-(URLManagerModel *)post_game_home_liveCasino_quer{
    return JobsURL(@"/api/game/home/liveCasino/query");
}
/// 菲站首页- 受欢迎的游戏列表查询【POST】
-(URLManagerModel *)post_game_home_popularGames_query{
    return JobsURL(@"/api/game/home/popularGames/query");
}
/// 菲站电子游戏页面/热门游戏及最新游戏-查询【POST】
-(URLManagerModel *)post_game_home_slot_query{
    return JobsURL(@"/api/game/home/slot/query");
}
/// 前端- 查询所有厂商提供的老虎机游戏列表【POST】
-(URLManagerModel *)post_game_home_sub_list{
    return JobsURL(@"/api/game/home/sub/list");
}
#pragma mark —— 进出游戏相关接口
/// 查询我的游戏注单详情【POST】
-(URLManagerModel *)post_game_bet_order_mybet_detail{
    return JobsURL(@"/api/game/bet/order/mybet/detail");
}
/// 查询我的游戏注单【POST】
-(URLManagerModel *)post_game_bet_order_mybet_sum{
    return JobsURL(@"/api/game/bet/order/mybet/sum");
}
/// 获取游戏url【POST】
-(URLManagerModel *)post_game_bet_single_wallet_jump{
    return JobsURL(@"/api/game/bet/single-wallet/jump");
}
/// 来自 http://16.163.191.190:8100/api/promotion/doc.html
#pragma mark —— feign-support-controller
/// 查看是否有流水卷或者存送卷【POST】
-(URLManagerModel *)post_promotion_feign_rolls_list{
    return JobsURL(@"/api/promotion/feign/rolls/list");
}
/// 批量使用流水卷或者存送卷【POST】
-(URLManagerModel *)post_promotion_feign_rolls_use{
    return JobsURL(@"/api/promotion/feign/rolls/use");
}
#pragma mark —— health-controller
/// hearbeat【GET】
-(URLManagerModel *)get_promotion_heartbeat{
    return JobsURL(@"/api/promotion/heartbeat");
}
#pragma mark —— 大转盘
/// 查询大转盘活动参数配置【GET】
-(URLManagerModel *)get_promotion_activity_turntable_detail{
    return JobsURL(@"/api/promotion/activity/turntable/detail");
}
/// 大转盘抽奖【GET】
-(URLManagerModel *)get_promotion_activity_turntable_prize_get{
    return JobsURL(@"/api/promotion/activity/turntable/prize/get");
}
/// 分页查询大转盘活动抽奖记录【POST】
-(URLManagerModel *)post_promotion_activity_turntable_record{
    return JobsURL(@"/api/promotion/activity/turntable/record");
}
/// 查询用户大转盘抽奖次数【GET】
-(URLManagerModel *)get_promotion_activity_turntable_user_num{
    return JobsURL(@"/api/promotion/activity/turntable/user/num");
}
/// 查询用户大转盘活动抽奖记录【GET】
-(URLManagerModel *)get_promotion_activity_turntable_user_record{
    return JobsURL(@"/api/promotion/activity/turntable/user/record");
}
#pragma mark —— 广告配置所有接口
/// 查询广告列表-支持游客:活动推广专区【GET】
-(URLManagerModel *)get_promotion_advertise_info_list_activity{
    return JobsURL(@"/api/promotion/advertise/info/list/activity");
}
/// 查询广告列表-支持游客:APP首页右下3Banner【GET】
-(URLManagerModel *)get_promotion_advertise_infoP_list_appIndex{
    return JobsURL(@"/api/promotion/advertise/info/list/app-index");
}
/// 查询广告列表-支持游客:APP会员中心【GET】
-(URLManagerModel *)get_promotion_advertise_info_list_appMember{
    return JobsURL(@"/api/promotion/advertise/info/list/app-member");
}
/// 查询广告列表-支持游客:首页天顶轮播大Banner【GET】
-(URLManagerModel *)get_promotion_advertise_info_list_index{
    return JobsURL(@"/api/promotion/advertise/info/list/index");
}
/// 查询广告列表-支持游客:导航栏4小Banner【GET】
-(URLManagerModel *)get_promotion_advertise_info_list_navigationBar{
    return JobsURL(@"/api/promotion/advertise/info/list/navigation-bar");
}
/// 查询广告列表-支持游客【GET】
-(URLManagerModel *)get_promotion_advertise_list{
    return JobsURL(@"/api/promotion/advertise/list");
}
/// 根据类型查询广告列表【GET】
-(URLManagerModel *)get_promotion_advertise_list_type{
    return JobsURL(@"/api/promotion/advertise/list/type");
}
#pragma mark —— 新手活动
/// 查询新手活动参数配置【GET】
-(URLManagerModel *)get_promotion_activity_newbie_detail{
    return JobsURL(@"/api/promotion/activity/newbie/detail");
}
/// 查询登录用户新手大礼包完成情况【GET】
-(URLManagerModel *)get_promotion_get_user_newbie_gift_detail{
    return JobsURL(@"/api/promotion/get/user/newbie/gift/detail");
}
/// 查询登录用户参加新手活动资格【GET】
-(URLManagerModel *)get_promotion_get_user_newbie_qualifications{
    return JobsURL(@"/api/promotion/get/user/newbie/qualifications");
}
/// 查询登录用户签到完成情况【GET】
-(URLManagerModel *)get_promotion_get_user_sign_gift_detail{
    return JobsURL(@"/api/promotion/get/user/sign/gift/detail");
}
/// 新手活动复活大礼包用户领取【GET】
-(URLManagerModel *)get_promotion_newbie_user_resurrection_receive{
    return JobsURL(@"/api/promotion/newbie/user/resurrection/receive");
}
/// 新手活动用户复活大礼包状态查询【GET】
-(URLManagerModel *)get_promotion_newbie_user_resurrection_statusGet{
    return JobsURL(@"/api/promotion/newbie/user/resurrection/status/get");
}
/// 新手活动签到大礼包用户签到【GET】
-(URLManagerModel *)get_promotion_newbie_user_sign{
    return JobsURL(@"/api/promotion/newbie/user/sign");
}
#pragma mark —— 活动相关接口
/// 存款优惠活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getActivity{
    return JobsURL(@"/api/promotion/api/client/activity/getActivity");
}
/// 存款优惠活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getDepositDiscountActivityRecord{
    return JobsURL(@"/api/promotion/api/client/activity/getDepositDiscountActivityRecord");
}
/// 会员签到活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getMemberSignActivityRecord{
    return JobsURL(@"/api/promotion/api/client/activity/getMemberSignActivityRecord");
}
/// 获取存款金额奖励【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getObtainDepositBonus{
    return JobsURL(@"/api/promotion/api/client/activity/getObtainDepositBonus");
}
/// 查询活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_queryActivityInfo{
    return JobsURL(@"/api/promotion/api/client/activity/queryActivityInfo");
}
/// 查询用户123存款活动的在途订单数量【POST】
-(URLManagerModel *)post_promotion_api_client_activity_queryInTransit123DepositOrdersCount{
    return JobsURL(@"/api/promotion/api/client/activity/queryInTransit123DepositOrdersCount");
}
/// 会员签到【POST】
-(URLManagerModel *)post_promotion_api_client_activity_sign{
    return JobsURL(@"/api/promotion/api/client/activity/sign");
}
/// 首存活动-查询累计流水【GET】
-(URLManagerModel *)get_promotion_event_activity_bet_total{
    return JobsURL(@"/api/promotion/event/activity/bet/total");
}
/// 活动领取-传返回记录的id【POST】
-(URLManagerModel *)post_promotion_event_activity_claimp{
    return JobsURL(@"/api/promotion/event/activity/claim");
}
/// 查询首存活动记录【GET】
-(URLManagerModel *)get_promotion_event_activity_record{
    return JobsURL(@"/api/promotion/event/activity/record");
}
/// 会员签到【POST】
-(URLManagerModel *)post_promotion_event_memberSign{
    return JobsURL(@"/api/promotion/event/memberSign");
}
/// 会员签到活动信息【POST】
-(URLManagerModel *)post_promotion_event_memberSignEvent{
    return JobsURL(@"/api/promotion/event/memberSignEvent");
}
#pragma mark —— 福利中心所有接口
/// 福利领取 ，目前只限2现金券 3存送卷 4流水卷【GET】
-(URLManagerModel *)get_promotion_welfare_claim{
    return JobsURL(@"/api/promotion/welfare/claim");
}
/// 用户查询福利中心列表【POST】
-(URLManagerModel *)post_promotion_welfare_list{
    return JobsURL(@"/api/promotion/welfare/list");
}
/// 用户福利中心统计【GET】
-(URLManagerModel *)get_promotion_welfare_statistic{
    return JobsURL(@"/api/promotion/welfare/statistic");
}
/// vip模块领取福利【POST】
-(URLManagerModel *)post_promotion_welfare_vip_claim{
    return JobsURL(@"/api/promotion/welfare/vip/claim");
}
/// 来自 http://16.163.191.190:8099/doc.html
#pragma mark —— 信息配置
/// 跑马灯信息查询【建议前端每20s-30s可以刷新请求一次】【GET】
-(URLManagerModel *)get_operation_announce_config_queryAnnByMember{
    return JobsURL(@"/api/operation/announce/config/queryAnnByMember");
}
/// 站内信全部变为已读【建议前端每5s刷新一次】【PUT】
-(URLManagerModel *)put_operation_letter_config_allReadStatus{
    return JobsURL(@"/api/operation/letter/config/allReadStatus");
}
/// 站内信全部删除【PUT】
-(URLManagerModel *)put_operation_letter_config_deleteAll{
    return JobsURL(@"/api/operation/letter/config/deleteAll");
}
/// 站内信删除【PUT】
-(URLManagerModel *)put_operation_letter_config_deleteLetter{
    return JobsURL(@"/api/operation/letter/config/deleteLetter");
}
/// 是否有未读站内信【建议前端每5s刷新一次】【POST】
-(URLManagerModel *)post_operation_letter_config_hasUnRead{
    return JobsURL(@"/api/operation/letter/config/hasUnRead");
}
/// 站内信记录查询【POST】
-(URLManagerModel *)post_operation_letter_config_queryLetterConfigSendList{
    return JobsURL(@"/api/operation/letter/config/queryLetterConfigSendList");
}
/// 站内信变为已读【PUT】
-(URLManagerModel *)put_operation_letter_config_toReadStatus{
    return JobsURL(@"/api/operation/letter/config/toReadStatus");
}
#pragma mark —— 全站维护
/// 全站维护【POST】
-(URLManagerModel *)post_operation_siteMain_queryDetail{
    return JobsURL(@"/api/operation/siteMain/queryDetail");
}
#pragma mark —— 公共资源
/// 教程子项详情【POST】
-(URLManagerModel *)post_operation_tutorial_config_detailItem{
    return JobsURL(@"/api/operation/tutorial/config/detailItem");
}
/// 教程列表【POST】
-(URLManagerModel *)post_api_operation_tutorial_config_list{
    return JobsURL(@"/api/operation/tutorial/config/listt");
}
/// 教程子项列表【POST】
-(URLManagerModel *)post_operation_tutorial_config_listItem{
    return JobsURL(@"/api/operation/tutorial/config/listItem");
}
#pragma mark —— 资源配置
/// 意见保存【POST】
-(URLManagerModel *)post_operation_advice_config_saveAdviceConfig{
    return JobsURL(@"/api/operation/advice/config/saveAdviceConfig");
}
#pragma mark —— 赞助模块
/// 查询赞助集锦列表【GET】
-(URLManagerModel *)get_operation_sponsor_high_list{
    return JobsURL(@"/api/operation/sponsor/high/list");
}
/// 查询赞助图集列表【GET】
-(URLManagerModel *)get_operation_sponsor_list{
    return JobsURL(@"/api/operation/sponsor/list");
}
#pragma mark —— 接口文档里面没有的
#pragma mark —— 目前缺乏的接口
/// 首页轮播图接口
///

@end
