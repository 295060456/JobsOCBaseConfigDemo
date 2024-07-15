//
//  JobsUserDefaultDefine.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#ifndef JobsUserDefaultDefine_h
#define JobsUserDefaultDefine_h

#pragma mark —— 其他
/// 单例对象
#ifndef JobsUserDefaults
#define JobsUserDefaults NSUserDefaults.standardUserDefaults
#endif /* JobsUserDefaults */
/// 同步 NSUserDefaults
#ifndef JobsUserDefaultSynchronize
#define JobsUserDefaultSynchronize NSUserDefaults.standardUserDefaults.synchronize
#endif /* JobsUserDefaultSynchronize */
#pragma mark —— 设置值
/// 设置 UserDefault 值（Value）
#ifndef JobsSetUserDefaultKeyWithValue
#define JobsSetUserDefaultKeyWithValue(key,value) [NSUserDefaults.standardUserDefaults setValue:value forKey:key]
#endif /* JobsSetUserDefaultKeyWithValue */
/// 设置 UserDefault 对象（Object）
#ifndef JobsSetUserDefaultKeyWithObject
#define JobsSetUserDefaultKeyWithObject(key,object) [NSUserDefaults.standardUserDefaults setObject:object forKey:key]
#endif /* JobsSetUserDefaultKeyWithObject */
/// 设置 UserDefault 布尔值（Bool）
#ifndef JobsSetUserBoolKeyWithBool
#define JobsSetUserBoolKeyWithBool(key,object) [NSUserDefaults.standardUserDefaults setBool:object forKey:key]
#endif /* JobsSetUserBoolKeyWithBool */
/// 设置 UserDefault 整数值（Integer）
#ifndef JobsSetUserDefaultKeyWithInteger
#define JobsSetUserDefaultKeyWithInteger(key,value) [NSUserDefaults.standardUserDefaults setInteger:value forKey:key]
#endif /* JobsSetUserDefaultKeyWithInteger */
/// 设置 UserDefault 浮点数值（Float）
#ifndef JobsSetUserDefaultKeyWithFloat
#define JobsSetUserDefaultKeyWithFloat(key,value) [NSUserDefaults.standardUserDefaults setFloat:value forKey:key]
#endif /* JobsSetUserDefaultKeyWithFloat */
/// 设置 UserDefault 双精度浮点数值（Double）
#ifndef JobsSetUserDefaultKeyWithDouble
#define JobsSetUserDefaultKeyWithDouble(key,value) [NSUserDefaults.standardUserDefaults setDouble:value forKey:key]
#endif /* JobsSetUserDefaultKeyWithDouble */
/// 设置 UserDefault URL（URL）
#ifndef JobsSetUserDefaultKeyWithURL
#define JobsSetUserDefaultKeyWithURL(key,url) [NSUserDefaults.standardUserDefaults setURL:url forKey:key]
#endif /* JobsSetUserDefaultKeyWithURL */
#pragma mark —— 获取值
/// 获取 UserDefault 值（Value）
#ifndef JobsGetUserDefaultValueForKey
#define JobsGetUserDefaultValueForKey(key) [NSUserDefaults.standardUserDefaults valueForKey:key]
#endif /* JobsGetUserDefaultValueForKey */
/// 获取 UserDefault 对象（Object）
#ifndef JobsGetUserDefaultObjForKey
#define JobsGetUserDefaultObjForKey(key) [NSUserDefaults.standardUserDefaults objectForKey:key]
#endif /* JobsGetUserDefaultObjForKey */
/// 获取 UserDefault 布尔值（Bool）
#ifndef JobsGetUserDefaultBoolForKey
#define JobsGetUserDefaultBoolForKey(key) [NSUserDefaults.standardUserDefaults boolForKey:key]
#endif /* JobsGetUserDefaultBoolForKey */
/// 获取 UserDefault 整数值（Integer）
#ifndef JobsGetUserDefaultIntegerForKey
#define JobsGetUserDefaultIntegerForKey(key) [NSUserDefaults.standardUserDefaults integerForKey:key]
#endif /* JobsGetUserDefaultIntegerForKey */
/// 获取 UserDefault 浮点数值（Float）
#ifndef JobsGetUserDefaultFloatForKey
#define JobsGetUserDefaultFloatForKey(key) [NSUserDefaults.standardUserDefaults floatForKey:key]
#endif /* JobsGetUserDefaultFloatForKey */
/// 获取 UserDefault 双精度浮点数值（Double）
#ifndef JobsGetUserDefaultDoubleForKey
#define JobsGetUserDefaultDoubleForKey(key) [NSUserDefaults.standardUserDefaults doubleForKey:key]
#endif /* JobsGetUserDefaultDoubleForKey */
/// 获取 UserDefault URL（URL）
#ifndef JobsGetUserDefaultURLForKey
#define JobsGetUserDefaultURLForKey(key) [NSUserDefaults.standardUserDefaults URLForKey:key]
#endif /* JobsGetUserDefaultURLForKey */
#pragma mark —— 删除值
/// 删除 UserDefault 值（Key）
#ifndef JobsDeleUserDefaultWithKey
#define JobsDeleUserDefaultWithKey(key) [NSUserDefaults.standardUserDefaults removeObjectForKey:key]
#endif /* JobsDeleUserDefaultWithKey */

#endif /* JobsUserDefaultDefine_h */
