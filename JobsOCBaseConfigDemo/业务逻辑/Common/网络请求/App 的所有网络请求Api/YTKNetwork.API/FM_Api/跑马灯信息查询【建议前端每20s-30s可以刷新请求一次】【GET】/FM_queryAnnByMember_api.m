//
//  FM_queryAnnByMember_api.m
//  FM
//
//  Created by User on 9/21/24.
//

#import "FM_queryAnnByMember_api.h"

@implementation FM_queryAnnByMember_api
/// 请求的完整URL：查询广告列表-支持游客:活动推广专区【GET】
-(NSString *)requestUrl{
    return self.BaseUrl.add(self.get_operation_announce_config_queryAnnByMember.url);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end
