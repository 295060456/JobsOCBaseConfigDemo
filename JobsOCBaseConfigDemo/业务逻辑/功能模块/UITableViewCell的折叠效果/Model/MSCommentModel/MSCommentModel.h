//
//  MSCommentModel.h
//  MataShop
//
//  Created by Jobs Hi on 10/2/23.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSCommentDetailModel : BaseModel

Prop_copy()NSString *rowTitle;

@end

@interface MSCommentModel : BaseModel

Prop_copy()NSString *sectionTitle;
Prop_strong()NSMutableArray <MSCommentDetailModel *>*commentDataMutArr;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof MSCommentDetailModel *_Nonnull jobsMakeMSCommentDetailModel(jobsByMSCommentDetailModelBlock _Nonnull block){
    MSCommentDetailModel *data = MSCommentDetailModel.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof MSCommentModel *_Nonnull jobsMakeMSCommentModel(jobsByMSCommentModelBlock _Nonnull block){
    MSCommentModel *data = MSCommentModel.alloc.init;
    if (block) block(data);
    return data;
}
