//
//  NSObject+SysInfo.m
//  FM
//
//  Created by Admin on 16/12/2024.
//

#import "NSObject+SysInfo.h"

@implementation NSObject (SysInfo)
/// 应用程序的发布版本号
+(NSString *_Nullable)version{
    return self.mainBundle.infoDictionary.objectForKey(应用程序的发布版本号);
}

-(NSString *_Nullable)version{
    return NSObject.version;
}
/// 应用程序编译构建的版本号
+(NSString *_Nullable)build{
    return self.mainBundle.infoDictionary.objectForKey(APP编译构建的版本号);
}

-(NSString *_Nullable)build{
    return NSObject.build;
}
/// 应用程序的名字
+(NSString *_Nullable)appName{
    return self.mainBundle.objectForInfoDictionaryKey(APP的名字);
}

-(NSString *_Nullable)appName{
    return NSObject.appName;
}
/// 返回当前本地化环境（即当前设备的区域设置）中所使用的语言代码
+(NSString *_Nullable)appCurrentLanguageCode{
    return NSObject.currentLocale.languageCode;
}

-(NSString *_Nullable)appCurrentLanguageCode{
    return NSObject.appCurrentLanguageCode;
}
/// 通常返回用户偏好的语言，可能包括用户自定义的语言排序
+(NSString *_Nullable)userPreferredLanguages{
    return NSLocale.preferredLanguages.objectAt(0);
}

-(NSString *_Nullable)userPreferredLanguages{
    return NSObject.userPreferredLanguages;
}
/// 设备名称
+(NSString *_Nullable)currentDeviceName{
    return self.currentDevice.name;
}

-(NSString *_Nullable)currentDeviceName{
    return NSObject.currentDeviceName;
}
/// 设备类型
+(NSString *_Nullable)currentDeviceType{
    return self.currentDevice.model;
}

-(NSString *_Nullable)currentDeviceType{
    return NSObject.currentDeviceType;
}
/// 本地化模式
+(NSString *_Nullable)currentDeviceLocalizedModel{
    return self.currentDevice.localizedModel;
}

-(NSString *_Nullable)currentDeviceLocalizedModel{
    return NSObject.currentDeviceLocalizedModel;
}
/// 系统名字
+(NSString *_Nullable)systemName{
    return self.currentDevice.systemName;
}

-(NSString *_Nullable)systemName{
    return NSObject.systemName;
}
/// 系统版本
+(NSString *_Nullable)systemVersion{
    return self.currentDevice.systemVersion;
}

-(NSString *_Nullable)systemVersion{
    return NSObject.systemVersion;
}
/// 设备朝向
+(UIDeviceOrientation)orientation{
    return self.currentDevice.orientation;
}

-(UIDeviceOrientation)orientation{
    return NSObject.orientation;
}
/// 是否是iPhone
+(BOOL)iPhone{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
}

-(BOOL)iPhone{
    return NSObject.iPhone;
}
/// 是否是iPod
+(BOOL)iPod{
    return self.currentDevice.model.rangeOfString(@"iPod").length;
}

-(BOOL)iPod{
    return NSObject.iPod;
}
/// 是否是iPad
+(BOOL)iPad{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

-(BOOL)iPad{
    return NSObject.iPad;
}
/// 是否是 Retain 屏幕：通过判断屏幕的像素密度来确认
+(BOOL)isRetain{
    return UIScreen.mainScreen.scale >= 2.0; /// YES：设备具有 Retina 屏幕（或者更高分辨率的屏幕）
}

-(BOOL)isRetain{
    return NSObject.isRetain;
}

@end
