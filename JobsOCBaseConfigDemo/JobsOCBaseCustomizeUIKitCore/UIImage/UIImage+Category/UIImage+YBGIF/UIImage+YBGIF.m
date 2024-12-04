//
//  UIImage+YBGIF.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/7/1.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "UIImage+YBGIF.h"

@implementation UIImage (YBGIF)
/// 根据NSData* 创建gif图片
+(JobsReturnImageByDataBlock _Nonnull)animatedGIFWithData{
    @jobs_weakify(self)
    return ^UIImage *(NSData * _Nullable data) {
        @jobs_strongify(self)
        if (!data) return nil;
        CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
        size_t count = CGImageSourceGetCount(source);
        UIImage *animatedImage;
        if (count <= 1) {
            animatedImage = UIImage.initByData(data);
        }else {
            __block NSTimeInterval duration = 0.0f;
            @jobs_weakify(self)
            NSMutableArray *images = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                @jobs_strongify(self)
                for (size_t i = 0; i < count; i++) {
                    CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
                    if (!image) {
                        continue;
                    }
                    duration += [self frameDurationAtIndex:i source:source];
                    data.add([UIImage imageWithCGImage:image
                                                             scale:UIScreen.mainScreen.scale
                                                       orientation:UIImageOrientationUp]);
                    CGImageRelease(image);
                }
            });
            if (!duration) duration = (1.0f / 10.0f) * count;
            animatedImage = [UIImage animatedImageWithImages:images duration:duration];
        }
        CFRelease(source);
        return animatedImage;
    };
}

+ (float)frameDurationAtIndex:(NSUInteger)index
                       source:(CGImageSourceRef)source {
    float frameDuration = 0.1f;
    CFDictionaryRef cfFrameProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil);
    NSDictionary *frameProperties = (__bridge NSDictionary *)cfFrameProperties;
    NSDictionary *gifProperties = frameProperties[(NSString *)kCGImagePropertyGIFDictionary];
    NSNumber *delayTimeUnclampedProp = gifProperties[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    if (delayTimeUnclampedProp) {
       frameDuration = delayTimeUnclampedProp.floatValue;
    }else {
       NSNumber *delayTimeProp = gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];
       if (delayTimeProp) {
           frameDuration = delayTimeProp.floatValue;
       }
    }

   // Many annoying ads specify a 0 duration to make an image flash as quickly as possible.
   // We follow Firefox's behavior and use a duration of 100 ms for any frames that specify
   // a duration of <= 10 ms. See <rdar://problem/7689300> and <http://webkit.org/b/36082>
   // for more information.
   
    if (frameDuration < 0.011f) frameDuration = 0.100f;
   
    CFRelease(cfFrameProperties);
    return frameDuration;
}
/// 根据图片名字创建gif图片
+ (UIImage *)animatedGIFNamed:(NSString *)name {
   CGFloat scale = UIScreen.mainScreen.scale;
   if (scale > 1.0f) {
       NSString *retinaPath = name.add(@"@2x.gif").pathForResourceWithFullName;
       NSData *data = [NSData dataWithContentsOfFile:retinaPath];
       if (data) return UIImage.animatedGIFWithData(data);
       NSString *path = name.add(@".gif").pathForResourceWithFullName;
       data = [NSData dataWithContentsOfFile:path];
       if (data) return UIImage.animatedGIFWithData(data);
       return JobsIMG(@"name");
   }else {
       NSString *path = name.add(@".gif").pathForResourceWithFullName;
       NSData *data = [NSData dataWithContentsOfFile:path];
       if (data) {
           return UIImage.animatedGIFWithData(data);
       }return JobsIMG(@"name");
   }
}
/// 根据大小裁剪图片
- (UIImage *)animatedImageByScalingAndCroppingToSize:(CGSize)size {
    if (CGSizeEqualToSize(self.size, size) || jobsZeroSizeValue(size)) return self;
   
    CGSize scaledSize = size;
    CGPoint thumbnailPoint = CGPointZero;

    CGFloat widthFactor = size.width / self.size.width;
    CGFloat heightFactor = size.height / self.size.height;
    CGFloat scaleFactor = (widthFactor > heightFactor) ? widthFactor : heightFactor;
    scaledSize.width = self.size.width * scaleFactor;
    scaledSize.height = self.size.height * scaleFactor;

    if (widthFactor > heightFactor) {
       thumbnailPoint.y = (size.height - scaledSize.height) * 0.5;
    }else if (widthFactor < heightFactor) {
       thumbnailPoint.x = (size.width - scaledSize.width) * 0.5;
    }
    @jobs_weakify(self)
    NSMutableArray <UIImage *>*scaledImages = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        for (UIImage *image in self.images) {
            UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
             [image drawInRect:CGRectMake(thumbnailPoint.x,
                                          thumbnailPoint.y,
                                          scaledSize.width,
                                          scaledSize.height)];
            UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
            data.add(newImage);
            UIGraphicsEndImageContext();
        }
    });return [UIImage animatedImageWithImages:scaledImages duration:self.duration];
}

@end

