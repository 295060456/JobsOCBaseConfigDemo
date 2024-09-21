//
//  FM_game_home_popularGames_query_api.m
//  FM
//
//  Created by User on 8/25/24.
//

#import "FM_game_home_popularGames_query_api.h"

@implementation FM_game_home_popularGames_query_api
/// 请求的完整URL：菲站首页- 受欢迎的游戏列表查询【POST】
-(NSString *)requestUrl{
    return self.BaseUrl.add(self.post_game_home_popularGames_query.url);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

@end
