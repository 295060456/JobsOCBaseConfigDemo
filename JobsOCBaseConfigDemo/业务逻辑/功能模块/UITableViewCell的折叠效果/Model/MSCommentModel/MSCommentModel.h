//
//  MSCommentModel.h
//  MataShop
//
//  Created by Jobs Hi on 10/2/23.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSCommentDetailModel : BaseModel

@property(nonatomic,copy)NSString *rowTitle;

@end

@interface MSCommentModel : BaseModel

@property(nonatomic,copy)NSString *sectionTitle;
@property(nonatomic,strong)NSMutableArray <MSCommentDetailModel *>*commentDataMutArr;

@end

NS_ASSUME_NONNULL_END
