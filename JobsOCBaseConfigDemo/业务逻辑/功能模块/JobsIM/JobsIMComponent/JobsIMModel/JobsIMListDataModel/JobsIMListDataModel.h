//
//  JobsIMListDataModel.h
//  JobsIM
//
//  Created by Jobs on 2020/11/17.
//

#import <Foundation/Foundation.h>
#import "UIImage+YBGIF.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsIMListDataModel : NSObject

Prop_copy()NSString *usernameStr;
Prop_copy()NSString *contentStr;
Prop_copy()NSString *timeStr;
Prop_strong()UIImage *userHeaderIMG;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsIMListDataModel *_Nonnull jobsMakeIMListDataModel(jobsByIMListDataModelBlock _Nonnull block){
    JobsIMListDataModel *data = JobsIMListDataModel.alloc.init;
    if (block) block(data);
    return data;
}
