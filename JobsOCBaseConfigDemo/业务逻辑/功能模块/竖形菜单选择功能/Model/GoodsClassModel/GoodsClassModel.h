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

@property(nonatomic,copy)NSString *idField;
@property(nonatomic,copy)NSString *pid;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *level;
@property(nonatomic,copy)NSString *indexs;
@property(nonatomic,copy)NSString *iconUrl;
@property(nonatomic,copy)NSString *showUrl;
@property(nonatomic,copy)NSString *productUrl;
@property(nonatomic,strong)NSMutableArray<GoodsClassModel *> *childrenList;

@end

NS_ASSUME_NONNULL_END
