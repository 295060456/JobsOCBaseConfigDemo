//
//  NSObject+HXPhotoPicker.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/20.
//

#import "NSObject+HXPhotoPicker.h"

@implementation NSObject (HXPhotoPicker)
#pragma mark —— 一些公有方法
/// HXPhotoPicker 弹出系统相册选择页面
-(void)hx_invokeSysPhotoAlbumSuccessBlock:(jobsByIDBlock _Nullable)successBlock
                                failBlock:(jobsByIDBlock _Nullable)failBlock{
    /// 请求相册权限
    @jobs_weakify(self)
    [TKPermissionPhoto authWithAlert:YES
                               level:TKPhotoAccessLevelReadWrite
                          completion:^(BOOL granted) {
        @jobs_strongify(self)
        if (granted) {
            UIViewController *viewController = nil;
            if([self isKindOfClass:UIViewController.class]){
                viewController = (UIViewController *)self;
            }
            if([self isKindOfClass:UIView.class]){
                UIView *view = (UIView *)self;
                viewController = (UIViewController *)self.getViewControllerByView(view);
            }
            
            if(viewController){
                [viewController hx_presentSelectPhotoControllerWithManager:self.photoManager
                                                                   didDone:^(NSArray<HXPhotoModel *> *allList,
                                                                             NSArray<HXPhotoModel *> *photoList,
                                                                             NSArray<HXPhotoModel *> *videoList,
                                                                             BOOL isOriginal,
                                                                             UIViewController *viewController,
                                                                             HXPhotoManager *manager) {
//                    @jobs_strongify(self)
                    HXPhotoPickerModel *photoPickerModel = HXPhotoPickerModel.new;
                    photoPickerModel.allList = allList;
                    photoPickerModel.photoList = photoList;
                    photoPickerModel.videoList = videoList;
                    photoPickerModel.isOriginal = isOriginal;
                    photoPickerModel.vc = viewController;
                    photoPickerModel.photoManager = manager;
                    if (successBlock) successBlock(photoPickerModel);
                } cancel:^(UIViewController *viewController, HXPhotoManager *manager) {
//                    @jobs_strongify(self)
                    HXPhotoPickerModel *photoPickerModel = HXPhotoPickerModel.new;
                    photoPickerModel.vc = viewController;
                    photoPickerModel.photoManager = manager;
                    if (failBlock) failBlock(photoPickerModel);
                }];
            }
        }else self.jobsToastMsg(@"保存图片需要过去您的相册权限,请前往设置打开");
    }];
}
/// HXPhotoPicker 调取系统相机进行拍摄
-(void)hx_invokeSysCameraSuccessBlock:(jobsByIDBlock _Nullable)successBlock
                            failBlock:(jobsByIDBlock _Nullable)failBlock{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        /// 请求相机📷权限
        @jobs_weakify(self)
        [TKPermissionCamera authWithAlert:YES
                               completion:^(BOOL granted) {
            @jobs_strongify(self)
            if (granted) {
                UIViewController *viewController = nil;
                if([self isKindOfClass:UIViewController.class]){
                    viewController = (UIViewController *)self;
                }
                if([self isKindOfClass:UIView.class]){
                    UIView *view = (UIView *)self;
                    viewController = (UIViewController *)self.getViewControllerByView(view);
                }
                
                if(viewController){
                    [viewController hx_presentCustomCameraViewControllerWithManager:self.photoManager
                                                                               done:^(HXPhotoModel *model,
                                                                                      HXCustomCameraViewController *viewController) {
//                        @jobs_strongify(self)
                        HXPhotoPickerModel *photoPickerModel = HXPhotoPickerModel.new;
                        photoPickerModel.customCameraVC = viewController;
                        photoPickerModel.photoModel = model;
                        if (successBlock) successBlock(photoPickerModel);
                    } cancel:^(HXCustomCameraViewController *viewController) {
                        NSSLog(@"取消了");
//                        @jobs_strongify(self)
                        HXPhotoPickerModel *photoPickerModel = HXPhotoPickerModel.new;
                        photoPickerModel.customCameraVC = viewController;
                        if (failBlock) failBlock(photoPickerModel);
                    }];
                }
            }else self.jobsToastMsg(JobsInternationalization(@"授权失败,无法使用相机.请在设置-隐私-相机中允许访问相机"));
        }];
    }else self.jobsToastMsg(JobsInternationalization(@"此设备不支持相机!"));
}

-(jobsByVoidBlock _Nonnull)invokeSysCamera{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        // 检查设备是否支持相机功能
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *imagePickerController = UIImagePickerController.new;
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePickerController.delegate = self;
            imagePickerController.allowsEditing = YES;  // 如果需要用户可以编辑照片，设为YES
            // 显示相机界面
            self.comingToPresentVC(imagePickerController);
        } else self.jobsToastMsg(JobsInternationalization(@"此设备不支持相机!"));
    };
}
#pragma mark —— UIImagePickerControllerDelegate
/// 当用户拍照完成后，这个方法会被调用
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    // 获取编辑后的图片（如果 allowsEditing 为 NO，则获取原图）
    UIImage *selectedImage = info[UIImagePickerControllerEditedImage] ? : info[UIImagePickerControllerOriginalImage];
    // 在此处处理拍照得到的图片，例如保存到相册或显示在界面上
    if(self.jobsBlock) self.jobsBlock(selectedImage);
    // 关闭相机界面
    [picker dismissViewControllerAnimated:YES completion:nil];
}
/// 用户取消拍照时调用这个方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark —— @property(nonatomic,strong)HXPhotoManager *photoManager;//选取图片的数据管理类
JobsKey(_photoManager)
@dynamic photoManager;
-(HXPhotoManager *)photoManager{
    HXPhotoManager *PhotoManager = Jobs_getAssociatedObject(_photoManager);
    if (!PhotoManager) {
        PhotoManager = [HXPhotoManager.alloc initWithType:HXPhotoManagerSelectedTypePhotoAndVideo];
        PhotoManager.configuration.localFileName = self.appDisplayName.add(@"Models");
        PhotoManager.configuration.type = HXConfigurationTypeWXChat;
        PhotoManager.configuration.showOriginalBytes = YES;
        PhotoManager.configuration.showOriginalBytesLoading = YES;
        PhotoManager.configuration.videoMaximumSelectDuration = -1;
        PhotoManager.configuration.limitVideoSize = 100 * 1024 * 1024;
        PhotoManager.configuration.selectVideoLimitSize = YES;
        PhotoManager.configuration.selectVideoBeyondTheLimitTimeAutoEdit = NO;
        PhotoManager.configuration.specialModeNeedHideVideoSelectBtn = NO;
        PhotoManager.configuration.videoMaxNum = 1;
        PhotoManager.configuration.maxNum = 9;
        PhotoManager.configuration.photoMaxNum = 9;
        PhotoManager.configuration.selectTogether = NO;
        /// ❤️导航栏用系统自带的，防止外界关闭了导航栏的bug❤️
        PhotoManager.viewWillAppear = ^(UIViewController *viewController) {
            /// 只会影响 viewWillAppear 和 viewWillDisappear 两个生命周期
            [viewController.navigationController setNavigationBarHidden:NO animated:NO];
        };
        Jobs_setAssociatedRETAIN_NONATOMIC(_photoManager, PhotoManager)
    }return PhotoManager;
}

-(void)setPhotoManager:(HXPhotoManager *)photoManager{
    Jobs_setAssociatedRETAIN_NONATOMIC(_photoManager, photoManager)
}
#pragma mark —— @property(nonatomic,strong)NSMutableArray <HXPhotoModel *>*__block historyPhotoDataMutArr;//与之相对应的是self.photoManager.afterSelectedArray
JobsKey(_historyPhotoDataMutArr)
@dynamic historyPhotoDataMutArr;
-(NSMutableArray <HXPhotoModel *>*)historyPhotoDataMutArr{
    NSMutableArray <HXPhotoModel *>*HistoryPhotoDataMutArr = Jobs_getAssociatedObject(_historyPhotoDataMutArr);
    if (!HistoryPhotoDataMutArr) {
        /// < 保存本地的方法 >
        /// 保存本地的方法都是在主线程调用
        /// 获取保存在本地文件的模型数组
        /// @param addData 是否添加到manager的数据中
        HistoryPhotoDataMutArr = [NSMutableArray arrayWithArray:[self.photoManager getLocalModelsInFileWithAddData:YES]];
        Jobs_setAssociatedRETAIN_NONATOMIC(_historyPhotoDataMutArr, HistoryPhotoDataMutArr)
    }return HistoryPhotoDataMutArr;
}

-(void)setHistoryPhotoDataMutArr:(NSMutableArray<HXPhotoModel *> *)historyPhotoDataMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_historyPhotoDataMutArr, historyPhotoDataMutArr)
}
#pragma mark —— @property(nonatomic,strong)NSMutableArray <HXPhotoModel *>*__block photosDataMutArr;
JobsKey(_photosDataMutArr)
@dynamic photosDataMutArr;
-(NSMutableArray<HXPhotoModel *> *)photosDataMutArr{
    NSMutableArray <HXPhotoModel *>*PhotosDataMutArr = Jobs_getAssociatedObject(_photosDataMutArr);
    if (!PhotosDataMutArr) {
        PhotosDataMutArr = NSMutableArray.array;
        Jobs_setAssociatedRETAIN_NONATOMIC(_photosDataMutArr, PhotosDataMutArr)
    }return PhotosDataMutArr;
}

-(void)setPhotosDataMutArr:(NSMutableArray<HXPhotoModel *> *)photosDataMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_photosDataMutArr, photosDataMutArr)
}
#pragma mark —— @property(nonatomic,strong)NSMutableArray <HXPhotoModel *>*__block videosDataMutArr;
JobsKey(_videosDataMutArr)
@dynamic videosDataMutArr;
-(NSMutableArray<HXPhotoModel *> *)videosDataMutArr{
    NSMutableArray <HXPhotoModel *>*VideosDataMutArr = Jobs_getAssociatedObject(_videosDataMutArr);
    if (!VideosDataMutArr) {
        VideosDataMutArr = NSMutableArray.array;
        Jobs_setAssociatedRETAIN_NONATOMIC(_videosDataMutArr, VideosDataMutArr)
    }return VideosDataMutArr;
}

-(void)setVideosDataMutArr:(NSMutableArray<HXPhotoModel *> *)videosDataMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_videosDataMutArr, videosDataMutArr)
}

@end

@implementation HXPhotoPickerModel

@end
