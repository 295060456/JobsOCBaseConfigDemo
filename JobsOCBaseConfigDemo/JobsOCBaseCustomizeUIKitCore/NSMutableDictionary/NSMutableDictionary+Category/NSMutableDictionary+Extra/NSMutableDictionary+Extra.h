//
//  NSMutableDictionary+Extra.h
//  FM
//
//  Created by User on 8/16/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsModel.h"
#import "JobsKeyValueModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (Extra)

-(JobsReturnMutableDicByKeyValueBlock _Nonnull)add;
-(JobsReturnMutableDicByDicBlock _Nonnull)addByDic;
-(JobsReturnMutableDicByKeyValueModelBlock _Nonnull)saveDataBy;
/// 打印的结果可以直接用于Postman
-(NSString *)jsonString;

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
