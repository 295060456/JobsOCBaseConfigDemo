//
//  NSString+Image.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 10/29/25.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Image)
/// 获取本地图像
-(nullable UIImage *)img;
/// 获取网络图像
-(void)fetchImageByPlaceholder:(UIImage *)placeholder
                    completion:(jobsByImageBlock _Nullable)completion;

-(JobsReturnImageByStringBlock _Nonnull)imageByDataURL;

@end

NS_ASSUME_NONNULL_END

