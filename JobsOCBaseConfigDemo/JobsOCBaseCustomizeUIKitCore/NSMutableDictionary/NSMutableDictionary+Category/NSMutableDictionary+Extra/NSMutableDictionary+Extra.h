//
//  NSMutableDictionary+Extra.h
//  FM
//
//  Created by User on 8/16/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsModel.h"

NS_INLINE __kindof NSMutableDictionary *_Nonnull jobsMakeMutDic(jobsByMutableDictionarycBlock _Nonnull block){
    NSMutableDictionary *data = NSMutableDictionary.dictionary;
    if (block) block(data);
    return data;
}

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (Extra)

-(jobsKeyValueBlock _Nonnull)add;
-(jobsByIDBlock _Nonnull)saveDataBy;

@end

NS_ASSUME_NONNULL_END
/**
 /// 保存页面数据
 -(void)saveDataInfo:(__kindof NSDictionary *)info
                 key:(NSString *)key {
     
     if(!_dataInfo.count) return;
     if(!info.count) return;
     if(isNull(key)) return;
     
     _dataInfo.saveDataBy(info.dataByKey(key));
 }
 */
