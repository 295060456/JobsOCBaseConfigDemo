//
//  FM_GetKYCInfo_api.m
//  FM
//
//  Created by User on 10/10/24.
//

#import "FM_GetKYCInfo_api.h"

@implementation FM_GetKYCInfo_api
/// 请求的完整URL：获取会员KYC信息【GET】
-(NSString *)requestUrl{
    return self.BaseUrl
        .add(self.get_kyc_info.url)
        .add(self.urlParameters);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}
/// 在链式请求中，下一个请求的参数来源于上一个请求的结果
-(NSString *_Nonnull)kyc{
    return [[self.responseJSONObject objectForKey:@"kycStatus"] stringValue] ? : JobsInternationalization(@"");
}

@end
