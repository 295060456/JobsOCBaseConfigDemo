//
//  JobsDevice.h
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#ifndef JobsDevice_h
#define JobsDevice_h

#pragma mark —— Category
#import "UIDevice+XMUtils.h"
#pragma mark —— Base
/// 获取手机UUID
static inline NSString *jobsUUIDString(void) {
    [UIDevice currentDevice];
    return UIDevice.currentDevice.identifierForVendor.UUIDString;
}
/// 获取手机别名
static inline NSString *jobsCurrentDeviceName(void) {
    return UIDevice.currentDevice.name;
}
/// 获取设备名称
static inline NSString *jobsCurrentDeviceSystemName(void) {
    return UIDevice.currentDevice.systemName;
}
/// 获取手机系统版本
static inline NSString *jobsCurrentDeviceSystemVersion(void) {
    return UIDevice.currentDevice.systemVersion;
}
/// 获取手机型号
static inline NSString *jobsCurrentDeviceModel(void) {
    return UIDevice.currentDevice.model;
}
/// 获取地方型号  (国际化区域名称)
static inline NSString *jobsCurrentDeviceLocalizedModel(void) {
    return UIDevice.currentDevice.localizedModel;
}
/// 获取当前App名字
static inline NSString *jobsCurrentAppName(void) {
   return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleDisplayName"];
}
/// 获取当前应用软件版本（Float类型）
static inline NSString *jobsCurrentAppVersion1(void) {
   return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleShortVersionString"];
}
/// 获取当前应用软件版本（int类型）
static inline NSString *jobsCurrentAppVersion2(void) {
   return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleVersion"];
}

#endif /* JobsDevice_h */
