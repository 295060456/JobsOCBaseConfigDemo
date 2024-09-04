//
//  MacroDef_Notification.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#ifndef MacroDef_Notification_h
#define MacroDef_Notification_h
/**
    在多线程应用中，Notification在哪个线程中post，就在哪个线程中被转发，而不一定是在注册观察者的那个线程中
    也就是说Notification的发送与接收处理都是在同一个线程中
    【特别注意】
    1、对于全局性的通知，不建议在BaseView中监听，而是建议在具体的VC里面，哪怕是BaseVC里面去监听他。因为在BaseView上会崩溃
    2、如果在分类或者父类去实现监听方法，具体的子类就收不到消息
 */
/// 系统通知宏定义
#pragma mark —— 1、定义通知中心
#ifndef JobsNotificationCenter
#define JobsNotificationCenter NSNotificationCenter.defaultCenter
#endif

#pragma mark —— 2、发送通知
/// 2.1、不带参数的发送通知
#ifndef JobsPostNotification
#define JobsPostNotification(NotificationName,Obj)\
[JobsNotificationCenter postNotificationName:(NotificationName) object:(Obj)];
#endif
/// 2.2、带参数的发送通知
#ifndef JobsPostNotificationUserInfo
#define JobsPostNotificationUserInfo(NotificationName,Obj,UserInfo)\
[JobsNotificationCenter postNotificationName:(NotificationName) \
                                      object:(Obj) \
                                    userInfo:(UserInfo)];
#endif
/// 2.3、在主线程上发送通知【建议】
#ifndef JobsPostNotificationOnMainThread
#define JobsPostNotificationOnMainThread(NotificationName, Obj, UserInfo)\
dispatch_async(dispatch_get_main_queue(), ^{\
    JobsPostNotificationUserInfo(NotificationName,Obj,UserInfo);\
});
#endif

#pragma mark —— 3、监听通知
#ifndef JobsAddNotification
#define JobsAddNotification(Observer, SEL, NotificationName, Obj)\
[JobsNotificationCenter addObserver:(Observer) \
                        selector:(SEL) \
                        name:(NotificationName) \
                      object:(Obj)];
#endif

#pragma mark —— 4、销毁通知
#ifndef JobsRemoveNotification
#define JobsRemoveNotification(Object) [JobsNotificationCenter removeObserver:Object];
#endif

#ifndef JobsRemoveNotificationWith
#define JobsRemoveNotificationWith(Observer, NotificationName, Obj)\
[JobsNotificationCenter removeObserver:(Observer) \
                                  name:(NotificationName)\
                                object:(Obj)];
#endif

#endif /* MacroDef_Notification_h */
