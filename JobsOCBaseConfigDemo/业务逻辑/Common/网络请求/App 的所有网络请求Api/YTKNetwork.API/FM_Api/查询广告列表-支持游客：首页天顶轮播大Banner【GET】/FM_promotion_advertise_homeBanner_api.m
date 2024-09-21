//
//  FM_promotion_advertise_homeBanner_api.m
//  FM
//
//  Created by User on 9/17/24.
//

#import "FM_promotion_advertise_homeBanner_api.h"

@implementation FM_promotion_advertise_homeBanner_api
/// 请求的完整URL：查询广告列表-支持游客：首页天顶轮播大Banner【GET】
-(NSString *)requestUrl{
    return self.BaseUrl.add(self.get_promotion_advertise_info_list_index.url);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end
