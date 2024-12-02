//
//  UIImage+YBGIF.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/7/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>
#import "NSMutableArray+Extra.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YBGIF)
/// 根据NSData* 创建gif图片
+(JobsReturnImageByDataBlock _Nonnull)animatedGIFWithData;
/// 根据图片名字创建gif图片
+ (UIImage *)animatedGIFNamed:(NSString *)name;
/// 根据大小裁剪图片
- (UIImage *)animatedImageByScalingAndCroppingToSize:(CGSize)size;//貌似废弃了，不管用，再研究

@end

NS_ASSUME_NONNULL_END
