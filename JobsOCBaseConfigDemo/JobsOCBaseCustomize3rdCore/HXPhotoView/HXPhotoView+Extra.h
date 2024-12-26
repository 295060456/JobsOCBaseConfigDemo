//
//  HXPhotoView+Extra.h
//  FM
//
//  Created by Admin on 26/12/2024.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

#if __has_include(<HXPhotoPicker/HXPhotoPicker.h>)
#import <HXPhotoPicker/HXPhotoPicker.h>
#else
#import "HXPhotoPicker.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface HXPhotoView (Extra)

+(JobsReturnHXPhotoViewByPhotoManagerBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END

//initBy
