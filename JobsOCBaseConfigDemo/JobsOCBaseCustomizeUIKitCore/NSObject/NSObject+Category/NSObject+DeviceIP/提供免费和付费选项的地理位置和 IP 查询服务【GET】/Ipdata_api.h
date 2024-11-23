//
//  Ipdata_api.h
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import "JobsBaseApi.h"

NS_ASSUME_NONNULL_BEGIN
/// 提供详细的IP信息@GET
/// https://api.ipdata.co/?api-key=YOUR_API_KEY
@interface Ipdata_api : JobsBaseApi

@end

NS_ASSUME_NONNULL_END
/*
 https://ipdata.co/
 
 ipdata.co 免费额度
  免费计划：每天可免费调用 1,500 次 API。
  获取密钥：需要在 ipdata.co 官方网站 注册一个免费账号后，生成 API 密钥。
 
 获取免费密钥步骤
  访问 ipdata.co 注册页面.
  注册一个账户（免费）。
  登录后，进入 API 密钥管理页面，生成一个 API 密钥。
  使用该密钥调用 API。

 */
