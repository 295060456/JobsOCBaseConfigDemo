//
//  JobsIMChatInfoTBVCell.h
//  JobsIM
//
//  Created by Jobs on 2020/11/10.
//

#import <UIKit/UIKit.h>
#import "JobsIMDefine.h"
#import "BaseCellProtocol.h"
#import "UITableViewCell+Margin.h"

#if __has_include(<MGSwipeTableCell/MGSwipeTableCell.h>)
#import <MGSwipeTableCell/MGSwipeTableCell.h>
#else
#import "MGSwipeTableCell.h"
#endif

#import "MGSwipeButtonModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsIMChatInfoTBVCell : MGSwipeTableCell<BaseCellProtocol>

@property(nonatomic,assign)BOOL isShowChatUserName;//是否显示每一个聊天的用户的用户名？默认不显示

-(NSArray *)createLeftButtons;
-(NSArray *)createRightButtons;

@end

NS_ASSUME_NONNULL_END
