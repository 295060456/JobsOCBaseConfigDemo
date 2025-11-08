//
//  PHAsset+Extra.m
//  FM
//
//  Created by Admin on 26/12/2024.
//

#import "PHAsset+Extra.h"

@implementation PHAsset (Extra)
/// 对系统方法 fetchAssetsWithOptions 的二次封装
+(JobsRetPHFetchResultWithPHAssetByPHFetchOptionsBlock _Nonnull)initByOptions{
    return ^__kindof PHFetchResult<PHAsset *> *_Nonnull(__kindof PHFetchOptions *_Nullable options){
        return [PHAsset fetchAssetsWithOptions:options];
    };
}

@end
