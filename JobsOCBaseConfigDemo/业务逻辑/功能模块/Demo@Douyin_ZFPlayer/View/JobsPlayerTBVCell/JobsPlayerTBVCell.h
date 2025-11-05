//
//  JobsPlayerTBVCell.h
//  DouYin
//
//  Created by Jobs on 2020/9/23.
//

#import <UIKit/UIKit.h>
#import "CustomZFPlayerControlView.h"
#import "VideoModel.h"
#import "JobsTuple.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsPlayerTBVCell : UITableViewCell<BaseCellProtocol>

-(ZFPlayerController *)getPlayer;

@end

NS_ASSUME_NONNULL_END
