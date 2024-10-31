//
//  BaseProtocol.h
//  Casino
//
//  Created by Jobs on 2021/12/7.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefineAllEnumHeader.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

@class UIViewModel;

NS_ASSUME_NONNULL_BEGIN

@protocol BaseProtocol <YTKChainRequestDelegate>
@optional
@property(nonatomic,assign)BOOL isLock;
@property(nonatomic,strong)RACDisposable *racDisposable;
#pragma mark —— Data
@property(nonatomic,assign)AppLanguage appLanguage;
@property(nonatomic,strong,nullable)NSString *internationalizationKEY;/// 国际化的key
@property(nonatomic,strong,nullable)NSMutableSet *jobsDataMutSet;/// 绑定的数据源，数据类型NSMutableSet
@property(nonatomic,strong,nullable)NSMutableArray *jobsDataMutArr;/// 绑定的数据源，数据类型NSMutableArray
@property(nonatomic,strong,nullable)NSMutableArray <UIViewModel *> *viewModelMutArr;
@property(nonatomic,strong,nullable)NSMutableDictionary *jobsDataMutDic;/// 绑定的数据源，数据类型NSMutableDictionary
@property(nonatomic,strong,nullable)Class cls;/// 绑定的class
@property(nonatomic,strong,nullable)RACSignal *reqSignal;
/// 强引用数据源
@property(nonatomic,strong,nullable)id data;/// 【强引用】绑定的数据源，数据类型id
@property(nonatomic,strong,nullable)id requestParams;/// 【强引用】绑定的数据源，数据类型id
@property(nonatomic,strong,nullable)UIViewModel *viewModel;
/// 弱引用数据源
@property(nonatomic,weak,nullable)id data_weak;/// 【弱引用】绑定的数据源，数据类型id
@property(nonatomic,weak,nullable)id requestParams_weak;/// 【弱引用】绑定的数据源，数据类型id
@property(nonatomic,weak,nullable)UIViewModel *viewModel_weak;
@property(nonatomic,strong)NSURL *url;
-(void)languageSwitchNotificationWithSelector:(SEL)aSelector;//在View上,target = self（view）,省略
/// 更改UITabBarItem的标题
-(void)changeTabBarItemTitle:(NSIndexPath *)indexPath;//NSObject (AppTools)
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
+(void)target:(id)target languageSwitchNotificationWithSelector:(SEL)aSelector;//NSObject (AppTools)
///【监听通知】设置App语言环境
-(void)monitorAppLanguage;//NSObject (Notification)
///【发通知】设置App语言环境
-(void)setAppLanguageAtAppLanguage:(AppLanguage)appLanguage;
/// 接收通知并相应的方法【在分类或者基类中实现会屏蔽具体子类的相关实现】
-(void)JobsLanguageSwitchNotification:(nonnull NSNotification *)notification;//在具体子类进行实现
#pragma mark —— 单例化和销毁
+(void)destroySingleton;
+(instancetype)sharedManager;
+(JobsReturnIDByVoidBlock _Nonnull)SharedInstance;
+(jobsByVoidBlock _Nonnull)DestroySingleton;

@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize BaseProtocol isLock
#ifndef BaseProtocol_synthesize
#define BaseProtocol_synthesize \
\
@synthesize isLock = isLock;\
@synthesize racDisposable = racDisposable;\
@synthesize appLanguage = _appLanguage;\
@synthesize internationalizationKEY = _internationalizationKEY;\
@synthesize jobsDataMutSet = _jobsDataMutSet;\
@synthesize jobsDataMutArr = _jobsDataMutArr;\
@synthesize viewModelMutArr = _viewModelMutArr;\
@synthesize jobsDataMutDic = _jobsDataMutDic;\
@synthesize cls = _cls;\
@synthesize reqSignal = _reqSignal;\
@synthesize data = _data;\
@synthesize data_weak = _data_weak;\
@synthesize requestParams = _requestParams;\
@synthesize requestParams_weak = _requestParams_weak;\
@synthesize viewModel = _viewModel;\
@synthesize viewModel_weak = _viewModel_weak;\
@synthesize url = _url;\

#endif

#pragma mark —— @dynamic BaseProtocol
#ifndef BaseProtocol_dynamic
#define BaseProtocol_dynamic \
\
@dynamic isLock;\
@dynamic racDisposable;\
@dynamic appLanguage;\
@dynamic internationalizationKEY;\
@dynamic jobsDataMutSet;\
@dynamic jobsDataMutArr;\
@dynamic viewModelMutArr;\
@dynamic jobsDataMutDic;\
@dynamic cls;\
@dynamic reqSignal;\
@dynamic data;\
@dynamic requestParams;\
@dynamic viewModel;\
@dynamic data_weak;\
@dynamic requestParams_weak;\
@dynamic viewModel_weak;\
@dynamic url;\

#endif
