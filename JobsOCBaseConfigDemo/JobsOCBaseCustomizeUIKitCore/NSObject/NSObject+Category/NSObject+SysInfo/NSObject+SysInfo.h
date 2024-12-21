//
//  NSObject+SysInfo.h
//  FM
//
//  Created by Admin on 16/12/2024.
//

#import <Foundation/Foundation.h>
#import "NSObject+Extras.h"
#import "DefineConstString.h" /// 常量字符串的定义

NS_ASSUME_NONNULL_BEGIN
/// 获取系统环境变量
@interface NSObject (SysInfo)
/// 应用程序的发布版本号
+(NSString *_Nullable)version;
-(NSString *_Nullable)version;
/// 应用程序编译构建的版本号
+(NSString *_Nullable)build;
-(NSString *_Nullable)build;
/// 应用程序的名字
+(NSString *_Nullable)appName;
-(NSString *_Nullable)appName;
/// 返回当前本地化环境（即当前设备的区域设置）中所使用的语言代码
+(NSString *_Nullable)appCurrentLanguageCode;
-(NSString *_Nullable)appCurrentLanguageCode;
/// 通常返回用户偏好的语言，可能包括用户自定义的语言排序
+(NSString *_Nullable)userPreferredLanguages;
-(NSString *_Nullable)userPreferredLanguages;
/// 设备名称
+(NSString *_Nullable)currentDeviceName;
-(NSString *_Nullable)currentDeviceName;
/// 设备类型
+(NSString *_Nullable)currentDeviceType;
-(NSString *_Nullable)currentDeviceType;
/// 本地化模式
+(NSString *_Nullable)currentDeviceLocalizedModel;
-(NSString *_Nullable)currentDeviceLocalizedModel;
/// 系统名字
+(NSString *_Nullable)systemName;
-(NSString *_Nullable)systemName;
/// 系统版本
+(NSString *_Nullable)systemVersion;
-(NSString *_Nullable)systemVersion;
/// 设备朝向
+(UIDeviceOrientation)orientation;
-(UIDeviceOrientation)orientation;
/// 是否是iPhone
+(BOOL)iPhone;
-(BOOL)iPhone;
/// 是否是iPod
+(BOOL)iPod;
-(BOOL)iPod;
/// 是否是iPad
+(BOOL)iPad;
-(BOOL)iPad;
/// 是否是 Retain 屏幕：通过判断屏幕的像素密度来确认
+(BOOL)isRetain;
-(BOOL)isRetain;

@end

NS_ASSUME_NONNULL_END
