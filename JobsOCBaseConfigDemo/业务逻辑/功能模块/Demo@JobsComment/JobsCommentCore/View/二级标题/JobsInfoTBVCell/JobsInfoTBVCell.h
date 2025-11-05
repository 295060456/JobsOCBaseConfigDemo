//
//  InfoTBVCell.h
//  commentList
//
//  Created by Jobs on 2020/7/14.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCellProtocol.h"
#import "UIImage+YBGIF.h"

#import "JobsCommentConfig.h"
#import "JobsCommentModel.h"
#import "RBCLikeButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsInfoTBVCell : UITableViewCell<BaseCellProtocol>

@property(nonatomic,strong,readonly)RBCLikeButton *likeBtn;

@end

NS_ASSUME_NONNULL_END
