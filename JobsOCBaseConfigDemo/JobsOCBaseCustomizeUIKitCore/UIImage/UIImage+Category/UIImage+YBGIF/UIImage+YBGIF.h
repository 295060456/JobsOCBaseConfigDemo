//
//  UIImage+YBGIF.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/7/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h> /// 提供对图像数据的读写支持。
#import "JobsBlock.h"
#import "NSMutableArray+Extra.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YBGIF)
/// 根据NSData* 创建gif图片
+(JobsRetImageByDataBlock _Nonnull)animatedGIFWithData;
/// 根据图片名字创建gif图片
+(JobsRetImageByStringBlock _Nonnull)animatedGIFByName;
/// 貌似废弃了，不管用，再研究
/// 根据大小裁剪图片
-(JobsRetImageByCGSizeBlock _Nonnull)animatedImageByScalingAndCroppingBySize;

@end

NS_ASSUME_NONNULL_END
