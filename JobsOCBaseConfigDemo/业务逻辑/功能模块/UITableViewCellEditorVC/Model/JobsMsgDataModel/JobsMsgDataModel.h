//
//  JobsMsgDataModel.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/2.
//

#import "UIViewModel.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsMsgDataModel : UIViewModel

@property(nonatomic,assign)JobsMsgType msgStyle;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,assign)BOOL isDraw;/// 是否已经被领取？
@property(nonatomic,assign)BOOL isRead;/// 已读

@end

NS_ASSUME_NONNULL_END

static inline __kindof JobsMsgDataModel *_Nonnull jobsMakeMsgDataModel(jobsByMsgDataModelBlock _Nonnull block){
    JobsMsgDataModel *data = JobsMsgDataModel.alloc.init;
    if (block) block(data);
    return data;
}
