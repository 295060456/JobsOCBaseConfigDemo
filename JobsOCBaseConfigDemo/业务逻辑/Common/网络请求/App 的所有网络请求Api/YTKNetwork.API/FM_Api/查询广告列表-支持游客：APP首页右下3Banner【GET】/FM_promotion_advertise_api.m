//
//  FM_promotion_advertise_api.m
//  FM
//
//  Created by User on 9/17/24.
//

#import "FM_promotion_advertise_api.h"

@implementation FM_promotion_advertise_api
/// 请求的完整URL：查询广告列表-支持游客：APP首页右下3Banner【GET】
-(NSString *)requestUrl{
    return self.BaseUrl.add(self.get_promotion_advertise_infoP_list_appIndex.url);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end
