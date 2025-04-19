//
//  HXPhotoPickerModel.h
//  FM
//
//  Created by Admin on 6/12/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

#if __has_include(<HXPhotoPicker/HXPhotoPicker.h>)
#import <HXPhotoPicker/HXPhotoPicker.h>
#else
#import "HXPhotoPicker.h"
#endif

@class HXCustomCameraViewController;

NS_ASSUME_NONNULL_BEGIN

@interface HXPhotoPickerModel : NSObject

Prop_strong()__kindof UIViewController *vc;
Prop_strong()HXCustomCameraViewController *customCameraVC;
Prop_strong()HXPhotoManager *photoManager;
Prop_strong()HXPhotoModel *photoModel;
Prop_assign()BOOL isOriginal;
Prop_strong()NSArray<HXPhotoModel *> *allList;
Prop_strong()NSArray<HXPhotoModel *> *photoList;
Prop_strong()NSArray<HXPhotoModel *> *videoList;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof HXPhotoPickerModel *_Nonnull jobsMakeHXPhotoPickerModel(jobsByHXPhotoPickerModelBlock _Nonnull block){
    HXPhotoPickerModel *model = HXPhotoPickerModel.alloc.init;
    if (block) block(model);
    return model;
}
