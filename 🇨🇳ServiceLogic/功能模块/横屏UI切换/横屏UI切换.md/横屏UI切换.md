# iOS 横竖屏UI切换

## 第三方支援

```ruby
pod 'HXRotationTool' # https://github.com/TheLittleBoy/HXRotationTool
```

## xcode 设置

![image-20240702165235414](./assets/image-20240702165235414.png)

## Info.plist 设置

```xml
# iPhone 应用
<key>UISupportedInterfaceOrientations</key>
<array>
    <string>UIInterfaceOrientationPortrait</string>
    <string>UIInterfaceOrientationPortraitUpsideDown</string>
    <string>UIInterfaceOrientationLandscapeLeft</string>
    <string>UIInterfaceOrientationLandscapeRight</string>
</array>
# iPad 应用
<key>UISupportedInterfaceOrientations~ipad</key>
<array>
    <string>UIInterfaceOrientationPortrait</string>
    <string>UIInterfaceOrientationPortraitUpsideDown</string>
    <string>UIInterfaceOrientationLandscapeLeft</string>
    <string>UIInterfaceOrientationLandscapeRight</string>
</array>
```

## 代码处理

* 相关枚举说明

  * `UIInterfaceOrientationMask`用于指定应用支持的界面方向的位掩码。它的值可以组合使用，以定义应用程序支持的方向

  ```objective-c
  typedef NS_OPTIONS(NSUInteger, UIInterfaceOrientationMask) {
      UIInterfaceOrientationMaskPortrait = (1 << UIInterfaceOrientationPortrait),/// 表示设备处于竖屏（Portrait）模式。
      UIInterfaceOrientationMaskLandscapeLeft = (1 << UIInterfaceOrientationLandscapeLeft),/// 表示设备处于左横屏（Landscape Left）模式。
      UIInterfaceOrientationMaskLandscapeRight = (1 << UIInterfaceOrientationLandscapeRight),/// 表示设备处于右横屏（Landscape Right）模式。
      UIInterfaceOrientationMaskPortraitUpsideDown = (1 << UIInterfaceOrientationPortraitUpsideDown),/// 表示设备处于倒竖屏（Portrait Upside Down）模式。
      UIInterfaceOrientationMaskLandscape = (UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight), /// 表示设备可以处于任意横屏（Landscape）模式，包括左横屏和右横屏。
      UIInterfaceOrientationMaskAll = (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskPortraitUpsideDown),/// 表示设备可以处于所有方向，包括竖屏、左横屏、右横屏和倒竖屏。
      UIInterfaceOrientationMaskAllButUpsideDown = (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight),/// 表示设备可以处于所有方向，但不包括倒竖屏。
  } API_UNAVAILABLE(tvos);
  ```

  * `UIInterfaceOrientation` 描述界面当前的方向，用于确定应用界面是如何显示的。其值包括：
    * 通常与 `UIInterfaceOrientationMask` 中定义的支持方向进行比较

  ```objective-c
  typedef NS_ENUM(NSInteger, UIInterfaceOrientation) {
      UIInterfaceOrientationUnknown            = UIDeviceOrientationUnknown, /// 界面方向未知或不确定。这通常用于初始化或错误状态
      UIInterfaceOrientationPortrait           = UIDeviceOrientationPortrait, /// 设备处于竖屏（Portrait）模式，即设备的顶部朝上
      UIInterfaceOrientationPortraitUpsideDown = UIDeviceOrientationPortraitUpsideDown,/// 设备处于倒竖屏（Portrait Upside Down）模式，即设备的顶部朝下
      UIInterfaceOrientationLandscapeLeft      = UIDeviceOrientationLandscapeRight, /// 设备处于左横屏（Landscape Left）模式。❤️注意，这个方向对应于设备顶部向右（而不是向左），这与其名称可能引起的直观理解不同❤️
      UIInterfaceOrientationLandscapeRight     = UIDeviceOrientationLandscapeLeft /// 设备处于右横屏（Landscape Right）模式。同样地，这个方向对应于设备顶部向左
  } API_UNAVAILABLE(tvos);
  ```

  * `UIDeviceOrientation` 描述<font color=red>**设备本身的物理方向**</font>，即设备如何被用户持握。其值包括：

    * 虽然它有时与 `UIInterfaceOrientation` 一致，但它们并不总是相同

    * 例如，在设备平放时（`UIDeviceOrientationFaceUp` 或 `UIDeviceOrientationFaceDown`）

  ```objective-c
  typedef NS_ENUM(NSInteger, UIDeviceOrientation) {
       UIDeviceOrientationUnknown, /// 设备方向未知或不确定。这通常用于初始化或错误状态
       UIDeviceOrientationPortrait,            /// 设备竖直放置，设备底部的 Home 键在底部（设备顶部朝上）
       UIDeviceOrientationPortraitUpsideDown,  /// 设备竖直放置，设备底部的 Home 键在顶部（设备顶部朝下）
       UIDeviceOrientationLandscapeLeft,       /// 设备水平放置，设备底部的 Home 键在右侧（设备顶部朝左）
       UIDeviceOrientationLandscapeRight,      /// 设备水平放置，设备底部的 Home 键在左侧（设备顶部朝右）
       UIDeviceOrientationFaceUp,              /// 设备平放，屏幕朝上
       UIDeviceOrientationFaceDown             /// 设备平放，屏幕朝下
  } API_UNAVAILABLE(tvos);
  ```

* 代码示例

```objective-c
/// 决定当前界面是否开启自动转屏，如果返回NO，后面两个方法也不会被调用，只是会支持默认的方向
- (BOOL)shouldAutorotate {
    return YES;
}
/// 当前控制器支持的屏幕旋转方向（在具体的控制器子类进行覆写）
/// iPad设备上，默认返回值UIInterfaceOrientationMaskAllButUpSideDwon
/// iPhone设备上，默认返回值是UIInterfaceOrientationMaskAll
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}
/// 设置进入界面默认支持的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [super preferredInterfaceOrientationForPresentation];
}
```

```objective-c
[NSNotificationCenter.defaultCenter addObserver:self
                                       selector:@selector(deviceOrientationDidChange:)
                                           name:UIDeviceOrientationDidChangeNotification
                                         object:nil];
[NSNotificationCenter.defaultCenter removeObserver:self
                                              name:UIDeviceOrientationDidChangeNotification
                                            object:nil];
                                             
/// UIDeviceOrientationDidChangeNotification 通知方法
- (void)deviceOrientationDidChange:(NSNotification *)notification {
    UIDeviceOrientation orientation = UIDevice.currentDevice.orientation;
    switch (orientation) {
            // 处理竖屏方向的逻辑
        case UIDeviceOrientationPortrait:/// 设备竖直向上，Home 按钮在下方
            NSLog(@"系统通知：↓");
            break;
        case UIDeviceOrientationPortraitUpsideDown:/// 设备竖直向下，Home 按钮在上方
            NSLog(@"系统通知：↑");
            break;
            // 处理横屏方向的逻辑
        case UIDeviceOrientationLandscapeLeft:/// 设备水平，Home 按钮在右侧
            NSLog(@"系统通知：→");
            break;
        case UIDeviceOrientationLandscapeRight:/// 设备水平，Home 按钮在左侧
            NSLog(@"系统通知：←");
            break;
        default:
            break;
    }
}                                            
```

## 屏幕上下倒立<font color=red>不可用</font>

* 技术上是可能的，但实际使用中可能受到限制；
* 目前涉及的iPhone全面屏（包括:`刘海屏 `或者 `动态岛`）系列，不支持倒立（上下颠倒）屏幕方向。这是 Apple 的设计决定，主要基于以下几个原因：
  * 用户体验：刘海屏的设计使得倒立使用时，"刘海"或"动态岛"会位于屏幕底部，这可能会影响用户体验和交互；
  * 硬件限制：前置摄像头、扬声器和各种传感器都集中在"刘海"区域，倒立使用可能会影响这些硬件的正常功能；
  * 设计一致性：保持界面的一致性，避免在不同设备间出现使用差异；
* 具体来说，以下 iPhone 型号不支持倒立屏幕：iPhone X 及之后的所有型号（包括 iPhone XS, XR, 11, 12, 13, 14, 15 系列等）；
* 对于应用开发，如果 App 特别需要支持倒立显示（例如，为了在某些特殊场景下方便查看内容），可能需要考虑实现自定义的界面旋转逻辑，而不是依赖系统的屏幕旋转；





