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
    JobsNetworkingEnvir_Dev,/// 开发环境
    JobsNetworkingEnvir_Test,/// 测试环境
    JobsNetworkingEnvir_UAT,/// UAT环境
    JobsNetworkingEnvir_Product,/// 生产环境
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
/// 登录方式
#ifndef LOGINMODE
#define LOGINMODE
typedef NS_ENUM(NSInteger, LoginType) {
    LoginType_Silent = 0,     /// 静默登录（只在账密登录成功后有效）
    LoginType_Manual,         /// 非静默登录
};
#endif /* LOGINMODE */
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
/// 文字方向
#ifndef TransformLayerDirectionType_h
#define TransformLayerDirectionType_h
typedef NS_ENUM(NSUInteger, TransformLayerDirectionType) {
    TransformLayerDirectionUp = 0,    /// 文字方向朝上(默认正常)
    TransformLayerDirectionLeft,      /// 文字方向朝左
    TransformLayerDirectionDown,      /// 文字方向朝下
    TransformLayerDirectionRight      /// 文字方向朝右
};
#endif /* TransformLayerDirectionType_h */
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
    HTTPResponseCodeTokenExpire = 10009,/// Token 过期
    HTTPResponseCodePhoneNumberNotExist = 1002000034,/// 手机号码不存在
    HTTPResponseCodeNoOK = 500,/// 服务器错误
    HTTPResponseCodeAccountLocked = 1002000035,/// 账户被锁
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
/// 开关状态
#ifndef JOBS_SWITCH_TYPE_ENUM_DEFINED
#define JOBS_SWITCH_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsSwitchType) {
    JobsSwitchType_Open = 0,/// 启用（正常）
    JobsSwitchType_Close = 1,/// 停用
};
#endif /* JOBS_SWITCH_TYPE_ENUM_DEFINED */
/// 开关状态
#ifndef JOBS_SWITCH_TYPE2_ENUM_DEFINED
#define JOBS_SWITCH_TYPE2_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsSwitchType2) {
    JobsSwitchType2_Close = 0,/// 停用
    JobsSwitchType2_Open = 1,/// 启用（正常）
};
#endif /* JOBS_SWITCH_TYPE2_ENUM_DEFINED */
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
    FMAdsType_promotionArea = 4, /// 活动推广专区
    FMAdsType_announcement = 5 /// 公告
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

#ifndef KYCSTATUS
#define KYCSTATUS
/// 跳转类型
typedef NS_ENUM(NSInteger, KYCStatus){
    KYCStatus_待审核 = 0,
    KYCStatus_通过,
    KYCStatus_拒绝,
    KYCStatus_未提交
};
#endif /* KYCSTATUS */

#ifndef KYCOK
#define KYCOK
/// 是否已KYC验证
typedef NS_ENUM(NSInteger, KYCok){
    KYCOK_未通过 = 0,
    KYCOK_已经通过 = 1
};
#endif /* KYCOK */

#ifndef HOMEBARLISTSTYLE
#define HOMEBARLISTSTYLE
/// 首页游戏列表名
typedef NS_ENUM(NSInteger, HomeBarListStyle){
    HomeBarListStyle_Sports = 1001101, /// Sports 体育
    HomeBarListStyle_LiveCasino = 1001102, /// Live Casino 真人
    HomeBarListStyle_TableGames = 1001103, /// Table Games 棋牌
    HomeBarListStyle_SlotsGames = 1001104, /// Slots Games 电子
    HomeBarListStyle_Lottery = 1001105, /// Lottery 彩票
    HomeBarListStyle_ESport = 1001106 /// ESport 电竞
};
#endif /* HOMEBARLISTSTYLE */

#ifndef BINDSTYLE
#define BINDSTYLE
/// 绑定状态
typedef NS_ENUM(NSInteger, BindStyle){
    NoBinded = 0,/// 未绑定
    Binded = 1/// 已绑定
};
#endif /* BINDSTYLE */


#ifndef NEEDREALNAME
#define NEEDREALNAME
/// 绑定状态
typedef NS_ENUM(NSInteger, NeedRealName){
    NEEDREALNAME_NONEED = 0,/// 不需要
    NEEDREALNAME_NEED1 = 1,/// 需要-单姓名
    NEEDREALNAME_NEEDMORE = 2/// 需要-可以多姓名
};
#endif /* NEEDREALNAME */

#ifndef IDTYPEENUM
#define IDTYPEENUM
typedef NS_ENUM(NSInteger, IdTypeEnum){
    PHILIPPINE_NATIONAL_ID = 1,/// Philippine National ID
    DRIVERS_LICENSE = 2,/// Driver's License
    PHIL_HEALTH_ID = 3,/// PhilHealth ID
    PHILIPPINE_POSTAL_ID = 4,/// Philippine Postal ID
    NBI_CLEARANCE = 5,/// NBI Clearanc
    SENIOR_CITIZEN_CARD = 6,/// Senior Citizen Card
    ID_PASSPORT = 7,/// ID Passport (Philippine/Foreign)
    IBP_ID = 8,/// Integrated Bar of the Philippines ID
    FIREARMS_LICENSE = 9,/// Firearms License
    PROFESSIONAL_REGULATIONS_COMMISSION = 10,/// Professional Regulations Commission
    OFW_ID = 11,/// Overseas Filipino Workers (OFW) ID
    SSS_CARD = 12,/// Social Security System (SSS) Card
    TIN = 13, /// Tax Identification
    UMID = 14,/// Unified Multi-Purpose ID
    VOTERS_ID = 15,/// Voter's Certificate and/or Voter's ID
    MARINA_ID = 16,/// Maritime Industry Authority (MARINA) ID
    PWD_ID = 17,/// Person's with Disability (PWD) iD
    ALIEN_CERTIFICATE_OF_REGISTRATION = 18,/// Alien Certificate of Registration
    ICR_ID = 19/// Immigrant Certificate of Registration
};
#endif /* IDTYPEENUM */

#ifndef ACTIVITYTYPE
#define ACTIVITYTYPE
/// 活动类型：1、日常； 2、签到 ；3、存款优惠
typedef NS_ENUM(NSInteger, ActivityType){
    ACTIVITYTYPE_NORMAL = 0,/// 日常
    NEEDREALNAME_SIGNIN = 1,/// 签到
    NEEDREALNAME_DEPOSITPROMO = 2/// 存款优惠
};
#endif /* ACTIVITYTYPE */

#ifndef REWARDDISTRIBUTIONTYPE
#define REWARDDISTRIBUTIONTYPE
/// 奖励发放：1、自动发放；2、人工审核
typedef NS_ENUM(NSInteger, RewardDistributionType) {
    REWARDDISTRIBUTIONTYPE_AUTO = 1,        /// 自动发放
    REWARDDISTRIBUTIONTYPE_MANUAL = 2       /// 人工审核
};
#endif /* REWARDDISTRIBUTIONTYPE */

#ifndef ACTIVITYDURATION
#define ACTIVITYDURATION
/// 活动周期：1、长期有效；2、指定时间
typedef NS_ENUM(NSInteger, ActivityDuration) {
    ACTIVITYDURATION_LONGTERM = 1,          /// 长期有效
    ACTIVITYDURATION_SPECIFIEDTIME = 2      /// 指定时间
};
#endif /* ACTIVITYDURATION */

#ifndef ACTIVITYCATEGORY
#define ACTIVITYCATEGORY
/// 活动分类：0、新手；1、日常；2、优惠；3、限时
typedef NS_ENUM(NSInteger, ActivityCategory) {
    ACTIVITYCATEGORY_NEWBIE = 0,            /// 新手
    ACTIVITYCATEGORY_DAILY = 1,             /// 日常
    ACTIVITYCATEGORY_PROMOTION = 2,         /// 优惠
    ACTIVITYCATEGORY_LIMITEDTIME = 3        /// 限时
};
#endif /* ACTIVITYCATEGORY */

#ifndef ACTIVITYSTATUS
#define ACTIVITYSTATUS
/// 活动状态：-2、删除；-1、过期；0、禁用；1、预热；2、开启
typedef NS_ENUM(NSInteger, ActivityStatus) {
    ACTIVITYSTATUS_DELETED = -2,            /// 删除
    ACTIVITYSTATUS_EXPIRED = -1,            /// 过期
    ACTIVITYSTATUS_DISABLED = 0,            /// 禁用
    ACTIVITYSTATUS_PREHEATING = 1,          /// 预热
    ACTIVITYSTATUS_OPEN = 2                 /// 开启
};
#endif /* ACTIVITYSTATUS */

#ifndef AGENTLINESETTING
#define AGENTLINESETTING
/// 代理线设置：1、全部参与；2、排除代理线；3、指定代理线
typedef NS_ENUM(NSInteger, AgentLineSetting) {
    AGENTLINESETTING_ALL = 1,               /// 全部参与
    AGENTLINESETTING_EXCLUDE = 2,           /// 排除代理线
    AGENTLINESETTING_SPECIFIED = 3          /// 指定代理线
};
#endif /* AGENTLINESETTING */

#ifndef HASSUBSETTING
#define HASSUBSETTING
/// 是否有子游戏：1.有 0.没有
typedef NS_ENUM(NSInteger, HasSubSetting) {
    HASSUBSETTING_NO = 0,     /// 没有子游戏
    HASSUBSETTING_YES = 1     /// 有子游戏
};
#endif /* HASSUBSETTING */

#ifndef ISHOTGAMESETTING
#define ISHOTGAMESETTING
/// 是否热门：0.是 1.否
typedef NS_ENUM(NSInteger, IsHotGameSetting) {
    ISHOTGAMESETTING_HOT = 0,     /// 是热门游戏
    ISHOTGAMESETTING_NOT_HOT = 1  /// 不是热门游戏
};
#endif /* ISHOTGAMESETTING */

#ifndef STATUSSETTING
#define STATUSSETTING
/// 状态：0.开始 1.禁用
typedef NS_ENUM(NSInteger, StatusSetting) {
    STATUSSETTING_STARTED = 0,     /// 开始
    STATUSSETTING_DISABLED = 1     /// 禁用
};
#endif /* STATUSSETTING */

#ifndef ELECTRONICLABELTYPESETTING
#define ELECTRONICLABELTYPESETTING
/// 电子标签类型：1. Hot 2. New
typedef NS_ENUM(NSInteger, ElectronicLabelTypeSetting) {
    ELECTRONICLABELTYPE_HOT = 1,  /// 热门
    ELECTRONICLABELTYPE_NEW = 2   /// 新品
};
#endif /* ELECTRONICLABELTYPESETTING */

#ifndef USERTYPESETTING
#define USERTYPESETTING
/// 用户类型设置
typedef NS_ENUM(NSInteger, UserTypeSetting) {
    USERTYPE_REGISTER = 1,           /// 注册
    USERTYPE_LOGIN = 2,              /// 登录
    USERTYPE_FORGET_PWD = 3,         /// 忘记密码
    USERTYPE_BIND_PHONE = 4,         /// 绑定手机号
    USERTYPE_BIND_BANKCARD = 5,      /// 绑定银行卡
    USERTYPE_BIND_CRYPTO_CURRENCY = 6, /// 绑定加密货币地址
    USERTYPE_AGENT_PAY_PWD_SET = 7,  /// 支付密码设置
    USERTYPE_AGENT_PAY_PWD_RESET = 8, /// 支付密码修改
    USERTYPE_AGENT_WITHDRAWAL_REQ = 9, /// 代理提款申请
    USERTYPE_AGENT_DEPOSIT = 10,     /// 代理代存
    USERTYPE_BIND_E_WALLET = 11      /// 绑定电子钱包
};
#endif /* USERTYPESETTING */
#ifndef BUSINESSSOURCESETTING
#define BUSINESSSOURCESETTING
/// 业务来源
typedef NS_ENUM(NSInteger, BusinessSourceSetting) {
    BUSINESSSOURCE_MEMBER = 1,  /// 会员（默认）
    BUSINESSSOURCE_AGENT = 2    /// 代理
};
#endif /* BUSINESSSOURCESETTING */
/// 站内信类型
#ifndef FM_INBOX_TYPE_ENUM_DEFINED
#define FM_INBOX_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, FMINBOXTYPE) {
    FMINBOX_Undefined = -1,                 /// 未定义或所有类型
    FMINBOX_SportsMatchAnnouncement = 1,    /// 体育赛事公告
    FMINBOX_Promo = 2,                      /// 推广
    FMINBOX_News = 3,                       /// 新闻
    FMINBOX_Personal = 4,                   /// 个人
    FMINBOX_Announcement = 5                /// 公告
};
#endif /* FM_INBOX_TYPE_ENUM_DEFINED */
/// 当前类型
#ifndef READSTATUS
#define READSTATUS
typedef NS_ENUM(NSInteger, ReadStatus) {
    ReadStatus_UNREAD,/// 未读
    ReadStatus_READ/// 已读
};
#endif /* READSTATUS */
/// 结算状态
#ifndef SETTLEFLAG
#define SETTLEFLAG
typedef NS_ENUM(NSInteger, SettleFlag) {
    SettleFlag_NO = 0,/// 未结算
    SettleFlag_YES/// 已结算
};
#endif /* SETTLEFLAG */
/// 查询时间类型
#ifndef JOBS_QUERY_TIME_TYPE_DEFINED
#define JOBS_QUERY_TIME_TYPE_DEFINED
typedef NS_ENUM(NSInteger, JobsQueryTimeType) {
    JobsQueryTimeType_SpecificTime = 0, /// 具体时间
    JobsQueryTimeType_Today,            /// 当天
    JobsQueryTimeType_Yesterday,        /// 昨天
    JobsQueryTimeType_Within7Days,      /// 7天内
    JobsQueryTimeType_Within30Days      /// 30天内
};
#endif /* JOBS_QUERY_TIME_TYPE_DEFINED */
/// 交易订单统一状态
#ifndef JOBS_TRANSACTION_STATUS_DEFINED
#define JOBS_TRANSACTION_STATUS_DEFINED
typedef NS_ENUM(NSInteger, JobsTransactionStatus) {
    JobsTransactionStatus_All = -1,      /// 查询全部
    JobsTransactionStatus_Processing = 0, /// 处理中
    JobsTransactionStatus_Success,       /// 成功
    JobsTransactionStatus_Failure,       /// 失败
    JobsTransactionStatus_Review    /// 审核中
};
#endif /* JOBS_TRANSACTION_STATUS_DEFINED */
/// 交易订单类型
#ifndef JOBS_TRANSACTION_TYPE_DEFINED
#define JOBS_TRANSACTION_TYPE_DEFINED
typedef NS_ENUM(NSInteger, JobsTransactionType) {
    JobsTransactionType_All = -1,             /// 查询全部
    JobsTransactionType_Deposit = 1,         /// 充值（存款）
    JobsTransactionType_Withdraw = 2,         /// 提现
    JobsTransactionType_Transfer = 3,         /// 转账
    JobsTransactionType_Rebate = 5,         /// 返水
    JobsTransactionType_Bonus = 6,            /// 红利
    JobsTransactionType_SystemAdjustment = 7, /// 系统调整
    JobsTransactionType_Live = 8              /// 直播
};
#endif /* JOBS_TRANSACTION_TYPE_DEFINED */
/// 交易类型
#ifndef JOBS_TRANSACTION_DIRECTION_DEFINED
#define JOBS_TRANSACTION_DIRECTION_DEFINED
typedef NS_ENUM(NSInteger, JobsTransactionDirection) {
    JobsTransactionDirection_Income = 0, /// 收入
    JobsTransactionDirection_Expense     /// 支出
};
#endif /* JOBS_TRANSACTION_DIRECTION_DEFINED */
#ifndef FM_WALLET_TYPE_DEFINED
#define FM_WALLET_TYPE_DEFINED
typedef NS_ENUM(NSInteger, FMWalletType) {
    FMWalletType_GCash = 1,    /// GCash
    FMWalletType_MayaPay,      /// MayaPay
    FMWalletType_GrabPay       /// GrabPay
};
#endif /* FM_WALLET_TYPE_DEFINED */
/// 提现类型
#ifndef FM_WITHDRAWAL_TYPE_DEFINED
#define FM_WITHDRAWAL_TYPE_DEFINED
typedef NS_ENUM(NSInteger, FMWithdrawalType) {
    FMWithdrawalType_BankCard = 0,   /// 银行卡提现
    FMWithdrawalType_Exclusive,      /// 专属提现
    FMWithdrawalType_USDT,           /// USDT 提现
    FMWithdrawalType_EBPay,          /// EBpay 提现
    FMWithdrawalType_EWallet         /// 电子钱包提现
};
#endif /* FM_WITHDRAWAL_TYPE_DEFINED */
/// 广告标签类型
#ifndef FM_AD_TAG_TYPE_DEFINED
#define FM_AD_TAG_TYPE_DEFINED
typedef NS_ENUM(NSInteger, FMAdTagType) {
    FMAdTagType_All = 0,             /// 全部广告
    FMAdTagType_LimitedTime,         /// 限时广告
    FMAdTagType_NewAccount,          /// 新账户广告
    FMAdTagType_Daily                /// 日常广告
};
#endif /* FM_AD_TAG_TYPE_DEFINED */



#endif /* JobsDefineAllEnumHeader_h */
