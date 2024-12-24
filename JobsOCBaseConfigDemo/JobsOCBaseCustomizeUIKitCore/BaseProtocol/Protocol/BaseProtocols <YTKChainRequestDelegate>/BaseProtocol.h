//
//  BaseProtocol.h
//  Casino
//
//  Created by Jobs on 2021/12/7.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "RACProtocol.h"
#import "DefineProperty.h"
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@protocol BaseProtocol <YTKChainRequestDelegate,RACProtocol>
@optional
#pragma mark —— 一些状态
Prop_assign()BOOL isLock;
Prop_assign()BOOL becomeFirstResponder;
Prop_assign()AppLanguage appLanguage;
/// 关于计时器
Prop_assign()BOOL start;
Prop_assign()BOOL pause;
Prop_assign()BOOL resume;
Prop_assign()BOOL stop;
Prop_assign()TimerProcessType timerProcessType; /// 计时器运行状态
#pragma mark —— Data
Prop_strong(nullable)NSURL *url;
Prop_copy(nullable)NSString *internationalizationKEY;/// 国际化的key
Prop_strong(nullable)NSMutableSet *jobsDataMutSet;/// 绑定的数据源，数据类型NSMutableSet
Prop_strong(nullable)NSMutableArray *jobsDataMutArr;/// 绑定的数据源，数据类型NSMutableArray
Prop_strong(nullable)NSMutableDictionary *jobsDataMutDic;/// 绑定的数据源，数据类型NSMutableDictionary
Prop_strong(nullable)Class cls;/// 绑定的class
/// 强引用数据源
Prop_strong(nullable)id data;/// 【强引用】绑定的数据源，数据类型id
Prop_strong(nullable)id requestParams;/// 【强引用】绑定的数据源，数据类型id
/// 弱引用数据源
Prop_weak(nullable)id data_weak;/// 【弱引用】绑定的数据源，数据类型id
Prop_weak(nullable)id requestParams_weak;/// 【弱引用】绑定的数据源，数据类型id
/// 更改UITabBarItem的标题
-(jobsByIndexPathBlock _Nonnull)changeTabBarItemTitleBy;
#pragma mark —— iOS 通知
///【监听所有通知】
///【监听所有通知】用 selector
-(void)monitorNotification:(nonnull NSString *)notificationName
              withSelector:(nonnull SEL)selector;
///【监听所有通知】用 Block
-(void)monitorNotification:(nonnull NSString *)notificationName
                 withBlock:(nonnull JobsReturnIDBySelectorBlock)actionBlock;
///【通知监听】国际化语言修改UI
/// @param target 需要铆定监听通知的对象
/// @param aSelector 相关逻辑
+(void)target:(id)target languageSwitchNotificationWithSelector:(SEL)aSelector;/// NSObject (AppTools)
///【监听通知】设置App语言环境
-(void)monitorAppLanguage;//NSObject (Notification)
///【发通知】设置App语言环境
-(jobsByNSIntegerBlock _Nonnull)appLanguageAtAppLanguageBy;
/// 接收通知并相应的方法【在分类或者基类中实现会屏蔽具体子类的相关实现】
-(jobsByNotificationBlock _Nonnull)jobsLanguageSwitchNotification;/// 在具体子类进行实现
#pragma mark —— 单例化和销毁
+(void)destroySingleton;
+(instancetype)sharedManager;
+(JobsReturnIDByVoidBlock _Nonnull)SharedInstance;
+(jobsByVoidBlock _Nonnull)DestroySingleton;

@end

NS_ASSUME_NONNULL_END

#ifndef BaseProtocol_synthesize
#define BaseProtocol_synthesize \
\
@synthesize isLock = _isLock;\
@synthesize becomeFirstResponder = _becomeFirstResponder;\
@synthesize appLanguage = _appLanguage;\
@synthesize start = _start;\
@synthesize pause = _pause;\
@synthesize resume = _resume;\
@synthesize stop = _stop;\
@synthesize timerProcessType = _timerProcessType;\
@synthesize internationalizationKEY = _internationalizationKEY;\
@synthesize jobsDataMutSet = _jobsDataMutSet;\
@synthesize jobsDataMutArr = _jobsDataMutArr;\
@synthesize jobsDataMutDic = _jobsDataMutDic;\
@synthesize cls = _cls;\
@synthesize data = _data;\
@synthesize data_weak = _data_weak;\
@synthesize requestParams = _requestParams;\
@synthesize requestParams_weak = _requestParams_weak;\
@synthesize url = _url;\

#endif /* BaseProtocol_synthesize */

#ifndef BaseProtocol_dynamic
#define BaseProtocol_dynamic \
\
@dynamic isLock;\
@dynamic becomeFirstResponder;\
@dynamic appLanguage;\
@dynamic start;\
@dynamic pause;\
@dynamic resume;\
@dynamic stop;\
@dynamic timerProcessType;\
@dynamic internationalizationKEY;\
@dynamic jobsDataMutSet;\
@dynamic jobsDataMutArr;\
@dynamic jobsDataMutDic;\
@dynamic cls;\
@dynamic data;\
@dynamic requestParams;\
@dynamic data_weak;\
@dynamic requestParams_weak;\
@dynamic url;\

#endif /* BaseProtocol_dynamic */
