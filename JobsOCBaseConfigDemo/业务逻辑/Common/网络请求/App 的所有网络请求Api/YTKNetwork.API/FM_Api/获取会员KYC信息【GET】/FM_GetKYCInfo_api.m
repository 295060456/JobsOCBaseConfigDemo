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
    return This.BaseUrl
        .add(self.get_kyc_info.url)
        .add(self.urlParameters);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}
/// 在链式请求中，下一个请求的参数来源于上一个请求的结果
-(NSString *_Nonnull)kyc{
    JobsResponseModel *responseModel = JobsResponseModel.byData(self.responseObject);
//    KYVModel *data = KYVModel.byData(responseModel.data);
//    return toStringByNSInteger(data.kycStatus);
    return @"";
}

@end
