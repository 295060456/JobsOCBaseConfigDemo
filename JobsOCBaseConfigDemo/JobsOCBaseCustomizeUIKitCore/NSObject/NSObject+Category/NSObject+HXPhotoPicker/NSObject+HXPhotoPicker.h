//
//  NSObject+HXPhotoPicker.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/20.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "TKPermissionKit.h"
#import "MacroDef_Strong@Weak.h"
#import "NSObject+WHToast.h"
#import "NSObject+CurrentDevice.h"
#import "UIViewController+HXExtension.h"
#import "HXPhotoPickerModel.h"

#if __has_include(<HXPhotoPicker/HXPhotoPicker.h>)
#import <HXPhotoPicker/HXPhotoPicker.h>
#else
#import "HXPhotoPicker.h"
#endif

#if __has_include(<WHToast/WHToast.h>)
#import <WHToast/WHToast.h>
#else
#import "WHToast.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (HXPhotoPicker)
<
HXCustomNavigationControllerDelegate
,UIImagePickerControllerDelegate
,UINavigationControllerDelegate
>

@property(nonatomic,strong)HXPhotoManager *photoManager;//选取图片的数据管理类
@property(nonatomic,strong)NSMutableArray <HXPhotoModel *>*historyPhotoDataMutArr;/// 与之相对应的是self.photoManager.afterSelectedArray
@property(nonatomic,strong)NSMutableArray <HXPhotoModel *>*photosDataMutArr;
@property(nonatomic,strong)NSMutableArray <HXPhotoModel *>*videosDataMutArr;
/// HXPhotoPicker 弹出系统相册选择页面
-(void)hx_invokeSysPhotoAlbumSuccessBlock:(jobsByIDBlock _Nullable)successBlock
                                failBlock:(jobsByIDBlock _Nullable)failBlock;
/// HXPhotoPicker 调取系统相机进行拍摄
-(void)hx_invokeSysCameraSuccessBlock:(jobsByIDBlock _Nullable)successBlock
                            failBlock:(jobsByIDBlock _Nullable)failBlock;
/// 调取系统相机进行拍摄
-(jobsByVoidBlock _Nonnull)invokeSysCamera;

@end

NS_ASSUME_NONNULL_END
