//
//  YTKNetworkApi.h
//  FM
//
//  Created by User on 9/21/24.
//

#ifndef YTKNetworkApi_h
#define YTKNetworkApi_h

#import "JobsBaseApi.h"

#import "FM_check_login_verification_api.h" /// 发送短信验证码【POST】
#import "FM_loginByAccAndPwd_api.h" /// 账号密码登录【POST】
#import "FM_game_home_popularGames_query_api.h" /// 菲站首页- 受欢迎的游戏列表查询【POST】
#import "FM_loginByVerificationCode_api.h" /// 手机登录【POST】
#import "GetMemberInfo_api.h" /// 获取会员个人信息【GET】
#import "FM_game_home_queryTopGamesList_api.h" /// 游戏大厅喜爱的游戏-添加【POST】
#import "FM_favoriteGames_add_api.h" /// 游戏大厅喜爱的游戏-添加
#import "FM_favoriteGames_delete_api.h" /// 游戏大厅喜爱的游戏-删除【POST】
#import "FM_kyc_submit_api.h" /// 用户提交KYC认证【POST】
#import "FM_user_logout_api.h" /// 用户登出【POST】
#import "FM_promotion_advertise_api.h" /// 查询广告列表-支持游客：APP首页右下3Banner【GET】
#import "FM_promotion_advertise_homeBanner_api.h" /// 查询广告列表-支持游客：APP首页右下3Banner【GET】
#import "FM_promotion_ad_api.h" /// 查询广告列表-支持游客:活动推广专区【GET】
#import "FM_queryAnnByMember_api.h" /// 跑马灯信息查询【建议前端每20s-30s可以刷新请求一次】【GET】

#import "NSObject+YTKNetwork.h"

#endif /* YTKNetworkApi_h */
