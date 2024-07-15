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

NS_ASSUME_NONNULL_BEGIN

@interface BaseButton : UIButton<BaseButtonProtocol>

@end

NS_ASSUME_NONNULL_END
