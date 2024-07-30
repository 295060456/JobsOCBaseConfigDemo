//
//  BaseTableViewHeaderFooterView.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/30.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
#import "UIViewModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewHeaderFooterView : UITableViewHeaderFooterView
<
BaseViewProtocol,
UIViewModelProtocol
>

@end

NS_ASSUME_NONNULL_END
