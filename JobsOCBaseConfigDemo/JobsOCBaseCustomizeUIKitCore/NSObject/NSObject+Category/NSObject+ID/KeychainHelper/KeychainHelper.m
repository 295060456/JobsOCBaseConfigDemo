//
//  KeychainHelper.m
//  KeychainIDFA
//
//  Created by Qixin on 14/12/18.
//  Copyright (c) 2014年 Qixin. All rights reserved.
//

#import "KeychainHelper.h"

@implementation KeychainHelper
/// 读取数据
+(JobsReturnIDByStringBlock _Nonnull)load{
    return ^id _Nullable(__kindof NSString *_Nullable service){
        id ret = nil;
        // 通过标记获取数据查询条件
        NSMutableDictionary *keychainQuery = self.getKeychainQuery(service);
        // 这是获取数据的时，必须提供的两个属性
        // TODO: 查询结果返回到 kSecValueData
        [keychainQuery setObject:(id)kCFBooleanTrue
                          forKey:(__bridge id<NSCopying>)(kSecReturnData)];
        // TODO: 只返回搜索到的第一条数据
        [keychainQuery setObject:(__bridge id)(kSecMatchLimitOne)
                          forKey:(__bridge id<NSCopying>)(kSecMatchLimit)];
        // 创建一个数据对象
        CFTypeRef result = NULL;
        // 通过条件查询数据
        if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, &result) == noErr){
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
        }if (result)  CFRelease(result);
        keychainQuery = nil;/// 释放对象
        return ret;
    };
}

+(jobsByStringBlock _Nonnull)remove{
    @jobs_weakify(self)
    return ^(__kindof NSString *_Nullable service){
        @jobs_strongify(self)
        /// 获取删除数据的查询条件
        NSMutableDictionary *keychainQuery = self.getKeychainQuery(service);
        /// 删除指定条件的数据
        SecItemDelete((__bridge CFDictionaryRef)(keychainQuery));
        /// 释放内存
        keychainQuery = nil;
    };
}
/// 创建生成保存数据查询条件
+(JobsReturnDicByStringBlock _Nonnull)getKeychainQuery{
    return ^NSMutableDictionary *_Nullable(__kindof NSString *_Nullable service){
        return [NSMutableDictionary dictionaryWithObjectsAndKeys:
                (__bridge id)(kSecClassGenericPassword),kSecClass,
                service, kSecAttrService,
                service, kSecAttrAccount,
                kSecAttrAccessibleAfterFirstUnlock,kSecAttrAccessible,
                nil];
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

@end
