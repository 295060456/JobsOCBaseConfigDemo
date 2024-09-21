//
//  FM_promotion_ad_api.m
//  FM
//
//  Created by User on 9/18/24.
//

#import "FM_promotion_ad_api.h"

@implementation FM_promotion_ad_api
/// 请求的完整URL：查询广告列表-支持游客:活动推广专区【GET】
-(NSString *)requestUrl{
    return self.BaseUrl.add(self.get_promotion_advertise_info_list_activity.url);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end
