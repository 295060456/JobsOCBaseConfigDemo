//
//  JobsCorModel.h
//  FM
//
//  Created by Admin on 4/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsCorModel : BaseModel

Prop_assign()CGFloat red;
Prop_assign()CGFloat green;
Prop_assign()CGFloat blue;
Prop_assign()CGFloat alpha;

Prop_assign()CGFloat hue;
Prop_assign()CGFloat saturation;
Prop_assign()CGFloat brightness;

Prop_copy()NSString *corStr; /// 十六进制字符串

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsCorModel *_Nonnull jobsMakeCorModel(jobsByCorModelBlock _Nonnull block){
    JobsCorModel *data = JobsCorModel.alloc.init;
    if (block) block(data);
    return data;
}
