//
//  NSObject+URLManager.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/12/10.
//  Copyright © 2020 MonkeyKingVideo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLManagerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (URLManager)

#pragma mark —— BaseURL
-(NSString *)BaseUrl;
-(NSString *)BaseUrl_H5;
#pragma mark —— App接口示例
-(URLManagerModel *)appInterfaceTesting;
#pragma mark —— GoldenF游戏厅
/// 查询当前登录用户PG/CQ9余额
-(URLManagerModel *)goldenFGetBalanceGET;
/// 查询WM,PG,CQ9维护状态的游戏
-(URLManagerModel *)goldenFMaintenanceGameListGET;

@end

NS_ASSUME_NONNULL_END

