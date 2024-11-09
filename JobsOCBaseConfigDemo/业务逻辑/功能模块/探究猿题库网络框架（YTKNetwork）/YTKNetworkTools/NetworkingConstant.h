//
//  NetworkingConstant.h
//  DouYin
//
//  Created by Jobs on 2020/9/24.
//

#ifndef NetworkingConstant_h
#define NetworkingConstant_h
/// BaseURL
#ifndef SERVER_URL
#define SERVER_URL NSObject.BaseUrl
#endif /* SERVER_URL_DEFINED */
/// 服务器相关
#ifndef HTTPRequestTokenKey
#define HTTPRequestTokenKey @"token"
#endif /* HTTPRequestTokenKey */
/// 签名key
#ifndef HTTPServiceSignKey
#define HTTPServiceSignKey @"sign"
#endif /* HTTPServiceSignKey */
/// 私钥key
#ifndef HTTPServiceKey
#define HTTPServiceKey @"privatekey"
#endif /* HTTPServiceKey */
/// 私钥Value
#ifndef HTTPServiceKeyValue
#define HTTPServiceKeyValue @"/** 你的私钥 **/"
#endif /* HTTPServiceKeyValue */
/// 状态码key
#ifndef HTTPServiceResponseCodeKey
#define HTTPServiceResponseCodeKey @"code"
#endif /* HTTPServiceResponseCodeKey */
/// 消息key
#ifndef HTTPServiceResponseMsgKey
#define HTTPServiceResponseMsgKey @"msg"
#endif /* HTTPServiceResponseMsgKey */
/// 数据data
#ifndef HTTPServiceResponseDataKey
#define HTTPServiceResponseDataKey @"data"
#endif /* HTTPServiceResponseDataKey */
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

#ifndef HTTP_REQUEST_HEADER_LANGUAGE_TYPE_ENUM_DEFINED
#define HTTP_REQUEST_HEADER_LANGUAGE_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, HTTPRequestHeaderLanguageType) {
    HTTPRequestHeaderLanguageEn,/// 英文
    HTTPRequestHeaderLanguageCN,/// 中文
    HTTPRequestHeaderLanguageOther/// 其他语言
};
#endif /* HTTP_REQUEST_HEADER_LANGUAGE_TYPE_ENUM_DEFINED */

static NSString *const HTTPServiceErrorDomain = @"HTTPServiceErrorDomain";/// The Http request error domain
static NSString *const HTTPServiceErrorResponseCodeKey = @"HTTPServiceErrorResponseCodeKey";/// 请求成功，但statusCode != 0
static NSString *const HTTPServiceErrorRequestURLKey = @"HTTPServiceErrorRequestURLKey";//请求地址错误
static NSString *const HTTPServiceErrorHTTPStatusCodeKey = @"HTTPServiceErrorHTTPStatusCodeKey";//请求错误的code码key: 请求成功了，但code码是错误提示的code,比如参数错误
static NSString *const HTTPServiceErrorDescriptionKey = @"HTTPServiceErrorDescriptionKey";//请求错误，详细描述key
static NSString *const HTTPServiceErrorMessagesKey = @"HTTPServiceErrorMessagesKey";//服务端错误提示，信息key

#endif /* NetworkingConstant_h */
