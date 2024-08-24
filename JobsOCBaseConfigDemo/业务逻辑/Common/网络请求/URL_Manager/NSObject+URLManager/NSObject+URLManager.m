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

//JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_DevEnviron_Cambodia_Main;/// 柬埔寨（主要）开发环境
JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_DevEnviron_Cambodia_Minor;/// 柬埔寨（次要）开发环境
//JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_DevEnviron_China_Mainland;/// 中国大陆开发环境
//JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_TestEnviron;/// 测试环境
//JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_ProductEnviron;/// 生产环境
//JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_UATEnviron;/// UAT环境

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
    switch (networkingEnvir) {
        case JobsNetworkingEnvir_DevEnviron_Cambodia_Main:{
            /// 柬埔寨（主要）开发环境
            return @"http://okeexx.cn:9200".urlProtect;
//            return @"154.204.57.237:9200";
//            return @"192.168.10.77:9200";
        }break;
        case JobsNetworkingEnvir_DevEnviron_Cambodia_Minor:{
            /// 柬埔寨的开发环境(次要)，因为某些代码未合并，柬埔寨的开发环境临时用测试环境替代
            return @"http://116.212.138.46:9200".urlProtect;
        }break;
        case JobsNetworkingEnvir_DevEnviron_China_Mainland:{
            /// 中国大陆开发环境
            return @"http://47.243.60.31:9200".urlProtect;
        }break;
        case JobsNetworkingEnvir_TestEnviron:{
            /// 测试环境
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

-(NSString *)BaseUrl_H5{
    switch (networkingEnvir) {
        case JobsNetworkingEnvir_DevEnviron_Cambodia_Main:{
            /// 柬埔寨（主要）开发环境
            return @"";
        }break;
        case JobsNetworkingEnvir_DevEnviron_Cambodia_Minor:{
            /// 柬埔寨的开发环境(次要)，因为某些代码未合并，柬埔寨的开发环境临时用测试环境替代
            return @"";
        }break;
        case JobsNetworkingEnvir_DevEnviron_China_Mainland:{
            /// 中国大陆开发环境
            return @"";
        }break;
        case JobsNetworkingEnvir_TestEnviron:{
            /// 测试环境
            return @"";
        }break;
        case JobsNetworkingEnvir_ProductEnviron:{
            /// 生产环境
            return @"";
        }break;
        default:
            return @"";
            break;
    }
}
#pragma mark —— App接口示例
-(URLManagerModel *)appInterfaceTesting{
    /// @"http://172.24.135.12/CommentData.json"
    return JobsURL(@"http://172.24.135.14:8000/Downloads/CommentData.json")
}
#pragma mark —— GoldenF游戏厅
/// 查询当前登录用户PG/CQ9余额
-(URLManagerModel *)goldenFGetBalanceGET{
    return JobsURL(@"​/golednf​/getBalance")
}
/// 查询WM,PG,CQ9维护状态的游戏
-(URLManagerModel *)goldenFMaintenanceGameListGET{
    return JobsURL(@"​​​/golednf​/maintenanceGameList");
}

@end
