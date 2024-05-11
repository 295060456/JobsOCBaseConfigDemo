//
//  JobsBaseTableViewCell.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2021/1/20.
//  Copyright © 2021 MonkeyKingVideo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "BaseCellProtocol.h"
#import "UITableViewCellProtocol.h"
#import "UIViewModelProtocol.h"
#import "MacroDef_Func.h"
#import "UIViewModel.h"

#import "XYColorOC-umbrella.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsBaseTableViewCell : UITableViewCell
<
BaseCellProtocol
,UITableViewCellProtocol
,UIViewModelProtocol
>

@end

NS_ASSUME_NONNULL_END
