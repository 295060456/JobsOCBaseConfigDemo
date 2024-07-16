//
//  ZFDouYinCell.h
//  DouYin
//
//  Created by Jobs on 2020/9/28.
//

#import <UIKit/UIKit.h>
#import "BaseCellProtocol.h"
#import "UIMarkProtocol.h"

#import "JobsRightBtnsView.h"

#import "ZFDouYinCellDelegate.h"
#import "VideoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsVideoTBVCell : UITableViewCell
<
BaseCellProtocol,
UIMarkProtocol
>

@property(nonatomic,weak)id<ZFDouYinCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
