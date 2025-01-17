//
//  BaseButton.h
//  DouDong-II
//
//  Created by Jobs on 2021/6/1.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "BaseButtonProtocol.h"
#import "UIButton+UI.h"
#import "UIView+Extras.h"
#import "UILabel+Extra.h"
#import "UIMarkProtocol.h"
#import "UIView+Measure.h"

NS_ASSUME_NONNULL_BEGIN
/// 此类的意义：可以重新定义相关子控件的Frame
@interface BaseButton : UIButton
<
BaseButtonProtocol
,UIMarkProtocol
>

@end

NS_ASSUME_NONNULL_END
