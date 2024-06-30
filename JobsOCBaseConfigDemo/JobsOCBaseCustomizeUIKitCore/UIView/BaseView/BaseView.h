//
//  BaseView.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2021/2/5.
//  Copyright © 2021 MonkeyKingVideo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "BaseProtocol.h"
#import "BaseViewProtocol.h"
#import "UIViewModelProtocol.h"
#import "MacroDef_Notification.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseView : UIView
<
UIViewModelProtocol
,BaseProtocol
,BaseViewProtocol
>

@end

NS_ASSUME_NONNULL_END
