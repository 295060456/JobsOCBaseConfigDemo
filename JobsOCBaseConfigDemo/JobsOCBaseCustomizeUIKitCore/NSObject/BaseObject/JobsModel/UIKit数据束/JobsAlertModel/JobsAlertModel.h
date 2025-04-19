//
//  JobsAlertModel.h
//  FM
//
//  Created by Admin on 25/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsAlertModel : BaseModel
/// UIAlertController
Prop_copy()NSString *alertControllerTitle;
Prop_copy()NSString *message;
Prop_assign()UIAlertControllerStyle preferredStyle;/// UIAlertControllerStyleAlert
/// UIAlertAction（普通的）
Prop_copy()NSString *alertActionTitle;
Prop_assign()UIAlertActionStyle alertActionStyle;/// UIAlertActionStyleDefault
Prop_copy()jobsByAlertActionBlock alertActionBlock;
/// UIAlertAction（取消）
Prop_copy()NSString *cancelAlertActionTitle;
Prop_assign()UIAlertActionStyle cancelAlertActionStyle;/// UIAlertActionStyleCancel
Prop_copy()jobsByAlertActionBlock cancelAlertActionBlock;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsAlertModel *_Nonnull jobsMakeAlertModel(jobsByAlertModelBlock _Nonnull block){
    JobsAlertModel *data = JobsAlertModel.alloc.init;
    if (block) block(data);
    return data;
}
