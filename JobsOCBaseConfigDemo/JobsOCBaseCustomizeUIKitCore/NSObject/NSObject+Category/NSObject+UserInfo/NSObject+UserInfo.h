//
//  NSObject+UserInfo.h
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import <Foundation/Foundation.h>
#import "DefineConstString.h"
#import "JobsBlock.h"
#import "JobsUserModel.h"
#import "NSUserDefaults+Manager.h"
#import "NSMutableSet+Extra.h"
#import "NSMutableArray+Extra.h"
#import "NSObject+Extras.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (UserInfo)
/**
  【鉴别是否登录】
  【标准】token是否为空
  【return】 YES(已经登录)、NO（未登录）
 */
-(BOOL)isLogin;
/// 判定是否登录的标准1：是否本地存在用户数据模型 + 是否存在Token
-(BOOL)isLoginByToken;
/// 判定是否登录的标准2
/// 登录是否过期：没有过期时间 ===  已经过期
-(JobsReturnBOOLByStringBlock _Nonnull)isLoginByExpiredTime;
/// 检查是否登录并执行传入的代码块
-(void)isLogin:(jobsByVoidBlock _Nullable)loginedinBlock;
/// 刷新用户Token
-(jobsByVoidBlock _Nonnull)refreshUserToken;
/// 刷新用户Token（仅删除本地的用户数据）
-(jobsByVoidBlock _Nonnull)refreshUserToken2;
#pragma mark —— 全局的用户数据(存、取、清)
/// 登出清空用户数据 【用户信息】/【JobsUserModel】
-(jobsByVoidBlock _Nonnull)logOut;
/// 保存用户数据（用 NSUserDefaults ）【用户信息】/【JobsUserModel】
-(jobsByUserModelBlock _Nonnull)saveUserInfo;
/// 读取用户信息【用户信息】/【JobsUserModel】
-(JobsUserModel <NSCoding>*_Nullable)readUserInfo;
/// 保存用户数据
-(jobsByIDAndKeyBlock _Nonnull)jobsSaveUserInfo;
/// 读取用户信息
-(JobsReturnIDByStringBlock _Nonnull)jobsReadUserInfo;
#pragma mark —— 保存特定的用户数据（不随登出清空数据）
///【通过特定的用户名】 保存（更新）用户的本地资料（用 NSUserDefaults ）
-(jobsByUserModelBlock _Nonnull)userNameToSaveUserInfo;
///【通过特定的用户名】 读取用户的本地资料
-(JobsReturnIDByClsAndSaltStrBlock _Nonnull)readUserInfoByUserName;
///【通过特定的用户名】 删除该用户的本地资料
-(jobsByStringBlock _Nonnull)deleteUserInfoByUserName;
#pragma mark —— 全局保存和删除已经登录成功的用户名
/// 全局保存已经登录成功 且 并未删除的用户名
-(jobsByStringBlock _Nonnull)saveUserName;
-(NSArray *_Nullable)readUserNameMutArr;
/// 全局删除已经登录成功的用户名
-(jobsByStringBlock _Nonnull)deleteUserName;

@end

NS_ASSUME_NONNULL_END
/**
 
 #pragma mark —— 存取用户信息Demo
 -(void)saveAndReadUserInfoDemo{
     JobsAppDoorVC *userModel = JobsAppDoorVC.new;
     userModel.token = @"12345";
     userModel.uid = @"54321";
     
     self.saveUserInfo(userModel);
     NSLog(@"");
     JobsAppDoorVC *f = self.readUserInfo;
     NSLog(@"");
 }
 
 */
