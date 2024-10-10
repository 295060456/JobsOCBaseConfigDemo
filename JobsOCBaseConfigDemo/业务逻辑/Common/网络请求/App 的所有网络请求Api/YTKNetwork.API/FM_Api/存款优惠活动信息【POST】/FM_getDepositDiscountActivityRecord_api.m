//
//  FM_getDepositDiscountActivityRecord_api.m
//  FM
//
//  Created by User on 10/8/24.
//

#import "FM_getDepositDiscountActivityRecord_api.h"

@implementation FM_getDepositDiscountActivityRecord_api
/// 请求的完整URL：存款优惠活动信息【POST】
-(NSString *)requestUrl{
    return self.BaseUrl
        .add(self.post_promotion_api_client_activity_getDepositDiscountActivityRecord.url)
        .add(self.urlParameters);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

@end
