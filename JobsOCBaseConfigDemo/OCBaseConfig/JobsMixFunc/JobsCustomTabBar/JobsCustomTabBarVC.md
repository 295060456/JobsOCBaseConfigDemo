# JobsCustomTabBarVC

[toc]

## 一个高仿系统的UITabBarController 

### 1、对于**`JobsCustomTabBarVC`**

- 对**TabBar 和TabBaritem的配置 是通过一个全局的单例配置文件来实现的，这个独立成一个文件，命名为JobsCustomTabBarConfig**
- **TabBarController命名为JobsCustom**TabBarVC,继承自系统的UITabBarController
- **TabBar命名为JobsCustomTabBar，是一个是一个UIView的子类，替换系统的TabBar**
- **TabBaritem命名为JobsCustomTabBaritem，是一个UIView的子类**

### 2、对于**`JobsCustomTabBar`**

- 可以自定义**JobsCustomTabBar的高度，高度数据从JobsCustomTabBarConfig的属性来**
- **可以自定义JobsCustomTabBar的背景为某种颜色 或者是 图片，颜色或者图片数据从JobsCustomTabBarConfig的属性来**
- **可以自定义每个JobsCustomTabBaritem的位置，如果没有配置则水平排布，且每个JobsCustomTabBaritem等间距排列，第一个JobsCustomTabBaritem距离JobsCustomTabBar左边和右边的距离，在不配置的情况下，默认是每个JobsCustomTabBaritem间距的一半。**
- **可以自定义每个JobsCustomTabBaritem相对于JobsCustomTabBar的y轴方向上的中线的偏移量。我要预防有些UI涉及要求某个要高一截**


### 3、对于**`JobsCustomTabBaritem`**

- **其实就是一个按钮，不需要做额外的处理**

### 使用方式

* ```objective-c
  #import "AppDelegate.h"
  #import "JobsCustomTabBarVC.h"
  #import "JobsCustomTabBarConfig.h"
  #import "JobsCustomTabBaritem.h"
  
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
      
      JobsCustomTabBaritem *item1 = [[JobsCustomTabBaritem alloc] init];
      [item1.button setTitle:@"First" forState:UIControlStateNormal];
      item1.button.backgroundColor = [UIColor redColor];
      
      JobsCustomTabBaritem *item2 = [[JobsCustomTabBaritem alloc] init];
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