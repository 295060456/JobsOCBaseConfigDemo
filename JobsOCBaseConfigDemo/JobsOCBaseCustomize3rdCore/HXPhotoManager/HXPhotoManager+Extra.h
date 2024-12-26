//
//  HXPhotoManager+Extra.h
//  FM
//
//  Created by Admin on 7/12/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

#if __has_include(<HXPhotoPicker/HXPhotoPicker.h>)
#import <HXPhotoPicker/HXPhotoPicker.h>
#else
#import "HXPhotoPicker.h"
#endif

@class HXPhotoConfiguration;

NS_ASSUME_NONNULL_BEGIN

@interface HXPhotoManager (Extra)

+(JobsReturnHXPhotoManagerByNSUIntegerBlock _Nonnull)initByType;
/// 只显示图片
+(HXPhotoManager *)initByTypePhoto;
/// 只显示视频
+(HXPhotoManager *)initByTypeVideo;
/// 图片和视频一起显示
+(HXPhotoManager *)initByTypePhotoAndVideo;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof HXPhotoConfiguration *_Nonnull jobsMakeHXPhotoConfiguration(jobsByHXPhotoConfigurationBlock _Nonnull block){
    HXPhotoConfiguration *data = HXPhotoConfiguration.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof HXPhotoManager *_Nonnull jobsMakeHXPhotoManagerBySelectedTypePhoto(jobsByHXPhotoManagerBlock _Nonnull block){
    HXPhotoManager *data = HXPhotoManager.initByTypePhoto;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof HXPhotoManager *_Nonnull jobsMakeHXPhotoManagerBySelectedTypeVideo(jobsByHXPhotoManagerBlock _Nonnull block){
    HXPhotoManager *data = HXPhotoManager.initByTypeVideo;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof HXPhotoManager *_Nonnull jobsMakeHXPhotoManagerBySelectedTypePhotoAndVideo(jobsByHXPhotoManagerBlock _Nonnull block){
    HXPhotoManager *data = HXPhotoManager.initByTypePhotoAndVideo;
    if (block) block(data);
    return data;
}
