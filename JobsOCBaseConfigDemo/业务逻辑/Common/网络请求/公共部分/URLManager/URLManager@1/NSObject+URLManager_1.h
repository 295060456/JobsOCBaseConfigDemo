//
//  NSObject+URLManager_1.h
//  FM
//
//  Created by User on 10/11/24.
//

#import <Foundation/Foundation.h>
#import "NSObject+Extras.h"
#import "URLManagerModel.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/// 来自 http://16.163.191.190:8093/doc.html
@interface NSObject (URLManager_1)
#pragma mark —— 主播管理接口
/// 获取主播详细信息【GET】
-(URLManagerModel *)get_presenter_getInfo_id:(NSString *)ID;
/// 根据会员ID查询主播信息【GET】
-(URLManagerModel *)get_presenter_getInfo2_memberId:(NSString *)memberId;
/// 查询主播信息列表【POST】
-(URLManagerModel *)post_presenter_list;
/// 修改主播信息【PUT】
-(URLManagerModel *)put_presenter_update;
#pragma mark —— 代理会员打包相关
/// 获取专属域名校验【GET】
-(URLManagerModel *)get_agentPackage_getCheckExclusiveDomain;
/// 获取打包信息【GET】
-(URLManagerModel *)get_agentPackage_getPackageInfo;
#pragma mark —— 会员KYC相关
/// 获取会员KYC信息【GET】
-(URLManagerModel *)get_kyc_info;
/// 获取会员KYC信息【GET】（废弃掉）
-(URLManagerModel *)get_kyc_info_getByUid;
/// 用户提交KYC认证【POST】
-(URLManagerModel *)post_kyc_submit;
/// KYC认证提醒【GET】
-(URLManagerModel *)get_kyc_verify_memberId:(NSString *)memberId;
/// 用户提交个人信息【POST】
-(URLManagerModel *)post_personal_information_submit;
#pragma mark —— 会员vip
/// vip特权领取【POST】
-(URLManagerModel *)post_vip_getCoupon;
/// 查询VIP特权专享【GET】
-(URLManagerModel *)get_vip_queryMemberRight_vipLevel;
/// 查询VIP信息【GET】
-(URLManagerModel *)get_vip_queryMemberVip;
/// 查询VIP信息详情【GET】
-(URLManagerModel *)get_vip_queryMemberVipDetail;
/// 查询VIP所有等级【GET】
-(URLManagerModel *)get_vip_queryMemberVipLevels;
/// 查询VIP所有优惠【GET】
-(URLManagerModel *)get_vip_queryMemberVipRebates;
/// 查询VIP所有权益【GET】
-(URLManagerModel *)get_vip_queryMemberVipRights;
/// 查询VIP权益开启关闭配置【GET】
-(URLManagerModel *)get_vip_queryVipSwitchConfig;
#pragma mark —— 会员收货地址
/// 会员收货地址删除【DELETE】
-(URLManagerModel *)delete_address_delete_id:(NSString *)ID;
/// 会员收货地址详情【GET】
-(URLManagerModel *)get_address_detail_id:(NSString *)ID;
/// 会员收货地址查询【GET】
-(URLManagerModel *)get_address_list;
/// 会员收货地址保存【POST】
-(URLManagerModel *)post_address_save;
/// 会员收货地址修改【POST】
-(URLManagerModel *)post_address_update;
#pragma mark —— 会员用户信息
/// 绑定邮箱【PUT】
-(URLManagerModel *)put_member_bindEmail;
/// 绑定手机号【PUT】
-(URLManagerModel *)member_bindMobile_put;
/// 获取会员个人信息【GET】
-(URLManagerModel *)get_member_get;
/// 获取会员个人信息【GET】
-(URLManagerModel *)get_member_getByMemberId;
/// 更新会员信息【PUT】
-(URLManagerModel *)put_member_memberUpdateLock;
/// 获取会员门店id【GET】
-(URLManagerModel *)get_member_queryMemberStoreId;
/// 刷新识别码【GET】
-(URLManagerModel *)get_member_refreshIdentityCode;
/// 修改会员头像【PUT】
-(URLManagerModel *)put_member_updateAvatar;
/// 修改会员生日【PUT】
-(URLManagerModel *)put_member_updateBirthday;
/// 修改会员昵称【PUT】
-(URLManagerModel *)put_member_updateNickname;
/// 修改会员密码【PUT】
-(URLManagerModel *)put_member_updatePassword;
/// 修改会员性别【PUT】
-(URLManagerModel *)put_member_updateSex;
/// 更新会员信息【PUT】
-(URLManagerModel *)put_member_updateMemberInfo;
/// 更新当前会员识别码【PUT】
-(URLManagerModel *)put_member_updateRandomIdentifiert;
#pragma mark —— 会员用户认证
/// 账号密码登录【POST】
-(URLManagerModel *)post_user_auth_accountLogin;
/// 账号密码注册【POST】
-(URLManagerModel *)post_user_auth_accountRegister;
/// 校验登录校验码【POST】
-(URLManagerModel *)post_user_auth_check_login_verification;
/// 校验图片验证码【GET】
-(URLManagerModel *)get_user_auth_check_verification_result;
/// 获取访问图形校验码的站点类型（1为国外地址校验，2为国内地址校验）【GET】
-(URLManagerModel *)get_user_auth_get_verification_domainType;
/// 获取图片验证码【GET】
-(URLManagerModel *)get_user_auth_get_verification_image;
/// 玩家登录心跳【GET】
-(URLManagerModel *)get_user_auth_heartbeat;
/// 用户登出【POST】
-(URLManagerModel *)post_user_auth_logout;
/// 手机登录【POST】
-(URLManagerModel *)post_user_auth_mobileLogin;
/// 手机号登录--手机号校验【GET】
-(URLManagerModel *)get_user_auth_mobile_loginCheckByMobile:(NSString *)mobile phoneCode:(NSString *)phoneCode;
/// 使用手机号注册【POST】
-(URLManagerModel *)post_user_auth_mobileRegister;
/// 手机号注册--验证码校验【GET】
-(URLManagerModel *)get_user_auth_mobile_registerCheckByCode:(NSString *)mobile smsCode:(NSString *)smsCode;
/// 手机号注册--手机校验【GET】
-(URLManagerModel *)get_user_auth_mobile_registerCheckByMobile:(NSString *)mobile phoneCode:(NSString *)phoneCode;
/// 手机号注册--自动生成账号【GET】
-(URLManagerModel *)get_user_auth_mobileRegisterCreatName;
/// 会员注册【POST】
-(URLManagerModel *)post_user_auth_ph_register_v1;
/// 找回密码-三步走-[step 1.] check-account【POST】
-(URLManagerModel *)post_user_auth_resetPassword_checkAccount;
/// 找回密码-三步走-[step 2.] check-mobile【POST】
-(URLManagerModel *)post_user_auth_resetPassword_checkMobile;
/// 找回密码-三步走-[step 3.] update-password【POST】
-(URLManagerModel *)post_user_auth_resetPassword_updatePassword;
/// 刷新Token【POST】
-(URLManagerModel *)post_user_auth_tokenRefresh;
#pragma mark —— 会员的虚拟币钱包地址管理
/// 已绑定手机号时绑定虚拟币钱包地址【POST】
-(URLManagerModel *)post_user_cryptocy_bind;
/// 未绑定手机号时绑定虚拟币钱包地址【POST】
-(URLManagerModel *)post_user_cryptocy_bindWithPhone;
/// 检查会员是否绑定手机号【GET】
-(URLManagerModel *)get_user_cryptocy_checkMobile;
/// 删除虚拟币地址【DELETE】
-(URLManagerModel *)delete_user_cryptocy;
/// 获取会员虚拟币钱包地址列表【GET】
-(URLManagerModel *)get_user_cryptocy_list;
/// 获取支持的虚拟币列表【GET】
-(URLManagerModel *)get_user_cryptocy_list_support;
#pragma mark —— 会员禁言记录接口
/// 根据状态查询会员禁言记录全量信息【GET】
-(URLManagerModel *)get_user_banLog_all_status:(NSString *)status;
/// 查询会员禁言详情【POST】
-(URLManagerModel *)post_user_banLog_banInfo;
/// 批量解禁【POST】
-(URLManagerModel *)post_user_banLog_batchUntie;
/// 查询会员禁言记录列表【POST】
-(URLManagerModel *)post_user_banLog_list;
/// 新增会员禁言记录【POST】
-(URLManagerModel *)post_user_banLog_save;
/// 修改会员禁言记录【PUT】
-(URLManagerModel *)put_user_banLog_update;
#pragma mark —— 会员页面
/// 获取联系方式数据【GET】
-(URLManagerModel *)get_user_member_contact_info;
/// 申请代理【POST】
-(URLManagerModel *)post_user_member_joinUs_create;
/// 三方登录【POST】
-(URLManagerModel *)post_user_member_joinUs_createProxy;
/// 获取登录信息【POST】
-(URLManagerModel *)post_user_member_joinUs_get_login_info;
/// 获取代理待审核数据【GET】
-(URLManagerModel *)get_user_member_joinUs_info;
/// 清理登录【POST】
-(URLManagerModel *)post_user_member_joinUs_login_clean;
/// 获取首页登录状态joinus展示情况【GET】
-(URLManagerModel *)get_user_member_joinUs_status;
#pragma mark —— 国家编码信息管理
/// 获取国家编码信息列表【GET】
-(URLManagerModel *)get_user_countrycode_list;
#pragma mark —— 提供给游戏服务的Feign接口
/// 查询会员信息-根据memberId【GET】
-(URLManagerModel *)get_user_userforgame_memberinfo;
/// 查询会员信息-根据memberName【GET】
-(URLManagerModel *)get_user_userforgame_memberinfoByName;
/// 批量查询会员信息-根据memberNames【GET】
-(URLManagerModel *)get_user_userforgame_memberinfoByNames;
/// updateMemberInfo【POST】
-(URLManagerModel *)post_user_userforgame_memberinfoUpdate;
#pragma mark —— 电子钱包管理
/// 绑定电子钱包【POST】
-(URLManagerModel *)post_user_eWallets_bind;
/// 删除电子钱包【GET】
-(URLManagerModel *)get_user_eWallets_delete;
/// 获取会员电子钱包列表【GET】
-(URLManagerModel *)get_user_eWallets_list;
#pragma mark —— 短信验证码接口
/// 校验短信验证码【POST】
-(URLManagerModel *)post_user_verCode_check;
/// 检查验证码【POST】
-(URLManagerModel *)post_user_verCode_checkCodeEmail;
/// 检查手机验证码【POST】
-(URLManagerModel *)post_user_verCode_checkCodeMobile;
/// 发送短信验证码【POST】
-(URLManagerModel *)post_user_verCode_sendSms;
#pragma mark —— 邀请好友
/// 领取奖励【POST】
-(URLManagerModel *)post_member_invite_drawAward;
/// 生成邀请码【GET】
-(URLManagerModel *)get_member_invite_generateReferralCode;
/// 跑马灯【GET】
-(URLManagerModel *)get_member_invite_queryHorseRing;
/// 邀请详情流水分成奖励列表【GET】
-(URLManagerModel *)get_member_invite_queryInviteBetAwardList;
/// 查询邀请好友流水奖励配置【GET】
-(URLManagerModel *)get_member_invite_queryInviteBetConfig;
/// 邀请详情首存奖励列表【GET】
-(URLManagerModel *)get_member_invite_queryInviteDepAward;
/// 查询邀请好友首存奖励配置【GET】
-(URLManagerModel *)get_member_invite_queryInviteDepConfig;
/// 邀请信息【GET】
-(URLManagerModel *)get_member_invite_queryInviteInfo;
/// 邀请详情累计发放金额和邀请人数【GET】
-(URLManagerModel *)get_member_invite_queryInviteInfoTotalAward;
/// 查询邀请好友vip奖励配置【GET】
-(URLManagerModel *)get_member_invite_queryInviteVipConfig;
#pragma mark —— 邮箱验证码接口
/// 发送邮箱验证码【POST】
-(URLManagerModel *)post_user_verify_sendEmail;
#pragma mark —— 银行信息管理
/// 已绑定手机号时绑定银行卡【POST】
-(URLManagerModel *)post_user_bankcard_bind;
/// 未绑定手机号时绑定银行卡【POST】
-(URLManagerModel *)post_user_bankcard_bindWithPhone;
/// 获取会员卡数量【GET】
-(URLManagerModel *)get_user_bankcard_cardTotal;
/// 绑卡前检查会员是否绑定手机号【GET】
-(URLManagerModel *)get_user_bankcard_checkMobile;
/// 银行卡二要素校验【POST】
-(URLManagerModel *)post_user_bankcard_checkBankCardTripartiteHttp;
/// 删除银行卡【DELETE】
-(URLManagerModel *)delete_user_bankcard;
/// 获取会员的银行卡列表【GET】
-(URLManagerModel *)get_user_bankcard_list;
/// 绑定银行卡【POST】
-(URLManagerModel *)post_user_bankcard_ph_bind;


@end

NS_ASSUME_NONNULL_END
