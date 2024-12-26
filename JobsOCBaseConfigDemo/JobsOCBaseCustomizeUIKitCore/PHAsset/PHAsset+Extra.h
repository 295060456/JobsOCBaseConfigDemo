//
//  PHAsset+Extra.h
//  FM
//
//  Created by Admin on 26/12/2024.
//

#import <Photos/Photos.h> 
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface PHAsset (Extra)
/// 对系统方法 fetchAssetsWithOptions 的二次封装
+(JobsReturnPHFetchResultWithPHAssetByPHFetchOptionsBlock _Nonnull)initByOptions;

@end

NS_ASSUME_NONNULL_END
