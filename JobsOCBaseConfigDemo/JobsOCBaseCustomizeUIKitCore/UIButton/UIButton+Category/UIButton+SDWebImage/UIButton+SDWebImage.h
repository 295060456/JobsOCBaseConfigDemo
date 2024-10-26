//
//  UIButton+SDWebImage.h
//  FM
//
//  Created by User on 9/19/24.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsBlock.h"
#import "NSString+Others.h"
#import "SDWebImageModel.h"

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

typedef __kindof UIButton *_Nullable(^JobsReturnButtonBySDExternalCompletionBlock)(SDExternalCompletionBlock _Nullable data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonBySDWebImageOptionsBlock)(SDWebImageOptions data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonBySDImageLoaderProgressBlock)(SDImageLoaderProgressBlock _Nullable data);

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (SDWebImage)

@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonByURLBlock imageURL;
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonByImageBlock placeholderImage;
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonBySDWebImageOptionsBlock options;
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonBySDExternalCompletionBlock completed;
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonBySDImageLoaderProgressBlock progress;
#pragma mark —— 设置普通图片的方法
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonByVoidBlock normalLoad;
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonByVoidBlock highlightedlLoad;
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonByVoidBlock disabledLoad;
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonByVoidBlock selectedLoad;
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonByVoidBlock focusedLoad API_AVAILABLE(ios(9.0));
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonByVoidBlock applicationLoad;
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonByVoidBlock reservedLoad;
#pragma mark —— 设置背景图片的方法
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonByVoidBlock bgNormalLoad;
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonByVoidBlock bgHighlightedlLoad;
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonByVoidBlock bgDisabledLoad;
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonByVoidBlock bgSelectedLoad;
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonByVoidBlock bgFocusedLoad API_AVAILABLE(ios(9.0));
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonByVoidBlock bgApplicationLoad;
@property(nonatomic,copy,readonly,nonnull)JobsReturnButtonByVoidBlock bgReservedLoad;

@end

NS_ASSUME_NONNULL_END
/**
 self->_btn
     .imageURL(self.viewModel.normalImageURLString.imageURLPlus.jobsUrl)
     .placeholderImage(self.viewModel.normalImage)
     .options(self.makeSDWebImageOptions)
     .completed(^(UIImage * _Nullable image,
                  NSError * _Nullable error,
                  SDImageCacheType cacheType,
                  NSURL * _Nullable imageURL) {
         if (error) {
             NSLog(@"aa图片加载失败: %@-%@", error,imageURL);
         } else {
             NSLog(@"图片加载成功");
         }
     }).normalLoad();
 */
/*

 ❤️SDWebImageRetryFailed：如果 URL 下载失败，默认情况下该 URL 会被列入黑名单，库不会再次尝试下载。此选项禁用黑名单机制，让库继续尝试下载。
 ❤️SDWebImageLowPriority：默认情况下，图像下载在 UI 交互期间开始。此选项禁用该功能，导致在 UIScrollView 减速时才开始下载。
 ❤️SDWebImageProgressiveLoad：启用渐进式下载，图像在下载过程中逐步显示，类似于浏览器的行为。默认情况下，图像在完全下载后才显示。
 ❤️SDWebImageRefreshCached：即使图像已被缓存，仍遵守 HTTP 响应的缓存控制规则，如果需要则从远程重新加载图像。适用于 URL 不变而图像更新的场景。
 ❤️SDWebImageContinueInBackground：在 iOS 4+ 中，如果应用进入后台，继续下载图像。这通过请求系统的额外后台时间来完成下载。
 ❤️SDWebImageHandleCookies：处理存储在 NSHTTPCookieStore 中的 cookies，设置 NSMutableURLRequest.HTTPShouldHandleCookies = YES。
 ❤️SDWebImageAllowInvalidSSLCertificates：允许不受信任的 SSL 证书，通常用于测试目的，生产环境应谨慎使用。
 ❤️SDWebImageHighPriority：默认情况下，图像按排队顺序加载。此选项将图像优先级提高，使其优先下载。
 ❤️SDWebImageDelayPlaceholder：延迟占位符图像的加载，直到图像加载完成为止。适用于作为错误占位符而不是加载占位符的场景。
 ❤️SDWebImageTransformAnimatedImage：默认情况下，不会对动画图像进行变换。此选项强制对动画图像进行变换。
 ❤️SDWebImageAvoidAutoSetImage：默认情况下，图像在下载后会自动添加到 imageView 中。此选项允许你在完成回调中手动设置图像。
 ❤️SDWebImageScaleDownLargeImages：将大图像缩小到与设备内存约束兼容的大小，防止内存过度消耗。
 ❤️SDWebImageQueryMemoryData：强制在内存中查询图像数据，即使图像已经缓存了。
 ❤️SDWebImageQueryMemoryDataSync：同步查询内存图像数据，而不是默认的异步查询。
 ❤️SDWebImageQueryDiskDataSync：同步查询磁盘缓存中的图像数据。
 ❤️SDWebImageFromCacheOnly：仅从缓存中加载图像，不从远程加载。
 ❤️SDWebImageFromLoaderOnly：仅从远程加载图像，不从缓存中加载。
 ❤️SDWebImageForceTransition：强制对所有图像加载场景（包括内存或磁盘缓存）应用视图过渡动画。
 ❤️SDWebImageAvoidDecodeImage（已弃用）：防止解码图像以减少内存消耗。
 ❤️SDWebImageDecodeFirstFrameOnly：仅解码动画图像的第一帧，并生成静态图像。
 ❤️SDWebImagePreloadAllFrames：预加载所有动画图像帧，以减少 CPU 使用率。
 ❤️SDWebImageMatchAnimatedImageClass：确保返回的图像类与 SDWebImageContextAnimatedImageClass 一致，如果无法匹配，返回错误。
 ❤️SDWebImageWaitStoreCache：确保在完成回调时，磁盘缓存已写入完成。
 ❤️SDWebImageTransformVectorImage：允许对矢量图像进行变换，尽管这可能会丢失细节。
 ❤️SDWebImageAvoidAutoCancelImage：禁用自动取消图像加载请求，允许每次加载都开始新的下载管道。
 ❤️SDWebImageRetryFailedSDWebImageWaitTransition：在图像视图过渡完成之前，延迟调用完成回调，以避免界面状态混乱。
*/
