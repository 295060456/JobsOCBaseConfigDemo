//
//  PHAssetCollectionChangeRequest+Extra.m
//  FM
//
//  Created by Admin on 26/12/2024.
//

#import "PHAssetCollectionChangeRequest+Extra.h"

@implementation PHAssetCollectionChangeRequest (Extra)
/// 对系统方法 changeRequestForAssetCollection 的二次封装
+(JobsReturnPHAssetCollectionChangeRequestByPHAssetCollectionBlock _Nonnull)initBy{
    return ^__kindof PHAssetCollectionChangeRequest *_Nonnull(__kindof PHAssetCollection *_Nullable data){
        /// 请求编辑相册
        return [PHAssetCollectionChangeRequest changeRequestForAssetCollection:data];
    };
}
/// 对系统方法 creationRequestForAssetCollectionWithTitle 的二次封装
+(JobsReturnPHAssetCollectionChangeRequestByStringBlock _Nonnull)initByTitle{
    return ^__kindof PHAssetCollectionChangeRequest *_Nonnull(__kindof NSString *_Nullable data){
        return [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:data];
    };
}
/// 对系统方法 addAssets 的二次封装
-(JobsReturnPHAssetCollectionChangeRequestByIDBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^PHAssetCollectionChangeRequest *_Nullable(id<NSFastEnumeration> _Nullable data){
        @jobs_strongify(self)
        [self addAssets:data];
        return self;
    };
}

@end
