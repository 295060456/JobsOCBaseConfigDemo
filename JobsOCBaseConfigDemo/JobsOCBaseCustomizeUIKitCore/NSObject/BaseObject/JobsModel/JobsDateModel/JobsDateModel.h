//
//  JobsDateModel.h
//  FM
//
//  Created by Admin on 20/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsDateModel : NSObject

@property(nonatomic,strong,null_resettable)NSTimeZone *timeZone;
@property(nonatomic,assign)NSTimeInterval timeInterval;
@property(nonatomic,strong,null_resettable)NSDateFormatter *dateFormatter;
@property(nonatomic,strong)NSDate *date;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsDateModel *_Nonnull jobsMakeDateModel(jobsByDateModelBlock _Nonnull block){
    JobsDateModel *data = JobsDateModel.alloc.init;
    if (block) block(data);
    return data;
}
