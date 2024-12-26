//
//  PHAssetChangeRequest+Extra.m
//  FM
//
//  Created by Admin on 26/12/2024.
//

#import "PHAssetChangeRequest+Extra.h"

@implementation PHAssetChangeRequest (Extra)
/// 对系统方法 creationRequestForAssetFromVideoAtFileURL 的二次封装
+(JobsReturnPHAssetChangeRequestByURLBlock _Nonnull)initByURL{
    return ^PHAssetChangeRequest *_Nonnull(NSURL *_Nullable url){
        return [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:url];
    };
}

@end
