# `JobsTabBarCtrl`-<font color=red>**深层次自定义`UITabbar`**</font>

[toc]

## 背景介绍

* 完全继承自系统Api，最大化兼容系统特色
* 扩展系统的一些方法，丰富使用

## 功能介绍

* 支持 `Tabbaritem` 在居中对齐的大前提下，图文相对位置的4个方向适配
* 自定义 `UITabBar`
* 支持单例模式
* 导航控制器包裹每一个子控制器，使得每一个子控制器具备`push`到其他控制器的能力
* 支持手势滑动切换子控制器。（等效于： `- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item`切换挂载的子控制器 ）
* 支持对某一特定的`Tabbaritem`向上凸起
* 支持自定义 `UITabBar`的高度
* `Tabbaritem`事件触发
  * 支持长按手势
    * 长按手势出菜单（高仿 **Telegram**）
  * 一些动画效果（比如：图片从小放大）
  * 点击震动
  * 点击声音
  * 支持`lottie`动画
  * 支持`PPBadgeView`
  * 支持强行自检跳转登录模块

## 一、`JobsTabBarCtrlConfig`

* 对`JobsTabBarCtrl`的全局配置文件
* 是一个继承自`NSObject`的**model**

## 二、 `JobsTabbarVC`

* 相关继承树： **`JobsTabbarVC`** : **`UITabBarController`**：**`UIViewController <UITabBarDelegate, NSCoding>`**

### 1、对横屏的适配

```objective-c
#pragma mark —— 在 UITabBarController 中适配横屏在 UITabBarController 中适配横屏
/// 决定当前界面是否开启自动转屏，如果返回NO，后面两个方法也不会被调用，只是会支持默认的方向
- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}
/// 当前控制器支持的屏幕旋转方向（在具体的控制器子类进行覆写）
/// iPad设备上，默认返回值UIInterfaceOrientationMaskAllButUpSideDwon
/// iPhone设备上，默认返回值是UIInterfaceOrientationMaskAll
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}
/// 设置进入界面默认支持的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [super preferredInterfaceOrientationForPresentation];
}
```

### 2、监听`TabBarItem`点击事件

```objective-c
#pragma mark —— UITabBarDelegate
/// 监听TabBarItem点击事件
- (void)tabBar:(UITabBar *)tabBar
 didSelectItem:(UITabBarItem *)item {
    if ([tabBar.items containsObject:item]) {
        NSUInteger index = [self.tabBar.items indexOfObject:item];
        NSLog(@"当前点击：%ld",(long)index);
        for (NSNumber *indexNUM in self.jumpIndexArr) {
            if (indexNUM.unsignedIntegerValue != index) {
                if (![self forcedLoginIndex:index]) {
                    /// 不需要进行强制登录的时候，才重新赋值刷新self.selectedIndex
                    self.selectedIndex = index;
                }
            }
        }
        // Lottie 动画
        if ([self judgeLottieWithIndex:self.selectedIndex]) {
            [self.tabBar animationLottieImage:(int)index];
        }
        // 震动反馈
        if (self.isFeedbackGenerator) {
            [self feedbackGenerator];
        }
        // 点击声音
        if (self.isPlaySound) {
            [self playSoundWithFileName:@"Sound.wav"];
        }
        // 重力弹跳动画效果
        if (self.isShakerAnimation) {
            [item.badgeView shakerAnimationWithDuration:2 height:20];
        }
        // 点击增加标数
        if (self.isOpenPPBadge) {
            [item pp_increase];
        }
        // 图片从小放大
        if (self.isAnimationAlert) {
            [self.UITabBarButtonMutArr[index] animationAlert];
        }
    }
}
```

```objective-c
/**
 【点击TabBarItem进行切换】return YES可以切换 | return NO 不可切换
 
 【调用先后次序】
    ①- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item；
 
    ②- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController；
 
 【📢注意】在①中，如果对self.selectedIndex进行修改，那么在②中，设置返回值为NO无效
 */
- (BOOL)tabBarController:(UITabBarController *)tabBarController
shouldSelectViewController:(UIViewController *)viewController {

    NSInteger index = [self.childVCMutArr indexOfObject:viewController];
    
    if ([viewController isKindOfClass:UIViewController.class] &&
        [self judgeLottieWithIndex:index]) {
        [viewController lottieImagePlay];
    }
    
    if (self.returnObjectBlock) A = [self.returnObjectBlock(@(index)) boolValue];
    return [self forcedLoginIndex:index] ? (A && self.isLogin) : A;
}
```

### 3、<font color=red>对系统的 `UITabBar` 通过**KVC**的方式替换为自定义的 `JobsTabBar`</font>

```
@property(nonatomic,strong,readonly)JobsTabBar *myTabBar;/// myTabBar.humpOffsetY 凸起的高度自定义，默认值30  offsetHeight
```

```objective-c
-(JobsTabBar *)myTabBar{
    if (!_myTabBar) {
        _myTabBar = JobsTabBar.new;
        _myTabBar.tabBarControllerConfigMutArr = self.tabBarControllerConfigMutArr;
        _myTabBar.alignmentType = ImageTopTitleBottom;
        [_myTabBar richElementsInViewWithModel:self.viewModel];
        self.jobsKVC(@"tabBar",_myTabBar);/// KVC 进行替换
    }return _myTabBar;
}
```

### 4、挂载子控制器

```objective-c
@property(nonatomic,strong)NSMutableArray <UIViewController *>*childVCMutArr;/// 子控制器
```

此才会有 **self.tabBar**

```objective-c
self.viewControllers = self.childVCMutArr;
```

```objective-c
-(NSMutableArray<UIViewController *> *)childVCMutArr{
    if (!_childVCMutArr) {
        _childVCMutArr = NSMutableArray.array;
    }return _childVCMutArr;
}
```

###  5、用导航控制器包裹每一个控制器。<font color=red>**使其每个控制器都具备`push`到其他控制器的功能**</font>

```objective-c
if (![viewController isKindOfClass:UINavigationController.class]) {/// 防止UIImagePickerController崩
    BaseNavigationVC *nav = [BaseNavigationVC.alloc initWithRootViewController:viewController];
    nav.title = config.title;
    [self.childVCMutArr replaceObjectAtIndex:i withObject:nav];/// 替换元素，每个VC加Navigation
}
```

### 6、滑动手势切换子控制器

```objective-c
/// 关闭手势
-(void)closePan{
    self.view.panGR.enabled = NO;
}
/// 打开手势
-(void)openPan{
    self.view.numberOfTouchesRequired = 1;
    self.view.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
    self.view.minimumPressDuration = 0.1;
    self.view.numberOfTouchesRequired = 1;
    self.view.allowableMovement = 1;
    self.view.userInteractionEnabled = YES;
    self.view.target = self;
    @jobs_weakify(self)
    self.view.panGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable target,
                                                                            UIPanGestureRecognizer *_Nullable pan) {
        @jobs_strongify(self)
        if (self.transitionCoordinator) return nil;
        if (pan.state == UIGestureRecognizerStateBegan ||
            pan.state == UIGestureRecognizerStateChanged){
            [self beginInteractiveTransitionIfPossible:pan];
        }return nil;
    }];
    self.view.panGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
}
```

```objective-c
- (id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController
                     interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    if (self.view.panGR.state == UIGestureRecognizerStateBegan ||
        self.view.panGR.state == UIGestureRecognizerStateChanged) {
        return [TransitionController.alloc initWithGestureRecognizer:self.view.panGR];
    }else {
        return nil;
    }
}
```

### 7、长按手势

```objective-c
-(void)添加长按手势{
    for (UIView *subView in self.UITabBarButtonMutArr) {
        subView.tag = [self.UITabBarButtonMutArr indexOfObject:subView];
        
        subView.numberOfTouchesRequired = 1;
        subView.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
        subView.minimumPressDuration = 0.1;
        subView.numberOfTouchesRequired = 1;
        subView.allowableMovement = 1;
        subView.userInteractionEnabled = YES;
        subView.target = self;
        subView.longPressGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                                    UILongPressGestureRecognizer *_Nullable longPressGR) {
            if(self.gestureRecognizerBlock) self.gestureRecognizerBlock(longPressGR);
            switch (longPressGR.state) {
                case UIGestureRecognizerStatePossible:{
                    NSLog(@"没有触摸事件发生，所有手势识别的默认状态");
                }break;
                case UIGestureRecognizerStateBegan:{
                    if (self.isFeedbackGenerator) {
                        [self feedbackGenerator];/// 震动反馈
                    }
                    /// 长按手势出菜单（高仿 Telegram）
                    [JobsPullListAutoSizeView initWithTargetView:self.UITabBarButtonMutArr[longPressGR.view.tag]
                                                      dataMutArr:self.pullListAutoSizeViewMutArr];
                    NSLog(@"一个手势已经开始  但尚未改变或者完成时");
                }break;
                case UIGestureRecognizerStateChanged:{
                    NSLog(@"手势状态改变");
                }break;
                case UIGestureRecognizerStateEnded:{// = UIGestureRecognizerStateRecognized
                    NSLog(@"手势完成");
                }break;
                case UIGestureRecognizerStateCancelled:{
                    NSLog(@"手势取消，恢复至Possible状态");
                }break;
                case UIGestureRecognizerStateFailed:{
                    NSLog(@"手势失败，恢复至Possible状态");
                }break;
                default:
                    break;
            }return nil;
        }];
        subView.longPressGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
    }
}
```

### 8、支持[**`PPBadgeView`**](https://github.com/jkpang/PPBadgeView)：`TabBarItem`计数小红点

```ruby
pod 'PPBadgeView' # https://github.com/jkpang/PPBadgeView iOS自定义Badge组件, 支持UIView, UITabBarItem, UIBarButtonItem以及子类NO_SMP
```

```objective-c
/// 开启/关闭 PPBadgeView的效果,至少在viewDidLayoutSubviews后有效
-(void)ppBadge:(BOOL)open{
    self.isOpenPPBadge = open;
    if (open) {
        for (UITabBarItem *item in self.tabBar.items) {
            if ([item.title isEqualToString:@"首页"]) {
                [item pp_addBadgeWithText:@"919+"];
#pragma mark —— 动画
                [item.badgeView animationAlert];//图片从小放大
                [item.badgeView shakerAnimationWithDuration:2 height:20];//重力弹跳动画效果
    //            [UIView 视图上下一直来回跳动的动画:item.badgeView];
            }
        }
    }
}
```

点击增加标数

```objective-c
if (self.isOpenPPBadge) {
   [item pp_increase];
}
```

### 9、至少在`-(void)viewWillAppear:(BOOL)animated`以后的生命周期，实现：

```objective-c
if (config.humpOffsetY != 0) {
    //一般的图片
    /// 修改图片偏移量，上下，左右必须为相反数，否则图片会被压缩
    viewController.tabBarItem.imageInsets = UIEdgeInsetsMake(-config.humpOffsetY,
                                                             0,
                                                             -config.humpOffsetY / 2,
                                                             0);
    /// 修改文字偏移量
    viewController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, 0);/// titlePositionAdjustment是图文间距
}
```

### 10、防止多次加载UI的特殊处理

```objective-c
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    @jobs_weakify(self)
    static dispatch_once_t JobsTabbarVC_viewWillAppear_onceToken;
    dispatch_once(&JobsTabbarVC_viewWillAppear_onceToken, ^{
        @jobs_strongify(self)
				/// TODO
    });
}
```

### 11、防止当子控制器为`UIImagePickerController` 引起的崩溃

```objective-c
UIViewController *viewController = self.childVCMutArr[i];
if (![viewController isKindOfClass:UINavigationController.class]) {/// 防止UIImagePickerController崩
    BaseNavigationVC *nav = [BaseNavigationVC.alloc initWithRootViewController:viewController];
    nav.title = config.title;
    [self.childVCMutArr replaceObjectAtIndex:i withObject:nav];/// 替换元素，每个VC加Navigation
}
```

### 12、强行自检跳转登录模块

```objective-c
@property(nonatomic,strong)NSArray <NSNumber *>*jumpIndexArr;/// 需要跳开的item
@property(nonatomic,strong)NSArray <NSNumber *>*needLoginArr;/// 在某些页面强制弹出登录
@property(nonatomic,strong)NSArray <NSNumber *>*noNeedLoginArr;/// 在某些页面不需要弹出登录，其优先级高于needLoginArr（也就是item点了没反应）
```

```objective-c
TabBarVC.jumpIndexArr = @[@3];//小标为3的客服模块需要被跳开做另行处理
TabBarVC.needLoginArr = @[@1,@2,@4];
TabBarVC.noNeedLoginArr = @[@0];// 在某些页面不需要弹出登录，其优先级高于needLoginArr
```

```objective-c
/// 需要强制跳转登录的index。点击和手势滑动都需要共同调用
-(BOOL)forcedLoginIndex:(NSUInteger)index{
    if ([self.needLoginArr containsObject:@(index)]) {
        [self forcedLogin];
        return YES;
    }return NO;
}
```

### 13、支持**`Lottie`**动画

* 关注实现类：[**@interface UIViewController (Lottie)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/UIViewController+Category/UIViewController+Others/UIViewController+Lottie)

  ```objective-c
  if ([self judgeLottieWithIndex:i]) {
      [self addLottieImage:config.lottieName];// 有Lottie动画名，则优先创建Lottie动画
  }
  ```

## 三、`JobsTabBar`

* 相关继承树： **`JobsTabBar`** : **`UITabBar`**：**`UIView`**

### 1、对`UITabBarItem`上的图文位置有约束作用。在居中对齐的大前提下

  ```objective-c
  #ifndef ALIGNMENT_TYPE_ENUM_DEFINED
  #define ALIGNMENT_TYPE_ENUM_DEFINED
  typedef NS_ENUM(NSInteger, AlignmentType) {
      ImageLeftTitleRight,/// 图左，文字右
      ImageRightTitleLeft,/// 图右，文字左
      ImageTopTitleBottom,/// 图上，文字下
      ImageBottomTitleTop /// 图下，文字上
  };
  #endif /* ALIGNMENT_TYPE_ENUM_DEFINED */
  ```

### 2、自定义 **TabBar** 的高度（适配横屏模式）

```objective-c
///【覆写父类方法】自定义 TabBar 的高度
- (CGSize)sizeThatFits:(CGSize)size {
    return [self checkScreenOrientation_UIInterfaceOrientation:^CGSize(UIInterfaceOrientation data) {
        switch (data) {
            case UIInterfaceOrientationPortraitUpsideDown:/// 倒竖屏方向
            case UIInterfaceOrientationPortrait:{ /// 竖屏方向
                    return [super sizeThatFits:size];
            }break;
            case UIInterfaceOrientationLandscapeLeft:/// 左横屏方向
            case UIInterfaceOrientationLandscapeRight:{ /// 右横屏方向
                    CGSize newSize = [super sizeThatFits:size];
                    newSize.height = JobsWidth(80); /// 设定你想要的高度
                    return newSize;
                }
            default:
                return [super sizeThatFits:size];
                break;
        }
    }];
}
```

### 3、获取 **TabBar** 的图片和文字，首先是需通过获取内部类`UITabBarButton`开始

可以对每个 **TabBaritem** 的位置做调整

```objective-c
 - (void)layoutSubviews {
     [super layoutSubviews];
     NSMutableArray<UIView *> *tabBarButtons = NSMutableArray.array;
     for (UIView *subview in self.subviews) {
         if ([subview isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
 //            subview.backgroundColor = JobsRandomColor; 
             [tabBarButtons addObject:subview];
             
             UILabel *label = nil; /// TabBar的文字
             UIImageView *imageView = nil; /// TabBar的图片
             
             for (UIView *subSubview in subview.subviews) {
                 if ([subSubview isKindOfClass:[UILabel class]]) {
                     label = (UILabel *)subSubview;
                     label.backgroundColor = JobsRedColor; 
                     [label sizeToFit];
                 }
                 
                 if ([subSubview isKindOfClass:[UIImageView class]]) {
                     imageView = (UIImageView *)subSubview;
                 }
             }
 
             [self layoutIfNeeded];
             if (label && imageView) {
                 [self alignLabel:label imageView:imageView inTabBarButton:subview];
             }
         }
     }   
     CGFloat s = 0.f;
     for (int t = 0; t < self.tabBarControllerConfigMutArr.count ; t++) {
         JobsTabBarCtrlConfig *tabBarControllerConfig = self.tabBarControllerConfigMutArr[t];
         UIView *tabBarButton = tabBarButtons[t];
         if (t) {
             tabBarButton.resetOriginX(s + tabBarControllerConfig.xOffset);
         }else{
             tabBarButton.resetOriginX(tabBarControllerConfig.xOffset);
         }
         
         s += (tabBarControllerConfig.xOffset + tabBarControllerConfig.tabBarItemWidth);
         tabBarButton.resetWidth(tabBarControllerConfig.tabBarItemWidth);
     }
 }
```

## 四、`JobsTabBarItem`

* 相关继承树：**`JobsTabBarItem`** ： **`UITabBarItem`**：**`UIBarItem`**：**` NSObject <NSCoding, UIAppearance>`** 
* 其本质只是挂载到`UITabBar`的一个配置文件，<font color=red>**不是View**</font>

## 五、附加的功能性

* [**功能性动效：手势横向滚动子`VC`联动`Tabbar`切换**](https://github.com/cdcyd/CommonControlsCollection)

* [**功能性动效：Tabbaritem的点击动效**](https://github.com/295060456/TLAnimationTabBar)

* [**功能性动效：高仿 `Telegram`，在指定位置出现菜单列表**]()

* 长按手势出菜单（高仿 **Telegram**）

  * ```objective-c
    /// 长按手势出菜单（高仿 Telegram）
    [JobsPullListAutoSizeView initWithTargetView:self.UITabBarButtonMutArr[longPressGR.view.tag]
                                      dataMutArr:self.pullListAutoSizeViewMutArr];
    ```

  * ```objective-c
    -(NSMutableArray<UIViewModel *> *)pullListAutoSizeViewMutArr{
        if (!_pullListAutoSizeViewMutArr) {
            _pullListAutoSizeViewMutArr = NSMutableArray.array;
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.image = JobsIMG(JobsInternationalization(@""));
                viewModel.textModel.text = JobsInternationalization(@"111");
                [_pullListAutoSizeViewMutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.image = JobsIMG(JobsInternationalization(@""));
                viewModel.textModel.text = JobsInternationalization(@"222");
                [_pullListAutoSizeViewMutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.image = JobsIMG(JobsInternationalization(@""));
                viewModel.textModel.text = JobsInternationalization(@"333");
                [_pullListAutoSizeViewMutArr addObject:viewModel];
            }
            
        }return _pullListAutoSizeViewMutArr;
    }
    ```

### 六、使用

```objective-c
self.configMutArr = self.makeConfigMutArr;
_window.rootViewController = RootViewController;
```

* **@implementation AppDelegate**

  ```objective-c
  -(NSMutableArray <JobsTabBarCtrlConfig *>*)makeConfigMutArr{
      NSMutableArray *ConfigMutArr = NSMutableArray.array;
      {
          JobsTabBarCtrlConfig *config = JobsTabBarCtrlConfig.new;
          config.vc = ViewController_1.new;
          config.title = JobsInternationalization(@"首页");
          config.imageSelected = JobsIMG(@"tabbbar_home_seleteds");
          config.imageUnselected = JobsIMG(@"tabbbar_home_normal");
          config.humpOffsetY = 0;
          config.lottieName = nil;
          config.xOffset = JobsWidth(200);
          config.tabBarItemWidth = JobsWidth(100);
          config.spacing = JobsWidth(3);
          config.tag = ConfigMutArr.count + 1;
          [ConfigMutArr addObject:config];
      }
      
      {
          JobsTabBarCtrlConfig *config = JobsTabBarCtrlConfig.new;
          config.vc = ViewController_2.new;
          config.title = JobsInternationalization(@"洗码");
          config.imageSelected = JobsIMG(@"tabbbar_weights_seleteds");
          config.imageUnselected = JobsIMG(@"tabbbar_weights_normal");
          config.humpOffsetY = 0;
          config.lottieName = nil;
          config.xOffset = JobsWidth(5);
          config.tabBarItemWidth = JobsWidth(100);
          config.spacing = JobsWidth(3);
          config.tag = ConfigMutArr.count + 1;
          [ConfigMutArr addObject:config];
      }
      
      {
          JobsTabBarCtrlConfig *config = JobsTabBarCtrlConfig.new;
          config.vc = ViewController_3.new;
          config.title = JobsInternationalization(@"充值");
          config.imageSelected = JobsIMG(@"tabbbar_pay_seleteds");
          config.imageUnselected = JobsIMG(@"tabbbar_pay_normal");
          config.humpOffsetY = 0;
          config.lottieName = nil;
          config.xOffset = JobsWidth(5);
          config.tabBarItemWidth = JobsWidth(50);
          config.spacing = JobsWidth(3);
          config.tag = ConfigMutArr.count + 1;
          [ConfigMutArr addObject:config];
      }
      
      {
          JobsTabBarCtrlConfig *config = JobsTabBarCtrlConfig.new;
          config.vc = ViewController_4.new;
          config.title = JobsInternationalization(@"客服");
          config.imageSelected = JobsIMG(@"tabbbar_service_seleteds");
          config.imageUnselected = JobsIMG(@"tabbbar_service_normal");
          config.humpOffsetY = 0;
          config.lottieName = nil;
          config.xOffset = JobsWidth(5);
          config.tabBarItemWidth = JobsWidth(50);
          config.spacing = JobsWidth(3);
          config.tag = ConfigMutArr.count + 1;
          [ConfigMutArr addObject:config];
      }
      
      {
          JobsTabBarCtrlConfig *config = JobsTabBarCtrlConfig.new;
          config.vc = ViewController_5.new;
          config.title = JobsInternationalization(@"会员中心");
          config.imageSelected = JobsIMG(@"tabbar_VIP_seleteds");
          config.imageUnselected = JobsIMG(@"tabbar_VIP_normal");
          config.humpOffsetY = 0;
          config.lottieName = nil;
          config.xOffset = JobsWidth(5);
          config.tabBarItemWidth = JobsWidth(100);
          config.tag = ConfigMutArr.count + 1;
          [ConfigMutArr addObject:config];
      }
      
      return ConfigMutArr;
  }
  ```

* **@implementation AppDelegate (Extra)**

  ```objective-c
  @property(nonatomic,strong)JobsTabbarVC *tabBarVC;
  ```

  ```objective-c
  /// UITabBarController 配置数据：子VC、Tabbaritem标题
  -(void)dataWithTabBarVC:(UITabBarController <UITabbarConfigProtocol>*)tabBarVC{
      for (JobsTabBarCtrlConfig *config in self.configMutArr) {
          [tabBarVC.tabBarControllerConfigMutArr addObject:config];
          [tabBarVC.childVCMutArr addObject:config.vc];
          [self.tabBarTitleMutArr addObject:config.title];
      }
  }
  ```

* 分类挂载

  ```objective-c
  #define RootViewController appDelegate.tabBarVC
  ```

  ```objective-c
  #pragma mark —— @property(nonatomic,strong)JobsTabbarVC *tabBarVC;
  JobsKey(_tabBarVC)
  @dynamic tabBarVC;
  -(JobsTabbarVC *)tabBarVC{
      JobsTabbarVC *TabBarVC = Jobs_getAssociatedObject(_tabBarVC);
      if (!TabBarVC) {
          TabBarVC = JobsTabbarVC.new;
          TabBarVC.isAnimationAlert = YES;//OK
          TabBarVC.isPlaySound = YES;
          TabBarVC.isFeedbackGenerator = YES;
          
          TabBarVC.jumpIndexArr = @[@3];//小标为3的客服模块需要被跳开做另行处理
          TabBarVC.needLoginArr = @[@1,@2,@4];
          TabBarVC.noNeedLoginArr = @[@0];// 在某些页面不需要弹出登录，其优先级高于needLoginArr
          
  //        TabBarVC.isShakerAnimation = YES;
          TabBarVC.isOpenScrollTabbar = NO;
  
          [self dataWithTabBarVC:TabBarVC];
          
          [TabBarVC actionReturnObjectBlock:^id(id data) {
              if ([data isKindOfClass:NSNumber.class]) {
                  NSNumber *num = (NSNumber *)data;
                  
                  BOOL ok = NO;
                  for (NSNumber *number in self.tabBarVC.jumpIndexArr) {
                      if (num.unsignedIntegerValue == number.unsignedIntegerValue) {
                          ok = YES;
                          break;
                      }
                  }
                  if (ok) {
  //                    if (self.customerContactModel.customerList.count) {
  //                        /// 单例模式防止重复添加
  //                        CasinoCustomerServiceView *customerServiceView = CasinoCustomerServiceView.sharedInstance;
  //                        [customerServiceView actionObjectBlock:^(id data) {
  //                            [customerServiceView tf_hide];
  //                        }];
  //                        customerServiceView.size = [CasinoCustomerServiceView viewSizeWithModel:self.hotLabelDataMutArr];
  //                        [customerServiceView richElementsInViewWithModel:self.hotLabelDataMutArr];
  //                        [customerServiceView tf_showSlide:jobsGetMainWindow()
  //                                                direction:PopupDirectionBottom
  //                                               popupParam:self.appDelegatePopupParameter];
  //                    }
                  }return @(!ok);
              }return @(YES);
          }];
          Jobs_setAssociatedRETAIN_NONATOMIC(_tabBarVC, TabBarVC);
      }return TabBarVC;
  }
  
  -(void)setTabBarVC:(JobsTabbarVC *)tabBarVC{
      Jobs_setAssociatedRETAIN_NONATOMIC(_tabBarVC, tabBarVC);
  }
  ```



