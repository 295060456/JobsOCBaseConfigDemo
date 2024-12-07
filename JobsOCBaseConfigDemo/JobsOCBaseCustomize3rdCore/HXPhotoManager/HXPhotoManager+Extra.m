//
//  HXPhotoManager+Extra.m
//  FM
//
//  Created by Admin on 7/12/2024.
//

#import "HXPhotoManager+Extra.h"

@implementation HXPhotoManager (Extra)

+(JobsReturnHXPhotoManagerByNSUIntegerBlock _Nonnull)initByType{
    return ^__kindof HXPhotoManager *_Nonnull(HXPhotoManagerSelectedType type){
        return [HXPhotoManager.alloc initWithType:type];
    };
}
/// 只显示图片
+(HXPhotoManager *)initByTypePhoto{
    return HXPhotoManager.initByType(HXPhotoManagerSelectedTypePhoto);
}
/// 只显示视频
+(HXPhotoManager *)initByTypeVideo{
    return HXPhotoManager.initByType(HXPhotoManagerSelectedTypeVideo);
}
/// 图片和视频一起显示
+(HXPhotoManager *)initByTypePhotoAndVideo{
    return HXPhotoManager.initByType(HXPhotoManagerSelectedTypePhotoAndVideo);
}

@end
