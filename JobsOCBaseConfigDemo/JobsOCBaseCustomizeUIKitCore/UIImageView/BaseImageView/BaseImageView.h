//
//  BaseImageView.h
//  KJBannerViewDemo
//
//  Created by 杨科军 on 2021/2/19.
//  Copyright © 2021 杨科军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
#import "BaseProtocol.h"
#import "UIViewModelProtocol.h"
#import "MacroDef_Notification.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseImageView : UIImageView
<
BaseViewProtocol
,UIViewModelProtocol
,BaseProtocol
>

@end

NS_ASSUME_NONNULL_END
