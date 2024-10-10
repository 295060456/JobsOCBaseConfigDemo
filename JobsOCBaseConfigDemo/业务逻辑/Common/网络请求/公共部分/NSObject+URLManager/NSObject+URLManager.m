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

JobsNetworkingEnvir _networkingEnvir = JobsNetworkingEnvir_Undefined; // 全局变量的定义
inline JobsNetworkingEnvir NetworkingEnvir(void) {
//    _networkingEnvir =  JobsNetworkingEnvir_DevEnviron;/// 开发环境
    _networkingEnvir =  JobsNetworkingEnvir_UATEnviron;/// UAT环境
//    _networkingEnvir =  JobsNetworkingEnvir_ProductEnviron;/// 生产环境
//    _networkingEnvir =  JobsNetworkingEnvir_Undefined;/// 未定义的网络环境
    return _networkingEnvir;
}
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
    switch (_networkingEnvir) {
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
    switch (_networkingEnvir) {
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
    switch (_networkingEnvir) {
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
/// 用户登出【POST】
-(URLManagerModel *)post_user_auth_logout{
    return JobsURL(@"/api/user/auth/logout");
}
/// 查询广告列表-支持游客:APP首页右下3Banner【GET】
-(URLManagerModel *)get_promotion_advertise_infoP_list_appIndex{
    return JobsURL(@"/api/promotion/advertise/info/list/app-index");
}
/// 存款优惠活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getDepositDiscountActivityRecord{
    return JobsURL(@"/api/promotion/api/client/activity/getDepositDiscountActivityRecord");
}

@end
