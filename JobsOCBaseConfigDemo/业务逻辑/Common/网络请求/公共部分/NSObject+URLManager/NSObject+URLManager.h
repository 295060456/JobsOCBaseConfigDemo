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
/// 用户登出【POST】
-(URLManagerModel *)post_user_auth_logout;
/// 查询广告列表-支持游客:APP首页右下3Banner【GET】
-(URLManagerModel *)get_promotion_advertise_infoP_list_appIndex;

@end

NS_ASSUME_NONNULL_END
