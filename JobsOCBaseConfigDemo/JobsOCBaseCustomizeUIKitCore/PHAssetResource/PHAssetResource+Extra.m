//
//  PHAssetResource+Extra.m
//  FM
//
//  Created by Admin on 26/12/2024.
//

#import "PHAssetResource+Extra.h"

@implementation PHAssetResource (Extra)

+(JobsRetArrayByPHAssetBlock _Nonnull)initBy{
    return ^__kindof NSArray <PHAssetResource *>*_Nonnull(__kindof PHAsset *_Nullable data){
        return [PHAssetResource assetResourcesForAsset:data];
    };
}

@end
