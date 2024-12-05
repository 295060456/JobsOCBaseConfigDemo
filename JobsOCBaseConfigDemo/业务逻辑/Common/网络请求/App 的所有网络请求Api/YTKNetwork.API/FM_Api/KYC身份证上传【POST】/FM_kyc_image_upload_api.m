//
//  FM_kyc_image_upload_api.m
//  FM
//
//  Created by Admin on 5/12/2024.
//

#import "FM_kyc_image_upload_api.h"

@implementation FM_kyc_image_upload_api
/// KYC身份证上传@POST
-(NSString *)requestUrl{
    return This.BaseUrl
        .add(self.post_kyc_image_upload.url)
        .add(self.urlParameters);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

@end
