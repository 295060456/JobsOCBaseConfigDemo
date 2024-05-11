//
//  NSObject+UserInfo.m
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import "NSObject+UserInfo.h"

NSString *const 用户信息 = @"用户信息";
NSString *const 用户名数组 = @"用户名数组";

@implementation NSObject (UserInfo)
/**
  【鉴别是否登录】
  【标准】token是否为空
  【return】 YES(已经登录)、NO（未登录）
 */
-(BOOL)isLogin{
    UserDefaultModel *obj = (UserDefaultModel *)[NSUserDefaults readWithKey:用户信息];
    if (obj) {
        return ![NSString isNullString:self.readUserInfo.token];
    }return obj;
}
#pragma mark —— 全局的用户数据(存、取、清)[全局唯一一份用户档案]
/// 登出清空用户数据
-(void)logOut{
    [self deleteUserInfoByUserName:用户信息];
}
/// 保存用户数据（用 NSUserDefaults ）
-(void)saveUserInfo:(JobsUserModel <NSCoding>*)userModel{
    UserDefaultModel *userDefaultModel = UserDefaultModel.new;
    userDefaultModel.obj = userModel;
    userDefaultModel.key = 用户信息;
    [NSUserDefaults updateWithModel:userDefaultModel];
}
/// 读取用户信息
-(JobsUserModel *)readUserInfo{
    return [self readUserInfoByUserName:用户信息];
}
#pragma mark —— 保存特定的用户数据（不随登出清空数据）[全局多份用户档案]
///【通过特定的用户名】 保存（更新）用户的本地资料（用 NSUserDefaults ）
-(void)userNameToSaveUserInfo:(JobsUserModel <NSCoding>*)userModel{
    UserDefaultModel *userDefaultModel = UserDefaultModel.new;
    userDefaultModel.obj = userModel;
    userDefaultModel.key = userModel.userName;
    [NSUserDefaults updateWithModel:userDefaultModel];
}
///【通过特定的用户名】 读取用户的本地资料
-(JobsUserModel *)readUserInfoByUserName:(NSString *)userName{
    NSData *archivedData = [NSUserDefaults readWithKey:userName];
    if(HDDeviceSystemVersion.floatValue < 12.0){
        SuppressWdeprecatedDeclarationsWarning(return [NSKeyedUnarchiver unarchiveObjectWithData:archivedData];);
    }else{
        NSError *error = nil;
        JobsUserModel *userModel = [NSKeyedUnarchiver unarchivedObjectOfClass:JobsUserModel.class
                                                                     fromData:archivedData
                                                                        error:&error];
        if (!userModel) {
            NSLog(@"解档失败: %@", error.localizedDescription);
        }return userModel;
    }
}
///【通过特定的用户名】 删除该用户的本地资料
-(void)deleteUserInfoByUserName:(NSString *)userName{
    [NSUserDefaults deleteWithKey:userName];
}
#pragma mark —— 全局保存和删除已经登录成功的用户名
/// 全局保存已经登录成功 且 并未删除的用户名组
-(void)saveUserName:(NSString *_Nullable)userName{
    if ([NSString isNullString:userName]) return;
    NSMutableArray *userNameMutArr = [NSMutableArray arrayWithArray:NSUserDefaults.standardUserDefaults.valueForKeyBlock(用户名数组)];//取出来的实际上是个不可变数组，所以需要向可变数组进行转化
    if (!userNameMutArr) {
        userNameMutArr = NSMutableArray.array;
    }
    // 保持唯一性
    if (![userNameMutArr containsObject:userName]) {
        [userNameMutArr addObject:userName];
        [NSUserDefaults.standardUserDefaults setObject:userNameMutArr forKey:用户名数组];
        [NSUserDefaults.standardUserDefaults synchronize];
    }
}
/// 读取用户名组
-(NSArray *_Nullable)readUserNameMutArr{
    return NSUserDefaults.standardUserDefaults.valueForKeyBlock(用户名数组);
}
/// 全局删除已经登录成功的用户名
-(void)deleteUserName:(NSString *_Nullable)userName{
    NSMutableArray *userNameMutArr = [NSMutableArray arrayWithArray:NSUserDefaults.standardUserDefaults.valueForKeyBlock(用户名数组)];
    if (userNameMutArr && ![NSString isNullString:userName]) {
        [userNameMutArr removeObject:userName];
        [NSUserDefaults.standardUserDefaults setObject:userNameMutArr forKey:用户名数组];
        [NSUserDefaults.standardUserDefaults synchronize];
    }
}

@end
