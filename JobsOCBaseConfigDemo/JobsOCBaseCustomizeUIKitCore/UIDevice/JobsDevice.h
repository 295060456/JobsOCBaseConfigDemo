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
NS_INLINE NSString *jobsUUIDString(void) {
    [UIDevice currentDevice];
    return UIDevice.currentDevice.identifierForVendor.UUIDString;
}
/// 获取手机别名
NS_INLINE NSString *jobsCurrentDeviceName(void) {
    return UIDevice.currentDevice.name;
}
/// 获取设备名称
NS_INLINE NSString *jobsCurrentDeviceSystemName(void) {
    return UIDevice.currentDevice.systemName;
}
/// 获取手机系统版本
NS_INLINE NSString *jobsCurrentDeviceSystemVersion(void) {
    return UIDevice.currentDevice.systemVersion;
}
/// 获取手机型号
NS_INLINE NSString *jobsCurrentDeviceModel(void) {
    return UIDevice.currentDevice.model;
}
/// 获取地方型号  (国际化区域名称)
NS_INLINE NSString *jobsCurrentDeviceLocalizedModel(void) {
    return UIDevice.currentDevice.localizedModel;
}
/// 获取当前App名字
NS_INLINE NSString *jobsCurrentAppName(void) {
   return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleDisplayName"];
}
/// 获取当前应用软件版本（Float类型）
NS_INLINE NSString *jobsCurrentAppVersion1(void) {
   return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleShortVersionString"];
}
/// 获取当前应用软件版本（int类型）
NS_INLINE NSString *jobsCurrentAppVersion2(void) {
   return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleVersion"];
}

#endif /* JobsDevice_h */
