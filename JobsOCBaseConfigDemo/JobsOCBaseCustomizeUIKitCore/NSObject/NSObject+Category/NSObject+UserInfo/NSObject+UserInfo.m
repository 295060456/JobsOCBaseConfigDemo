//
//  NSObject+UserInfo.m
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import "NSObject+UserInfo.h"

NSString *const 用户信息 = @"用户信息";
NSString *const 用户名数组 = @"用户名数组";
NSString *const FM用户数据 = @"FM用户数据";

@implementation NSObject (UserInfo)
/**
 【鉴别是否登录】
 【标准】token是否为空
 【return】 YES(已经登录)、NO（未登录）
 */
-(BOOL)isLogin{
    UserDefaultModel *obj = (UserDefaultModel *)NSUserDefaults.readWithKey(用户信息);
    if (obj) {
        return isValue(self.readUserInfo().token);
    }return obj;
}
/// 检查是否登录并执行传入的代码块
-(void)isLogin:(jobsByVoidBlock)loginedinBlock {
    if (self.isLogin) {
        if (loginedinBlock) loginedinBlock();
    } else self.toLogin();
}
#pragma mark —— 全局的用户数据(存、取、清)[全局唯一一份用户档案]
/// 登出清空用户数据 【用户信息】/【JobsUserModel】
-(void)logOut{
    self.deleteUserInfoByUserName(用户信息);
}
/// 保存用户数据（用 NSUserDefaults ）【用户信息】/【JobsUserModel】
-(jobsByUserModelBlock)saveUserInfo{
    @jobs_weakify(self)
    return ^(JobsUserModel <NSCoding> *_Nullable userModel) {
        @jobs_strongify(self)
        self.jobsSaveUserInfo(userModel,用户信息);
    };
}
/// 读取用户信息【用户信息】/【JobsUserModel】
-(JobsReturnUserModelByVoidBlock)readUserInfo{
    @jobs_weakify(self)
    return ^JobsUserModel <NSCoding> *_Nullable() {
        @jobs_strongify(self)
        return self.jobsReadUserInfo(用户信息);
    };
}
/// 保存用户数据
-(jobsByIDAndKeyBlock)jobsSaveUserInfo{
    return ^(NSObject <NSCoding> * _Nonnull userModel,
             NSString * _Nullable key) {
        UserDefaultModel *userDefaultModel = UserDefaultModel.new;
        userDefaultModel.obj = userModel;
        userDefaultModel.key = key;
        NSUserDefaults.updateWithModel(userDefaultModel);
    };
}
/// 读取用户信息
-(JobsReturnIDByStringBlock)jobsReadUserInfo{
    @jobs_weakify(self)
    return ^id _Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        return self.readUserInfoByUserName(nil,data);
    };
}
#pragma mark —— 保存特定的用户数据（不随登出清空数据）[全局多份用户档案]
///【通过特定的用户名】 保存（更新）用户的本地资料（用 NSUserDefaults ）
-(jobsByUserModelBlock)userNameToSaveUserInfo{
    return ^(JobsUserModel <NSCoding>*_Nullable userModel){
        UserDefaultModel *userDefaultModel = UserDefaultModel.new;
        userDefaultModel.obj = userModel;
        userDefaultModel.key = userModel.userName;
        NSUserDefaults.updateWithModel(userDefaultModel);
    };
}
///【通过特定的用户名】 读取用户的本地资料
-(JobsReturnIDByClsAndSaltStrBlock)readUserInfoByUserName{
    return ^id _Nullable(Class _Nonnull cls,NSString *_Nullable userName){
        NSData *archivedData = NSUserDefaults.readWithKey(userName);
        if(HDDeviceSystemVersion.floatValue < 12.0){
            SuppressWdeprecatedDeclarationsWarning(return [NSKeyedUnarchiver unarchiveObjectWithData:archivedData];);
        }else{
            NSError *error = nil;
            /// 如果 JobsUserModel 中包含更多自定义类型或者你需要解码其他基本类型（例如 NSArray 或 NSDictionary），需要将这些类也加入到 allowedClasses 集合中。
            /// 确保在解码所有需要的类时，将其包含在 allowedClasses 集合中以避免警告和潜在的解码失败。例如
            NSMutableSet <Class>*allowedClasses = NSMutableSet.set;
            allowedClasses.add(JobsUserModel.class);
            allowedClasses.add(NSString.class);
            allowedClasses.add(NSNumber.class);
            allowedClasses.add(NSArray.class);
            allowedClasses.add(NSDictionary.class);
            allowedClasses.add(UIImage.class);
            allowedClasses.add(NSArray.class);
            allowedClasses.add(cls);
            
            id userModel = [NSKeyedUnarchiver unarchivedObjectOfClasses:allowedClasses
                                                               fromData:archivedData
                                                                  error:&error];
            if (!userModel) {
                NSLog(@"解档失败: %@", error.localizedDescription);
                /// 没取到用户数据，就直接跳登录
                self.toLogin();
            }return userModel;
        }
    };
}
///【通过特定的用户名】 删除该用户的本地资料
-(jobsByStringBlock)deleteUserInfoByUserName{
    return ^(NSString *_Nullable userName) {
        NSUserDefaults.deleteWithKey(userName);
    };
}
#pragma mark —— 全局保存和删除已经登录成功的用户名
/// 全局保存已经登录成功 且 并未删除的用户名组
-(jobsByStringBlock)saveUserName{
    return ^(NSString *_Nullable userName){
        if (isNull(userName)) return;
        NSMutableArray <NSString *>*userNameMutArr = [NSMutableArray arrayWithArray:JobsUserDefaults.valueForKey(用户名数组)];//取出来的实际上是个不可变数组，所以需要向可变数组进行转化
        if (!userNameMutArr) {
            userNameMutArr = NSMutableArray.array;
        }
        // 保持唯一性
        if (![userNameMutArr containsObject:userName]) {
            userNameMutArr.add(userName);
            JobsSetUserDefaultKeyWithObject(用户名数组, userNameMutArr);
            JobsUserDefaultSynchronize;
        }
    };
}
/// 读取用户名组
-(NSArray *_Nullable)readUserNameMutArr{
    return JobsUserDefaults.valueForKey(用户名数组);
}
/// 全局删除已经登录成功的用户名
-(jobsByStringBlock)deleteUserName{
    return ^(NSString *_Nullable userName){
        NSMutableArray <NSString *>*userNameMutArr = [NSMutableArray arrayWithArray:JobsUserDefaults.valueForKey(用户名数组)];
        if (userNameMutArr && isValue(userName)) {
            [userNameMutArr removeObject:userName];
            JobsSetUserDefaultKeyWithObject(用户名数组, userNameMutArr);
            JobsUserDefaultSynchronize;
        }
    };
}

@end
