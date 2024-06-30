//
//  JobsAppDoorContentView.h
//  My_BaseProj
//
//  Created by Jobs on 2020/12/3.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseContentView.h"
#import "UIView+Extras.h"
#import "UIView+AutoSelfAdaptionSize.h"
#import "JobsAppDoorInputViewHeader.h"
#import "JobsAppDoorConfig.h"
#import "JobsAppDoorModel.h"
#import "JobsAppDoorInputViewBaseStyleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorContentView : BaseContentView

@property(nonatomic,strong)NSMutableArray <JobsAppDoorInputViewBaseStyle *>*loginDoorInputViewBaseStyleMutArr;
@property(nonatomic,strong)NSMutableArray <JobsAppDoorInputViewBaseStyle *>*registerDoorInputViewBaseStyleMutArr;
@property(nonatomic,strong)JobsAppDoorModel *appDoorModel;/// 网络请求的传入参数
/// 获取存储按钮
-(UIButton *)getStoreCodeBtn;
/// 去登录【外部调用】
-(void)animationToLogin;
/// 去注册【外部调用】
-(void)animationToRegister;

@end

NS_ASSUME_NONNULL_END
