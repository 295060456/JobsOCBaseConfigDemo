//
//  UITableViewCell+UITableViewCellProtocol.h
//  DouDong-II
//
//  Created by Jobs on 2021/11/19.
//

#import <UIKit/UIKit.h>
#import "MacroDef_Func.h"
#import "UIViewModel.h"
#import "MacroDef_Size.h"
#import "UITableViewCellProtocol.h"

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

@interface UITableViewCell (UITableViewCellProtocol)
<
UITableViewCellProtocol
>

@end

NS_ASSUME_NONNULL_END
