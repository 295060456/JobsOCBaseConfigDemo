//
//  NSObject+URLManager.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/12/10.
//  Copyright © 2020 MonkeyKingVideo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLManagerModel.h"
/// 域名列表：
/// https://docs.google.com/spreadsheets/d/1Iijk6KwNVXMhuu5VeQXaWZhXogKnuj1Ms1V6dWmz_ik/edit?gid=0#gid=0
/// 体育接口文档：
/// http://16.163.191.190:8093/doc.html
/// http://16.163.191.190:8100/api/promotion/doc.html
/// http://16.163.191.190:8097/doc.html
/// http://16.163.191.190:8099/doc.html
/// http://16.163.191.190:9201/doc.html#/default/%E5%BB%A3%E5%91%8A%E7%AE%A1%E7%90%86%E6%8E%A5%E5%8F%A3/addUsingPOST_1
/// 接口文档会因为后端开发而同步，使用时务必进行确认

extern JobsNetworkingEnvir _networkingEnvir;
JobsNetworkingEnvir NetworkingEnvir(void);
NS_INLINE JobsNetworkingEnvir networkingEnvir(NSInteger data){
    switch (data) {
        case JobsNetworkingEnvir_DevEnviron:{
            _networkingEnvir = JobsNetworkingEnvir_DevEnviron;/// 开发环境
        }break;
        case JobsNetworkingEnvir_UATEnviron:{
            _networkingEnvir = JobsNetworkingEnvir_UATEnviron;/// UAT环境
        }break;
        case JobsNetworkingEnvir_ProductEnviron:{
            _networkingEnvir = JobsNetworkingEnvir_ProductEnviron;/// 生产环境
        }break;
        default:
            _networkingEnvir = JobsNetworkingEnvir_Undefined;/// 未定义的网络环境
            break;
    }return _networkingEnvir;
}
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (URLManager)

#pragma mark —— BaseURL
-(NSString *)BaseUrl;
-(NSString *)BaseUrl_H5;
-(NSString *)BaseUrl_Image;
#pragma mark —— App接口示例
-(URLManagerModel *)appInterfaceTesting;
/// 来自 http://16.163.191.190:8093/doc.html
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
/// 获取会员KYC信息【GET】
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
/// 来自 http://16.163.191.190:8097/doc.html
#pragma mark —— APP游戏首页娱乐城
/// 菲站APP首页- 受欢迎的游戏列表查询
-(URLManagerModel *)post_game_home_queryTopGamesList;
#pragma mark —— CQ9电子游戏接口19
/// CheckPlayer【GET】
-(URLManagerModel *)get_CQ9_checkPlayer:(NSString *)playerName;
/// getBalance【GET】
-(URLManagerModel *)get_CQ9_getBalance:(NSString *)playerName;
/// bet【POST】
-(URLManagerModel *)post_CQ9_bet;
/// credit【POST】
-(URLManagerModel *)post_CQ9_credit;
/// debit【POST】
-(URLManagerModel *)post_CQ9_debit;
/// EndRound【POST】
-(URLManagerModel *)post_CQ9_EndRound;
/// refund【POST】
-(URLManagerModel *)post_CQ9_refund;
/// rollin【POST】
-(URLManagerModel *)post_CQ9_rollin;
/// rollOut【POST】
-(URLManagerModel *)post_CQ9_rollOut;
/// takeAll【POST】
-(URLManagerModel *)post_CQ9_takeAll;
/// record【GET】
-(URLManagerModel *)get_CQ9_record:(NSString *)mtcode;
/// payoff【POST】
-(URLManagerModel *)post_CQ9_payoff;
/// errorHtml【GET】
-(URLManagerModel *)get_CQ9_errorHtml;
/// errorHtml【POST】
-(URLManagerModel *)post_CQ9_errorHtml;
/// errorHtml【PUT】
-(URLManagerModel *)put_CQ9_errorHtml;
/// errorHtml【DELETE】
-(URLManagerModel *)delete_CQ9_errorHtml;
#pragma mark —— EVO真人游戏接口
/// balance【POST】
-(URLManagerModel *)post_EVO_balance;
/// cancel【POST】
-(URLManagerModel *)post_EVO_cancel;
/// check【POST】
-(URLManagerModel *)post_EVO_check;
/// credit【POST】
-(URLManagerModel *)post_EVO_credit;
/// debit【POST】
-(URLManagerModel *)post_EVO_debit;
/// promo_payout【POST】
-(URLManagerModel *)post_EVO_promo_payout;
/// sid【POST】
-(URLManagerModel *)post_EVO_sid;
#pragma mark —— FC电子游戏接口
/// activityReward【POST】
-(URLManagerModel *)post_FC_activityReward;
/// bet【POST】
-(URLManagerModel *)post_FC_bet;
/// betCancel【POST】
-(URLManagerModel *)post_FC_betCancel;
/// BetNInfo【POST】
-(URLManagerModel *)post_FC_betNInfo;
/// CancelBetNInfo【POST】
-(URLManagerModel *)post_FC_cancelBetNInfo;
/// 余额回调【POST】
-(URLManagerModel *)post_FC_getBalance;
/// settle【POST】
-(URLManagerModel *)post_FC_settle;
#pragma mark —— JDB
/// 捕鱼游戏接口【POST】
-(URLManagerModel *)post_JDB_fish;
/// 棋牌游戏接口【POST】
-(URLManagerModel *)post_JDB_poker;
/// 电子接口【POST】
-(URLManagerModel *)post_JDB_;
/// 电子游戏接口【POST】
-(URLManagerModel *)post_JDB_slot;
#pragma mark —— JiLi
/// slot_auth【POST】
-(URLManagerModel *)post_JiLi_slot_auth;
/// slot_bet【POST】
-(URLManagerModel *)post_JiLi_slot_bet;
/// slot_cancelBet【POST】
-(URLManagerModel *)post_JiLi_slot_cancelBet;
/// slot_cancelSessionBet【POST】
-(URLManagerModel *)post_JiLi_slot_cancelSessionBet;
/// slot_sessionBet【POST】
-(URLManagerModel *)post_JiLi_slot_sessionBet;
#pragma mark —— KA电子游戏接口
/// balance【POST】
-(URLManagerModel *)post_KA_balance;
/// credit【POST】
-(URLManagerModel *)post_KA_credit;
/// end【POST】
-(URLManagerModel *)post_KA_end;
/// play【POST】
-(URLManagerModel *)post_KA_play;
/// revoke【POST】
-(URLManagerModel *)post_KA_revoke;
/// start【POST】
-(URLManagerModel *)post_KA_start;
#pragma mark —— PB体育游戏接口
/// ping【POST】
-(URLManagerModel *)post_PB_ping;
/// wagering⚠️【POST】
-(URLManagerModel *)post_PB_wagering;
#pragma mark —— PG电子游戏接口
/// cashAdjustment【POST】
-(URLManagerModel *)post_PG_cashAdjustment;
/// cashGet【POST】
-(URLManagerModel *)post_PG_cashGet;
/// cashTransferInOut【POST】
-(URLManagerModel *)post_PG_cashTransferInOut;
/// verifySession【POST】
-(URLManagerModel *)post_PG_verifySession;
#pragma mark —— 个人中心
/// 一键回收 返回中心钱包余额【POST】
-(URLManagerModel *)post_game_fund_collect;
/// 转入【POST】
-(URLManagerModel *)post_game_fund_transferIn;
/// 获取会员与转账场馆余额：缓存3秒【POST】
-(URLManagerModel *)post_game_fund_wallet;
#pragma mark —— 全平台投注记录相关接口
/// 跟单记录【POST】
-(URLManagerModel *)post_game_bet_followList;
/// mageXcess审计【GET】
-(URLManagerModel *)get_game_bet_mageXcess_queryRecord;
/// 根据传入的天数计算，返回超过days天数未登录的用户idlist【POST】
-(URLManagerModel *)post_game_bet_noLoginMemberIdList;
/// 按时间范围查询注单【POST】
-(URLManagerModel *)post_game_bet_orders;
/// 全平台投注记录列表【POST】
-(URLManagerModel *)post_game_bet_pageList;
#pragma mark —— 场馆转入转出记录列表
/// 场馆转入转出记录列表【POST】
-(URLManagerModel *)post_game_pay_pageList;
#pragma mark —— 子游戏数据导入测试
/// 游戏gameLobby数据导入【GET】
-(URLManagerModel *)get_game_pagcor_gameLobbyImport;
#pragma mark —— 对接PAGCOR的API
/// 游戏gameLobby数据导入【GET】
-(URLManagerModel *)get_game_pagcor_order_list;
#pragma mark —— 数据同步相关
/// 同步厅方订单数据【POST】
-(URLManagerModel *)post_game_job_fetchBetOrders;
/// 查询是否已经生成用户钱包【POST】
-(URLManagerModel *)post_game_syncData_checkExistWallet;
/// 同步用户钱包数据【POST】
-(URLManagerModel *)post_game_syncData_syncFundWallet;
#pragma mark —— 游戏数据统计
/// 统计注单流水稽核金额【POST】
-(URLManagerModel *)post_game_statis_queryAuditAmount;
/// 查询会员投注记录统计【POST】
-(URLManagerModel *)post_game_statis_queryBetByLobbyName;
/// 统计下注会员数&投注金额【POST】
-(URLManagerModel *)post_game_statis_queryBetInfoByAgent;
/// 查询游戏投注记录【POST】
-(URLManagerModel *)post_game_statis_queryBetListByPage;
/// 查询投注会员详情【POST】
-(URLManagerModel *)post_game_statis_queryGameOrderBetByPage;
/// 统计会员输赢【POST】
-(URLManagerModel *)post_game_statis_queryProfit;
/// 查询会员总输赢【POST】
-(URLManagerModel *)post_game_statis_queryUserProfitLoss;
/// 统计游戏有效投注额【POST】
-(URLManagerModel *)post_game_statis_queryValidBet;
/// 统计游戏有效投注额【POST】
-(URLManagerModel *)post_game_statis_queryValidBet2;
#pragma mark —— 游戏首页娱乐城
/// 游戏导航列表：缓存1分钟
-(URLManagerModel *)get_game_home_bar_list;
/// 游戏大厅喜爱的游戏-添加【POST】
-(URLManagerModel *)post_game_home_favoriteGames_add;
/// 游戏大厅喜爱的游戏-删除【POST】
-(URLManagerModel *)post_game_home_favoriteGames_delete;
/// 菲站首页- 查询所有厂商提供的老虎机游戏收藏列表【POST】
-(URLManagerModel *)post_game_home_favoriteGames_query;
/// 菲站游戏大厅-模糊查询【POST】
-(URLManagerModel *)post_game_home_gameZone_fuzzyQuery;
/// 菲站首页大厅场馆对应游戏列表-查询【POST】
-(URLManagerModel *)post_game_home_homeLobbyGame_query;
/// 菲站首页大厅场馆对应累加资金-查询【POST】
-(URLManagerModel *)post_game_home_jackpotsGamesFunds_query;
/// 菲站热门游戏/百家乐/轮盘/21点-查询【POST】
-(URLManagerModel *)post_game_home_liveCasino_quer;
/// 菲站首页- 受欢迎的游戏列表查询【POST】
-(URLManagerModel *)post_game_home_popularGames_query;
/// 菲站电子游戏页面/热门游戏及最新游戏-查询【POST】
-(URLManagerModel *)post_game_home_slot_query;
/// 前端- 查询所有厂商提供的老虎机游戏列表【POST】
-(URLManagerModel *)post_game_home_sub_list;
#pragma mark —— 进出游戏相关接口
/// 查询我的游戏注单详情【POST】
-(URLManagerModel *)post_game_bet_order_mybet_detail;
/// 查询我的游戏注单【POST】
-(URLManagerModel *)post_game_bet_order_mybet_sum;
/// 获取游戏url【POST】
-(URLManagerModel *)post_game_bet_single_wallet_jump;
/// 来自 http://16.163.191.190:8100/api/promotion/doc.html
#pragma mark —— feign-support-controller
/// 查看是否有流水卷或者存送卷【POST】
-(URLManagerModel *)post_promotion_feign_rolls_list;
/// 批量使用流水卷或者存送卷【POST】
-(URLManagerModel *)post_promotion_feign_rolls_use;
#pragma mark —— health-controller
/// hearbeat【GET】
-(URLManagerModel *)get_promotion_heartbeat;
#pragma mark —— 大转盘
/// 查询大转盘活动参数配置【GET】
-(URLManagerModel *)get_promotion_activity_turntable_detail;
/// 大转盘抽奖【GET】
-(URLManagerModel *)get_promotion_activity_turntable_prize_get;
/// 分页查询大转盘活动抽奖记录【POST】
-(URLManagerModel *)post_promotion_activity_turntable_record;
/// 查询用户大转盘抽奖次数【GET】
-(URLManagerModel *)get_promotion_activity_turntable_user_num;
/// 查询用户大转盘活动抽奖记录【GET】
-(URLManagerModel *)get_promotion_activity_turntable_user_record;
#pragma mark —— 广告配置所有接口
/// 查询广告列表-支持游客:活动推广专区【GET】
-(URLManagerModel *)get_promotion_advertise_info_list_activity;
/// 查询广告列表-支持游客:APP首页右下3Banner【GET】
-(URLManagerModel *)get_promotion_advertise_infoP_list_appIndex;
/// 查询广告列表-支持游客:APP会员中心【GET】
-(URLManagerModel *)get_promotion_advertise_info_list_appMember;
/// 查询广告列表-支持游客:首页天顶轮播大Banner【GET】
-(URLManagerModel *)get_promotion_advertise_info_list_index;
/// 查询广告列表-支持游客:导航栏4小Banner【GET】
-(URLManagerModel *)get_promotion_advertise_info_list_navigationBar;
/// 查询广告列表-支持游客【GET】
-(URLManagerModel *)get_promotion_advertise_list;
/// 根据类型查询广告列表【GET】
-(URLManagerModel *)get_promotion_advertise_list_type;
#pragma mark —— 新手活动
/// 查询新手活动参数配置【GET】
-(URLManagerModel *)get_promotion_activity_newbie_detail;
/// 查询登录用户新手大礼包完成情况【GET】
-(URLManagerModel *)get_promotion_get_user_newbie_gift_detail;
/// 查询登录用户参加新手活动资格【GET】
-(URLManagerModel *)get_promotion_get_user_newbie_qualifications;
/// 查询登录用户签到完成情况【GET】
-(URLManagerModel *)get_promotion_get_user_sign_gift_detail;
/// 新手活动复活大礼包用户领取【GET】
-(URLManagerModel *)get_promotion_newbie_user_resurrection_receive;
/// 新手活动用户复活大礼包状态查询【GET】
-(URLManagerModel *)get_promotion_newbie_user_resurrection_statusGet;
/// 新手活动签到大礼包用户签到【GET】
-(URLManagerModel *)get_promotion_newbie_user_sign;
#pragma mark —— 活动相关接口
/// 存款优惠活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getActivity;
/// 存款优惠活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getDepositDiscountActivityRecord;
/// 会员签到活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getMemberSignActivityRecord;
/// 获取存款金额奖励【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getObtainDepositBonus;
/// 查询活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_queryActivityInfo;
/// 查询用户123存款活动的在途订单数量【POST】
-(URLManagerModel *)post_promotion_api_client_activity_queryInTransit123DepositOrdersCount;
/// 会员签到【POST】
-(URLManagerModel *)post_promotion_api_client_activity_sign;
/// 首存活动-查询累计流水【GET】
-(URLManagerModel *)get_promotion_event_activity_bet_total;
/// 活动领取-传返回记录的id【POST】
-(URLManagerModel *)post_promotion_event_activity_claimp;
/// 查询首存活动记录【GET】
-(URLManagerModel *)get_promotion_event_activity_record;
/// 会员签到【POST】
-(URLManagerModel *)post_promotion_event_memberSign;
/// 会员签到活动信息【POST】
-(URLManagerModel *)post_promotion_event_memberSignEvent;
#pragma mark —— 福利中心所有接口
/// 福利领取 ，目前只限2现金券 3存送卷 4流水卷【GET】
-(URLManagerModel *)get_promotion_welfare_claim;
/// 用户查询福利中心列表【POST】
-(URLManagerModel *)post_promotion_welfare_list;
/// 用户福利中心统计【GET】
-(URLManagerModel *)get_promotion_welfare_statistic;
/// vip模块领取福利【POST】
-(URLManagerModel *)post_promotion_welfare_vip_claim;
/// 来自 http://16.163.191.190:8099/doc.html
#pragma mark —— 信息配置
/// 跑马灯信息查询【建议前端每20s-30s可以刷新请求一次】【GET】
-(URLManagerModel *)get_operation_announce_config_queryAnnByMember;
/// 站内信全部变为已读【建议前端每5s刷新一次】【PUT】
-(URLManagerModel *)put_operation_letter_config_allReadStatus;
/// 站内信全部删除【PUT】
-(URLManagerModel *)put_operation_letter_config_deleteAll;
/// 站内信删除【PUT】
-(URLManagerModel *)put_operation_letter_config_deleteLetter;
/// 是否有未读站内信【建议前端每5s刷新一次】【POST】
-(URLManagerModel *)post_operation_letter_config_hasUnRead;
/// 站内信记录查询【POST】
-(URLManagerModel *)post_operation_letter_config_queryLetterConfigSendList;
/// 站内信变为已读【PUT】
-(URLManagerModel *)put_operation_letter_config_toReadStatus;
#pragma mark —— 全站维护
/// 全站维护【POST】
-(URLManagerModel *)post_operation_siteMain_queryDetail;
#pragma mark —— 公共资源
/// 教程子项详情【POST】
-(URLManagerModel *)post_operation_tutorial_config_detailItem;
/// 教程列表【POST】
-(URLManagerModel *)post_api_operation_tutorial_config_list;
/// 教程子项列表【POST】
-(URLManagerModel *)post_operation_tutorial_config_listItem;
#pragma mark —— 资源配置
/// 意见保存【POST】
-(URLManagerModel *)post_operation_advice_config_saveAdviceConfig;
#pragma mark —— 赞助模块
/// 查询赞助集锦列表【GET】
-(URLManagerModel *)get_operation_sponsor_high_list;
/// 查询赞助图集列表【GET】
-(URLManagerModel *)get_operation_sponsor_list;
#pragma mark —— 接口文档里面没有的
#pragma mark —— 目前缺乏的接口
/// 首页轮播图接口
///
@end

NS_ASSUME_NONNULL_END
