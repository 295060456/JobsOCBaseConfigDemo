//
//  NSObject+UserInfo.m
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import "NSObject+UserInfo.h"

@implementation NSObject (UserInfo)
/**
 【鉴别目前是否登录】
 【标准】判定的标准 = 用户数据存在➕用户数据中Token的值非空➕Token过期时间存在➕Token是否已经过期
 【return】 YES(已经登录)、NO（未登录）
 */
-(BOOL)isLogin{
    NSLog(@"userInfo = %@",self.doorModel);
    NSLog(@"Token = %@",self.doorModel.token);
    if(isValue(self.doorModel.expireTime)){
        NSLog(@"当前时间为:%@, Token过期时间为:%@", NSDate.date, self.doorModel.expireTime.chinaTime(nil));
    }
    /// 模型都没有建立肯定是没有登录的
    if(!self.doorModel) return NO;
    /// Token 都没有肯定也是没有登录的
    if(isNull(self.doorModel.token)) return NO;
//    /// 存在过期时间，则鉴别过期时间以判断是否登录
//    if(isValue(self.doorModel.expireTime)) {
//        /// 登录是否过期：过期 === 未登录
//        return self.isLoginByExpiredTime(self.doorModel.expireTime);
//    }
    else return YES;/// 过期时间都没有，肯定也是没有登录的
}
/// 判定是否登录的标准1：是否本地存在用户数据模型 + 是否存在Token
-(BOOL)isLoginByToken{
    /// 模型都没有建立肯定是没有登录的
    if(self.doorModel) return YES;
    /// Token 都没有肯定也是没有登录的
    if(isValue(self.doorModel.token)) return YES;
    return NO;
}
/// 判定是否登录的标准2
/// 登录是否过期：没有过期时间 ===  已经过期
-(JobsReturnBOOLByStringBlock _Nonnull)isLoginByExpiredTime{
    return ^BOOL(NSString *_Nullable data){
        if(isValue(data)){
            return !data.isExpired();
        }return NO;
    };
}
/// 检查是否登录并执行传入的代码块
-(void)isLogin:(jobsByVoidBlock _Nullable)loginedinBlock {
    if (self.isLogin) {
        if (loginedinBlock) loginedinBlock();
    } else self.toLogin();
}
/// 刷新用户Token
-(jobsByVoidBlock _Nonnull)refreshUserToken{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(self.isLogin){
            /// 如果Token过期，则跳转登录获取，以刷新Token
            self.toLogin();
        }
    };
}
/// 刷新用户Token（仅删除本地的用户数据）
-(jobsByVoidBlock _Nonnull)refreshUserToken2{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(!(self.isLoginByToken &&
             self.isLoginByExpiredTime((self.doorModel.expireTime)))){
            self.deleteUserInfoByUserName(用户信息);/// 清理本地用户数据
        }
    };
}
#pragma mark —— 全局的用户数据(存、取、清)[全局唯一一份用户档案]
/// 登出清空用户数据 【用户信息】/【JobsUserModel】
-(jobsByVoidBlock _Nonnull)logOut{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.deleteUserInfoByUserName(用户信息);
    };
}
/// 保存用户数据（用 NSUserDefaults ）【用户信息】/【JobsUserModel】
-(jobsByUserModelBlock _Nonnull)saveUserInfo{
    @jobs_weakify(self)
    return ^(JobsUserModel <NSCoding> *_Nullable userModel) {
        @jobs_strongify(self)
        self.jobsSaveUserInfo(userModel,用户信息);
    };
}
/// 读取用户信息【用户信息】/【JobsUserModel】
-(JobsUserModel <NSCoding>*_Nullable)readUserInfo{
    return self.jobsReadUserInfo(用户信息);
}
/// 保存用户数据
-(jobsByIDAndKeyBlock _Nonnull)jobsSaveUserInfo{
    return ^(NSObject <NSCoding> * _Nonnull userModel,
             NSString * _Nullable key) {
        NSUserDefaults.updateWithModel(jobsMakeUserDefaultModel(^(UserDefaultModel * _Nonnull data) {
            data.obj = userModel;
            data.key = key;
        }));
    };
}
/// 读取用户信息
-(JobsReturnIDByStringBlock _Nonnull)jobsReadUserInfo{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data) {
        @jobs_strongify(self)
        return self.readUserInfoByUserName(nil,data);
    };
}
#pragma mark —— 保存特定的用户数据（不随登出清空数据）[全局多份用户档案]
///【通过特定的用户名】 保存（更新）用户的本地资料（用 NSUserDefaults ）
-(jobsByUserModelBlock _Nonnull)userNameToSaveUserInfo{
    return ^(JobsUserModel <NSCoding>*_Nullable userModel){
        NSUserDefaults.updateWithModel(jobsMakeUserDefaultModel(^(UserDefaultModel * _Nonnull data) {
            data.obj = userModel;
            data.key = userModel.userName;
        }));
    };
}
///【通过特定的用户名】 读取用户的本地资料
-(JobsReturnIDByClsAndSaltStrBlock _Nonnull)readUserInfoByUserName{
    return ^id _Nullable(Class _Nonnull cls,NSString *_Nullable userName){
        NSData *archivedData = NSUserDefaults.readWithKey(userName);
        if(archivedData){
            if(HDDeviceSystemVersion.floatValue < 12.0){
                SuppressWdeprecatedDeclarationsWarning(return [NSKeyedUnarchiver unarchiveObjectWithData:archivedData];);
            }else{
                NSError *error = nil;
                id userModel = nil;
                /// 如果 JobsUserModel 中包含更多自定义类型或者你需要解码其他基本类型（例如 NSArray 或 NSDictionary），需要将这些类也加入到 allowedClasses 集合中。
                /// 确保在解码所有需要的类时，将其包含在 allowedClasses 集合中以避免警告和潜在的解码失败。例如
                userModel = [NSKeyedUnarchiver unarchivedObjectOfClasses:jobsMakeMutSet(^(__kindof NSMutableSet <Class>*_Nullable data) {
                    data.add(JobsUserModel.class);
                    data.add(NSString.class);
                    data.add(NSNumber.class);
                    data.add(NSArray.class);
                    data.add(NSDictionary.class);
                    data.add(UIImage.class);
                    data.add(NSArray.class);
                    data.add(cls);
                })
                                                                   fromData:archivedData
                                                                      error:&error];
                if (!userModel) {
                    NSLog(@"解档失败: %@", error.localizedDescription);
                    /// 没取到用户数据，就直接跳登录
    //                self.toLogin();
                }return userModel;
            }
        }else{
            NSLog(@"解档失败:需要被解档的数据为空");
            return nil;
        }
    };
}
///【通过特定的用户名】 删除该用户的本地资料
-(jobsByStringBlock _Nonnull)deleteUserInfoByUserName{
    return ^(NSString *_Nullable userName) {
        NSUserDefaults.deleteWithKey(userName);
    };
}
#pragma mark —— 全局保存和删除已经登录成功的用户名
/// 全局保存已经登录成功 且 并未删除的用户名组
-(jobsByStringBlock _Nonnull)saveUserName{
    return ^(NSString *_Nullable userName){
        if (isNull(userName)) return;
        JobsSetUserDefaultKeyWithObject(用户名数组, jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            data.addBy(JobsUserDefaults.valueForKey(用户名数组));
            if (!data.containsObject(userName)) data.add(userName);// 保持唯一性
        }));JobsUserDefaultSynchronize;
    };
}
/// 读取用户名组
-(NSArray *_Nullable)readUserNameMutArr{
    return JobsUserDefaults.valueForKey(用户名数组);
}
/// 全局删除已经登录成功的用户名
-(jobsByStringBlock _Nonnull)deleteUserName{
    return ^(NSString *_Nullable userName){
        JobsSetUserDefaultKeyWithObject(用户名数组, jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.addBy(JobsUserDefaults.valueForKey(用户名数组));
            if (isValue(userName)) data.remove(userName);
        }));JobsUserDefaultSynchronize;
    };
}

@end
