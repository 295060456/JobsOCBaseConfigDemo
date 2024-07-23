# 自定义 UITabBarController

[toc]

## 一、<font id=相关目录结构>相关目录结构</font>

* <font color=red>`JobsTabBarVC`</font>：**`UITabBarController`**
  * `JobsTabBarItemConfig`：**`NSObject`**
  * **UITabBarItem**
    * `JobsTabBarItem`：**`UITabBarItem`**
    * `UITabBarItem+TLAnimation`
  * **UITabBar**
    * `UITabBar+Ex`
    * `UITabBar+TLAnimation`
    * `JobsTabBar`：**`UITabBar`**
* <font color =red>`JobsCustomTabBarVC`</font>：**`UITabBarController`**
  * `JobsCustomTabBarConfig`：**`NSObject`**
  * `JobsCustomTabBar`：**`UIView`**
  * `JobsCustomTabBarButton`：**`UIButton`**
* <font color=red>`LZTabBarController`</font>：**`UITabBarController`**
  * `LZTabBar`：**`UIView`**
  * `LZTabBarConfig` ：**`NSObject`**
  * `LZTabBarItem`：**`UIView`**

## 二、拓展系统TabBarVC <a href="#相关目录结构" style="font-size:17px; color:green;"><b>回到顶部</b></a>

### 1、<font color=red>`JobsTabBarVC`</font>

* 产生背景
  * 在极大的拥抱系统API的基础上进行拓展，使用系统优化好的控件，在后期可能会避免一些不必要的麻烦
  * 但是需要再此基础上去自定义一些实用性功能
    * 图文动画弹出
    * 点击`UITabBarItem`产生震动
    * 点击`UITabBarItem`产生声音
    * 点击`UITabBarItem`支持Lottie动画效果
    * 点击`UITabBarItem`支持右上角文字变化（**`PPBadgeView`**）
    * 长按手势
    * 点击`UITabBarItem`支持自检跳转：检测跳转登录模块、自定义点击跳转行为（不一定非要切换根控制器，而是比如弹出一个提示语）
    * 对某个`UITabBarItem`的垂直距离自定义
  
#### 1.1、对横屏的适配

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

#### 1.2、<font color=red id=KVC.tabBar>对系统的 `UITabBar` 通过**KVC**的方式替换为自定义的 `JobsTabBar`</font>

  ```objective-c
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

#### 1.3、滑动手势切换子控制器

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

#### 1.4、长按手势

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

#### 1.5、支持[**`PPBadgeView`**](https://github.com/jkpang/PPBadgeView)：`TabBarItem`计数小红点

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

```objective-c
if (self.isOpenPPBadge) {
		[item pp_increase];
 }
```

#### 1.6、至少在`-(void)viewWillAppear:(BOOL)animated`以后的生命周期，实现

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

#### 1.7、防止多次加载UI的特殊处理

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

#### 1.8、防止当子控制器为`UIImagePickerController` 引起的崩溃

  ```objective-c
  UIViewController *viewController = self.childVCMutArr[i];
  if (![viewController isKindOfClass:UINavigationController.class]) {/// 防止UIImagePickerController崩
      BaseNavigationVC *nav = [BaseNavigationVC.alloc initWithRootViewController:viewController];
      nav.title = config.title;
      [self.childVCMutArr replaceObjectAtIndex:i withObject:nav];/// 替换元素，每个VC加Navigation
  }
  ```

#### 1.9、强行自检跳转登录模块

```objective-c
/// 对单个的 TabBarItem 进行的配置。这个类不能用作单例
@interface JobsTabBarItemConfig : NSObject
@property(nonatomic,assign)BOOL isNeedCheckLogin;
@property(nonatomic,assign)BOOL isNotNeedCheckLogin;/// 优先级高于isNeedCheckLogin
@property(nonatomic,assign)BOOL isNeedjump;/// 跳开处理，即不切控制器，而是做其他操作，比如弹一个提示框
@end
```

```objective-c
-(BOOL)forcedLoginIndex:(NSUInteger)index{
    for (JobsTabBarItemConfig *tabBarItemConfig in AppDelegate.tabBarItemConfigMutArr) {
        if(tabBarItemConfig.isNeedCheckLogin){
            [self forcedLogin];
            return YES;
        }
    }return NO;
}
```

#### 1.10、支持**`Lottie`**动画

* 关注实现类：[**@interface UIViewController (Lottie)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/UIViewController+Category/UIViewController+Others/UIViewController+Lottie)

  ```objective-c
  if ([self judgeLottieWithIndex:i]) {
      [self addLottieImage:config.lottieName];// 有Lottie动画名，则优先创建Lottie动画
  }
  ```

### 2、`JobsTabBar`

* 对`UITabBarItem`上的图文位置有约束作用。在居中对齐的大前提下

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

* 自定义 **TabBar** 的高度（适配横屏模式）

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

* 获取 **TabBar** 的图片和文字，首先是需通过获取内部类`UITabBarButton`开始

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

## 三、高度自定义TabBarVC <a href="#相关目录结构" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 产生背景：系统的Api会有一些反人类思维的做法，会极大影响我们对于一些UI的布控
  * `UITabBarItem`仅仅是针对`UITabBarController`的一个配置文件，而不是视图层。图片和文字是配置在`UITabBarItem`里面的
  * 当需要自定义 `UITabBarItem`中配置的图文位置，就相对比较吃力。特别是在横屏条件下，无法准确定位图文的生长周期，导致布局失败

### 1、<font color =red>`JobsCustomTabBarVC`</font>

* 将系统的 `UITabBarItem`替换为按钮（**UIButton**）更加符合国人思维习惯

* （单例模式）配置文件`JobsCustomTabBarConfig`

* 对于`UITabBarItem`的图文配置转而面对**UIButton**的子控件（包含1个主标题、1个附标题、1个图）的设置

* 在最新的Api中**UIButton**的配置将由`UIButtonConfiguration`接管。当使用了`UIButtonConfiguration`以后，老旧Api的配置**UIButton**的方式将会失效

  ```objective-c
  -(BaseButton *)titleBtn{
      if (!_titleBtn) {
          @jobs_weakify(self)
          _titleBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                        background:nil
                                                    titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                     textAlignment:NSTextAlignmentCenter
                                                  subTextAlignment:NSTextAlignmentCenter
                                                       normalImage:nil
                                                    highlightImage:nil
                                                   attributedTitle:nil
                                           selectedAttributedTitle:nil
                                                attributedSubtitle:nil
                                                             title:nil
                                                          subTitle:nil
                                                         titleFont:nil
                                                      subTitleFont:nil
                                                          titleCor:nil
                                                       subTitleCor:nil
                                                titleLineBreakMode:NSLineBreakByWordWrapping
                                             subtitleLineBreakMode:NSLineBreakByWordWrapping
                                               baseBackgroundColor:nil
                                                   backgroundImage:nil
                                                      imagePadding:JobsWidth(0)
                                                      titlePadding:JobsWidth(0)
                                                    imagePlacement:NSDirectionalRectEdgeNone
                                        contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                          contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                     contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                 cornerRadiusValue:JobsWidth(0)
                                                   roundingCorners:UIRectCornerAllCorners
                                              roundingCornersRadii:CGSizeZero
                                                    layerBorderCor:nil
                                                       borderWidth:JobsWidth(0)
                                                     primaryAction:nil
                                        longPressGestureEventBlock:nil
                                                   clickEventBlock:^id(BaseButton *x) {
              @jobs_strongify(self)
              x.selected = !x.selected;
              if (self.objectBlock) self.objectBlock(x);
              return nil;
          }];
          [self addSubview:_titleBtn];
          [_titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
              make.left.equalTo(self).offset(self.viewModel.textModel.offsetXForEach);
              make.top.bottom.equalTo(self);
          }];
      }
      
      _titleBtn.jobsResetBtnTitle(self.titleModel.textModel.text);
      _titleBtn.jobsResetSubtitle((self.titleModel.subTextModel.text));
      _titleBtn.jobsResetImagePadding(self.titleModel.imageTitleSpace);
      _titleBtn.jobsResetTitlePadding(self.titleModel.titleSpace);
      _titleBtn.jobsResetBtnImage(self.titleModel.image);
      _titleBtn.jobsResetTitleLineBreakMode(self.titleModel.subTextModel.lineBreakMode);
      _titleBtn.jobsResetSubTitleLineBreakMode(self.titleModel.subTextModel.lineBreakMode);
      _titleBtn.jobsResetImagePlacement(self.titleModel.buttonEdgeInsetsStyle);
      _titleBtn.jobsResetTitleBaseForegroundColor(self.titleModel.textModel.textCor);
      _titleBtn.jobsResetBtnBgCor((self.titleModel.bgCor));
      [_titleBtn jobsSetBtnTitleFont:self.titleModel.textModel.font btnTitleCor:self.titleModel.textModel.textCor];
      _titleBtn.makeBtnLabelByShowingType(self.titleModel.textModel.labelShowingType);
  
      /// 富文本的优先级最高，不括起来上述的设置无效
      if(self.titleModel.textModel.attributedText){
          _titleBtn.jobsResetAttributedTitle(self.titleModel.textModel.attributedText);
      }
      
      if(self.titleModel.subTextModel.attributedText){
          _titleBtn.jobsResetAttributedSubtitle(self.titleModel.subTextModel.attributedText);
      }return _titleBtn;
  }
  ```

### 2、<font color=red>`LZTabBarController`</font>

* `@interface LZTabBarItem : UIView`
* 配置文件：`LZTabBarConfig`
* 将系统的 `UITabBarItem`替换为点击手势（**UITapGestureRecognizer**）更加符合国人思维习惯
* **UITapGestureRecognizer**于`LZTabBarItem`

## 四、其他 <a href="#相关目录结构" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 生命周期

  * <font color=red>**`UITabBarController`** 执行完毕`-(void)viewWillAppear:(BOOL)animated`之后，会走挂载的控制器的生命周期，然后再调回来走**`UITabBarController`** 的**`-(void)viewDidAppear:(BOOL)animated`**</font>

  * <font id=监听`TabBarItem`点击事件>**点击系统的`Tabbaritem`后，先后触发**</font>

    ```
    - (void)tabBar:(UITabBar *)tabBar
     didSelectItem:(UITabBarItem *)item;
    ```

    ```
    - (BOOL)tabBarController:(UITabBarController *)tabBarController
    shouldSelectViewController:(UIViewController *)viewController;
    ```

    ```objective-c
    - (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
               animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC;
    ```

    ```
    - (void)tabBarController:(UITabBarController *)tabBarController 
     didSelectViewController:(UIViewController *)viewController{
        NSLog(@"");
    }
    ```

    ```
    -(void)viewWillLayoutSubviews;
    ```

    ```
    -(void)viewDidLayoutSubviews
    ```

  * `self.viewControllers`被赋值以后，才会有` self.tabBar`

* 系统配置文件，关注实现类：`@interface AppDelegate (TabBarCtr)`

* 使用`UITabBarController`的意义
  
  * 真正切换控制器的方法是对其self.**selectedIndex**进行赋值，如果切换失败，检查属性`self.viewControllers`
  
* 使用方式
  
  ```objective-c
  #ifndef ROOT_VIEW_CONTROLLER_H
  #define ROOT_VIEW_CONTROLLER_H
  //#define RootViewController AppDelegate.tabBarNavCtrl
  //#define RootViewController AppDelegate.tabBarVC
  //
  #define RootViewController AppDelegate.jobsCustomTabBarNavCtrl
  //#define RootViewController AppDelegate.jobsCustomTabBarVC
  //
  //#define RootViewController AppDelegate.lZTabBarNavCtrl
  //#define RootViewController AppDelegate.lZTabBarCtrl
  #endif // ROOT_VIEW_CONTROLLER_H
  ```
  
  ```objective-c
  @interface AppDelegate : UIResponder
  <
  UIApplicationDelegate
  ,UNUserNotificationCenterDelegate
  >
  /// UI
  @property(nonatomic,strong)UIWindow *window;/// 仅仅为了iOS 13 版本向下兼容而存在
  /// Data
  @property(readonly,strong)NSPersistentCloudKitContainer *persistentContainer;
  @property(nonatomic,assign)BOOL allowOrentitaionRotation;
  
  +(instancetype)sharedManager;
  +(void)destroyInstance;
  
  -(void)saveContext;
  
  @end
  ```
  
  ```objective-c
  - (BOOL)application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
      self.window = JobsAppTools.sharedManager.makeAppDelegateWindow;
      self.window.rootViewController = RootViewController;
      [AppDelegate.tabBarVC ppBadge:YES];
      [self.window makeKeyAndVisible];
      return YES;
  }
  ```
  
* [如果要在`UITabBarController`里面自定义TabBar，那么**需要用KVC的方式进行替换**](#KVC.tabBar)

* 相关阅读

  * [**iOS Tabbar各种定制**](https://www.jianshu.com/p/a64348ba0b5b)
  * [**UITabBarController的selectedIndex属性不起作用？**](https://blog.csdn.net/weixin_42012181/article/details/80846660)
