//
//  ZLGestureLockViewController.h
//  GestureLockDemo
//
//  Created by ZL on 2017/4/5.
//  Copyright © 2017年 ZL. All rights reserved.
//  手势密码界面 控制器

#import <UIKit/UIKit.h>
#import "UIButton+UI.h"
#import "MacroDef_Func.h"
#import "MacroDef_String.h"
#import "ZLGestureLockView.h"
#import "ZLGestureLockIndicator.h"
#import "BaseViewController.h"

typedef NS_ENUM(NSInteger,ZLUnlockType) {
    ZLUnlockTypeCreatePsw, // 创建手势密码
    ZLUnlockTypeValidatePsw // 校验手势密码
};

@interface ZLGestureLockViewController : BaseViewController
<
ZLGestureLockDelegate
, UIAlertViewDelegate
>

+ (void)deleteGesturesPassword;//删除手势密码
+ (NSString *)gesturesPassword;//获取手势密码

- (instancetype)initWithUnlockType:(ZLUnlockType)unlockType;

@end
