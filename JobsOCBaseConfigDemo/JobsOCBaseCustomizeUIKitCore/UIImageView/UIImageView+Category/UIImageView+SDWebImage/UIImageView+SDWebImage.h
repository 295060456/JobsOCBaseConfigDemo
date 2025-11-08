//
//  UIImageView+SDWebImage.h
//  FM
//
//  Created by User on 9/5/24.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsBlock.h"
#import "DefineProperty.h"

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif
/// SDWebImage+UIImageView
#ifndef SDWebImageImageViewBlock
#define SDWebImageImageViewBlock
typedef __kindof UIImageView *_Nullable(^JobsReturnImageViewBySDExternalCompletionBlocks)(SDExternalCompletionBlock _Nullable data);
typedef __kindof UIImageView *_Nullable(^JobsReturnImageViewBySDWebImageOptionsBlocks)(SDWebImageOptions data);
#endif /* SDWebImageImageViewBlock */

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (SDWebImage)

Prop_copy(readonly,nonnull)JobsRetViewByVoidBlock load;
Prop_copy(readonly,nonnull)JobsRetImageViewByURLBlock imageURL;
Prop_copy(readonly,nonnull)JobsRetImageViewByImageBlock placeholderImage;
Prop_copy(readonly,nonnull)JobsReturnImageViewBySDWebImageOptionsBlocks options;
Prop_copy(readonly,nonnull)JobsReturnImageViewBySDExternalCompletionBlocks completed;

@end

NS_ASSUME_NONNULL_END
/**
 self.bgImageView
         .imageURL(url.imageURLPlus.jobsUrl)
         .placeholderImage(self.param.wPlaceholderImage.img))
         .options(self.makeSDWebImageOptions)
         .completed(^(UIImage * _Nullable image,
                      NSError * _Nullable error,
                      SDImageCacheType cacheType,
                      NSURL * _Nullable imageURL) {
             if (error) {
                 JobsLog(@"aa图片加载失败: %@-%@", error,imageURL);
             } else {
                 JobsLog(@"图片加载成功");
             }
         }).load();
 
 */
