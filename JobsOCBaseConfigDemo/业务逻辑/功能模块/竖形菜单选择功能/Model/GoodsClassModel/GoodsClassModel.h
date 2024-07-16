//
//  GoodsClassModel.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/15.
//

#import <Foundation/Foundation.h>
#import "UIViewModel.h"

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface GoodsClassModel : UIViewModel

@property(nonatomic,strong)NSString *idField;
@property(nonatomic,strong)NSString *pid;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *level;
@property(nonatomic,strong)NSString *indexs;
@property(nonatomic,strong)NSString *iconUrl;
@property(nonatomic,strong)NSString *showUrl;
@property(nonatomic,strong)NSString *productUrl;
@property(nonatomic,strong)NSMutableArray<GoodsClassModel *> *childrenList;

@end

NS_ASSUME_NONNULL_END
