//
//  AVURLAsset+Extra.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/30/24.
//

#import <AVFoundation/AVFoundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface AVURLAsset (Extra)
/// 获取视频第一帧
-(UIImage *_Nonnull)videoPreViewImage;

@end

NS_ASSUME_NONNULL_END
