//
//  NSObject+GKPhotoBrowser.m
//  MataShop
//
//  Created by Jobs Hi on 10/15/23.
//

#import "NSObject+GKPhotoBrowser.h"

@implementation NSObject (GKPhotoBrowser)
#pragma mark —— 一些私有方法
NS_INLINE __kindof GKPhoto *_Nonnull jobsMakeGKPhoto(jobsByGKPhotoBlock _Nonnull block){
    GKPhoto *data = GKPhoto.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof GKPhotoBrowser *_Nonnull jobsMakeGKPhotoBrowserByPhotosArray(NSArray <GKPhoto *>*photosArray,
                                                                                NSInteger currentIndex,
                                                                                jobsByGKPhotoBrowserBlock block) {
    GKPhotoBrowser *photoBrowser = [GKPhotoBrowser photoBrowserWithPhotos:photosArray currentIndex:currentIndex];
    if (block) block(photoBrowser);
    return photoBrowser;
}

-(JobsReturnGKPhotoBrowserByPhotosArrayAndCurrentIndexBlock _Nonnull)makeGKPhotoBrowser{
    return ^GKPhotoBrowser *_Nullable(__kindof NSArray <GKPhoto *>*_Nullable photosArray,
                                      NSInteger currentIndex){
        return [GKPhotoBrowser photoBrowserWithPhotos:photosArray currentIndex:currentIndex];
    };
}

-(jobsByGKPhotoBrowserBlock _Nonnull)configPhotoBrowser{
    return ^(GKPhotoBrowser *_Nonnull browser){
        browser.configure.showStyle           = GKPhotoBrowserShowStyleNone;
        browser.configure.hideStyle           = GKPhotoBrowserHideStyleZoomScale;
        browser.configure.isSingleTapDisabled = YES;  // 不响应默认单击事件
        browser.isStatusBarShow     = YES;  // 显示状态栏
        browser.configure.isHideSourceView    = NO;
        browser.delegate            = self;
        browser.configure.isFollowSystemRotation = !(UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone);
    };
}
#pragma mark —— 一些公有方法
/// 针对数据源是UIImage  *的GKPhotoBrowser
-(GKPhotoBrowser *)tapImageWithIndexPath:(NSIndexPath *)indexPath
                         imageDataMutArr:(NSMutableArray <UIImage *>*)imageDataMutArr{
    @jobs_weakify(self)
    return jobsMakeGKPhotoBrowserByPhotosArray(jobsMakeMutArr(^(__kindof NSMutableArray <GKPhoto *>*_Nullable data) {
        [imageDataMutArr enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj,
                                                      NSUInteger idx,
                                                      BOOL * _Nonnull stop) {
            data.add(jobsMakeGKPhoto(^(GKPhoto * _Nonnull photo) {
                photo.image = obj;
                photo.placeholderImage = JobsIMG(@"plliza_empy_placehoder");
            }));
        }];
    }),indexPath.row,^(GKPhotoBrowser *_Nonnull browser){
        @jobs_strongify(self)
        self.configPhotoBrowser(browser);
    });
}
/// 针对数据源是NSURL  *的GKPhotoBrowser
-(GKPhotoBrowser *)tapImageWithIndexPath:(NSIndexPath *)indexPath
                          imageUrlMutArr:(NSMutableArray <NSURL *>*)imageUrlMutArr{
    @jobs_weakify(self)
    return jobsMakeGKPhotoBrowserByPhotosArray(jobsMakeMutArr(^(__kindof NSMutableArray <GKPhoto *>*_Nullable data) {
        [imageUrlMutArr enumerateObjectsUsingBlock:^(NSURL * _Nonnull obj,
                                                     NSUInteger idx,
                                                     BOOL * _Nonnull stop) {
            data.add(jobsMakeGKPhoto(^(GKPhoto * _Nonnull photo) {
                photo.url = obj;
                photo.placeholderImage = JobsIMG(@"plliza_empy_placehoder");
            }));
        }];
    }),indexPath.row,^(GKPhotoBrowser *_Nonnull browser){
        @jobs_strongify(self)
        self.configPhotoBrowser(browser);
    });
}
/// 针对数据源是NSString  *的GKPhotoBrowser
-(GKPhotoBrowser *)tapImageWithIndexPath:(NSIndexPath *)indexPath
                       imageUrlStrMutArr:(NSMutableArray <NSString *>*)imageUrlStrMutArr{
    @jobs_weakify(self)
    return jobsMakeGKPhotoBrowserByPhotosArray(jobsMakeMutArr(^(__kindof NSMutableArray <GKPhoto *>*_Nullable data) {
        [imageUrlStrMutArr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj,
                                                        NSUInteger idx,
                                                        BOOL * _Nonnull stop) {
            data.add(jobsMakeGKPhoto(^(GKPhoto * _Nonnull photo) {
                photo.url = obj.jobsUrl;
                photo.placeholderImage = JobsIMG(@"plliza_empy_placehoder");
            }));
        }];
    }),indexPath.row,^(GKPhotoBrowser *_Nonnull browser){
        @jobs_strongify(self)
        self.configPhotoBrowser(browser);
    });
}
#pragma mark —— GKPhotoBrowserDelegate
/// 滚动到一半时索引改变
-(void)photoBrowser:(GKPhotoBrowser *)browser
    didChangedIndex:(NSInteger)index{
    
}
/// 选择photoView时回调
-(void)photoBrowser:(GKPhotoBrowser *)browser
   didSelectAtIndex:(NSInteger)index{
    
}
/// 单击事件
-(void)photoBrowser:(GKPhotoBrowser *)browser
 singleTapWithIndex:(NSInteger)index{
    
}
/// 双击事件
-(void)photoBrowser:(GKPhotoBrowser *)browser
 doubleTapWithIndex:(NSInteger)index{
    self.savePic(browser);
}
/// 长按事件
-(void)photoBrowser:(GKPhotoBrowser *)browser
 longPressWithIndex:(NSInteger)index{
    self.savePic(browser);
}
/// 旋转事件
-(void)photoBrowser:(GKPhotoBrowser *)browser
onDeciceChangedWithIndex:(NSInteger)index
        isLandscape:(BOOL)isLandscape{
    
}
/// 缩放事件
-(void)photoBrowser:(GKPhotoBrowser *)browser
 zoomEndedWithIndex:(NSInteger)index
          zoomScale:(CGFloat)scale{
    
}
/// photoView复用回调
-(void)photoBrowser:(GKPhotoBrowser *)browser
       reuseAtIndex:(NSInteger)index
          photoView:(GKPhotoView *)photoView{
    
}
/// 保存按钮点击事件
-(void)photoBrowser:(GKPhotoBrowser *)browser
     onSaveBtnClick:(NSInteger)index
              image:(UIImage *)image{
    
}
/// 上下滑动消失
/// 开始滑动时
-(void)photoBrowser:(GKPhotoBrowser *)browser
  panBeginWithIndex:(NSInteger)index{
    
}
/// 结束滑动时 disappear：是否消失
-(void)photoBrowser:(GKPhotoBrowser *)browser
  panEndedWithIndex:(NSInteger)index
      willDisappear:(BOOL)disappear{
    
}
/// 布局子视图
-(void)photoBrowser:(GKPhotoBrowser *)browser
 willLayoutSubViews:(NSInteger)index{
    
}
/// browser完全消失回调
-(void)photoBrowser:(GKPhotoBrowser *)browser
didDisappearAtIndex:(NSInteger)index{
    
}
/// browser自定义加载方式时回调
-(void)photoBrowser:(GKPhotoBrowser *)browser
   loadImageAtIndex:(NSInteger)index
           progress:(float)progress
      isOriginImage:(BOOL)isOriginImage{
    
}
/// browser加载失败自定义弹窗
-(void)photoBrowser:(GKPhotoBrowser *)browser
  loadFailedAtIndex:(NSInteger)index error:(NSError *)error{
    
}
/// 自定义单个图片的加载失败文字，优先级高于failureText
-(NSString *)photoBrowser:(GKPhotoBrowser *)browser
        failedTextAtIndex:(NSInteger)index{
    return JobsInternationalization(@"图片加载失败");
}
/// 自定义单个图片的加载失败图片，优先级高于failureImage
-(UIImage *)photoBrowser:(GKPhotoBrowser *)browser
      failedImageAtIndex:(NSInteger)index{
    return JobsIMG(JobsInternationalization(@""));
}
/// 视频播放状态回调
-(void)photoBrowser:(GKPhotoBrowser *)browser
videoStateChangeWithPhotoView:(GKPhotoView *)photoView
             status:(GKVideoPlayerStatus)status{
    
}
/// 视频播放进度回调
-(void)photoBrowser:(GKPhotoBrowser *)browser
videoTimeChangeWithPhotoView:(GKPhotoView *)photoView
        currentTime:(NSTimeInterval)currentTime
          totalTime:(NSTimeInterval)totalTime{
    
}

@end
