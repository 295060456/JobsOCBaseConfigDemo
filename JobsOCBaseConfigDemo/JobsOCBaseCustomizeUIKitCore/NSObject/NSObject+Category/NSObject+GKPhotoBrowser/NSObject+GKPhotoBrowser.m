//
//  NSObject+GKPhotoBrowser.m
//  MataShop
//
//  Created by Jobs Hi on 10/15/23.
//

#import "NSObject+GKPhotoBrowser.h"

@implementation NSObject (GKPhotoBrowser)
/// 针对数据源是UIImage  *的GKPhotoBrowser
-(GKPhotoBrowser *)tapImageWithIndexPath:(NSIndexPath *)indexPath
                         imageDataMutArr:(NSMutableArray <UIImage *>*)imageDataMutArr{
    NSMutableArray *photosArray = [NSMutableArray arrayWithCapacity:imageDataMutArr.count];
    [imageDataMutArr enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj,
                                                  NSUInteger idx,
                                                  BOOL * _Nonnull stop) {
        GKPhoto *photo = GKPhoto.new;
        photo.image = obj;
        photo.placeholderImage = JobsIMG(@"plliza_empy_placehoder");
        photosArray.jobsAddObject(photo);
    }];
    GKPhotoBrowser *browser = [GKPhotoBrowser photoBrowserWithPhotos:photosArray
                                                        currentIndex:indexPath.row];
    browser.showStyle           = GKPhotoBrowserShowStyleNone;
    browser.hideStyle           = GKPhotoBrowserHideStyleZoomScale;
    browser.isSingleTapDisabled = YES;  // 不响应默认单击事件
    browser.isStatusBarShow     = YES;  // 显示状态栏
    browser.isHideSourceView    = NO;
    browser.delegate            = self;
    
    UIUserInterfaceIdiom idiom = UIDevice.currentDevice.userInterfaceIdiom;
    if (idiom == UIUserInterfaceIdiomPhone) {
        browser.isFollowSystemRotation = NO;
    } else if (idiom == UIUserInterfaceIdiomPad) {
        browser.isFollowSystemRotation = YES;
    }return browser;
}
/// 针对数据源是NSURL  *的GKPhotoBrowser
-(GKPhotoBrowser *)tapImageWithIndexPath:(NSIndexPath *)indexPath
                          imageUrlMutArr:(NSMutableArray <NSURL *>*)imageUrlMutArr{
    NSMutableArray *photosArray = [NSMutableArray arrayWithCapacity:imageUrlMutArr.count];
    
    
    [imageUrlMutArr enumerateObjectsUsingBlock:^(NSURL * _Nonnull obj,
                                                 NSUInteger idx,
                                                 BOOL * _Nonnull stop) {
        GKPhoto *photo = GKPhoto.new;
        photo.url = obj;
        photo.placeholderImage = JobsIMG(@"plliza_empy_placehoder");
        [photosArray addObject:photo];
    }];

    GKPhotoBrowser *browser = [GKPhotoBrowser photoBrowserWithPhotos:photosArray
                                                        currentIndex:indexPath.row];
    browser.showStyle           = GKPhotoBrowserShowStyleNone;
    browser.hideStyle           = GKPhotoBrowserHideStyleZoomScale;
    browser.isSingleTapDisabled = YES;  // 不响应默认单击事件
    browser.isStatusBarShow     = YES;  // 显示状态栏
    browser.isHideSourceView    = NO;
    browser.delegate            = self;
    
    UIUserInterfaceIdiom idiom = UIDevice.currentDevice.userInterfaceIdiom;
    if (idiom == UIUserInterfaceIdiomPhone) {
        browser.isFollowSystemRotation = NO;
    } else if (idiom == UIUserInterfaceIdiomPad) {
        browser.isFollowSystemRotation = YES;
    }return browser;
}
/// 针对数据源是NSString  *的GKPhotoBrowser
-(GKPhotoBrowser *)tapImageWithIndexPath:(NSIndexPath *)indexPath
                       imageUrlStrMutArr:(NSMutableArray <NSString *>*)imageUrlStrMutArr{
    NSMutableArray *photosArray = [NSMutableArray arrayWithCapacity:imageUrlStrMutArr.count];
    [imageUrlStrMutArr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj,
                                                    NSUInteger idx,
                                                    BOOL * _Nonnull stop) {
        GKPhoto *photo = GKPhoto.new;
        photo.url = obj.jobsUrl;
        photo.placeholderImage = JobsIMG(@"plliza_empy_placehoder");
        [photosArray addObject:photo];
    }];

    GKPhotoBrowser *browser = [GKPhotoBrowser photoBrowserWithPhotos:photosArray
                                                        currentIndex:indexPath.row];
    browser.showStyle           = GKPhotoBrowserShowStyleNone;
    browser.hideStyle           = GKPhotoBrowserHideStyleZoomScale;
    browser.isSingleTapDisabled = YES;  // 不响应默认单击事件
    browser.isStatusBarShow     = YES;  // 显示状态栏
    browser.isHideSourceView    = NO;
    browser.delegate            = self;

    UIUserInterfaceIdiom idiom = UIDevice.currentDevice.userInterfaceIdiom;
    if (idiom == UIUserInterfaceIdiomPhone) {
        browser.isFollowSystemRotation = NO;
    } else if (idiom == UIUserInterfaceIdiomPad) {
        browser.isFollowSystemRotation = YES;
    }return browser;
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
#pragma mark —— 一些私有方法

@end
