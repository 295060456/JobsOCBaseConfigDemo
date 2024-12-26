//
//  JobsKeyValueModel.h
//  FM
//
//  Created by User on 9/21/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsKeyValueModel <__covariant KeyType, __covariant ObjectType> : BaseModel

@property(nonatomic,copy)KeyType key;
@property(nonatomic,strong)ObjectType value;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsKeyValueModel *_Nonnull jobsMakeKeyValueModel(jobsByKeyValueModelBlock _Nonnull block){
    JobsKeyValueModel *data = JobsKeyValueModel.alloc.init;
    if (block) block(data);
    return data;
}
