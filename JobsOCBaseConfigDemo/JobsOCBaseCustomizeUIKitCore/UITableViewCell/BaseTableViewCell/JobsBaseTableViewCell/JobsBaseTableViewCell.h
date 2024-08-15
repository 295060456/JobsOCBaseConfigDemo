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
#import "UIView+Measure.h"

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#elif __has_include("XYColorOC.h")
#import "XYColorOC.h"
#elif __has_include("XYColorOC-umbrella.h")
#import "XYColorOC-umbrella.h"
#else
#error "XYColorOC header not found"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsBaseTableViewCell : UITableViewCell
<
UITableViewCellProtocol
,UIViewModelProtocol
>
/// 获取绑定的数据源
-(UIViewModel *)getViewModel;

@end

NS_ASSUME_NONNULL_END
