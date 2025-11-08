//
//  AVAssetImageGenerator+Extra.m
//  FM
//
//  Created by Admin on 26/12/2024.
//

#import "AVAssetImageGenerator+Extra.h"

@implementation AVAssetImageGenerator (Extra)

+(JobsRetAVAssetImageGeneratorByAVURLAssetBlock _Nonnull)initBy{
    @jobs_weakify(self)
    return ^__kindof AVAssetImageGenerator *_Nonnull(__kindof AVURLAsset *_Nullable data){
        @jobs_strongify(self)
        return [AVAssetImageGenerator.alloc initWithAsset:data];
    };
}

@end
