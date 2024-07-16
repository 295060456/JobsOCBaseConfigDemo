//
//  YTKRequest+Custom.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/2/19.
//

#import "YTKRequest+Custom.h"

@implementation YTKRequest (Custom)
/// 配置公共的请求头
-(NSMutableDictionary *)customHeaders{
    NSMutableDictionary *headers = NSMutableDictionary.dictionary;
//    headers[@"authorization"] = self.readUserInfo.token;
    headers[@"authorization"] = @"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI1ODQ4NDdiZi1iMjlhLTQwYmMtYmYyMC04YTE1NjUwMDc1MWIiLCJzdWIiOiJ7XCJiY3J5cHRQYXNzd29yZFwiOlwiJDJhJDEwJEVvQjJqZzIwajJBc2JZSkFqVmNRMi5uajAzcWRINEFQbnlDT1EyVUNza0FDZThBcmZBb3hTXCIsXCJ1c2VySWRcIjpcIjEyNFwifSIsImlzcyI6ImNhc2luby13ZWIiLCJpYXQiOjE2NDUyNjc3MzMsImV4cCI6MTY0NTI2ODAzM30.Qc_KuUzp475KxonHxL37CazFnaFlRTgiFyn9m5X0anc";// 在正式环境请求的Token
    
    NSLog(@"%@",self.readUserInfo);
    switch (self.currentLanguageType) {
        case HTTPRequestHeaderLanguageEn:{
            headers[@"language"] = @"en_US";
        }break;
        case HTTPRequestHeaderLanguageCN:{
            headers[@"language"] = @"zh_CN";
        }break;
        default:
            break;
    }return headers;
}

-(NSDictionary *)requestHeaderFieldValueDictionary {
    return self.customHeaders;
}

@end
