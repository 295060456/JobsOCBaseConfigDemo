//
//  NSUserDefaults+Manager.m
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import "NSUserDefaults+Manager.h"

@implementation NSUserDefaults (Manager)
/// CRUD（create, read, update, delete）
/// 存数据（包括父类直到NSObject的所有属性）
+(void)updateWithModel:(UserDefaultModel *)userDefaultModel{
    if (![NSString isNullString:userDefaultModel.key]) {
        if (userDefaultModel.obj && ![userDefaultModel.obj isKindOfClass:NSNull.class]) {
            // 步骤1: 将NSObject对象归档为二进制数据
            NSError *error = nil;
            NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:userDefaultModel.obj
                                                         requiringSecureCoding:YES
                                                                         error:&error];
            if (error) {
                NSLog(@"归档失败: %@", error.localizedDescription);
            } else {
                // 步骤2: 将归档数据存储到NSUserDefaults
                JobsSetUserDefaultKeyWithObject(userDefaultModel.key, archivedData);
                JobsUserDefaultSynchronize;
                NSLog(@"%@",NSString.userDefaultsDir);
                return;
            }
        }
        
        if (userDefaultModel.booLValue) {
            JobsSetUserBoolKeyWithBool(userDefaultModel.key, userDefaultModel.booLValue);
            JobsUserDefaultSynchronize;
            NSLog(@"%@",NSString.userDefaultsDir);
            return;
        }
    }
}
/// 读取数据
+(id _Nullable)readWithKey:(NSString *)key{
    id data = nil;
    if (![NSString isNullString:key]){
        data = [NSUserDefaults.standardUserDefaults valueForKey:key];
    }return data;
}
/// 删除数据
+(void)deleteWithKey:(NSString *)key{
    if (![NSString isNullString:key]){
        JobsDeleUserDefaultWithKey(key);
        JobsUserDefaultSynchronize;
    }
}

@end
