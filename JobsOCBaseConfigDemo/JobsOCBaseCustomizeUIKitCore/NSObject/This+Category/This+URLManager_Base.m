//
//  This+URLManager_Base.m
//  FM
//
//  Created by Admin on 21/10/2024.
//

#import "This+URLManager_Base.h"

@implementation This (URLManager_Base)
#pragma mark —— BaseURL
+(NSString *)BaseUrl{
    switch (NetworkingEnvir()) {
        case JobsNetworkingEnvir_Dev:{
            /// 开发环境
            return @"www.sports5555.com".byHttps;
        }break;
        case JobsNetworkingEnvir_Test:{
            /// 测试环境
            return @"".byHttps;
        }break;
        case JobsNetworkingEnvir_UAT:{
            /// UAT环境
            return @"bsports.net.ph".byHttps;
        }break;
        case JobsNetworkingEnvir_Product:{
            /// 生产环境
            return @"bsports.ph".byHttps;
        }break;
        default:
            return @"".byHttps;
            break;
    }
}

+(NSString *)BaseUrl_Image{
    switch (NetworkingEnvir()) {
        case JobsNetworkingEnvir_Dev:{
            /// 开发环境
            return @"img.sports5555.com".byHttps;
        }break;
        case JobsNetworkingEnvir_Test:{
            /// 测试环境
            return @"".urlProtect;
        }break;
        case JobsNetworkingEnvir_UAT:{
            /// UAT环境
            return @"minio.bzpicx.com".byHttps;
        }break;
        case JobsNetworkingEnvir_Product:{
            /// 生产环境
            return @"p.bzpicx.com".byHttps;
        }break;
        default:
            return @"p.bzpicx.com".byHttps;
            break;
    }
}

+(NSString *)BaseUrl_H5{
    switch (NetworkingEnvir()) {
        case JobsNetworkingEnvir_Dev:{
            /// 开发环境
            return @"".byHttps;
        }break;
        case JobsNetworkingEnvir_Test:{
            /// 测试环境
            return @"".byHttps;
        }break;
        case JobsNetworkingEnvir_UAT:{
            /// UAT环境
            return @"".byHttps;
        }break;
        case JobsNetworkingEnvir_Product:{
            /// 生产环境
            return @"".byHttps;
        }break;
        default:
            return @"".byHttps;
            break;
    }
}
#pragma mark —— App接口示例
+(URLManagerModel *)appInterfaceTesting{
    return JobsURL(@"http://172.24.135.14:8000/Downloads/CommentData.json") /// @"http://172.24.135.12/CommentData.json"
}

@end
