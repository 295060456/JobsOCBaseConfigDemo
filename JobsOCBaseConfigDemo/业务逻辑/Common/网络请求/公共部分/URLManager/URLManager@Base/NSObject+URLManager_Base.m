//
//  NSObject+URLManager_Base.m
//  FM
//
//  Created by User on 10/11/24.
//

#import "NSObject+URLManager_Base.h"

@implementation NSObject (URLManager_Base)
#pragma mark —— BaseURL
-(NSString *)BaseUrl{
    switch (NetworkingEnvir()) {
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
    switch (NetworkingEnvir()) {
        case JobsNetworkingEnvir_DevEnviron:{
            /// 开发环境
            return @"https://img.sports5555.com".urlProtect;
        }break;
        case JobsNetworkingEnvir_UATEnviron:{
            /// UAT环境
            return @"https://minio.bzpicx.com".urlProtect;
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
    switch (NetworkingEnvir()) {
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
