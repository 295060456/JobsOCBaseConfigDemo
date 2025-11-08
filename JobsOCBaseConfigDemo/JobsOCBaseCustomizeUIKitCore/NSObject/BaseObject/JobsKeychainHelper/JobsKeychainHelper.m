//
//  JobsKeychainHelper.m
//  KeychainIDFA
//
//  Created by Qixin on 14/12/18.
//  Copyright (c) 2014年 Qixin. All rights reserved.
//

#import "JobsKeychainHelper.h"

@implementation JobsKeychainHelper
#pragma mark —— 🔑钥匙串存储：
/// 读取数据
+(JobsRetIDByStrBlock _Nonnull)load{
    return ^id _Nullable(__kindof NSString *_Nullable service){
        id ret = nil;
        // 创建一个数据对象
        CFTypeRef result = NULL;
        // 通过条件查询数据
        if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)JobsKeychainHelper.getKeychainQuery2(service), &result) == noErr){
            NSError *error = nil;
            @try {
                if (JobsAvailableSysVersion(12.0)) {
                    ret = [NSKeyedUnarchiver unarchivedObjectOfClass:NSObject.class
                                                            fromData:(__bridge NSData *)result
                                                               error:&error];
                }else{
                    SuppressWdeprecatedDeclarationsWarning(ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)result]);
                }
            } @catch (NSException * exception){
                JobsLog(@"Unarchive of search data where %@ failed of %@ ",service,exception);
            }
        }if (result) CFRelease(result);
        return ret;
    };
}

+(jobsByStringBlock _Nonnull)remove{
    @jobs_weakify(self)
    return ^(__kindof NSString *_Nullable service){
        @jobs_strongify(self)
        SecItemDelete((__bridge CFDictionaryRef)(self.getKeychainQuery(service)));
    };
}
/// 保存数据，并检查是否保存成功
+(BOOL)save:(NSString *_Nonnull)service data:(id _Nonnull)data{
    // 获取存储的数据的条件
    NSMutableDictionary *keychainQuery = self.getKeychainQuery(service);
    // 删除旧的数据
    SecItemDelete((__bridge CFDictionaryRef)(keychainQuery));
    NSData *obj = nil;
    if (JobsAvailableSysVersion(12.0)) {
        NSError *error = nil;
        obj = [NSKeyedArchiver archivedDataWithRootObject:data
                                    requiringSecureCoding:YES
                                                    error:&error];
        if(error){
            JobsLog(@"error = %@",error.description)
        }
    }else{
        SuppressWdeprecatedDeclarationsWarning(obj = NSKeyedArchiver.initByObject(data));
    }
    // 设置新的数据
    [keychainQuery setObject:obj
                      forKey:(__bridge id<NSCopying>)(kSecValueData)];
    // 添加数据
    OSStatus saveState = SecItemAdd((__bridge CFDictionaryRef)(keychainQuery), NULL);
    // 释放对象
    keychainQuery = nil;
    // 判断是否存储成功
    if (saveState == errSecSuccess) {
        return YES;
    }return NO;
}
#pragma mark —— 🔑钥匙串存储：账户 + 密码
+(BOOL)saveAccount:(NSString *_Nonnull)account
          password:(NSString *_Nonnull)password
         forService:(NSString *_Nonnull)service{
    if (isNull(account) || isNull(password) || isNull(service)) return NO;
    /// 删除已有数据（如果存在）
    self.deleteAccountInfoByService(service);
    /// 创建字典来保存 Keychain 数据,并添加到 Keychain
    OSStatus status = SecItemAdd((__bridge CFDictionaryRef)jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
        data.addByDic(JobsKeychainHelper.getKeychainBaseQuery(service));
        [data setObject:password.UTF8Encoding forKey:(__bridge id)kSecValueData];
    }), NULL);return (status == errSecSuccess);
}
/// service + account ==> password
+(NSString *_Nullable)getPasswordByService:(NSString *_Nonnull)service account:(NSString *_Nonnull)account{
    if (isNull(service) || isNull(account)) return nil;
    CFTypeRef result = NULL;
    if (SecItemCopyMatching((__bridge CFDictionaryRef)jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
        data.addByDic(JobsKeychainHelper.getKeychainBaseQuery(service))
            .addByDic(JobsKeychainHelper.getKeychainBaseQuery2(service));
    }), &result) == errSecSuccess) {
        return NSString.initByUTF8Data((__bridge_transfer NSData *)result);
    }return nil;
}
/// 删除已有数据
+(JobsRetBOOLByStringBlock _Nonnull)deleteAccountInfoByService{
    return ^BOOL(__kindof NSString *_Nullable service){
        if (isNull(service)) return NO;
        /// 删除字典
        return (SecItemDelete((__bridge CFDictionaryRef)self.getKeychainBaseQuery1(service)) == errSecSuccess);
    };
}
#pragma mark —— 私有方法·存储策略
/**
 * kSecAttrAccessibleAfterFirstUnlock
 * 表示 Keychain 中的数据在设备首次解锁后就可以被访问
 * 设备重启后，用户首次解锁设备时，Keychain 数据会变得可访问
 * 在设备锁定状态下（如用户按下电源按钮锁屏），数据仍然可访问。
 */
/// 创建生成保存数据查询条件
+(JobsRetDicByStringBlock _Nonnull)getKeychainBaseQuery1{
    return ^NSMutableDictionary *_Nullable(__kindof NSString *_Nullable service){
        return jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
            [data setObject:(__bridge id)(kSecClassGenericPassword) forKey:(__bridge NSString *)kSecClass];
            [data setObject:service forKey:(__bridge NSString *)kSecAttrService];
        });
    };
}

+(JobsRetDicByStringBlock _Nonnull)getKeychainBaseQuery2{
    return ^NSMutableDictionary *_Nullable(__kindof NSString *_Nullable service){
        return jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
            [data setObject:@YES forKey:(__bridge id)kSecReturnData];/// 查询结果返回到 kSecValueData
            [data setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];/// 只返回搜索到的第一条数据
        });
    };
}

+(JobsRetDicByStringBlock _Nonnull)getKeychainBaseQuery{
    return ^NSMutableDictionary *_Nullable(__kindof NSString *_Nullable service){
        return jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
            data.addByDic(JobsKeychainHelper.getKeychainBaseQuery1(service));
            [data setObject:service forKey:(__bridge NSString *)kSecAttrAccount];
        });
    };
}

+(JobsRetDicByStringBlock _Nonnull)getKeychainQuery{
    return ^NSMutableDictionary *_Nullable(__kindof NSString *_Nullable service){
        return jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
            data.addByDic(JobsKeychainHelper.getKeychainBaseQuery(service));
            [data setObject:(__bridge id)kSecAttrAccessibleAfterFirstUnlock forKey:(__bridge NSString *)kSecAttrAccessible];
        });
    };
}

+(JobsRetDicByStringBlock _Nonnull)getKeychainQuery2{
    return ^NSMutableDictionary *_Nullable(__kindof NSString *_Nullable service){
        return jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
            data.addByDic(JobsKeychainHelper.getKeychainQuery(service))
                .addByDic(JobsKeychainHelper.getKeychainBaseQuery2(service));
        });
    };
}

@end
