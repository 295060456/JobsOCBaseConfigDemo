//
//  NSObject+PopViewToLogOut.h
//  Casino
//
//  Created by Jobs on 2022/1/1.
//

#import <Foundation/Foundation.h>
#import "NSObject+TFPopup.h"
#import "JobsBasePopupView.h"

NS_ASSUME_NONNULL_BEGIN
/// 触发退出登录模块之前，弹窗提示二次确认，确认以后再删除本地用户数据
@interface NSObject (PopViewToLogOut)
/// UI
@property(nonatomic,strong)JobsBasePopupView *logOutPopupView;
/// Data
@property(nonatomic,strong)UIViewModel *logOutPopupVM;

@end

NS_ASSUME_NONNULL_END
