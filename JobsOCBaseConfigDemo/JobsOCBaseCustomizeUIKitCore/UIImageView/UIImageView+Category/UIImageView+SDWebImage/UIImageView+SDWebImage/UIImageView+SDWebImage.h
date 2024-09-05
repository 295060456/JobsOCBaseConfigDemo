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

typedef UIImageView *_Nullable(^JobsReturnImageViewBySDExternalCompletionBlock)(SDExternalCompletionBlock _Nullable data);
typedef UIImageView *_Nullable(^JobsReturnImageViewBySDWebImageOptionsBlock)(SDWebImageOptions data);

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
 
 self.bgImageView
     .imageURL(model.url)
     .placeholderImage(model.bgImage)
     .options(SDWebImageRefreshCached)/// 强制刷新缓存
     .completed(^(UIImage * _Nullable image,
                  NSError * _Nullable error,
                  SDImageCacheType cacheType,
                  NSURL * _Nullable imageURL) {
         if (error) {
             NSLog(@"图片加载失败: %@", error);
         } else {
             NSLog(@"图片加载成功");
         }
     }).load();
 
 */
