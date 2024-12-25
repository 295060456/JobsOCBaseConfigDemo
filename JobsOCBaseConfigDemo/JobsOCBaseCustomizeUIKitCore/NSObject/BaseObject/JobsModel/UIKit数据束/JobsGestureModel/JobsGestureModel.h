//
//  JobsGestureModel.h
//  FM
//
//  Created by Admin on 25/12/2024.
//

#import <Foundation/Foundation.h>
#import "GestureProtocol.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsGestureModel : NSObject <GestureProtocol>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsGestureModel *_Nonnull jobsMakeGestureModel(jobsByGestureModelBlock _Nonnull block){
    JobsGestureModel *data = JobsGestureModel.alloc.init;
    if (block) block(data);
    return data;
}
