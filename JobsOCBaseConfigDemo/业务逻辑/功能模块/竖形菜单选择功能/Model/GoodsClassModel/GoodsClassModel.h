//
//  GoodsClassModel.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/15.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "AppToolsProtocol.h"
#import "BaseModel.h"
#import "BaseButtonProtocol.h"

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface GoodsClassModel : BaseModel <AppToolsProtocol,BaseButtonProtocol>

Prop_copy()NSString *idField;
Prop_copy()NSString *pid;
Prop_copy()NSString *name;
Prop_copy()NSString *level;
Prop_copy()NSString *indexs;
Prop_copy()NSString *iconUrl;
Prop_copy()NSString *showUrl;
Prop_copy()NSString *productUrl;
Prop_copy()NSMutableArray <GoodsClassModel *>*childrenList;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof GoodsClassModel *_Nonnull jobsMakeGoodsClassModel(jobsByGoodsClassModelBlock _Nonnull block){
    GoodsClassModel *data = GoodsClassModel.alloc.init;
    if (block) block(data);
    return data;
}
