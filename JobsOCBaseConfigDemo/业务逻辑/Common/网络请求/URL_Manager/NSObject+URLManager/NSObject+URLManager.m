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

JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_DevEnviron;/// 开发环境
//JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_UATEnviron;/// UAT环境
//JobsNetworkingEnvir networkingEnvir = JobsNetworkingEnvir_ProductEnviron;/// 生产环境

/// 域名列表：
/// https://docs.google.com/spreadsheets/d/1Iijk6KwNVXMhuu5VeQXaWZhXogKnuj1Ms1V6dWmz_ik/edit?gid=0#gid=0
/// 体育接口文档：
/// http://16.163.191.190:8093/doc.html
/// http://16.163.191.190:8097/doc.html
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
    switch (networkingEnvir) {
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
    switch (networkingEnvir) {
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
    switch (networkingEnvir) {
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

@end
