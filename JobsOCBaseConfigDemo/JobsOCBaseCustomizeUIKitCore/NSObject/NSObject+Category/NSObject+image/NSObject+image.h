//
//  NSObject+image.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 10/31/25.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (image)
/// 获取本地GIF图像
-(nullable UIImage *)gif_img;
/// 获取本地普通图像
-(nullable UIImage *)img;
/// 获取网络图像
-(void)fetchImageByPlaceholder:(UIImage *)placeholder
                    completion:(jobsByImageBlock _Nullable)completion;

-(JobsReturnImageByStringBlock _Nonnull)imageByDataURL;

@end

NS_ASSUME_NONNULL_END
