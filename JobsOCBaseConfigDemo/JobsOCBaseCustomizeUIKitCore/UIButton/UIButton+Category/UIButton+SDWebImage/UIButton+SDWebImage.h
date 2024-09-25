//
//  UIButton+SDWebImage.h
//  FM
//
//  Created by User on 9/19/24.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsBlock.h"
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
@property(nonatomic,strong,readonly,nonnull)JobsReturnButtonByURLBlock imageURL;
@property(nonatomic,strong,readonly,nonnull)JobsReturnButtonByImageBlock placeholderImage;
@property(nonatomic,strong,readonly,nonnull)JobsReturnButtonBySDWebImageOptionsBlock options;
@property(nonatomic,strong,readonly,nonnull)JobsReturnButtonBySDExternalCompletionBlock completed;
@property(nonatomic,strong,readonly,nonnull)JobsReturnButtonBySDImageLoaderProgressBlock progress;
#pragma mark —— 设置普通图片的方法
@property(nonatomic,strong,readonly,nonnull)jobsByVoidBlock normalLoad;
@property(nonatomic,strong,readonly,nonnull)jobsByVoidBlock highlightedlLoad;
@property(nonatomic,strong,readonly,nonnull)jobsByVoidBlock disabledLoad;
@property(nonatomic,strong,readonly,nonnull)jobsByVoidBlock selectedLoad;
@property(nonatomic,strong,readonly,nonnull)jobsByVoidBlock focusedLoad API_AVAILABLE(ios(9.0));
@property(nonatomic,strong,readonly,nonnull)jobsByVoidBlock applicationLoad;
@property(nonatomic,strong,readonly,nonnull)jobsByVoidBlock reservedLoad;
#pragma mark —— 设置背景图片的方法
@property(nonatomic,strong,readonly,nonnull)jobsByVoidBlock bgNormalLoad;
@property(nonatomic,strong,readonly,nonnull)jobsByVoidBlock bgHighlightedlLoad;
@property(nonatomic,strong,readonly,nonnull)jobsByVoidBlock bgDisabledLoad;
@property(nonatomic,strong,readonly,nonnull)jobsByVoidBlock bgSelectedLoad;
@property(nonatomic,strong,readonly,nonnull)jobsByVoidBlock bgFocusedLoad API_AVAILABLE(ios(9.0));
@property(nonatomic,strong,readonly,nonnull)jobsByVoidBlock bgApplicationLoad;
@property(nonatomic,strong,readonly,nonnull)jobsByVoidBlock bgReservedLoad;

@end

NS_ASSUME_NONNULL_END
/**
 btn.imageURL(self.BaseUrl.add(model.iosImage).jobsUrl)
    .placeholderImage(model.image)
    .options(SDWebImageRefreshCached)/// 强制刷新缓存
    .completed(^(UIImage * _Nullable image,
                 NSError * _Nullable error,
                 SDImageCacheType cacheType,
                 NSURL * _Nullable imageURL) {
        if (error) {
            NSLog(@"图片加载失败: %@-%@", error,imageURL);
        } else {
            NSLog(@"图片加载成功");
        }
    }).normalLoad();
 */
