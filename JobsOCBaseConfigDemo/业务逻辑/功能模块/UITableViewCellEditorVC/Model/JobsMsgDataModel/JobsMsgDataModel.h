//
//  JobsMsgDataModel.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/2.
//

#import "UIViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsMsgDataModel : UIViewModel

@property(nonatomic,assign)JobsMsgType msgStyle;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,assign)BOOL isDraw;/// 是否已经被领取？
@property(nonatomic,assign)BOOL isRead;/// 已读

@end

NS_ASSUME_NONNULL_END
