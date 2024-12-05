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
/// http://16.163.191.190:8093/doc.html （URLManager@1）
/// http://16.163.191.190:8100/api/promotion/doc.html （URLManager@2）
/// http://16.163.191.190:8097/doc.html （URLManager@3）
/// http://16.163.191.190:8099/doc.html （URLManager@4）
/// http://16.163.191.190:8193/doc.html#/default/
/// http://16.163.191.190:9201/doc.html#/default/%E5%BB%A3%E5%91%8A%E7%AE%A1%E7%90%86%E6%8E%A5%E5%8F%A3/addUsingPOST_1
/// https://docs.google.com/spreadsheets/d/19VaLjdQpYvGk_Gcfng5KhRXa9MxALuKGpNy9_3qGh4A/edit?gid=833582610#gid=833582610
/// 接口文档会因为后端开发而同步，使用时务必进行确认
NS_INLINE JobsNetworkingEnvir NetworkingEnvir(void) {
//    static JobsNetworkingEnvir _networkingEnvir =  JobsNetworkingEnvir_Dev;/// 开发环境
//    static JobsNetworkingEnvir _networkingEnvir =  JobsNetworkingEnvir_Test;/// 测试环境
    static JobsNetworkingEnvir _networkingEnvir =  JobsNetworkingEnvir_UAT;/// UAT环境
//    static JobsNetworkingEnvir _networkingEnvir =  JobsNetworkingEnvir_Product;/// 生产环境
//    static JobsNetworkingEnvir _networkingEnvir =  JobsNetworkingEnvir_Undefined;/// 未定义的网络环境
    return _networkingEnvir;
}

NS_INLINE JobsNetworkingEnvir networkingEnvir(NSInteger data) {
    static JobsNetworkingEnvir _networkingEnvir = JobsNetworkingEnvir_Undefined; // 静态变量仅初始化一次
    switch (data) {
        case JobsNetworkingEnvir_Dev:
            _networkingEnvir = JobsNetworkingEnvir_Dev; /// 开发环境
            break;
        case JobsNetworkingEnvir_Test:
            _networkingEnvir = JobsNetworkingEnvir_UAT; /// 测试环境
            break;
        case JobsNetworkingEnvir_UAT:
            _networkingEnvir = JobsNetworkingEnvir_UAT; /// UAT环境
            break;
        case JobsNetworkingEnvir_Product:
            _networkingEnvir = JobsNetworkingEnvir_Product; /// 生产环境
            break;
        default:
            _networkingEnvir = JobsNetworkingEnvir_Undefined; /// 未定义的网络环境
            break;
    }return _networkingEnvir;
}

#import "JobsDefineAllEnumHeader.h"

#ifndef JobsURL
#define JobsURL(URL) [NSObject url:(URL) funcName:NSStringFromSelector(_cmd)];
#endif /* JobsURL */

#import "This+URLManager_Base.h"
#import "NSObject+URLManager_1.h"
#import "NSObject+URLManager_2.h"
#import "NSObject+URLManager_3.h"
#import "NSObject+URLManager_4.h"
#import "NSObject+URLManager_5.h"
#import "NSObject+URLManager_6.h"
#import "NSObject+URLManager_7.h"

#endif /* URLManager_h */
