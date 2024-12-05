//
//  JobsAlertModel.h
//  FM
//
//  Created by Admin on 25/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsAlertModel : NSObject
/// UIAlertController
@property(nonatomic,copy)NSString *alertControllerTitle;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,assign)UIAlertControllerStyle preferredStyle;/// UIAlertControllerStyleAlert
/// UIAlertAction（普通的）
@property(nonatomic,copy)NSString *alertActionTitle;
@property(nonatomic,assign)UIAlertActionStyle alertActionStyle;/// UIAlertActionStyleDefault
@property(nonatomic,copy)jobsByAlertActionBlock alertActionBlock;
/// UIAlertAction（取消）
@property(nonatomic,copy)NSString *cancelAlertActionTitle;
@property(nonatomic,assign)UIAlertActionStyle cancelAlertActionStyle;/// UIAlertActionStyleCancel
@property(nonatomic,copy)jobsByAlertActionBlock cancelAlertActionBlock;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsAlertModel *_Nonnull jobsMakeAlertModel(jobsByAlertModelBlock _Nonnull block){
    JobsAlertModel *data = JobsAlertModel.alloc.init;
    if (block) block(data);
    return data;
}
