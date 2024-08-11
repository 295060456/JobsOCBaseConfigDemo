//
//  NSObject+UserInfo.h
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import <Foundation/Foundation.h>
#import "NSUserDefaults+Manager.h"
#import "JobsUserModel.h"
#import "JobsBlock.h"

FOUNDATION_EXTERN NSString * _Nonnull const 用户信息;
FOUNDATION_EXTERN NSString * _Nonnull const 用户名数组;

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (UserInfo)
/**
  【鉴别是否登录】
  【标准】token是否为空
  【return】 YES(已经登录)、NO（未登录）
 */
-(BOOL)isLogin;
#pragma mark —— 全局的用户数据(存、取、清)
/// 登出清空用户数据
-(void)logOut;
/// 保存用户数据（用 NSUserDefaults ）
-(jobsByUserModelBlock)saveUserInfo;
/// 读取用户信息
-(JobsReturnUserModelByVoidBlock)readUserInfo;
#pragma mark —— 保存特定的用户数据（不随登出清空数据）
///【通过特定的用户名】 保存（更新）用户的本地资料（用 NSUserDefaults ）
-(void)userNameToSaveUserInfo:(JobsUserModel <NSCoding>*)userModel;
///【通过特定的用户名】 读取用户的本地资料
-(JobsUserModel *)readUserInfoByUserName:(NSString *)userName;
///【通过特定的用户名】 删除该用户的本地资料
-(void)deleteUserInfoByUserName:(NSString *)userName;
#pragma mark —— 全局保存和删除已经登录成功的用户名
/// 全局保存已经登录成功 且 并未删除的用户名
-(void)saveUserName:(NSString *_Nullable)userName;
-(NSArray *_Nullable)readUserNameMutArr;
/// 全局删除已经登录成功的用户名
-(void)deleteUserName:(NSString *_Nullable)userName;

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
     JobsAppDoorVC *f = self.readUserInfo();
     NSLog(@"");
 }
 
 */
