# JobsCustomTabBarVC

[toc]

## 一个高仿系统的UITabBarController 

### 1、对于**`JobsCustomTabBarVC`**

- 对 **`TabBar`** 和 **`TabBaritem`** 的配置 是通过一个全局的单例配置文件来实现的，这个独立成一个文件，命名为**JobsCustomTabBarConfig**
- <font color=red>**`TabBarController`** 命名为 **`JobsCustomTabBarVC`**</font>，继承自系统的 **`UITabBarController`**
- <font color=red>**`TabBar`**命名为 **`JobsCustomTabBar`**</font>，是一个是一个UIView的子类。替换系统的 **`TabBar`**
- <font color=red>**`TabBaritem`** 命名为 **`JobsCustomTabBarButton`**</font>，是一个UIView的子类

### 2、对于**`JobsCustomTabBar`**

- 允许自定义**`JobsCustomTabBar`**的高度，高度数据从**`JobsCustomTabBarConfig`**的属性来
- 允许自定义**`JobsCustomTabBar`**的背景为某种颜色 或者是 图片，颜色或者图片数据从**`JobsCustomTabBarConfig`**的属性来
- 可以自定义每个**`JobsCustomTabBarButton`**的位置，如果没有配置则水平排布，且每个**`JobsCustomTabBarButton`**等间距排列，第一个**`JobsCustomTabBarButton`**距离**`JobsCustomTabBar`**左边和右边的距离，在不配置的情况下，默认是每个**`JobsCustomTabBarButton`**间距的一半。
- 允许自定义每个**`JobsCustomTabBarButton`**相对于**`JobsCustomTabBar`**的y轴方向上的中线的偏移量。要预防有些UI涉及要求某个要高一截


### 3、对于**`JobsCustomTabBarButton`**

- **其实就是一个按钮，不需要做额外的处理**
- <font color=red>**实际描述的是系统的`UITabBarButton`，更加符合国人思维习惯**</font>
- <u>系统的`UITabBarController`里面的`UITabBarButton`是作为内部私有类进行处理，所以很麻烦</u>

### 使用方式

* ```objective-c
  #import "AppDelegate.h"
  #import "JobsCustomTabBarVC.h"
  #import "JobsCustomTabBarConfig.h"
  #import "JobsCustomTabBarButton.h"
  
  @interface ViewController : UIViewController
  @end
  
  @implementation ViewController
  @end
  
  @interface AppDelegate ()
  @end
  
  @implementation AppDelegate
  
  - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
      UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
      self.window = window;
      
      JobsCustomTabBarVC *tabBarVC = [[JobsCustomTabBarVC alloc] init];
      
      ViewController *firstVC = [[ViewController alloc] init];
      firstVC.view.backgroundColor = [UIColor redColor];
      firstVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"First" image:nil tag:0];
      
      ViewController *secondVC = [[ViewController alloc] init];
      secondVC.view.backgroundColor = [UIColor blueColor];
      secondVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Second" image:nil tag:1];
      
      tabBarVC.viewControllers = @[firstVC, secondVC];
      
      JobsCustomTabBarButton *item1 = [[JobsCustomTabBarButton alloc] init];
      [item1.button setTitle:@"First" forState:UIControlStateNormal];
      item1.button.backgroundColor = [UIColor redColor];
      
      JobsCustomTabBarButton *item2 = [[JobsCustomTabBarButton alloc] init];
      [item2.button setTitle:@"Second" forState:UIControlStateNormal];
      item2.button.backgroundColor = [UIColor blueColor];
      
      JobsCustomTabBarConfig *config = [JobsCustomTabBarConfig sharedConfig];
      config.tabBarItems = @[item1, item2];
      
      window.rootViewController = tabBarVC;
      [window makeKeyAndVisible];
      
      return YES;
  }
  
  @end
  ```