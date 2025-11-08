//
//  PHAssetCollectionChangeRequest+Extra.h
//  FM
//
//  Created by Admin on 26/12/2024.
//

#import <Photos/Photos.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface PHAssetCollectionChangeRequest (Extra)
/// 对系统方法 changeRequestForAssetCollection 的二次封装
+(JobsRetPHAssetCollectionChangeRequestByPHAssetCollectionBlock _Nonnull)initBy;
/// 对系统方法 creationRequestForAssetCollectionWithTitle 的二次封装
+(JobsRetPHAssetCollectionChangeRequestByStringBlock _Nonnull)initByTitle;
/// 对系统方法 addAssets 的二次封装
-(JobsRetPHAssetCollectionChangeRequestByIDBlock _Nonnull)add;

@end

NS_ASSUME_NONNULL_END
