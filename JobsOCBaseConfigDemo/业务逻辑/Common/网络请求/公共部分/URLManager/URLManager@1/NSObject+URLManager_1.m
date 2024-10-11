//
//  NSObject+URLManager_1.m
//  FM
//
//  Created by User on 10/11/24.
//

#import "NSObject+URLManager_1.h"
/// 来自 http://16.163.191.190:8093/doc.html
@implementation NSObject (URLManager_1)
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
/// 获取会员KYC信息【GET】（废弃掉）
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

@end
