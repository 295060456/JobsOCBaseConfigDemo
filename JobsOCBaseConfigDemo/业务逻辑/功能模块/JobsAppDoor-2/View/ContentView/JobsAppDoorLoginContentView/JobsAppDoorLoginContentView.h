//
//  LoginContentView.h
//  Shooting
//
//  Created by Jobs on 2020/9/3.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsDoorInputViewProtocol.h"
#import "BaseViewProtocol.h"
#import "JobsAppDoorInputViewHeader.h"
#import "JobsAppDoorConfig.h"
#import "BaseContentView.h"

NS_ASSUME_NONNULL_BEGIN
/// 登录页
@interface JobsAppDoorLoginContentView : BaseContentView
<
JobsDoorInputViewProtocol
,BaseViewProtocol
>

@end

NS_ASSUME_NONNULL_END
