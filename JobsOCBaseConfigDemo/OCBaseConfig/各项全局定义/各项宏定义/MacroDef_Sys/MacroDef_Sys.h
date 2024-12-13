//
//  MacroDef_Sys.h
//  UBallLive
//
//  Created by Jobs on 2020/10/9.
//

#ifndef MacroDef_Sys_h
#define MacroDef_Sys_h

#define HDAppVersion [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleShortVersionString"]/// 标识应用程序的发布版本号
#define HDAppBuildVersion [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleVersion"]/// App BUILD 版本号
#define HDAppDisplayName [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleExecutable"]/// App名字
#define HDLocalLanguage [NSLocale.currentLocale objectForKey:NSLocaleLanguageCode]/// 当前语言
#define CURRENTLANGUAGE [NSLocale.preferredLanguages objectAtIndex:0]/// 当前语言
#define HDLocalCountry [NSLocale.currentLocale objectForKey:NSLocaleCountryCode]/// 当前国家
#define HDDevice UIDevice.currentDevice
#define HDDeviceName UIDevice.currentDevice.name/// 设备名称
#define HDDeviceModel UIDevice.currentDevice.model/// 设备类型
#define HDDeviceLocalizedModel UIDevice.currentDevice.localizedModel/// 本地化模式
#define HDDeviceSystemName UIDevice.currentDevice.systemName/// 系统名字
#define HDDeviceSystemVersion UIDevice.currentDevice.systemVersion/// 系统版本
#define HDDeviceOrientation UIDevice.currentDevice.orientation/// 设备朝向

#define HDiPhone ([UIDevice.currentDevice.model rangeOfString:@"iPhone"].length > 0)
#define HDiPod ([UIDevice.currentDevice.model rangeOfString:@"iPod"].length > 0)
#define HDisPad (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)/// 是否iPad
#define HDisiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)/// 是否iPhone
#define HDisRetina (UIScreen.mainScreen.scale >= 2.0)/// 非Retain屏幕 1.0
/// 懒加载
#ifndef Jobs_Lazy_Load_Property
#define Jobs_Lazy_Load_Property(PropertyType, Name, InitCode) \
- (PropertyType *)Name { \
    if (!_##Name) { \
        InitCode \
    } return _##Name; \
}
#endif /* Jobs_Lazy_Load_Property */
/// 用于分类定义属性Set和Get方法
#pragma mark —— Key
#ifndef JobsKey
#define JobsKey(key) static void *key = &key;
#endif /* JobsKey */
#pragma mark —— Get
#ifndef Jobs_getAssociatedObject
#define Jobs_getAssociatedObject(key) objc_getAssociatedObject(self, &key)
#endif /* Jobs_getAssociatedObject */
#pragma mark —— Set
#ifndef Jobs_setAssociatedASSIGN /// 封装成对象（NSNumber *）进行存储
#define Jobs_setAssociatedASSIGN(key, Object) \
    objc_setAssociatedObject(self, \
                             &(key), \
                             (Object), \
                             OBJC_ASSOCIATION_ASSIGN);
#endif /* Jobs_setAssociatedASSIGN */
#ifndef Jobs_setAssociatedRETAIN_NONATOMIC /// 适用于被 strong 和 retain 修饰的属性
#define Jobs_setAssociatedRETAIN_NONATOMIC(key, Object) \
    objc_setAssociatedObject(self, \
                             &(key), \
                             (Object), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
#endif /* Jobs_setAssociatedRETAIN_NONATOMIC */
#ifndef Jobs_setAssociatedRETAIN /// 适用于被 strong 和 retain 修饰的属性
#define Jobs_setAssociatedRETAIN(key, Object) \
    objc_setAssociatedObject(self, \
                             &(key), \
                             (Object), \
                             OBJC_ASSOCIATION_RETAIN);
#endif /* Jobs_setAssociatedRETAIN */
#ifndef Jobs_setAssociatedCOPY_NONATOMIC
#define Jobs_setAssociatedCOPY_NONATOMIC(key, Object) \
    objc_setAssociatedObject(self, \
                             &(key), \
                             (Object), \
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
#endif /* Jobs_setAssociatedCOPY_NONATOMIC */
#ifndef Jobs_setAssociatedCOPY
#define Jobs_setAssociatedCOPY(key, Object) \
    objc_setAssociatedObject(self, \
                             &(key), \
                             (Object), \
                             OBJC_ASSOCIATION_COPY);
#endif /* Jobs_setAssociatedCOPY */

#endif /* MacroDef_Sys_h */
