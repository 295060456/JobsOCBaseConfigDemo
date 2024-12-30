//
//  WGradientProgressModel.h
//  FM
//
//  Created by Admin on 28/12/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface WGradientProgressModel : NSObject

@property(nonatomic,assign)CGFloat progress;
@property(nonatomic,strong,nonnull)CAGradientLayer *__block gradLayer;//通过改变layer的宽度来实现进度 运动员

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof WGradientProgressModel *_Nonnull jobsMakeWGradientProgressModel(jobsByWGradientProgressModelBlock _Nonnull block){
    WGradientProgressModel *data = WGradientProgressModel.alloc.init;
    if (block) block(data);
    return data;
}
