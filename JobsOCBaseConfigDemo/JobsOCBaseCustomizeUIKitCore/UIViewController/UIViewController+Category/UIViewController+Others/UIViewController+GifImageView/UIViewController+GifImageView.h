//
//  UIViewController+GifImageView.h
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsString.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (GifImageView)

#pragma mark —— BaseVC+GifImageView
Prop_strong()UIImageView *gifImageView;
Prop_copy()NSString *path;
Prop_strong()NSData *data;
Prop_strong()UIImage *image;

@end

NS_ASSUME_NONNULL_END
