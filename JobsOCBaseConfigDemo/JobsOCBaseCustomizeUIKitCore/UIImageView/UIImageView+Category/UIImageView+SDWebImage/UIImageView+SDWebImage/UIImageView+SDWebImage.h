//
//  UIImageView+SDWebImage.h
//  FM
//
//  Created by User on 9/5/24.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsBlock.h"

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

typedef __kindof UIImageView *_Nullable(^JobsReturnImageViewBySDExternalCompletionBlock)(SDExternalCompletionBlock _Nullable data);
typedef __kindof UIImageView *_Nullable(^JobsReturnImageViewBySDWebImageOptionsBlock)(SDWebImageOptions data);

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (SDWebImage)

@property(nonatomic,strong,readonly,nonnull)jobsByVoidBlock load;

@property(nonatomic,strong,readonly,nonnull)JobsReturnImageViewByURLBlock imageURL;
@property(nonatomic,strong,readonly,nonnull)JobsReturnImageViewByImageBlock placeholderImage;
@property(nonatomic,strong,readonly,nonnull)JobsReturnImageViewBySDWebImageOptionsBlock options;
@property(nonatomic,strong,readonly,nonnull)JobsReturnImageViewBySDExternalCompletionBlock completed;

@end

NS_ASSUME_NONNULL_END
/**

 @jobs_weakify(self)
 [url.imageURLPlus.jobsUrl.absoluteString cleanSDImageCache:^{
     @jobs_strongify(self)
 self.bgImageView
         .imageURL(url.imageURLPlus.jobsUrl)
         .placeholderImage(JobsIMG(self.param.wPlaceholderImage))
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
         }).load();
 }];
 
 */
