//
//  UIDevice+XMUtils.m
//  AwesomeTips
//
//  Created by kangzubin on 2018/9/20.
//  Copyright © 2018 KANGZUBIN. All rights reserved.
//

#import "UIDevice+XMUtils.h"

@implementation UIDevice (XMUtils)
/// iPhone 全屏型号的前缀数组
+(__kindof NSArray *_Nonnull)fullScreenPrefixes{
    return jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable arr) {
        arr.add(@"iPhone10,3").add(@"iPhone10,6"); /// iPhone X
        arr.add(@"iPhone11,");                     /// iPhone XS, XS Max, XR
        arr.add(@"iPhone12,");                     /// iPhone 11 系列
        arr.add(@"iPhone13,");                     /// iPhone 12 系列
        arr.add(@"iPhone14,");                     /// iPhone 13 & 14 系列
        arr.add(@"iPhone15,");                     /// iPhone 15 系列
    });
}
/**
 获取硬件平台名称，叫 device model 或者 machine name
 @return 硬件平台名称，如 iPhone3,1、iPad7,4 等
 */
+(NSString * _Nullable)platform{
    size_t size;
    sysctlbyname("hw.machine",
                 NULL,
                 &size,
                 NULL,
                 0);
    char *machine = (char *)malloc(size);
    if (machine == NULL) {
        return nil;
    }
    sysctlbyname("hw.machine",
                 machine,
                 &size,
                 NULL,
                 0);
    NSString *platform = [NSString stringWithCString:machine
                                            encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}
/**
 机型判定
 
 最近一次更新日期：2024.12.16
 数据来源：https://www.theiphonewiki.com/wiki/Models 定位标识符 Identifier
 ⚠️标识处：在数据来源处并未罗列
 */
+(JobsRetStringByStringBlock _Nonnull)platformBy {
    return ^__kindof NSString *_Nullable(__kindof NSString *_Nullable string){
        {// iPhone
            if (string.isEqualToString(@"iPhone1,1"))    return @"iPhone 初代";
            if (string.isEqualToString(@"iPhone1,2"))    return @"iPhone 3G";
            if (string.isEqualToString(@"iPhone2,1"))    return @"iPhone 3GS";
            if (string.isEqualToString(@"iPhone3,1"))    return @"iPhone 4 (GSM)";
            if (string.isEqualToString(@"iPhone3,2"))    return @"iPhone 4 (GSM Rev A)";
            if (string.isEqualToString(@"iPhone3,3"))    return @"iPhone 4 (CDMA)";
            if (string.isEqualToString(@"iPhone4,1"))    return @"iPhone 4S";
            if (string.isEqualToString(@"iPhone5,1"))    return @"iPhone 5 (GSM)";
            if (string.isEqualToString(@"iPhone5,2"))    return @"iPhone 5 (CDMA)";
            if (string.isEqualToString(@"iPhone5,3"))    return @"iPhone 5c";
            if (string.isEqualToString(@"iPhone5,4"))    return @"iPhone 5c";
            if (string.isEqualToString(@"iPhone6,1"))    return @"iPhone 5s";
            if (string.isEqualToString(@"iPhone6,2"))    return @"iPhone 5s";
            if (string.isEqualToString(@"iPhone7,1"))    return @"iPhone 6 Plus";
            if (string.isEqualToString(@"iPhone7,2"))    return @"iPhone 6";
            if (string.isEqualToString(@"iPhone8,1"))    return @"iPhone 6s";
            if (string.isEqualToString(@"iPhone8,2"))    return @"iPhone 6s Plus";
            if (string.isEqualToString(@"iPhone8,4"))    return @"iPhone SE (1st generation)";
            if (string.isEqualToString(@"iPhone9,1"))    return @"iPhone 7";         // Global
            if (string.isEqualToString(@"iPhone9,2"))    return @"iPhone 7 Plus";    // Global
            if (string.isEqualToString(@"iPhone9,3"))    return @"iPhone 7";         // GSM
            if (string.isEqualToString(@"iPhone9,4"))    return @"iPhone 7 Plus";    // GSM
            if (string.isEqualToString(@"iPhone10,1"))   return @"iPhone 8";         // Global
            if (string.isEqualToString(@"iPhone10,2"))   return @"iPhone 8 Plus";    // Global
            if (string.isEqualToString(@"iPhone10,3"))   return @"iPhone X";         // Global
            if (string.isEqualToString(@"iPhone10,4"))   return @"iPhone 8";         // GSM
            if (string.isEqualToString(@"iPhone10,5"))   return @"iPhone 8 Plus";    // GSM
            if (string.isEqualToString(@"iPhone10,6"))   return @"iPhone X";         // GSM
            if (string.isEqualToString(@"iPhone11,2"))   return @"iPhone XS";
            if (string.isEqualToString(@"iPhone11,4"))   return @"iPhone XS Max";
            if (string.isEqualToString(@"iPhone11,6"))   return @"iPhone XS Max";
            if (string.isEqualToString(@"iPhone11,8"))   return @"iPhone XR";
            if (string.isEqualToString(@"iPhone12,1"))   return @"iPhone 11";
            if (string.isEqualToString(@"iPhone12,3"))   return @"iPhone 11 Pro";
            if (string.isEqualToString(@"iPhone12,5"))   return @"iPhone 11 Pro Max";
            if (string.isEqualToString(@"iPhone12,8"))   return @"iPhone SE (2nd generation)";
            if (string.isEqualToString(@"iPhone13,1"))   return @"iPhone 12 mini";
            if (string.isEqualToString(@"iPhone13,2"))   return @"iPhone 12";
            if (string.isEqualToString(@"iPhone13,3"))   return @"iPhone 12 Pro";
            if (string.isEqualToString(@"iPhone13,4"))   return @"iPhone 12 Pro Max";
            if (string.isEqualToString(@"iPhone14,2"))   return @"iPhone 13 Pro";
            if (string.isEqualToString(@"iPhone14,3"))   return @"iPhone 13 Pro Max";
            if (string.isEqualToString(@"iPhone14,4"))   return @"iPhone 13 mini";
            if (string.isEqualToString(@"iPhone14,5"))   return @"iPhone 13";
            if (string.isEqualToString(@"iPhone14,6"))   return @"iPhone SE (3rd generation)";
            if (string.isEqualToString(@"iPhone14,7"))   return @"iPhone 14";
            if (string.isEqualToString(@"iPhone14,8"))   return @"iPhone 14 Plus";
            if (string.isEqualToString(@"iPhone15,2"))   return @"iPhone 14 Pro";
            if (string.isEqualToString(@"iPhone15,3"))   return @"iPhone 14 Pro Max";
            if (string.isEqualToString(@"iPhone15,4"))   return @"iPhone 15";
            if (string.isEqualToString(@"iPhone15,5"))   return @"iPhone 15 Plus";
            if (string.isEqualToString(@"iPhone15,6"))   return @"iPhone 15 Pro";
            if (string.isEqualToString(@"iPhone15,7"))   return @"iPhone 15 Pro Max";
        }
        {// iPod touch
            if (string.isEqualToString(@"iPod1,1"))      return @"iPod touch (1st generation)";
            if (string.isEqualToString(@"iPod2,1"))      return @"iPod touch (2nd generation)";
            if (string.isEqualToString(@"iPod3,1"))      return @"iPod touch (3rd generation)";
            if (string.isEqualToString(@"iPod4,1"))      return @"iPod touch (4th generation)";
            if (string.isEqualToString(@"iPod5,1"))      return @"iPod touch (5th generation)";
            if (string.isEqualToString(@"iPod7,1"))      return @"iPod touch (6th generation)";
            if (string.isEqualToString(@"iPod9,1"))      return @"iPod touch (7th generation)";
            if (string.isEqualToString(@"iPod9,2"))      return @"iPod touch (未来模型)";
        }
        {// iPad
            if (string.isEqualToString(@"iPad1,1"))      return @"iPad";
            if (string.isEqualToString(@"iPad1,2"))      return @"iPad 3G";// ⚠️
            if (string.isEqualToString(@"iPad2,1"))      return @"iPad 2 (WiFi)";
            if (string.isEqualToString(@"iPad2,2"))      return @"iPad 2 (GSM)";
            if (string.isEqualToString(@"iPad2,3"))      return @"iPad 2 (CDMA)";
            if (string.isEqualToString(@"iPad2,4"))      return @"iPad 2 (WiFi)";
            if (string.isEqualToString(@"iPad2,5"))      return @"iPad Mini (WiFi)";
            if (string.isEqualToString(@"iPad2,6"))      return @"iPad Mini (GSM)";
            if (string.isEqualToString(@"iPad2,7"))      return @"iPad Mini (CDMA)";
            if (string.isEqualToString(@"iPad3,1"))      return @"iPad 3 (WiFi)";
            if (string.isEqualToString(@"iPad3,2"))      return @"iPad 3 (CDMA)";
            if (string.isEqualToString(@"iPad3,3"))      return @"iPad 3 (GSM)";
            if (string.isEqualToString(@"iPad3,4"))      return @"iPad 4 (WiFi)";
            if (string.isEqualToString(@"iPad3,5"))      return @"iPad 4 (GSM)";
            if (string.isEqualToString(@"iPad3,6"))      return @"iPad 4 (CDMA)";
            if (string.isEqualToString(@"iPad4,1"))      return @"iPad Air (WiFi)";// ⚠️
            if (string.isEqualToString(@"iPad4,2"))      return @"iPad Air (GSM)";// ⚠️
            if (string.isEqualToString(@"iPad4,3"))      return @"iPad Air (CDMA)";// ⚠️
            if (string.isEqualToString(@"iPad4,4"))      return @"iPad Mini 2 (WiFi)";// ⚠️
            if (string.isEqualToString(@"iPad4,5"))      return @"iPad Mini 2 (GSM)";// ⚠️
            if (string.isEqualToString(@"iPad4,6"))      return @"iPad Mini 2 (CDMA)";// ⚠️
            if (string.isEqualToString(@"iPad4,7"))      return @"iPad Mini 3 (WiFi)";
            if (string.isEqualToString(@"iPad4,8"))      return @"iPad Mini 3 (GSM)";
            if (string.isEqualToString(@"iPad4,9"))      return @"iPad Mini 3 (CDMA)";
        }
        {// Apple TV
            if (string.isEqualToString(@"AppleTV1,1"))   return @"Apple TV (1st generation)";
            if (string.isEqualToString(@"AppleTV2,1"))   return @"Apple TV (2nd generation)";
            if (string.isEqualToString(@"AppleTV3,1"))   return @"Apple TV (3rd generation)";
            if (string.isEqualToString(@"AppleTV3,2"))   return @"Apple TV (3rd generation)";
            if (string.isEqualToString(@"AppleTV5,3"))   return @"Apple TV (4th generation)";
            if (string.isEqualToString(@"AppleTV6,2"))   return @"Apple TV 4K";
            if (string.isEqualToString(@"AppleTV11,1"))  return @"Apple TV 4K (2nd generation)";
        }
        {// Simulator
            if (string.isEqualToString(@"i386"))         return UIDevice.currentDevice.model.add(@" ").add(@"Simulator");
            if (string.isEqualToString(@"x86_64"))       return UIDevice.currentDevice.model.add(@" ").add(@"Simulator");
        }return nil;
    };
}
///  获取设备型号名称（可以区分iOS模拟器）
+(NSString * _Nullable)platformNameStr{
    NSString *platformStr = self.platform;
    if (!platformStr) {
        return UIDevice.currentDevice.model; // e.g. @"iPhone", @"iPod touch"
    }return self.platformBy(platformStr);
}
/// 获取当前设备标识符Identifier（不区分iOS模拟器：把IOS模拟器当真机对待）
+(NSString * _Nullable)platformIDStr{
    return self.isSimulator ? UIDevice.simulatorModel : self.platform;
}
/// 判断当前机型是否是iphone6 及其以上机型,过滤掉对ipad的判断
+(BOOL)judgementUpperIphone6{
    NSString *str = UIDevice.platformNameStr;
    if (str.isEqualToString(@"iPhone 2G"))         return NO;
    if (str.isEqualToString(@"iPhone 3G"))         return NO;
    if (str.isEqualToString(@"iPhone 3GS"))        return NO;
    if (str.isEqualToString(@"iPhone 4"))          return NO;
    if (str.isEqualToString(@"iPhone 4S"))         return NO;
    if (str.isEqualToString(@"iPhone 5"))          return NO;
    if (str.isEqualToString(@"iPhone 5c"))         return NO;
    if (str.isEqualToString(@"iPhone 5s"))         return NO;
    if (str.isEqualToString(@"iPhone Simulator"))  return NO; /// iPhone 模拟器
    return YES;
}
/// 判断当前机型是否为非刘海屏：是刘海屏return YES，不是刘海屏return NO
+(BOOL)isFullScreen{
    if (self.isiPhone) {
        for (NSString *prefix in UIDevice.fullScreenPrefixes) {
            if (self.platformIDStr.hasPrefix(prefix)) return YES;
        }return NO; // 其他型号默认为非全屏
    }return NO;
}
/// 判断当前是否是iOS模拟器
+(BOOL)isSimulator{
    NSString *str = UIDevice.platformNameStr;
    return str.isEqualToString(@"iPhone Simulator");
}
/// 判断当前手机设备是否为刘海屏（兼容iOS模拟器）
+(BOOL)isBangScreen{
    if (@available(iOS 11.0, *)) {
        CGFloat topInset = jobsGetMainWindow().safeAreaInsets.top;
        return topInset > 20.0;
    }return NO;
}
/// 判断当前iOS机型
+(NSString * _Nullable)machineName{
    size_t size;
    sysctlbyname("hw.machine",
                 NULL,
                 &size,
                 NULL,
                 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine",
                 machine,
                 &size,
                 NULL, 0);
    NSString *machineString = [NSString stringWithCString:machine
                                                 encoding:NSUTF8StringEncoding];
    free(machine);
    return machineString;
}
/// 判定当前设备是否为iPhone（iOS模拟器也被视作为iPhone）
+(BOOL)isiPhone{
    return UIDevice.currentDevice.model.hasPrefix(@"iPhone");
}
/// 判断当前iOS模拟器所模拟的机型
+(NSString * _Nullable)simulatorModel{
    if (TARGET_OS_SIMULATOR) {
        NSDictionary *environment = NSProcessInfo.processInfo.environment;
        NSString *simulatorModel = environment[@"SIMULATOR_MODEL_IDENTIFIER"];
        return simulatorModel;
    }return nil; /// 不在模拟器上运行，返回 nil 或其他合适的值
}
/**
 获取设备型号名称
 @return 设备型号名称，与 platformNameStr 一致，只查询一次然后缓存
 */
+(NSString * _Nullable)deviceName{
    static NSString *deviceName = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceName = UIDevice.platformNameStr;
        if (deviceName.length == 0) deviceName = @"iPhone";
    });return deviceName;
}

@end

