//
//  UIDevice+XMUtils.m
//  AwesomeTips
//
//  Created by kangzubin on 2018/9/20.
//  Copyright © 2018 KANGZUBIN. All rights reserved.
//

#import "UIDevice+XMUtils.h"

@implementation UIDevice (XMUtils)
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
 根据传入的定位标识符 Identifier，判定是什么机型
 @param string 定位标识符 Identifier
 
 最近一次更新日期：2023.09.10
 数据来源：https://www.theiphonewiki.com/wiki/Models 定位标识符 Identifier
 ⚠️标识处：在数据来源处并未罗列
 */
+(NSString * _Nullable)platform:(NSString * _Nullable)string{
    // iPhone
    {
        if ([string isEqualToString:@"iPhone1,1"])    return @"iPhone 初代";
        if ([string isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
        if ([string isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
        if ([string isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
        if ([string isEqualToString:@"iPhone3,2"])    return @"iPhone 4 (GSM Rev A)";
        if ([string isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
        if ([string isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
        if ([string isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
        if ([string isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (CDMA)";
        if ([string isEqualToString:@"iPhone5,3"])    return @"iPhone 5c";
        if ([string isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";
        if ([string isEqualToString:@"iPhone6,1"])    return @"iPhone 5s";
        if ([string isEqualToString:@"iPhone6,2"])    return @"iPhone 5s";
        if ([string isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
        if ([string isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
        if ([string isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
        if ([string isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
        if ([string isEqualToString:@"iPhone8,4"])    return @"iPhone SE (1st generation)";
        if ([string isEqualToString:@"iPhone9,1"])    return @"iPhone 7";         // Global
        if ([string isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";    // Global
        if ([string isEqualToString:@"iPhone9,3"])    return @"iPhone 7";         // GSM
        if ([string isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";    // GSM
        if ([string isEqualToString:@"iPhone10,1"])   return @"iPhone 8";         // Global
        if ([string isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";    // Global
        if ([string isEqualToString:@"iPhone10,3"])   return @"iPhone X";         // Global
        if ([string isEqualToString:@"iPhone10,4"])   return @"iPhone 8";         // GSM
        if ([string isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";    // GSM
        if ([string isEqualToString:@"iPhone10,6"])   return @"iPhone X";         // GSM
        if ([string isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
        if ([string isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";
        if ([string isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
        if ([string isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
        if ([string isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
        if ([string isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
        if ([string isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";
        if ([string isEqualToString:@"iPhone12,8"])   return @"iPhone SE (2nd generation)";
        if ([string isEqualToString:@"iPhone13,1"])   return @"iPhone 12 mini";
        if ([string isEqualToString:@"iPhone13,2"])   return @"iPhone 12";
        if ([string isEqualToString:@"iPhone13,3"])   return @"iPhone 12 Pro";
        if ([string isEqualToString:@"iPhone13,4"])   return @"iPhone 12 Pro Max";
        if ([string isEqualToString:@"iPhone14,2"])   return @"iPhone 13 Pro";
        if ([string isEqualToString:@"iPhone14,3"])   return @"iPhone 13 Pro Max";
        if ([string isEqualToString:@"iPhone14,4"])   return @"iPhone 13 mini";
        if ([string isEqualToString:@"iPhone14,5"])   return @"iPhone 13";
        if ([string isEqualToString:@"iPhone14,6"])   return @"iPhone SE (3rd generation)";
        if ([string isEqualToString:@"iPhone14,7"])   return @"iPhone 14";
        if ([string isEqualToString:@"iPhone14,8"])   return @"iPhone 14 Plus";
        if ([string isEqualToString:@"iPhone15,2"])   return @"iPhone 14 Pro";
        if ([string isEqualToString:@"iPhone15,3"])   return @"iPhone 14 Pro Max";
    }
    // iPod touch
    {
        if ([string isEqualToString:@"iPod1,1"])      return @"iPod touch (1st generation)";
        if ([string isEqualToString:@"iPod2,1"])      return @"iPod touch (2nd generation)";
        if ([string isEqualToString:@"iPod3,1"])      return @"iPod touch (3rd generation)";
        if ([string isEqualToString:@"iPod4,1"])      return @"iPod touch (4th generation)";
        if ([string isEqualToString:@"iPod5,1"])      return @"iPod touch (5th generation)";
        if ([string isEqualToString:@"iPod7,1"])      return @"iPod touch (6th generation)";
        if ([string isEqualToString:@"iPod9,1"])      return @"iPod touch (7th generation)";
    }
    // iPad
    {
        if ([string isEqualToString:@"iPad1,1"])      return @"iPad";
        if ([string isEqualToString:@"iPad1,2"])      return @"iPad 3G";// ⚠️
        if ([string isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
        if ([string isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
        if ([string isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
        if ([string isEqualToString:@"iPad2,4"])      return @"iPad 2 (WiFi)";
        if ([string isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
        if ([string isEqualToString:@"iPad2,6"])      return @"iPad Mini (GSM)";
        if ([string isEqualToString:@"iPad2,7"])      return @"iPad Mini (CDMA)";
        if ([string isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
        if ([string isEqualToString:@"iPad3,2"])      return @"iPad 3 (CDMA)";
        if ([string isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
        if ([string isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
        if ([string isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
        if ([string isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
        if ([string isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";// ⚠️
        if ([string isEqualToString:@"iPad4,2"])      return @"iPad Air (GSM)";// ⚠️
        if ([string isEqualToString:@"iPad4,3"])      return @"iPad Air (CDMA)";// ⚠️
        if ([string isEqualToString:@"iPad4,4"])      return @"iPad Mini Retina (WiFi)";
        if ([string isEqualToString:@"iPad4,5"])      return @"iPad Mini Retina (Cellular)";
        if ([string isEqualToString:@"iPad4,6"])      return @"iPad Mini Retina (China)";
        if ([string isEqualToString:@"iPad4,7"])      return @"iPad Mini 3 (WiFi)";
        if ([string isEqualToString:@"iPad4,8"])      return @"iPad Mini 3 (Cellular)";
        if ([string isEqualToString:@"iPad4,9"])      return @"iPad Mini 3 (Cellular)";
        if ([string isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
        if ([string isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (Cellular)";
        if ([string isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (WiFi)";// ⚠️
        if ([string isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";// ⚠️
        if ([string isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7-inch (WiFi)";
        if ([string isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7-inch (Cellular)";
        if ([string isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9-inch (WiFi)";
        if ([string isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9-inch (Cellular)";
        if ([string isEqualToString:@"iPad6,11"])     return @"iPad 5 (WiFi)";
        if ([string isEqualToString:@"iPad6,12"])     return @"iPad 5 (Cellular)";
        if ([string isEqualToString:@"iPad7,1"])      return @"iPad Pro 12.9-inch 2nd-gen (WiFi)";
        if ([string isEqualToString:@"iPad7,2"])      return @"iPad Pro 12.9-inch 2nd-gen (Cellular)";
        if ([string isEqualToString:@"iPad7,3"])      return @"iPad Pro 10.5-inch (WiFi)";
        if ([string isEqualToString:@"iPad7,4"])      return @"iPad Pro 10.5-inch (Cellular)";
        if ([string isEqualToString:@"iPad7,5"])      return @"iPad 6 (WiFi)";
        if ([string isEqualToString:@"iPad7,6"])      return @"iPad 6 (Cellular)";
        if ([string isEqualToString:@"iPad7,11"])     return @"iPad (7th generation)";
        if ([string isEqualToString:@"iPad7,12"])     return @"iPad (7th generation)";
        if ([string isEqualToString:@"iPad8,1"])      return @"iPad Pro (11-inch)";
        if ([string isEqualToString:@"iPad8,2"])      return @"iPad Pro (11-inch)";
        if ([string isEqualToString:@"iPad8,3"])      return @"iPad Pro (11-inch)";
        if ([string isEqualToString:@"iPad8,4"])      return @"iPad Pro (11-inch)";
        if ([string isEqualToString:@"iPad8,5"])      return @"iPad Pro (12.9-inch) (3rd generation)";
        if ([string isEqualToString:@"iPad8,6"])      return @"iPad Pro (12.9-inch) (3rd generation)";
        if ([string isEqualToString:@"iPad8,7"])      return @"iPad Pro (12.9-inch) (3rd generation)";
        if ([string isEqualToString:@"iPad8,8"])      return @"iPad Pro (12.9-inch) (3rd generation)";
        if ([string isEqualToString:@"iPad8,9"])      return @"iPad Pro (11-inch) (2nd generation)";
        if ([string isEqualToString:@"iPad8,10"])     return @"iPad Pro (11-inch) (2nd generation)";
        if ([string isEqualToString:@"iPad8,11"])     return @"iPad Pro (12.9-inch) (4th generation)";
        if ([string isEqualToString:@"iPad8,12"])     return @"iPad Pro (12.9-inch) (4th generation)";
        if ([string isEqualToString:@"iPad11,1"])     return @"iPad mini (5th generation)";
        if ([string isEqualToString:@"iPad11,2"])     return @"iPad mini (5th generation)";
        if ([string isEqualToString:@"iPad11,6"])     return @"iPad (8th generation)";
        if ([string isEqualToString:@"iPad11,7"])     return @"iPad (8th generation)";
        if ([string isEqualToString:@"iPad12,1"])     return @"iPad (9th generation)";
        if ([string isEqualToString:@"iPad12,2"])     return @"iPad (9th generation)";
        if ([string isEqualToString:@"iPad13,4"])     return @"iPad Pro (11-inch) (3rd generation)";
        if ([string isEqualToString:@"iPad13,5"])     return @"iPad Pro (11-inch) (3rd generation)";
        if ([string isEqualToString:@"iPad13,6"])     return @"iPad Pro (11-inch) (3rd generation)";
        if ([string isEqualToString:@"iPad13,7"])     return @"iPad Pro (11-inch) (3rd generation)";
        if ([string isEqualToString:@"iPad13,8"])     return @"iPad Pro (12.9-inch) (5th generation)";
        if ([string isEqualToString:@"iPad13,9"])     return @"iPad Pro (12.9-inch) (5th generation)";
        if ([string isEqualToString:@"iPad13,10"])    return @"iPad Pro (12.9-inch) (5th generation)";
        if ([string isEqualToString:@"iPad13,11"])    return @"iPad Pro (12.9-inch) (5th generation)";
        if ([string isEqualToString:@"iPad14,1"])     return @"iPad mini (6th generation)";
        if ([string isEqualToString:@"iPad14,2"])     return @"iPad mini (6th generation, WiFi)";
        if ([string isEqualToString:@"iPad14,3"])     return @"iPad mini (6th generation, Cellular)";// ⚠️
    }
    // Apple TV
    {
        if ([string isEqualToString:@"AppleTV1,1"])   return @"Apple TV (1st generation)";
        if ([string isEqualToString:@"AppleTV2,1"])   return @"Apple TV (2nd generation)";
        if ([string isEqualToString:@"AppleTV3,1"])   return @"Apple TV (3rd generation)";
        if ([string isEqualToString:@"AppleTV3,2"])   return @"Apple TV (3rd generation)";
        if ([string isEqualToString:@"AppleTV5,3"])   return @"Apple TV (4th generation)";
        if ([string isEqualToString:@"AppleTV6,2"])   return @"Apple TV 4K";
        if ([string isEqualToString:@"AppleTV11,1"])  return @"Apple TV 4K (2nd generation)";
    }
    // Simulator
    {
        if ([string isEqualToString:@"i386"])         return [NSString stringWithFormat:@"%@ Simulator", UIDevice.currentDevice.model];
        if ([string isEqualToString:@"x86_64"])       return [NSString stringWithFormat:@"%@ Simulator", UIDevice.currentDevice.model];
    }return nil;
}
///  获取设备型号名称（可以区分iOS模拟器）
+(NSString * _Nullable)platformNameStr{
    NSString *platformStr = [self platform];
    if (!platformStr) {
        return UIDevice.currentDevice.model; // e.g. @"iPhone", @"iPod touch"
    }return [self platform:platformStr];
}
/// 获取当前设备标识符Identifier（不区分iOS模拟器：把IOS模拟器当真机对待）
+(NSString * _Nullable)platformIDStr{
    return self.isSimulator ? UIDevice.simulatorModel : [self platform];
}
/// 判断当前机型是否是iphone6 及其以上机型,过滤掉对ipad的判断
+(BOOL)judgementUpperIphone6{
    NSString *str = [UIDevice platformNameStr];
    if ([str isEqualToString:@"iPhone 2G"])         return NO;
    if ([str isEqualToString:@"iPhone 3G"])         return NO;
    if ([str isEqualToString:@"iPhone 3GS"])        return NO;
    if ([str isEqualToString:@"iPhone 4"])          return NO;
    if ([str isEqualToString:@"iPhone 4S"])         return NO;
    if ([str isEqualToString:@"iPhone 5"])          return NO;
    if ([str isEqualToString:@"iPhone 5c"])         return NO;
    if ([str isEqualToString:@"iPhone 5s"])         return NO;
    if ([str isEqualToString:@"iPhone Simulator"])  return NO;//test
    return YES;
}
/// 判断当前机型是否为非刘海屏：是刘海屏return YES，不是刘海屏return NO
+(BOOL)isFullScreen{
    if(self.isiPhone){
        if ([self.platformIDStr isEqualToString:@"iPhone1,1"])    return NO;// iPhone 初代
        if ([self.platformIDStr isEqualToString:@"iPhone1,2"])    return NO;// iPhone 3G
        if ([self.platformIDStr isEqualToString:@"iPhone2,1"])    return NO;// iPhone 3GS
        if ([self.platformIDStr isEqualToString:@"iPhone3,1"])    return NO;// iPhone 4 (GSM)
        if ([self.platformIDStr isEqualToString:@"iPhone3,2"])    return NO;// iPhone 4 (GSM Rev A)
        if ([self.platformIDStr isEqualToString:@"iPhone3,3"])    return NO;// iPhone 4 (CDMA)
        if ([self.platformIDStr isEqualToString:@"iPhone4,1"])    return NO;// iPhone 4S
        if ([self.platformIDStr isEqualToString:@"iPhone5,1"])    return NO;// iPhone 5 (GSM)
        if ([self.platformIDStr isEqualToString:@"iPhone5,2"])    return NO;// iPhone 5 (CDMA)
        if ([self.platformIDStr isEqualToString:@"iPhone5,3"])    return NO;// iPhone 5c
        if ([self.platformIDStr isEqualToString:@"iPhone5,4"])    return NO;// iPhone 5c
        if ([self.platformIDStr isEqualToString:@"iPhone6,1"])    return NO;// iPhone 5s
        if ([self.platformIDStr isEqualToString:@"iPhone6,2"])    return NO;// iPhone 5s
        if ([self.platformIDStr isEqualToString:@"iPhone7,1"])    return NO;// iPhone 6 Plus
        if ([self.platformIDStr isEqualToString:@"iPhone7,2"])    return NO;// iPhone 6
        if ([self.platformIDStr isEqualToString:@"iPhone8,1"])    return NO;// iPhone 6s
        if ([self.platformIDStr isEqualToString:@"iPhone8,2"])    return NO;// iPhone 6s Plus
        if ([self.platformIDStr isEqualToString:@"iPhone8,4"])    return NO;// iPhone SE (1st generation)
        if ([self.platformIDStr isEqualToString:@"iPhone9,1"])    return NO;// iPhone 7
        if ([self.platformIDStr isEqualToString:@"iPhone9,2"])    return NO;// iPhone 7 Plus
        if ([self.platformIDStr isEqualToString:@"iPhone9,3"])    return NO;// iPhone 7
        if ([self.platformIDStr isEqualToString:@"iPhone9,4"])    return NO;// iPhone 7 Plus
        if ([self.platformIDStr isEqualToString:@"iPhone10,1"])   return NO;// iPhone 8
        if ([self.platformIDStr isEqualToString:@"iPhone10,2"])   return NO;// iPhone 8 Plus
        if ([self.platformIDStr isEqualToString:@"iPhone10,4"])   return NO;// iPhone 8
        if ([self.platformIDStr isEqualToString:@"iPhone10,5"])   return NO;// iPhone 8 Plus
        if ([self.platformIDStr isEqualToString:@"iPhone14,6"])   return NO;// iPhone SE (3rd generation)
        return YES;
    }return NO;
}
/// 判断当前是否是iOS模拟器
+(BOOL)isSimulator{
    NSString *str = [UIDevice platformNameStr];
    return [str isEqualToString:@"iPhone Simulator"];
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
/// 判定当前设备是否为iPhone
+(BOOL)isiPhone{
    return [UIDevice.currentDevice.model hasPrefix:@"iPhone"];
}
/// 判断当前iOS模拟器所模拟的机型
+(NSString * _Nullable)simulatorModel{
    if (TARGET_OS_SIMULATOR) {
        NSDictionary *environment = NSProcessInfo.processInfo.environment;
        NSString *simulatorModel = environment[@"SIMULATOR_MODEL_IDENTIFIER"];
        return simulatorModel;
    }return nil; //不在模拟器上运行，返回 nil 或其他合适的值
}
/**
 获取设备型号名称
 @return 设备型号名称，与 platformNameStr 一致，只查询一次然后缓存
 */
+(NSString * _Nullable)deviceName{
    static NSString *deviceName = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceName = [self platformNameStr];
        if (deviceName.length == 0) {
            deviceName = @"iPhone";
        }
    });return deviceName;
}

@end

