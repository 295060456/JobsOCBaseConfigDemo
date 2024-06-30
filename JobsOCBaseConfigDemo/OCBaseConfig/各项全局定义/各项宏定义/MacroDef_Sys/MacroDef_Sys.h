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

/**
 仿写来自WMZBanner框架的属性点语法调用
 https://github.com/wwmz/WMZBanner 轻量级轮播图+卡片样式+自定义样式 ⚠️作者停止维护
 关注：关于WMZBanner的怪异写法探究.md
 */
/// 用于 @interface
#ifndef JobsInterface
#define JobsInterface(className,propertyModifier,propertyPointerType,propertyName) \
@property(nonatomic,propertyModifier)propertyPointerType  propertyName; \
-(className *(^)(propertyPointerType propertyName)) propertyName##Set;
#endif
/// 用于 @implementation
#ifndef JobsImplementation
#define JobsImplementation(className,propertyPointerType,propertyName) \
- (className * (^) (propertyPointerType propertyName))propertyName##Set{ \
return ^(propertyPointerType propertyName) { \
self->_##propertyName = propertyName; \
return self; \
}; \
}
#endif
/// 用于分类定义属性Set和Get方法
#pragma mark —— Key
#ifndef JobsKey
#define JobsKey(key) static void *key = &key;
#endif
#pragma mark —— Get
#ifndef Jobs_getAssociatedObject
#define Jobs_getAssociatedObject(key) objc_getAssociatedObject(self, &key)
#endif
#pragma mark —— Set
#ifndef Jobs_setAssociatedASSIGN
#define Jobs_setAssociatedASSIGN(key, Object) \
    objc_setAssociatedObject(self, \
                             &(key), \
                             (Object), \
                             OBJC_ASSOCIATION_ASSIGN);
#endif

#ifndef Jobs_setAssociatedRETAIN_NONATOMIC
#define Jobs_setAssociatedRETAIN_NONATOMIC(key, Object) \
    objc_setAssociatedObject(self, \
                             &(key), \
                             (Object), \
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
#endif

#ifndef Jobs_setAssociatedCOPY_NONATOMIC
#define Jobs_setAssociatedCOPY_NONATOMIC(key, Object) \
    objc_setAssociatedObject(self, \
                             &(key), \
                             (Object), \
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
#endif

#ifndef Jobs_setAssociatedRETAIN
#define Jobs_setAssociatedRETAIN(key, Object) \
    objc_setAssociatedObject(self, \
                             &(key), \
                             (Object), \
                             OBJC_ASSOCIATION_RETAIN);
#endif

#ifndef Jobs_setAssociatedCOPY
#define Jobs_setAssociatedCOPY(key, Object) \
    objc_setAssociatedObject(self, \
                             &(key), \
                             (Object), \
                             OBJC_ASSOCIATION_COPY);
#endif

#endif /* MacroDef_Sys_h */
