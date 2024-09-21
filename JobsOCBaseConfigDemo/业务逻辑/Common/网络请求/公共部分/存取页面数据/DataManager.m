//
//  DataManager.m
//  ZBNetworkingDemo
//
//  Created by Suzhibin on 2020/1/19.
//  Copyright © 2020 Suzhibin. All rights reserved.
//

#import "DataManager.h"

@interface DataManager()

@property(nonatomic,strong)NSMutableDictionary *dataInfo;

@end

@implementation DataManager
/// 数据管理对象单例
+(instancetype)sharedInstance{
    static DataManager *sharedManager = nil;
    @synchronized(self){
        if (!sharedManager) {
            sharedManager = DataManager.new;
        }
    }return sharedManager;
}
/// 保存页面数据
-(void)saveDataInfo:(__kindof NSDictionary *)info
                key:(NSString *)key {
    if(!_dataInfo.count) return;
    if(!info.count) return;
    if(isNull(key)) return;
    _dataInfo.saveDataBy(info.dataByKey(key));
}
/// 根据menuId获取相应页面的数据
-(NSDictionary *)dataInfoWithKey:(NSString *)key {
    return [_dataInfo objectForKey:key];
}
#pragma mark —— lazyLoad
-(NSMutableDictionary *)dataInfo{
    if(!_dataInfo){
        _dataInfo = NSMutableDictionary.dictionary;
    }return _dataInfo;
}

@end
