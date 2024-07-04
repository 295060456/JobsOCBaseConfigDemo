//
//  JobsUserDefaultDefine.h
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#ifndef JobsUserDefaultDefine_h
#define JobsUserDefaultDefine_h

#pragma mark —— set方法

#ifndef SetUserDefaultKeyWithValue
#define SetUserDefaultKeyWithValue(key,value) [NSUserDefaults.standardUserDefaults setValue:value forKey:key]
#endif /* SetUserDefaultKeyWithValue */

#ifndef SetUserDefaultKeyWithObject
#define SetUserDefaultKeyWithObject(key,object) [NSUserDefaults.standardUserDefaults setObject:object forKey:key]
#endif /* SetUserDefaultKeyWithObject */

#ifndef SetUserDefaultKeyWithInteger
#define SetUserDefaultKeyWithInteger(key,integer) [NSUserDefaults.standardUserDefaults setInteger:integer forKey:key]
#endif /* SetUserDefaultKeyWithInteger */

#ifndef SetUserDefaultKeyWithBool
#define SetUserDefaultKeyWithBool(key,bool) [NSUserDefaults.standardUserDefaults setBool:bool forKey:key]
#endif /* SetUserDefaultKeyWithBool */

#ifndef SetUserDefaultKeyWithFloat
#define SetUserDefaultKeyWithFloat(key,float) [NSUserDefaults.standardUserDefaults setFloat:float forKey:key]
#endif /* SetUserDefaultKeyWithFloat */

#ifndef SetUserDefaultKeyWithDouble
#define SetUserDefaultKeyWithDouble(key,double) [NSUserDefaults.standardUserDefaults setDouble:double forKey:key]
#endif /* SetUserDefaultKeyWithDouble */

#ifndef SetUserDefaultKeyWithURL
#define SetUserDefaultKeyWithURL(key,URL) [NSUserDefaults.standardUserDefaults setURL:URL forKey:key]
#endif /* SetUserDefaultKeyWithURL */

#pragma mark —— get方法
#ifndef GetUserDefaultValueForKey
#define GetUserDefaultValueForKey(key) [NSUserDefaults.standardUserDefaults valueForKey:key]
#endif /* GetUserDefaultValueForKey */

#ifndef GetUserDefaultObjForKey
#define GetUserDefaultObjForKey(key) [NSUserDefaults.standardUserDefaults objectForKey:key]
#endif /* GetUserDefaultObjForKey */

#ifndef GetUserDefaultBoolForKey
#define GetUserDefaultBoolForKey(key) [NSUserDefaults.standardUserDefaults boolForKey:key]
#endif /* GetUserDefaultBoolForKey */

#ifndef GetUserDefaultIntegerForKey
#define GetUserDefaultIntegerForKey(key) [NSUserDefaults.standardUserDefaults integerForKey:key]
#endif /* GetUserDefaultIntegerForKey */

#ifndef GetUserDefaultFloatForKey
#define GetUserDefaultFloatForKey(key) [NSUserDefaults.standardUserDefaults floatForKey:key]
#endif /* GetUserDefaultFloatForKey */

#ifndef GetUserDefaultDoubleForKey
#define GetUserDefaultDoubleForKey(key) [NSUserDefaults.standardUserDefaults doubleForKey:key]
#endif /* GetUserDefaultDoubleForKey */

#ifndef GetUserDefaultURLForKey
#define GetUserDefaultURLForKey(key) [NSUserDefaults.standardUserDefaults URLForKey:key]
#endif /* GetUserDefaultURLForKey */

#pragma mark —— 删除方法
#ifndef DeleUserDefaultWithKey
#define DeleUserDefaultWithKey(key) [NSUserDefaults.standardUserDefaults removeObjectForKey:key]
#endif /* DeleUserDefaultWithKey */

#pragma mark —— 同步方法（不同步，值无法正常写入）
#ifndef UserDefaultSynchronize
#define UserDefaultSynchronize NSUserDefaults.standardUserDefaults.synchronize
#endif /* UserDefaultSynchronize */

#endif /* JobsUserDefaultDefine_h */
