# ArchitectureLoginDemos-OC

三套同一业务（登录页）的最小 Objective‑C 示例：**MVP / MVVM / VIPER**。附带一个表格列表入口。

## 目录
```
Common/                 // 公共实体与服务
MVP/                    // MVP Presenter + VC + 协议
MVVM/                   // MVVM ViewModel + VC
VIPER/                  // VIPER View/Interactor/Presenter/Router/Protocols
List/                   // DemoListViewController（入口列表）
```

## 接入步骤
1. 新建一个 iOS UIKit 工程（Objective‑C，iOS 13+）。
2. 把 `src/` 下所有文件拖进你的 Xcode Target。
3. 在 `AppDelegate` 中把根控制器换成列表：

```objective-c
#import "AppDelegate.h"
#import "List/DemoListViewController.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    DemoListViewController *listVC = [DemoListViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:listVC];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}
```

## 账号口令
- 用户名：`admin`
- 密码：`123456`
```
