//
//  PHAssetChangeRequest+Extra.h
//  FM
//
//  Created by Admin on 26/12/2024.
//

#import <Photos/Photos.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface PHAssetChangeRequest (Extra)
/// 对系统方法 creationRequestForAssetFromVideoAtFileURL 的二次封装
+(JobsReturnPHAssetChangeRequestByURLBlock _Nonnull)initByURL;

@end

NS_ASSUME_NONNULL_END
