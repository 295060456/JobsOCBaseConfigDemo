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

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface GoodsClassModel : BaseModel <AppToolsProtocol>

@property(nonatomic,copy)NSString *idField;
@property(nonatomic,copy)NSString *pid;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *level;
@property(nonatomic,copy)NSString *indexs;
@property(nonatomic,copy)NSString *iconUrl;
@property(nonatomic,copy)NSString *showUrl;
@property(nonatomic,copy)NSString *productUrl;
@property(nonatomic,strong)NSMutableArray <GoodsClassModel *>*childrenList;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof GoodsClassModel *_Nonnull jobsMakeGoodsClassModel(jobsByGoodsClassModelBlock _Nonnull block){
    GoodsClassModel *data = GoodsClassModel.alloc.init;
    if (block) block(data);
    return data;
}
