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

NS_ASSUME_NONNULL_BEGIN

@protocol BaseProtocol <NSObject>
@optional
@property(nonatomic,assign)BOOL isLock;
@property(nonatomic,strong)RACDisposable *racDisposable;
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

#endif

#pragma mark —— @dynamic BaseProtocol
#ifndef BaseProtocol_dynamic
#define BaseProtocol_dynamic \
\
@dynamic isLock;\
@dynamic racDisposable;\

#endif
