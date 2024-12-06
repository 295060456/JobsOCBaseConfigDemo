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

@property(nonatomic,strong)__kindof UIViewController *vc;
@property(nonatomic,strong)HXCustomCameraViewController *customCameraVC;
@property(nonatomic,strong)HXPhotoManager *photoManager;
@property(nonatomic,strong)HXPhotoModel *photoModel;
@property(nonatomic,assign)BOOL isOriginal;
@property(nonatomic,strong)NSArray<HXPhotoModel *> *allList;
@property(nonatomic,strong)NSArray<HXPhotoModel *> *photoList;
@property(nonatomic,strong)NSArray<HXPhotoModel *> *videoList;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof HXPhotoPickerModel *_Nonnull jobsMakeHXPhotoPickerModel(jobsByHXPhotoPickerModelBlock _Nonnull block){
    HXPhotoPickerModel *model = HXPhotoPickerModel.alloc.init;
    if (block) block(model);
    return model;
}
