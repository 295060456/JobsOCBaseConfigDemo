//
//  BaseProtocol.h
//  Casino
//
//  Created by Jobs on 2021/12/7.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import <os/lock.h>
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
#pragma mark —— 锁🔐
Prop_strong(nullable)NSLock *lock; /// Foundation 框架提供的互斥锁。更灵活，性能比 @synchronized 高。需要手动管理加锁和解锁。
Prop_strong(nullable)NSRecursiveLock *recursiveLock; /// 递归锁，同一线程可以多次获得锁而不会导致死锁
Prop_assign(readonly)os_unfair_lock os_lock; /// Apple 推荐的轻量级锁，性能极高。替代 OSSpinLock。不需要显式销毁
Prop_assign(readonly)pthread_mutex_t mutex; /// pthread_mutex_t是底层的非对象类型，不支持 ARC（自动引用计数）的内存管理规则。pthread_mutex_init(&_mutex, NULL); // 初始化互斥锁
#pragma mark —— 一些状态
Prop_assign()BOOL isLock;
Prop_assign()BOOL isRead;
Prop_assign()BOOL becomeFirstResponder;
Prop_assign()AppLanguage appLanguage;
Prop_assign()CGPoint lastContentOffset; /// 主要用于记录与计算 UIScrollView 的滑动方向
#pragma mark —— 关于计时器
Prop_assign()CGFloat time;
Prop_strong(nullable)NSInvocation *invocation;
Prop_strong(nullable)NSTimer *timer;
Prop_strong(nullable)id userInfo;
Prop_retain()dispatch_semaphore_t semaphore;/// 也可以作为锁
Prop_retain()dispatch_source_t dispatchTimer;
Prop_assign()CGFloat anticlockwiseTime;/// ❤️【逆时针模式：到这个时间点结束】、【顺时针模式：从这个时间点开始】
Prop_assign()NSTimeInterval timeSecIntervalSinceDate;/// 推移时间，秒数
Prop_assign()NSTimeInterval startTime;
Prop_assign()NSTimeInterval timeInterval;/// 时间间距
Prop_assign()BOOL repeats;
Prop_assign(readonly,getter=isValid)BOOL valid;
Prop_assign()BOOL start;
Prop_assign()BOOL running;
Prop_assign()BOOL pause;
Prop_assign()BOOL resume;
Prop_assign()BOOL stop;
Prop_assign()DispatchTimerState state;
Prop_assign()ScheduledTimerType timerType; /// 用哪一种模式进行初始化NSTimer定时器
Prop_assign()TimerStyle timerStyle;/// 逆时针模式?顺时针模式？
Prop_assign(readonly)NSTimerCurrentStatus timerCurrentStatus;/// 定时器当前状态
Prop_assign()TimerProcessType timerProcessType; /// 计时器运行状态
#pragma mark —— JS
Prop_strong(nullable)WKUserContentController *userContentCtrl;
Prop_strong(nullable)WKScriptMessage *scriptMsg;
Prop_copy(nullable)NSString *handlerName;
Prop_copy(nullable)NSString *evaluateJavaScript;
Prop_copy(nullable)NSString *customUserAgent;
Prop_copy(nullable)jobsJSCompletionHandlerBlock completionHandlerBlock;
#pragma mark —— Data
Prop_copy(nullable)NSMutableArray <NSURL *>*urls;
Prop_strong(nullable)NSURL *url;
Prop_strong(nullable)NSURL *imageUrl;
Prop_copy(nullable)NSString *internationalizationKEY;/// 国际化的key
Prop_copy(nullable)NSMutableSet *jobsDataMutSet;/// 绑定的数据源，数据类型NSMutableSet
Prop_copy(nullable)NSMutableArray *jobsDataMutArr;/// 绑定的数据源，数据类型NSMutableArray
Prop_copy(nullable)NSMutableDictionary *jobsDataMutDic;/// 绑定的数据源，数据类型NSMutableDictionary
Prop_strong(nullable)Class cls;/// 绑定的class
/**
 SEL：就是一个字符串（Char*类型），表示方法的名字
 IMP：就是指向方法实现首地址的指针
 Method：是一个结构体，包含一个SEL表示方法名、一个IMP指向函数的实现地址、一个Char*表示函数的类型（包括返回值和参数类型）
 SEL、IMP、Method之间的关系可以这么理解：
 一个类（Class）持有一系列的方法（Method），在load类时，runtime会将所有方法的选择器（SEL）hash后映射到一个集合（NSSet）中（NSSet里的元素不能重复）
 当需要发消息时，会根据选择器（SEL）去查找方法；找到之后，用Method结构体里的函数指针（IMP）去调用方法。这样在运行时查找selecter的速度就会非常快
 */
Prop_assign(nullable)SEL selector;
Prop_assign(nullable)IMP implementation;
Prop_strong(nullable)id target;
Prop_weak(nullable)id weak_target;
/// 强引用数据源
Prop_strong(nullable)id data;/// 【强引用】绑定的数据源，数据类型id
Prop_strong(nullable)id requestParams;/// 【强引用】绑定的数据源，数据类型id
Prop_strong(nullable)id modelData;/// 挂载修饰的ViewModel/UIButtonModel/TextModel...
Prop_assign()CGFloat value_CGFloat;
Prop_assign()NSInteger value_NSInteger;
Prop_assign()NSUInteger value_NSUInteger;
/// 弱引用数据源
Prop_weak(nullable)id data_weak;/// 【弱引用】绑定的数据源，数据类型id
Prop_weak(nullable)id requestParams_weak;/// 【弱引用】绑定的数据源，数据类型id
/// 更改UITabBarItem的标题
-(jobsByIndexPathBlock _Nonnull)changeTabBarItemTitleBy;
#pragma mark —— iOS 通知
///【监听所有通知】
///【监听所有通知】用 selector
-(void)monitorNotification:(NSString *_Nonnull)notificationName
              withSelector:(SEL _Nonnull)selector;
///【监听所有通知】用 Block
-(void)monitorNotification:(NSString * _Nonnull)notificationName
                 withBlock:(JobsRetIDByTwoIDBlock _Nonnull)actionBlock;
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
+(JobsRetIDByVoidBlock _Nonnull)SharedInstance;
+(jobsByVoidBlock _Nonnull)DestroySingleton;

@end

NS_ASSUME_NONNULL_END

#ifndef BaseProtocol_synthesize_lock
#define BaseProtocol_synthesize_lock \
\
@synthesize lock = _lock;\
@synthesize recursiveLock = _recursiveLock;\
@synthesize os_lock = _os_lock;\
@synthesize mutex = _mutex;\

#endif /* BaseProtocol_synthesize_lock */

#ifndef BaseProtocol_synthesize_state
#define BaseProtocol_synthesize_state \
\
@synthesize isLock = _isLock;\
@synthesize isRead = _isRead;\
@synthesize becomeFirstResponder = _becomeFirstResponder;\
@synthesize appLanguage = _appLanguage;\
@synthesize lastContentOffset = _lastContentOffset;\

#endif /* BaseProtocol_synthesize_state */

#ifndef BaseProtocol_synthesize_timer
#define BaseProtocol_synthesize_timer \
\
@synthesize time = _time;\
@synthesize invocation = _invocation;\
@synthesize timer = _timer;\
@synthesize userInfo = _userInfo;\
@synthesize semaphore = _semaphore;\
@synthesize dispatchTimer = _dispatchTimer;\
@synthesize anticlockwiseTime = _anticlockwiseTime;\
@synthesize timeSecIntervalSinceDate = _timeSecIntervalSinceDate;\
@synthesize startTime = _startTime;\
@synthesize timeInterval = _timeInterval;\
@synthesize repeats = _repeats;\
@synthesize valid = _valid;\
@synthesize start = _start;\
@synthesize running = _running;\
@synthesize pause = _pause;\
@synthesize resume = _resume;\
@synthesize stop = _stop;\
@synthesize state = _state;\
@synthesize timerType = _timerType;\
@synthesize timerStyle = _timerStyle;\
@synthesize timerCurrentStatus = _timerCurrentStatus;\
@synthesize timerProcessType = _timerProcessType;\
@synthesize userContentCtrl = _userContentCtrl;\
@synthesize scriptMsg = _scriptMsg;\
@synthesize handlerName = _handlerName;\
@synthesize evaluateJavaScript = _evaluateJavaScript;\
@synthesize customUserAgent = _customUserAgent;\
@synthesize completionHandlerBlock = _completionHandlerBlock;\

#endif /* BaseProtocol_synthesize_timer */

#ifndef BaseProtocol_synthesize_data
#define BaseProtocol_synthesize_data \
\
@synthesize urls = _urls;\
@synthesize url = _url;\
@synthesize imageUrl = _imageUrl;\
@synthesize internationalizationKEY = _internationalizationKEY;\
@synthesize jobsDataMutSet = _jobsDataMutSet;\
@synthesize jobsDataMutArr = _jobsDataMutArr;\
@synthesize jobsDataMutDic = _jobsDataMutDic;\
@synthesize cls = _cls;\
@synthesize selector = _selector;\
@synthesize implementation = _implementation;\
@synthesize target = _target;\
@synthesize weak_target = _weak_target;\
@synthesize data = _data;\
@synthesize data_weak = _data_weak;\
@synthesize requestParams = _requestParams;\
@synthesize modelData = _modelData;\
@synthesize value_CGFloat = _value_CGFloat;\
@synthesize value_NSInteger = _value_NSInteger;\
@synthesize value_NSUInteger = _value_NSUInteger;\
@synthesize requestParams_weak = _requestParams_weak;\

#endif /* BaseProtocol_synthesize_data */

#ifndef BaseProtocol_synthesize
#define BaseProtocol_synthesize \
\
BaseProtocol_synthesize_lock \
BaseProtocol_synthesize_state \
BaseProtocol_synthesize_timer \
BaseProtocol_synthesize_data \

#endif /* BaseProtocol_synthesize */

#ifndef BaseProtocol_dynamic
#define BaseProtocol_dynamic \
\
@dynamic lock;\
@dynamic recursiveLock;\
@dynamic os_lock;\
@dynamic mutex;\
@dynamic isLock;\
@dynamic isRead;\
@dynamic becomeFirstResponder;\
@dynamic appLanguage;\
@dynamic lastContentOffset;\
@dynamic time;\
@dynamic invocation;\
@dynamic timer;\
@dynamic userInfo;\
@dynamic semaphore;\
@dynamic dispatchTimer;\
@dynamic anticlockwiseTime;\
@dynamic timeSecIntervalSinceDate;\
@dynamic startTime;\
@dynamic timeInterval;\
@dynamic repeats;\
@dynamic valid;\
@dynamic start;\
@dynamic running;\
@dynamic pause;\
@dynamic resume;\
@dynamic stop;\
@dynamic state;\
@dynamic timerType;\
@dynamic timerStyle;\
@dynamic timerCurrentStatus;\
@dynamic timerProcessType;\
@dynamic userContentCtrl;\
@dynamic scriptMsg;\
@dynamic handlerName;\
@dynamic evaluateJavaScript;\
@dynamic customUserAgent;\
@dynamic completionHandlerBlock;\
@dynamic urls;\
@dynamic url;\
@dynamic imageUrl;\
@dynamic internationalizationKEY;\
@dynamic jobsDataMutSet;\
@dynamic jobsDataMutArr;\
@dynamic jobsDataMutDic;\
@dynamic cls;\
@dynamic selector;\
@dynamic implementation;\
@dynamic target;\
@dynamic weak_target;\
@dynamic data;\
@dynamic data_weak;\
@dynamic requestParams;\
@dynamic modelData;\
@dynamic value_CGFloat;\
@dynamic value_NSInteger;\
@dynamic value_NSUInteger;\
@dynamic requestParams_weak;\

#endif /* BaseProtocol_dynamic */
