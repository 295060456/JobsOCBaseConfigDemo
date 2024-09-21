//
//  FM_favoriteGames_delete_api.m
//  FM
//
//  Created by User on 9/11/24.
//

#import "FM_favoriteGames_delete_api.h"

@implementation FM_favoriteGames_delete_api
/// 请求的完整URL：游戏大厅喜爱的游戏-删除【POST】
-(NSString *)requestUrl{
    return self.BaseUrl.add(self.post_game_home_favoriteGames_delete.url);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

@end
