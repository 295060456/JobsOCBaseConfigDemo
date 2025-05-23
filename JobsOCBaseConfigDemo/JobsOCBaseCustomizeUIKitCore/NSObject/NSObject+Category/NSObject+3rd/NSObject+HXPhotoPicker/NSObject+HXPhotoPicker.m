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
                viewController = self.getViewControllerByView(view) ? : self.getCurrentViewController;
            }
            if(viewController){
                [viewController hx_presentSelectPhotoControllerWithManager:self.photoManager
                                                                   didDone:^(NSArray<HXPhotoModel *> *allList,
                                                                             NSArray<HXPhotoModel *> *photoList,
                                                                             NSArray<HXPhotoModel *> *videoList,
                                                                             BOOL isOriginal,
                                                                             UIViewController *viewController,
                                                                             HXPhotoManager *manager) {
                    if (successBlock) successBlock(jobsMakeHXPhotoPickerModel(^(__kindof HXPhotoPickerModel * _Nullable model) {
                        model.allList = allList;
                        model.photoList = photoList;
                        model.videoList = videoList;
                        model.isOriginal = isOriginal;
                        model.vc = viewController;
                        model.photoManager = manager;
                    }));
                } cancel:^(UIViewController *viewController, HXPhotoManager *manager) {
                    if (failBlock) failBlock(jobsMakeHXPhotoPickerModel(^(__kindof HXPhotoPickerModel * _Nullable model) {
                        model.vc = viewController;
                        model.photoManager = manager;
                    }));
                }];
            }
        }else self.jobsToastMsg(@"保存图片需要过去您的相册权限,请前往设置打开");
    }];
}
/// HXPhotoPicker 调取系统相机进行拍摄（没有兼容横屏）
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
                                                                               done:^(HXPhotoModel *photoModel,
                                                                                      HXCustomCameraViewController *viewController) {
                        if (successBlock) successBlock(jobsMakeHXPhotoPickerModel(^(__kindof HXPhotoPickerModel * _Nullable model) {
                            model.customCameraVC = viewController;
                            model.photoModel = photoModel;
                        }));
                    } cancel:^(HXCustomCameraViewController *viewController) {
                        NSSLog(@"取消了");
                        if (failBlock) failBlock(jobsMakeHXPhotoPickerModel(^(__kindof HXPhotoPickerModel * _Nullable model) {
                            model.customCameraVC = viewController;
                        }));
                    }];
                }
            }else self.jobsToastMsg(JobsInternationalization(@"授权失败,无法使用相机.请在设置-隐私-相机中允许访问相机"));
        }];
    }else self.jobsToastMsg(JobsInternationalization(@"此设备不支持相机!"));
}
/// 完全意义上的调用系统的相机拍照功能
-(jobsByVoidBlock _Nonnull)invokeSysCamera{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        // 检查设备是否支持相机功能
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            /// 显示相机界面
            self.comingToPresentVC(jobsMakeImagePickerController(^(__kindof UIImagePickerController * _Nullable imagePickerController) {
                @jobs_strongify(self)
                imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                imagePickerController.delegate = self;
                imagePickerController.allowsEditing = YES; /// 如果需要用户可以编辑照片，设为YES
            }));
        } else self.jobsToastMsg(JobsInternationalization(@"此设备不支持相机!"));
    };
}
#pragma mark —— UIImagePickerControllerDelegate
/// 当用户拍照完成后，这个方法会被调用
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    /// 获取编辑后的图片（如果 allowsEditing 为 NO，则获取原图）
    UIImage *selectedImage = info[UIImagePickerControllerEditedImage] ? : info[UIImagePickerControllerOriginalImage];
    /// 在此处处理拍照得到的图片，例如保存到相册或显示在界面上
    if(self.objBlock) self.objBlock(selectedImage);
    /// 关闭相机界面
    [picker dismissViewControllerAnimated:YES completion:nil];
}
/// 用户取消拍照时调用这个方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark —— Prop_strong()HXPhotoManager *photoManager;//选取图片的数据管理类
JobsKey(_photoManager)
@dynamic photoManager;
-(HXPhotoManager *)photoManager{
    HXPhotoManager *PhotoManager = Jobs_getAssociatedObject(_photoManager);
    if (!PhotoManager) {
        PhotoManager = HXPhotoManager.initByTypePhotoAndVideo;
        @jobs_weakify(self)
        PhotoManager.configuration = jobsMakeHXPhotoConfiguration(^(__kindof HXPhotoConfiguration * _Nullable config) {
            @jobs_strongify(self)
            config.localFileName = self.appDisplayName.add(@"Models"); /// 模型数组保存草稿时存在本地的文件名称
            config.type = HXConfigurationTypeWXChat; /// 配置类型
            config.showOriginalBytes = YES; /// 原图按钮显示已选照片的大小
            config.showOriginalBytesLoading = YES; /// 原图按钮显示已选照片大小时是否显示加载菊花
            config.videoMaximumSelectDuration = -1; /// 视频能选择的最大秒数  -  默认 3分钟/180秒
            config.limitVideoSize = 100 * 1024 * 1024; /// 限制视频的大小 单位：b 字节
            config.selectVideoLimitSize = YES; /// 选择视频时是否限制照片大小
            config.selectVideoBeyondTheLimitTimeAutoEdit = NO; /// 选择视频时超出限制时长是否自动跳转编辑界面
            config.specialModeNeedHideVideoSelectBtn = NO; /// 只针对 照片、视频不能同时选并且视频只能选择1个的时候隐藏掉视频cell右上角的选择按钮
            config.videoMaxNum = 1; /// 视频最大选择数
            config.maxNum = 9; /// 最大选择数
            config.photoMaxNum = 9; /// 照片最大选择数
            config.selectTogether = NO; /// 图片和视频是否能够同时选择 默认 NO
        });
        /// ❤️导航栏用系统自带的，防止外界关闭了导航栏的bug❤️
        PhotoManager.viewWillAppear = ^(UIViewController *viewController) {
            /// 只会影响 viewWillAppear 和 viewWillDisappear 两个生命周期
            [viewController.navigationController setNavigationBarHidden:NO animated:NO];
        };Jobs_setAssociatedRETAIN_NONATOMIC(_photoManager, PhotoManager)
    }return PhotoManager;
}

-(void)setPhotoManager:(HXPhotoManager *)photoManager{
    Jobs_setAssociatedRETAIN_NONATOMIC(_photoManager, photoManager)
}
#pragma mark —— Prop_copy()NSMutableArray <HXPhotoModel *>*__block historyPhotoDataMutArr;//与之相对应的是self.photoManager.afterSelectedArray
JobsKey(_historyPhotoDataMutArr)
@dynamic historyPhotoDataMutArr;
-(NSMutableArray <HXPhotoModel *>*)historyPhotoDataMutArr{
    NSMutableArray <HXPhotoModel *>*HistoryPhotoDataMutArr = Jobs_getAssociatedObject(_historyPhotoDataMutArr);
    if (!HistoryPhotoDataMutArr) {
        /// < 保存本地的方法 >
        /// 保存本地的方法都是在主线程调用
        /// 获取保存在本地文件的模型数组
        /// @param addData 是否添加到manager的数据中
        HistoryPhotoDataMutArr = NSMutableArray.initBy([self.photoManager getLocalModelsInFileWithAddData:YES]);
        Jobs_setAssociatedRETAIN_NONATOMIC(_historyPhotoDataMutArr, HistoryPhotoDataMutArr)
    }return HistoryPhotoDataMutArr;
}

-(void)setHistoryPhotoDataMutArr:(NSMutableArray<HXPhotoModel *> *)historyPhotoDataMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_historyPhotoDataMutArr, historyPhotoDataMutArr)
}
#pragma mark —— Prop_copy()NSMutableArray <HXPhotoModel *>*__block photosDataMutArr;
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
#pragma mark —— Prop_copy()NSMutableArray <HXPhotoModel *>*__block videosDataMutArr;
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
