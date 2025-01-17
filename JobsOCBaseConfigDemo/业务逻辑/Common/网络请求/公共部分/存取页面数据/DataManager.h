//
//  DataManager.h
//  ZBNetworkingDemo
//
//  Created by Suzhibin on 2020/1/19.
//  Copyright © 2020 Suzhibin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject

@property(nonatomic,copy)NSString *cacheKey;
@property(nonatomic,copy)NSString *tag;
/// 数据管理对象单例
+(instancetype)sharedManager;
/// 保存页面数据
-(void)saveDataInfo:(NSDictionary *)info key:(NSString *)key;
/// 根据menuId获取相应页面的数据
-(NSDictionary *)dataInfoWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
