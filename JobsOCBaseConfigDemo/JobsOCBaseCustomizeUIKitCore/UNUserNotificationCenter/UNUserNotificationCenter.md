# `UNUserNotificationCenter`

## 1、引入头文件

```objective-c
#import <UserNotifications/UserNotifications.h>
```

* 这个框架是 Apple 提供的，用于处理通知（包括本地通知和远程推送通知）的功能。
* 它引入了一套现代化的 API，用来替代较早的 `UILocalNotification` 和旧的远程推送通知机制。

## 2、本地通知和远程通知的统一处理

* `UserNotifications` 框架统一了本地通知和远程通知的处理接口，简化了开发过程。
  你需要导入它才能使用以下类和功能：
  - `UNUserNotificationCenter`：通知中心，管理所有通知的调度和交互。
  - `UNNotificationRequest`：用于创建一个通知请求。
  - `UNNotificationContent`：定义通知的内容（如标题、正文、声音、附件等）。
  - `UNNotificationTrigger`：定义通知触发条件（时间、位置等）。

## 3、请求通知权限

```objective-c
#import <UserNotifications/UserNotifications.h>

UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
[center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge)
                      completionHandler:^(BOOL granted, NSError * _Nullable error) {
    if (granted) {
        NSLog(@"用户授权了通知权限");
    } else {
        NSLog(@"用户拒绝了通知权限");
    }
}];
```

## 4、发送本地通知

```objective-c
// 创建通知内容
UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
content.title = @"通知标题";
content.body = @"这是通知的正文内容";
content.sound = [UNNotificationSound defaultSound];

// 设置触发条件（5秒后触发）
UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];

// 创建通知请求
UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"testNotification" content:content trigger:trigger];

// 添加通知请求到通知中心
[[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
    if (!error) {
        NSLog(@"本地通知已调度");
    }
}];
```

## 5、处理通知的交互：实现 `UNUserNotificationCenterDelegate` 协议

```objective-c
- (void)userNotificationCenter:(UNUserNotificationCenter *)center 
       willPresentNotification:(UNNotification *)notification 
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    NSLog(@"接收到通知：%@", notification.request.content.userInfo);
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound);
}
```

## 6、附加功能

* **通知的附件**：可以在通知中添加图片、视频或音频等附件。
* **通知操作按钮**：允许用户直接在通知中执行某些操作，比如回复消息或标记完成。
