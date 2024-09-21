//
//  FM_kyc_submit_api.m
//  FM
//
//  Created by User on 9/13/24.
//

#import "FM_kyc_submit_api.h"

@implementation FM_kyc_submit_api
/// 请求的完整URL：游戏大厅喜爱的游戏-删除【POST】
-(NSString *)requestUrl{
    return self.BaseUrl.add(self.post_kyc_submit.url);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

@end
