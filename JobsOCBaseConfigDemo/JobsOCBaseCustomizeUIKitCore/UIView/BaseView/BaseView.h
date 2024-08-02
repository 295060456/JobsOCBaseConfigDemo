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
#import "JobsNavBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseView : UIView
<
UIViewModelProtocol
,BaseProtocol
,BaseViewProtocol
>
@property(nonatomic,strong)JobsNavBarConfig *_Nullable navBarConfig;
@property(nonatomic,strong)JobsNavBar * _Nullable navBar;

-(JobsReturnNavBarConfigByButtonModelBlock)makeNavBarConfig;
// 返回按钮的回调
-(void)actionNavBarBackBtnClickBlock:(JobsNavBarBackBtnClickAction)objectBlock;
// 关闭按钮的回调
-(void)actionNavBarCloseBtnClickBlock:(JobsNavBarCloseBtnClickAction)objectBlock;

@end

NS_ASSUME_NONNULL_END
