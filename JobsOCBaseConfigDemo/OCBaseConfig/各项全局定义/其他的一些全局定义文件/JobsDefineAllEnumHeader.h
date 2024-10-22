//
//  JobsDefineAllEnumHeader.h
//  MataShop
//
//  Created by Jobs Hi on 10/10/23.
//
#pragma mark —— 此文件用来存储记录全局的一些枚举

#ifndef JobsDefineAllEnumHeader_h
#define JobsDefineAllEnumHeader_h
#pragma mark —— 系统相关
/// 开发环境
#ifndef JOBS_NETWORKING_ENVIR_ENUM_DEFINED
#define JOBS_NETWORKING_ENVIR_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsNetworkingEnvir) {
    JobsNetworkingEnvir_Undefined = 0,
    JobsNetworkingEnvir_DevEnviron,/// 开发环境
    JobsNetworkingEnvir_UATEnviron,/// UAT环境
    JobsNetworkingEnvir_ProductEnviron,/// 生产环境
};
#endif /* JOBS_NETWORKING_ENVIR_ENUM_DEFINED */
/// 平台维护状态
#ifndef JOBS_APP_STATUS_ENUM_DEFINED
#define JOBS_APP_STATUS_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsAppStatus) {
    JobsAppStatus_Undefined = 0,
    JobsAppStatus_Maintenance,/// 平台维护中
    JobsAppStatus_OK,/// 平台正常
    JobsAppStatus_Close,/// 平台关闭
    JobsAppStatus_All
};
#endif /* JOBS_APP_STATUS_ENUM_DEFINED */
/// 终端类型
#ifndef JOBS_TERMINAL_TYPE_ENUM_DEFINED
#define JOBS_TERMINAL_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsTerminalType) {
    JobsTerminalType_Undefined = 0,/// 保留字段
    JobsTerminalType_Android,/// 安卓平台
    JobsTerminalType_iOS,/// iOS平台
    JobsTerminalType_Web,/// Web平台
    JobsTerminalType_All
};
#endif /* JOBS_TERMINAL_TYPE_ENUM_DEFINED */
/// 更新类型
#ifndef JOBS_UPDATE_TYPE_ENUM_DEFINED
#define JOBS_UPDATE_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsUpdateType) {
    JobsUpdate_Undefined,/// 不更新
    JobsUpdateBySys,/// 系统强制更新
    JobsUpdateByUser,/// 用户手动更新
    JobsUpdate_All,/// 系统自动更新
};
#endif /* JOBS_UPDATE_TYPE_ENUM_DEFINED */
/// 系统支持语言
#ifndef APP_LANGUAGE_ENUM_DEFINED
#define APP_LANGUAGE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, AppLanguage) {
    AppLanguageBySys,/// App语言跟随当前系统
    AppLanguageChineseSimplified, /// zh-Hans：简体中文
    AppLanguageChineseTraditional,/// zh-Hant：繁体中文
    AppLanguageEnglish,           /// en：标准英语
    AppLanguageTagalog            /// tl：菲律宾他加禄语
};
#endif/* APP_LANGUAGE_ENUM_DEFINED */
/// 屏幕方向
#ifndef DeviceOrientation_typedef
#define DeviceOrientation_typedef
typedef NS_ENUM(NSInteger, DeviceOrientation) {
    DeviceOrientationUnknown, /// 未知方向
    DeviceOrientationPortrait,/// 竖屏
    DeviceOrientationLandscape /// 横屏
};
#endif /* DeviceOrientation_typedef */
/// 当前类型
#ifndef MyEnums_h
#define MyEnums_h
typedef NS_ENUM(NSInteger, ComponentType) {
    ComponentTypeUnknown,/// 其他
    ComponentTypeView,/// 视图
    ComponentTypeViewController/// 控制器
};
#endif /* MyEnums_h */
/// 图片编码格式
#ifndef PIC_TO_STR_STYLE_ENUM_DEFINED
#define PIC_TO_STR_STYLE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, PicToStrStyle) {
    PicToStrStyle_Hexadecimal = 0,/// 图片 转 十六进制
    PicToStrStyle_Base16,/// 图片 转 Base16字符编码
    PicToStrStyle_Base32,/// 图片 转 Base32字符编码
    PicToStrStyle_Base64,/// 图片 转 Base64字符编码
    PicToStrStyle_Base85,/// 图片 转 Base85字符编码
    PicToStrStyle_MIME,/// 图片 转 MIME
};
#endif /* PIC_TO_STR_STYLE_ENUM_DEFINED */
/// banner滚动方向
#ifndef JHT_BANNER_VIEW_ORIENTATION_ENUM_DEFINED
#define JHT_BANNER_VIEW_ORIENTATION_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JhtBannerViewOrientation) {
    // 横向
    BV_Orientation_Horizontal,
    // 纵向
    BV_Orientation_Vertical,
};
#endif /* JHT_BANNER_VIEW_ORIENTATION_ENUM_DEFINED */
/// ShadowDirection
#ifndef ShadowDirection_h
#define ShadowDirection_h
typedef NS_OPTIONS(NSUInteger, ShadowDirection) {
    ShadowDirection_top = 0,
    ShadowDirection_down = 1 << 0,
    ShadowDirection_left = 1 << 1,
    ShadowDirection_right = 1 << 2,
    ShadowDirection_leftTop = 1 << 3,
    ShadowDirection_leftDown = 1 << 4,
    ShadowDirection_rightTop = 1 << 5,
    ShadowDirection_rightDown = 1 << 6,
    ShadowDirection_All = ~0UL
};
#endif /* ShadowDirection_h */
/// UIBorderSideType
#ifndef UIBorderSideType_h
#define UIBorderSideType_h
typedef NS_OPTIONS(NSUInteger, UIBorderSideType) {
    UIBorderSideTypeAll  = 0,
    UIBorderSideTypeTop = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft = 1 << 2,
    UIBorderSideTypeRight = 1 << 3,
};
#endif /* UIBorderSideType_h */
/// BaseURL
#ifndef SERVER_URL_DEFINED
#define SERVER_URL_DEFINED
#define server_URL NSObject.BaseUrl
#endif /* SERVER_URL_DEFINED */
/// 服务器相关
#ifndef HTTP_REQUEST_TOKEN_KEY_DEFINED
#define HTTP_REQUEST_TOKEN_KEY_DEFINED
#define HTTPRequestTokenKey @"token"
#endif /* HTTP_REQUEST_TOKEN_KEY_DEFINED */
/// 签名key
#ifndef HTTP_SERVICE_SIGN_KEY_DEFINED
#define HTTP_SERVICE_SIGN_KEY_DEFINED
#define HTTPServiceSignKey @"sign"
#endif /* HTTP_SERVICE_SIGN_KEY_DEFINED */
/// 私钥key
#ifndef HTTP_SERVICE_KEY_DEFINED
#define HTTP_SERVICE_KEY_DEFINED
#define HTTPServiceKey @"privatekey"
#endif /* HTTP_SERVICE_KEY_DEFINED */
/// 私钥Value
#ifndef HTTP_SERVICE_KEY_VALUE_DEFINED
#define HTTP_SERVICE_KEY_VALUE_DEFINED
#define HTTPServiceKeyValue @"/** 你的私钥 **/"
#endif /* HTTP_SERVICE_KEY_VALUE_DEFINED */
/// 状态码key
#ifndef HTTP_SERVICE_RESPONSE_CODE_KEY_DEFINED
#define HTTP_SERVICE_RESPONSE_CODE_KEY_DEFINED
#define HTTPServiceResponseCodeKey @"code"
#endif /* HTTP_SERVICE_RESPONSE_CODE_KEY_DEFINED */
/// 消息key
#ifndef HTTP_SERVICE_RESPONSE_MSG_KEY_DEFINED
#define HTTP_SERVICE_RESPONSE_MSG_KEY_DEFINED
#define HTTPServiceResponseMsgKey @"msg"
#endif /* HTTP_SERVICE_RESPONSE_MSG_KEY_DEFINED */
/// 数据data
#ifndef HTTP_SERVICE_RESPONSE_DATA_KEY_DEFINED
#define HTTP_SERVICE_RESPONSE_DATA_KEY_DEFINED
#define HTTPServiceResponseDataKey @"data"
#endif /* HTTP_SERVICE_RESPONSE_DATA_KEY_DEFINED */
/**
 后台定义：
 
 【返回状态码(code)】
 -1、服务器异常。
 0、表示成功。
 1、登录已过期，请重新登录。
 2、授权失败。
 4、限定时间内超过请求次数
 6.、风险操作。
 7、未设置交易密码。
 8、帐号已在其他设备登录。
 
 【需要权限的接口】请求头加上authorization字段，值为服务器颁发的jwt令牌。令牌无感刷新，需实时更新
 */
#ifndef HTTP_RESPONSE_CODE_ENUM_DEFINED
#define HTTP_RESPONSE_CODE_ENUM_DEFINED
/// 请求数据返回的状态码、根据自己的服务端数据来
typedef NS_ENUM(NSInteger, HTTPResponseCode) {
    HTTPResponseCodeServeError = 10005,/// 服务器异常
    HTTPResponseCodeSuccess = 200,/// 请求成功
    HTTPResponseCodeNoToken = 401,/// 令牌不能为空
    HTTPResponseCodeLoginFailed = 1002000000,/// 登录失败：账密错误
    HTTPResponseCodeAuthorizationFailure = 2,/// 授权失败
    HTTPResponseCodeLeakTime = 4,/// 限定时间内超过请求次数
    HTTPResponseCodeRiskOperation = 6,/// 风险操作
    HTTPResponseCodeNoSettingTransactionPassword = 7,/// 未设置交易密码
    HTTPResponseCodeOffline = 8,/// 帐号已在其他设备登录
    HTTPResponseCodeTokenExpire = 10009/// Token 过期
    ///其他代号，展示msg内容即可
};
#endif /* HTTP_RESPONSE_CODE_ENUM_DEFINED */
///
#ifndef HTTP_REQUEST_HEADER_LANGUAGE_TYPE_ENUM_DEFINED
#define HTTP_REQUEST_HEADER_LANGUAGE_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, HTTPRequestHeaderLanguageType) {
    HTTPRequestHeaderLanguageEn,/// 英文
    HTTPRequestHeaderLanguageCN,/// 中文
    HTTPRequestHeaderLanguageOther/// 其他语言
};
#endif /* HTTP_REQUEST_HEADER_LANGUAGE_TYPE_ENUM_DEFINED */
///
#ifndef MK_RIGHT_BTN_VIEW_BTN_TYPE_ENUM_DEFINED
#define MK_RIGHT_BTN_VIEW_BTN_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, MKRightBtnViewBtnType) {
    MKRightBtnViewBtnType_loveBtn,/// 点赞
    MKRightBtnViewBtnType_commentBtn,/// 评论
    MKRightBtnViewBtnType_shareBtn/// 分享
};
#endif /* MK_RIGHT_BTN_VIEW_BTN_TYPE_ENUM_DEFINED */
///
#ifndef MOVE_DIRECTION_ENUM_DEFINED
#define MOVE_DIRECTION_ENUM_DEFINED
typedef NS_ENUM(NSInteger, MoveDirection){
    MoveDirection_vertical_up = 0, /// 垂直方向(向上)滑动
    MoveDirection_vertical_down,   /// 垂直方向(向下)滑动
    MoveDirection_horizont_left,   /// 水平方向(向左)滑动
    MoveDirection_horizont_right   /// 水平方向(向右)滑动
};
#endif /* MOVE_DIRECTION_ENUM_DEFINED */

#ifndef JOBS_INDEX_PATH_STRUCT_DEFINED
#define JOBS_INDEX_PATH_STRUCT_DEFINED
typedef struct {
    NSInteger section;
    NSInteger rowOrItem;
} JobsIndexPath; /// 这样写的话，外面可以JobsIndexPath.section 进行调用
#endif /* JOBS_INDEX_PATH_STRUCT_DEFINED */
/// 比较结果
#ifndef COMPARE_RES_ENUM_DEFINED
#define COMPARE_RES_ENUM_DEFINED
typedef NS_ENUM(NSInteger, CompareRes) {
    CompareRes_Error,
    CompareRes_MoreThan, /// >
    CompareRes_Equal,/// ==
    CompareRes_LessThan /// <
};
#endif /* CompareRes */
/// 搜索策略
#ifndef JOBS_SEARCH_STRATEGY_ENUM_DEFINED
#define JOBS_SEARCH_STRATEGY_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsSearchStrategy) {
    JobsSearchStrategy_Accurate = 0,/// 精确查询
    JobsSearchStrategy_Fuzzy/// 模糊查询
};
#endif /* JOBS_SEARCH_STRATEGY_ENUM_DEFINED */
/// 滚动方向
#ifndef SCROLL_DIRECTION_ENUM_DEFINED
#define SCROLL_DIRECTION_ENUM_DEFINED
typedef NS_ENUM(NSInteger, ScrollDirection) {
    ScrollDirectionNone = 0,
    ScrollDirectionRight,/// 右👉🏻
    ScrollDirectionLeft,/// 左👈🏻
    ScrollDirectionUp,/// 上面👆🏻
    ScrollDirectionDown,/// 下面👇🏻
    ScrollDirectionRight_UP,/// 右上👉🏻👆🏻
    ScrollDirectionLeft_UP,/// 左上👈🏻👆🏻
    ScrollDirectionRight_Down,/// 右下👉🏻👇🏻
    ScrollDirectionLeft_Down,/// 左下👈🏻👇🏻
};
#endif /* SCROLL_DIRECTION_ENUM_DEFINED */

#pragma mark —— 订单相关
/// 时间定义
#ifndef JOBS_ORDER_DATE_ENUM_DEFINED
#define JOBS_ORDER_DATE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsOrderDate) {
    JobsOrderDate_Undefined,
    JobsOrderDate_Today = 0,/// 今天
    JobsOrderDate_Yesterday,/// 昨天
    JobsOrderDate_In7Days,/// 近7天内
    JobsOrderDate_InOneMonth,/// 一个月内
    JobsOrderDate_All/// 全部
};
#endif /* JOBS_ORDER_DATE_ENUM_DEFINED */
/// 支付类型
#ifndef JOBS_PAY_TYPE_ENUM_DEFINED
#define JOBS_PAY_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsPayType) {
    JobsPayType_Undefined,
    JobsPayType_银行卡,
    JobsPayType_支付宝,
    JobsPayType_微信,
    JobsPayType_数字货币,
    JobsPayType_人工后台操作上下分,
    JobsPayType_AppBalance,/// App余额支付
    JobsPayType_MataValue,/// Mata值支付
    JobsPayType_MataCreditScore,/// 信用分支付
    JobsPayType_All
};
#endif /* JOBS_PAY_TYPE_ENUM_DEFINED */
/// 默认支付类型
#ifndef JOBS_PAY_DEFAULT_TYPE_ENUM_DEFINED
#define JOBS_PAY_DEFAULT_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsPayDefaultType) {
    JobsPayDefaultType_Undefined,
    JobsPayDefaultType_Main,/// 主支付类型
    JobsPayDefaultType_Other,/// 副支付类型
    JobsPayDefaultType_All
};
#endif /* JOBS_PAY_DEFAULT_TYPE_ENUM_DEFINED */
/// 订单类型
#ifndef JOBS_ORDER_TYPE_ENUM_DEFINED
#define JOBS_ORDER_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsOrderType) {
    JobsOrderType_Undefined,
    JobsOrderType_商城订单,
    JobsOrderType_信用分订单,
    JobsOrderType_课程订单,
    JobsOrderType_All
};
#endif /* JOBS_ORDER_TYPE_ENUM_DEFINED */
/// 存取款
#ifndef BankStyle_Def
#define BankStyle_Def
typedef NS_ENUM(NSInteger, BankStyle) {
    Deposit,/// 存款
    Withdraw, /// 提款
};
#endif/* BankStyle_Def */
/// 订单状态
#ifndef JOBS_ORDER_STATE_ENUM_DEFINED
#define JOBS_ORDER_STATE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsOrderState) {
    JobsOrderState_Undefined,///
    JobsOrderState_Due,/// 待付款订单
    JobsOrderState_WaitSent,/// 已付款.待发货订单
    JobsOrderState_WaitReceived,/// 已发货.待收货订单
    JobsOrderState_Evaluate,/// 已完成收货的订单，并且待评价
    JobsOrderState_Finished,/// 已完成收货的订单，并且已经评价
    JobsOrderState_待审核订单,
    JobsOrderState_已审核订单,
    JobsOrderState_订单出款错误,
    JobsOrderState_订单已经被删除,
    JobsOrderState_All/// 全部订单
};
#endif /* JOBS_ORDER_STATE_ENUM_DEFINED */

#pragma mark —— 会员相关
/// 更新用户信息类型
#ifndef JOBS_UPDATE_USER_INFO_TYPE_ENUM_DEFINED
#define JOBS_UPDATE_USER_INFO_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsUpdateUserInfoType) {
    JobsUpdateUserInfoType_Undefined = 0,/// 未定义
    JobsUpdateUserInfoType_Nation,/// 国家
    JobsUpdateUserInfoType_Nationality,/// 民族
    JobsUpdateUserInfoType_RealName,/// 真实姓名
    JobsUpdateUserInfoType_NikeName,/// 花名
    JobsUpdateUserInfoType_Age,/// 年龄
    JobsUpdateUserInfoType_Birthday,/// 生日
    JobsUpdateUserInfoType_sex,/// 性别
    JobsUpdateUserInfoType_SexualOrientation,/// 性倾向
    JobsUpdateUserInfoType_Mail,/// 邮箱地址
    JobsUpdateUserInfoType_Wechat,/// 微信账号
    JobsUpdateUserInfoType_QQ,/// QQ账号
    JobsUpdateUserInfoType_Telephone,/// 手机号码
    JobsUpdateUserInfoType_SinaWeibo,/// 新浪微博账号
    JobsUpdateUserInfoType_Telegram,/// 纸飞机账号
    JobsUpdateUserInfoType_Instagram,/// Instagram账号
    JobsUpdateUserInfoType_Facebook,/// Facebook账号
    JobsUpdateUserInfoType_Skype,/// Skype账号
    JobsUpdateUserInfoType_WhatsApp,/// WhatsApp账号
    JobsUpdateUserInfoType_All,/// 全部更新
};
#endif /* JOBS_UPDATE_USER_INFO_TYPE_ENUM_DEFINED */
/// 会员等级
#ifndef JOBS_RANK_CLASS_ENUM_DEFINED
#define JOBS_RANK_CLASS_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsRankClass) {
    JobsRankClass_Undefined = 0,/// 未定义
    JobsRankClass_VIP0,
    JobsRankClass_VIP1,
    JobsRankClass_VIP2,
    JobsRankClass_VIP3,
    JobsRankClass_VIP4,
    JobsRankClass_VIP5,
    JobsRankClass_VIP6,
    JobsRankClass_VIP7,
    JobsRankClass_VIP8,
    JobsRankClass_VIP9,
    JobsRankClass_VIP10,
    JobsRankClass_All
};
#endif /* JOBS_RANK_CLASS_ENUM_DEFINED */
/// 活动状态
#ifndef JOBS_ACTIVE_STATE_ENUM_DEFINED
#define JOBS_ACTIVE_STATE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsActiveState) {
    JobsActiveState_Undefined = 0,/// 未定义
    JobsActiveState_参与活动,
    JobsActiveState_等级不符,
    JobsActiveState_正在参与活动,
    JobsActiveState_已参与过活动,
    JobsActiveState_All
};
#endif /* JOBS_ACTIVE_STATE_ENUM_DEFINED */
/// 客服平台状态
#ifndef JOBS_CUSTOMER_CONTACT_TYPE_ENUM_DEFINED
#define JOBS_CUSTOMER_CONTACT_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsCustomerContactType) {
    JobsCustomerContactType_Undefined = 0,/// 未定义
    JobsCustomerContactType_Close,/// 停用
    JobsCustomerContactType_Open,/// 启用
    JobsCustomerContactType_All,
};
#endif /* JOBS_CUSTOMER_CONTACT_TYPE_ENUM_DEFINED */
/// 客服平台标识
#ifndef JOBS_CUSTOMER_CONTACT_STYLE_ENUM_DEFINED
#define JOBS_CUSTOMER_CONTACT_STYLE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsCustomerContactStyle) {
    JobsCustomerContactStyle_Undefined = 0,/// 未定义
    JobsCustomerContactStyle_QQ = 1,/// QQ
    JobsCustomerContactStyle_Skype,/// Skype
    JobsCustomerContactStyle_Telegram,/// Telegram
    JobsCustomerContactStyle_whatsApp,/// WhatsApp
    JobsCustomerContactStyle_手机号码,/// 手机号码
    JobsCustomerContactStyle_OnlineURL,/// onlineURL
    JobsCustomerContactStyle_All,
};
#endif /* JOBS_CUSTOMER_CONTACT_STYLE_ENUM_DEFINED */
/// 消息类型
#ifndef JOBS_MSG_TYPE_ENUM_DEFINED
#define JOBS_MSG_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsMsgType) {
    JobsMsgType_Undefined = 0,/// 未定义
    JobsMsgType_Notify,/// 通知
    JobsMsgType_Activity,/// 活动
    JobsMsgType_Notice,/// 公告
    JobsMsgType_Bonus,/// 红利
    JobsMsgType_All,
};
#endif /* JOBS_MSG_TYPE_ENUM_DEFINED */
/// 账户类型
#ifndef AccountStyle_DEFINED
#define AccountStyle_DEFINED
typedef NS_ENUM(NSInteger, AccountStyle) {
    AccountStyle_GCCash,/// GCCash
    AccountStyle_Bank,/// 银行
};
#endif /* AccountStyle_DEFINED */

#ifndef MOVE_DIRECTION_ENUM_DEFINED
#define MOVE_DIRECTION_ENUM_DEFINED
typedef NS_ENUM(NSInteger, FM_action_type){
    FM_action_type_Signin = 0, /// 注册
    FM_action_type_Login,   /// 登录
    FM_action_type_forgotPwd,   /// 忘记密码
    FM_action_type_BindMobilePhone,   /// 绑定手机号
    FM_action_type_BindBankCard,   /// 绑定银行卡
    FM_action_type_BindEwallet,   /// 绑定加密货币地址
    M_action_type_Withdraw,   /// 提现
};
#endif /* MOVE_DIRECTION_ENUM_DEFINED */

#ifndef FMGAMELISTSTYLE
#define FMGAMELISTSTYLE
typedef NS_ENUM(NSInteger, FMGameListStyle){
    FMGameListStyle_New = 0,   /// 最新
    FMGameListStyle_Hot = 1,   /// 热门
    FMGameListStyle_All = 2, /// 全部
    FMGameListStyle_Fav = 3,   /// 最爱
};
#endif /* FMGAMELISTSTYLE */

#ifndef FMADSTYPE
#define FMADSTYPE
/// 广告类型
typedef NS_ENUM(NSInteger, FMAdsType){
    FMAdsType_homeBanner = 0, /// 首页天顶轮播大Banner
    FMAdsType_ = 1, /// 导航栏4小Banner
    FMAdsType_hotRecommend = 2, /// APP首页右下3Banner
    FMAdsType_memberCentral = 3, /// APP会员中心
    FMAdsType_promotionArea = 4 /// 活动推广专区
};
#endif /* FMAFMADSTYPEdsType */

#ifndef FMACCOUNTTYPE
#define FMACCOUNTTYPE
/// 账号类型
typedef NS_ENUM(NSInteger, FMAccType){
    FMAccType_ALL_MEMBER = 0, /// 所有会员
    FMAccType_DESIGNATED_MEMBER = 1, /// 指定会员
    FMAccType_All_AGENCY = 2, /// 全代理线
    FMAccType_DESIGNATED_AGENCY = 3, /// 指定代理线
};
#endif /* FMACCOUNTTYPE */

#ifndef FMJUMPTYPE
#define FMJUMPTYPE
/// 跳转类型
typedef NS_ENUM(NSInteger, FMJumpType){
    FMJumpType_DESIGNATED_GAME = 0, /// 指定游戏
    FMJumpType_STADIUM = 1, /// 场馆大厅
    FMJumpType_ACTIVITY = 2, /// 活动模块
    FMJumpType_WEBURL = 3, /// 网站地址
    FMJumpType_NO = 4, /// 不跳转
};
#endif /* FMJUMPTYPE */
/// 记录是什么触发登录操作的（登录成功继续进行流程）
#ifndef FMLOGINWORK
#define FMLOGINWORK
/// 跳转类型
typedef NS_ENUM(NSInteger, FMLoginWork){
    FMLoginWork_Default = 0,
    FMLoginWork_MyFav,
    FMLoginWork_MyBank
};
#endif /* FMLOGINWORK */

#endif /* JobsDefineAllEnumHeader_h */
