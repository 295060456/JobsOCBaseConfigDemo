//
//  AVURLAsset+Extra.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/30/24.
//

#import "AVURLAsset+Extra.h"

@implementation AVURLAsset (Extra)
/// 获取视频第一帧
-(UIImage *_Nonnull)videoPreViewImage{
    AVAssetImageGenerator *assetGen = [AVAssetImageGenerator.alloc initWithAsset:self];
    assetGen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [assetGen copyCGImageAtTime:time
                                        actualTime:&actualTime
                                             error:&error];
    UIImage *videoImage = [UIImage.alloc initWithCGImage:image];
    CGImageRelease(image);
    return videoImage;
}

@end
