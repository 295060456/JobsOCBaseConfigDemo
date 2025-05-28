//
//  BaseView.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2021/2/5.
//  Copyright © 2021 MonkeyKingVideo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "DefineProperty.h"
#import "BaseProtocol.h"
#import "BaseViewProtocol.h"
#import "UIViewModelProtocol.h"
#import "AppToolsProtocol.h"
#import "MacroDef_Notification.h"
#import "JobsNavBar.h"
//#import "NSObject+AppTools.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseView : UIView
<
UIViewModelProtocol,
BaseProtocol,
BaseViewProtocol,
AppToolsProtocol
>

Prop(nullable)JobsNavBarConfig *navBarConfig;
Prop(nullable)JobsNavBar *navBar;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UIView *_Nonnull jobsMakeBaseView(jobsByBaseViewBlock _Nonnull block){
    BaseView *data = BaseView.alloc.init;
    if (block) block(data);
    return data;
}
