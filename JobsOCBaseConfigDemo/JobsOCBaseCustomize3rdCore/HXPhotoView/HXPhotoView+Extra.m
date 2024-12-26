//
//  HXPhotoView+Extra.m
//  FM
//
//  Created by Admin on 26/12/2024.
//

#import "HXPhotoView+Extra.h"

@implementation HXPhotoView (Extra)

+(JobsReturnHXPhotoViewByPhotoManagerBlock _Nonnull)initBy{
    return ^HXPhotoView *_Nullable(HXPhotoManager *_Nullable manager){
        return [HXPhotoView photoManager:manager];
    };
}

@end
