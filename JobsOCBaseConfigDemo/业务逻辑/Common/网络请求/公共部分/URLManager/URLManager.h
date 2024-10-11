//
//  URLManager.h
//  FM
//
//  Created by User on 10/11/24.
//

#ifndef URLManager_h
#define URLManager_h
/// 域名列表：
/// https://docs.google.com/spreadsheets/d/1Iijk6KwNVXMhuu5VeQXaWZhXogKnuj1Ms1V6dWmz_ik/edit?gid=0#gid=0
/// 体育接口文档：
/// http://16.163.191.190:8093/doc.html
/// http://16.163.191.190:8100/api/promotion/doc.html
/// http://16.163.191.190:8097/doc.html
/// http://16.163.191.190:8099/doc.html
/// http://16.163.191.190:8193/doc.html#/default/
/// http://16.163.191.190:9201/doc.html#/default/%E5%BB%A3%E5%91%8A%E7%AE%A1%E7%90%86%E6%8E%A5%E5%8F%A3/addUsingPOST_1
/// 接口文档会因为后端开发而同步，使用时务必进行确认

NS_INLINE JobsNetworkingEnvir networkingEnvir(NSInteger data) {
    static JobsNetworkingEnvir _networkingEnvir = JobsNetworkingEnvir_Undefined; // 静态变量仅初始化一次
    switch (data) {
        case JobsNetworkingEnvir_DevEnviron:
            _networkingEnvir = JobsNetworkingEnvir_DevEnviron; /// 开发环境
            break;
        case JobsNetworkingEnvir_UATEnviron:
            _networkingEnvir = JobsNetworkingEnvir_UATEnviron; /// UAT环境
            break;
        case JobsNetworkingEnvir_ProductEnviron:
            _networkingEnvir = JobsNetworkingEnvir_ProductEnviron; /// 生产环境
            break;
        default:
            _networkingEnvir = JobsNetworkingEnvir_Undefined; /// 未定义的网络环境
            break;
    }
    return _networkingEnvir;
}

NS_INLINE JobsNetworkingEnvir NetworkingEnvir(void) {
//    static JobsNetworkingEnvir _networkingEnvir =  JobsNetworkingEnvir_DevEnviron;/// 开发环境
    static JobsNetworkingEnvir _networkingEnvir =  JobsNetworkingEnvir_UATEnviron;/// UAT环境
//    static JobsNetworkingEnvir _networkingEnvir =  JobsNetworkingEnvir_ProductEnviron;/// 生产环境
//    static JobsNetworkingEnvir _networkingEnvir =  JobsNetworkingEnvir_Undefined;/// 未定义的网络环境
    return _networkingEnvir;
}

#import "JobsDefineAllEnumHeader.h"

#ifndef JobsURL
#define JobsURL(URL) [NSObject url:(URL) funcName:NSStringFromSelector(_cmd)];
#endif /* JobsURL */

#import "NSObject+URLManager_Base.h"
#import "NSObject+URLManager_1.h"
#import "NSObject+URLManager_2.h"
#import "NSObject+URLManager_3.h"
#import "NSObject+URLManager_4.h"
#import "NSObject+URLManager_5.h"
#import "NSObject+URLManager_6.h"
/**
 【开发环境】
 用户名：Jobs295060456
 电话号码：09668536375
 验证码：888
 密码：Jobs123456
 
 【开发环境】
 用户名：dev028
 电话号码：55555445576
 验证码：888
 密码：123456

 【UAT】
 用户名：dev023
 电话号码：77255445233
 验证码： 888
 密码：123456
 */

#endif /* URLManager_h */
