//
//  SDWebImageModel.h
//  FM
//
//  Created by User on 9/19/24.
//

#import <Foundation/Foundation.h>

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDWebImageModel : NSObject

@property(nonatomic,strong)NSURL *url;
@property(nonatomic,strong)UIImage *placeholder;
@property(nonatomic,assign)SDWebImageOptions options;
@property(nonatomic,copy)SDExternalCompletionBlock completion;
@property(nonatomic,copy)SDImageLoaderProgressBlock progress;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof SDWebImageModel *_Nonnull jobsMakeSDWebImageModel(jobsBySDWebImageModelBlock _Nonnull block){
    SDWebImageModel *data = SDWebImageModel.alloc.init;
    if (block) block(data);
    return data;
}
