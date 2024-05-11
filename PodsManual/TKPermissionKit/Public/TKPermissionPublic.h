//
//  TKPermissionPublic.h
//  TKPermissionKitDemo
//
//  Created by mac on 2019/10/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "NSString+Others.h"
#import "NSObject+OpenURL.h"
#import "NSObject+Extras.h"
#import "MacroDef_String.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKPermissionPublic : NSObject
/// 自定义未授权时，权限提示信息block，如果该属性存在则alertTitleXXX相关方法不执行。
@property(nonatomic,copy,nullable)TKPermissionCustomMsgBlock blockCustomMsg;

+(instancetype)shared;
/// 包装UIAlertController, 具有两个按钮
/// @param title  标题
/// @param msg  内容
/// @param leftTitle 左边按钮文字
/// @param rightTitle 右边按钮文字
+(void)alertTitle:(NSString *)title
              msg:(NSString *)msg
        leftTitle:(NSString *)leftTitle
       rightTitle:(NSString *)rightTitle;
/// 包装UIAlertController,只有一个按钮
/// @param title 标题
/// @param msg 内容
/// @param actionTitle  按钮文字
+(void)alertActionTitle:(NSString *)title 
                    msg:(NSString *)msg
            actionTitle:(NSString *)actionTitle;
/// 权限提示alert，两个按钮
+(void)alertPromptTips:(NSString *)msg;
/// 简单弹窗，一个按钮
+(void)alertTips:(NSString *)msg;

@end

NS_ASSUME_NONNULL_END
