//
//  PHCollectionList+Extra.h
//  FM
//
//  Created by Admin on 26/12/2024.
//

#import <Photos/Photos.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface PHCollectionList (Extra)
/// 对系统方法 fetchTopLevelUserCollectionsWithOptions 的二次封装
+(JobsRetPHFetchResultWithPHCollectionByPHFetchOptionsBlock _Nonnull)initByOptions;

@end

NS_ASSUME_NONNULL_END
