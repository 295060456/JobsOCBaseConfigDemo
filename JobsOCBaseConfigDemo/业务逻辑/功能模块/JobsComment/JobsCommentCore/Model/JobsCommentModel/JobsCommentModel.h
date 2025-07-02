//
//  MKCommentModel.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/7/23.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN
/// 对应字段 child
@interface JobsChildCommentModel : BaseModel

Prop_copy()NSString *ID;
Prop_copy()NSString *parentId;
Prop_copy()NSString *headImg;
Prop_copy()NSString *userId;
Prop_copy()NSString *nickname;
Prop_copy()NSString *content;
Prop_copy()NSString *commentDate;
Prop_assign()NSInteger praiseNum;
Prop_copy()NSString *toReplyUserId;
Prop_copy()NSString *toReplyUserImg;
Prop_copy()NSString *toReplyUserName;
Prop_copy()NSString *commentId;
Prop_copy()NSString *isPraise;
Prop_assign()NSInteger isVip;
Prop_assign()NSInteger toIsVip;

@end
/// 对应字段 list
@interface JobsFirstCommentModel : BaseModel

Prop_copy()NSString *ID;
Prop_copy()NSString *parentId;
Prop_copy()NSString *headImg;
Prop_copy()NSString *userId;
Prop_copy()NSString *nickname;
Prop_copy()NSString *content;
Prop_copy()NSString *commentDate;
Prop_assign()NSInteger praiseNum;
Prop_assign()NSInteger replyNum;
Prop_strong()NSArray <JobsChildCommentModel *>*childDataArr;//二级评论
Prop_copy()NSString *videoId;
Prop_copy()NSString *commentId;
Prop_assign()NSInteger isPraise;
Prop_assign()BOOL isVip;

@end
/// 对应字段 data
@interface JobsCommentModel : BaseModel

Prop_copy()NSArray <JobsFirstCommentModel *>*listDataArr;//一级评论

@end

@interface JobsFirstCommentCustomCofigModel : BaseModel

Prop_strong()NSArray <JobsChildCommentModel *>*childDataArr;//二级评论
#pragma mask —— 自定义字段
Prop_assign()BOOL isFullShow;//是否全显示 默认不全显示
Prop_assign()NSInteger preMax;//显示控制，二级数据默认最多显示多少个 默认3
Prop_assign()NSInteger firstShowNum;//在满足限制条件的情况下，第一次显示的数据条数 （数据库有但小于PreMax）
Prop_assign()NSInteger loadMoreDataNum;//加载更多数据,一次加载的个数，为0全加载

@end


NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsChildCommentModel *_Nonnull jobsMakeChildCommentModel(jobsByChildCommentModelBlock _Nonnull block){
    JobsChildCommentModel *data = JobsChildCommentModel.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JobsFirstCommentModel *_Nonnull jobsMakeFirstCommentModel(jobsByFirstCommentModelBlock _Nonnull block){
    JobsFirstCommentModel *data = JobsFirstCommentModel.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JobsCommentModel *_Nonnull jobsMakeCommentModel(jobsByCommentModelBlock _Nonnull block){
    JobsCommentModel *data = JobsCommentModel.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JobsFirstCommentCustomCofigModel *_Nonnull jobsMakeFirstCommentCustomCofigModel(jobsByFirstCommentCustomCofigModelBlock _Nonnull block){
    JobsFirstCommentCustomCofigModel *data = JobsFirstCommentCustomCofigModel.alloc.init;
    if (block) block(data);
    return data;
}
