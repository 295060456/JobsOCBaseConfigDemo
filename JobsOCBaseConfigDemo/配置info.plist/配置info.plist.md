#  配置`info.plist`

* 这个文件不需要包含进项目工程，系统通过自检（读取指定目录下的指定名的文件）读取，如果包含进项目，编译会出问题
* 用**Open As Source Code**的方式，打开`info.plist`，并添加以下信息
[toc]
## 1、App索取用户权限（做多语言化处理）
```xml
<key>NSFaceIDUsageDescription</key>
<string>$(NSFaceIDUsageDescription)</string><!-- App需要您的同意，才能访问您的面容识别功能，用于安全验证 -->
<key>NSAppleMusicUsageDescription</key>
<string>$(NSAppleMusicUsageDescription)</string><!-- Add tracks to your music library. -->
<key>NSBluetoothAlwaysUsageDescription</key>
<string>$(NSBluetoothAlwaysUsageDescription)</string><!-- 若不允许，你将无法使用联机服务 -->
<key>NSBluetoothPeripheralUsageDescription</key>
<string>$(NSBluetoothPeripheralUsageDescription)</string><!-- 若不允许，你将无法使用联机服务 -->
<key>NSCalendarsUsageDescription</key>
<string>$(NSCalendarsUsageDescription)</string><!-- 若不允许，你将无法使用添加日历功能 -->
<key>NSCameraUsageDescription</key>
<string>$(NSCameraUsageDescription)</string><!-- 若不允许，你将无法使用拍照功能 -->
<key>NSContactsUsageDescription</key>
<string>$(NSContactsUsageDescription)</string><!-- 通讯录信息仅用于查找联系人，并会得到严格保密 -->
<key>NSHealthShareUsageDescription</key>
<string>$(NSHealthShareUsageDescription)</string><!-- 若不允许，你将无法参与运动排行榜活动 -->
<key>NSHealthUpdateUsageDescription</key>
<string>$(NSHealthUpdateUsageDescription)</string><!-- 若不允许，你将无法参与运动排行榜活动 -->
<key>NSHomeKitUsageDescription</key>
<string>$(NSHomeKitUsageDescription)</string><!-- 若不允许，你将无法使用智能家居服务 -->
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>$(NSLocationAlwaysAndWhenInUseUsageDescription)</string><!-- 我们需要获取你的定位权限以供完成查找附近商户功能 -->
<key>NSLocationAlwaysUsageDescription</key>
<string>$(NSLocationAlwaysUsageDescription)</string><!-- 我们需要您的同意,您的位置信息将用于查看当前位置信息 -->
<key>NSLocationWhenInUseUsageDescription</key>
<string>$(NSLocationWhenInUseUsageDescription)</string><!-- 我们需要获取你的定位权限以供完成查找附近商户功能 -->
<key>NSMicrophoneUsageDescription</key>
<string>$(NSMicrophoneUsageDescription)</string><!-- 我们需要获取你的麦克风权限以供完成语音搜索功能 -->
<key>NSMotionUsageDescription</key>
<string>$(NSMotionUsageDescription)</string><!-- 我们需要获取你的运动权限以完成运动挑战赛功能 -->
<key>NSPhotoLibraryAddUsageDescription</key>
<string>$(NSPhotoLibraryAddUsageDescription)</string><!-- 我们需要获取你的相册权限以完成选择本地图片功能 -->
<key>NSPhotoLibraryUsageDescription</key>
<string>$(NSPhotoLibraryUsageDescription)</string><!-- 我们需要获取你的相册权限以完成选择本地图片功能 -->
<key>NSRemindersUsageDescription</key>
<string>$(NSRemindersUsageDescription)</string><!-- 我们需要获取你的提醒事项权限以供添加提醒事项 -->
<key>NSSiriUsageDescription</key>
<string>$(NSSiriUsageDescription)</string><!-- 我们需要获取你的Siri权限以方便完成Siri建议功能 -->
<key>NSSpeechRecognitionUsageDescription</key>
<string>$(NSSpeechRecognitionUsageDescription)</string><!-- 我们需要获取你的语音识别功能已完成键盘语音识别输入功能 -->
<key>NSVideoSubscriberAccountUsageDescription</key>
<string>$(NSVideoSubscriberAccountUsageDescription)</string><!-- 我们需要获取你的TV权限 -->
```

*Localizable.strings(English)* <font color=red>**多语言映射文件**</font>

```
/// 权限设置
"App需要您的同意，才能访问您的面容识别功能，用于安全验证" = "NSFaceIDUsageDescription";
"添加曲目到您的音乐库" = "NSAppleMusicUsageDescription";
"若不允许，你将无法使用联机服务" = "NSBluetoothAlwaysUsageDescription";
"若不允许，你将无法使用联机服务" = "NSBluetoothPeripheralUsageDescription";
"若不允许，你将无法使用添加日历功能" = "NSCalendarsUsageDescription";
"若不允许，你将无法使用拍照功能" = "NSCameraUsageDescription";
"通讯录信息仅用于查找联系人，并会得到严格保密" = "NSContactsUsageDescription";
"若不允许，你将无法参与运动排行榜活动" = "NSHealthShareUsageDescription";
"若不允许，你将无法参与运动排行榜活动" = "NSHealthUpdateUsageDescription";
"若不允许，你将无法使用智能家居服务" = "NSHomeKitUsageDescription";
"我们需要获取你的定位权限以供完成查找附近商户功能" = "NSLocationAlwaysAndWhenInUseUsageDescription";
"我们需要您的同意,您的位置信息将用于查看当前位置信息" = "NSLocationAlwaysUsageDescription";
"我们需要获取你的定位权限以供完成查找附近商户功能" = "NSLocationWhenInUseUsageDescription";
"我们需要获取你的麦克风权限以供完成语音搜索功能" = "NSMicrophoneUsageDescription";
"我们需要获取你的运动权限以完成运动挑战赛功能" = "NSMotionUsageDescription";
"我们需要获取你的相册权限以完成选择本地图片功能" = "NSPhotoLibraryAddUsageDescription";
"我们需要获取你的相册权限以完成选择本地图片功能" = "NSPhotoLibraryUsageDescription";
"我们需要获取你的提醒事项权限以供添加提醒事项" = "NSRemindersUsageDescription";
"我们需要获取你的Siri权限以方便完成Siri建议功能" = "NSSiriUsageDescription";
"我们需要获取你的语音识别功能已完成键盘语音识别输入功能" = "NSSpeechRecognitionUsageDescription";
"我们需要获取你的TV权限" = "NSVideoSubscriberAccountUsageDescription";
```

## 2、App多语言化

```xml
<!-- 用于指定应用程序的显示名称是否本地化 -->
<key>LSHasLocalizedDisplayName</key>
<true/>
<!-- 应用支持的所有语言代码，这些语言代码应该与您的本地化资源文件夹相匹配 -->
<key>CFBundleLocalizations</key>
<array>
    <string>en</string>
    <string>zh-Hans</string>
    <string>fil-PH</string>
</array>
<!-- 开发区域的语言代码 -->
<key>CFBundleDevelopmentRegion</key>
<string>en</string>
```

## 3、App添加外部字体

* 需要把外部字体包含进工程项目里面

  ```xml
  <key>UIAppFonts</key>
  <array>
      <string>时尚中黑简体.ttf</string>
      <string>锐字锐线怒放黑简.ttf</string>
  </array>
  ```

## 4、App白名单

* iOS 9系统策略更新，限制了http协议的访问，此外应用需要在`Info.plist`中将要使用的URL Schemes列为白名单，才可正常检查其他应用是否安装。

* 当你的应用在iOS 9中需要使用 QQ/QQ空间/支付宝/微信SDK 的相关能力（分享、收藏、支付、登录等）时，需要在`Info.plist`里增加如下代码：

  ```xml
  <key>LSApplicationQueriesSchemes</key>
   <array>
      <!-- 微信 URL Scheme 白名单-->
      <string>wechat</string>
      <string>weixin</string>
      <!-- 新浪微博 URL Scheme 白名单-->
      <string>sinaweibohd</string>
      <string>sinaweibo</string>
      <string>sinaweibosso</string>
      <string>weibosdk</string>
      <string>weibosdk2.5</string>
      <!-- QQ、Qzone URL Scheme 白名单-->
      <string>mqqapi</string>
      <string>mqq</string>
      <string>mqqOpensdkSSoLogin</string>
      <string>mqqconnect</string>
      <string>mqqopensdkdataline</string>
      <string>mqqopensdkgrouptribeshare</string>
      <string>mqqopensdkfriend</string>
      <string>mqqopensdkapi</string>
      <string>mqqopensdkapiV2</string>
      <string>mqqopensdkapiV3</string>
      <string>mqzoneopensdk</string>
      <string>wtloginmqq</string>
      <string>wtloginmqq2</string>
      <string>mqqwpa</string>
      <string>mqzone</string>
      <string>mqzonev2</string>
      <string>mqzoneshare</string>
      <string>wtloginqzone</string>
      <string>mqzonewx</string>
      <string>mqzoneopensdkapiV2</string>
      <string>mqzoneopensdkapi19</string>
      <string>mqzoneopensdkapi</string>
      <string>mqzoneopensdk</string>
      <!-- 支付宝  URL Scheme 白名单-->
      <string>alipay</string>
      <string>alipayshare</string>
  </array>
  ```

## 5、App屏幕旋转

```xml
<key>UISupportedInterfaceOrientations</key>
<array>
    <string>UIInterfaceOrientationPortrait</string>
    <string>UIInterfaceOrientationPortraitUpsideDown</string>
    <string>UIInterfaceOrientationLandscapeLeft</string>
    <string>UIInterfaceOrientationLandscapeRight</string>
</array>
```

## 6、iOS 横竖屏UI切换

* iPhone 应用

  ```xml
  <key>UISupportedInterfaceOrientations</key>
  <array>
      <string>UIInterfaceOrientationPortrait</string>
      <string>UIInterfaceOrientationPortraitUpsideDown</string>
      <string>UIInterfaceOrientationLandscapeLeft</string>
      <string>UIInterfaceOrientationLandscapeRight</string>
  </array>
  ```

* iPad 应用

  ```xml
  <key>UISupportedInterfaceOrientations~ipad</key>
  <array>
      <string>UIInterfaceOrientationPortrait</string>
      <string>UIInterfaceOrientationPortraitUpsideDown</string>
      <string>UIInterfaceOrientationLandscapeLeft</string>
      <string>UIInterfaceOrientationLandscapeRight</string>
  </array>
  ```

## 7、App添加Appicon

```xml
<key>CFBundleIcons</key>
<dict>
    <key>CFBundleAlternateIcons</key>
    <dict>
        <key>晴</key>
        <dict>
            <key>CFBundleIconFiles</key>
            <array>
                <string>晴</string>
            </array>
            <key>UIPrerenderedIcon</key>
            <false/>
        </dict>
        <key>多云</key>
        <dict>
            <key>CFBundleIconFiles</key>
            <array>
                <string>多云</string>
            </array>
            <key>UIPrerenderedIcon</key>
            <false/>
        </dict>
        <key>小雨</key>
        <dict>
            <key>CFBundleIconFiles</key>
            <array>
                <string>小雨</string>
            </array>
            <key>UIPrerenderedIcon</key>
            <false/>
        </dict>
        <key>大雨</key>
        <dict>
            <key>CFBundleIconFiles</key>
            <array>
                <string>大雨</string>
            </array>
            <key>UIPrerenderedIcon</key>
            <false/>
        </dict>
        <key>雪</key>
        <dict>
            <key>CFBundleIconFiles</key>
            <array>
                <string>雪</string>
            </array>
            <key>UIPrerenderedIcon</key>
            <false/>
        </dict>
    </dict>
    <key>UINewsstandIcon</key>
    <dict>
        <key>CFBundleIconFiles</key>
        <array>
            <string></string>
        </array>
        <key>UINewsstandBindingEdge</key>
        <string>UINewsstandBindingEdgeLeft</string>
        <key>UINewsstandBindingType</key>
        <string>UINewsstandBindingTypeMagazine</string>
    </dict>
</dict>
```

## 8、iOS 状态栏修改

```xml
<!-- iOS 状态栏颜色的修改【全局设置 全局是NO、局部是YES】View controller-based status bar appearance : NO-->
<key>UIViewControllerBasedStatusBarAppearance</key>
<false/>
<!-- iOS 状态栏颜色的修改【全局设置】Status bar style : Light Content-->
<key>UIStatusBarStyle</key>
<string>UIStatusBarStyleLightContent</string>
<!--只设置UIViewControllerBasedStatusBarAppearance为false，而不设置UIStatusBarHidden为true，在某些情况下会显示本应该隐藏的iOS状态栏-->
<key>UIStatusBarHidden</key>
<true/>
```

## 9、App名

```xml
<!-- 是应用程序的唯一标识符，通常以反转的域名格式（例如：com.example.MyApp）表示。-->
<!-- Products文件夹下打包的App的名字将会命名为${CFBundleDisplayName}.app-->
<key>CFBundleIdentifier</key>
<string></string>
<!-- 应用程序的显示名称。会显示在设备的主屏幕上以及应用程序内的标题栏等位置-->
<!-- 可以是应用程序的短名称，用于显示给用户，不需要是全名-->
<!-- Products文件夹下打包的App的名字将会命名为${CFBundleDisplayName}.app-->
<key>CFBundleName</key>
<string>CFBundleDisplayName</string>
<!-- 应用程序的显示名称，用于在设备的主屏幕上显示。-->
<!-- Products文件夹下打包的App的名字将会命名为${工程项目名}.app-->
<key>CFBundleDisplayName</key>
<string>CFBundleDisplayName</string>
```

## 10、App多场景的支持

```xml
<!--❤️【UIApplicationSceneManifest】iOS 13 开始引入。支持多窗口应用程序，允许用户在 iPad 和 macOS 上运行多个实例的应用程序❤️-->
<key>UIApplicationSceneManifest</key>
<dict>
    <!--【UIApplicationSupportsMultipleScenes】指示应用程序是否支持多场景（多窗口）。设置为 YES 表示支持多场景 -->
    <key>UIApplicationSupportsMultipleScenes</key>
    <false/>
    <!-- 【UISceneConfigurations】定义不同场景的配置，包括每种场景的生命周期管理类和初始场景配置 -->
    <key>UISceneConfigurations</key>
    <dict>
        <!-- 【UIWindowSceneSessionRoleApplication】在 iOS 的多窗口场景管理中，角色定义了场景的用途或类型。表示该场景是应用的主要窗口场景。 -->
        <key>UIWindowSceneSessionRoleApplication</key>
        <array>
            <dict>
                <!--【UISceneConfigurationName】指定了一个场景配置的名称，iOS 会使用这个名称来查找和加载相应的场景配置 -->
                <key>UISceneConfigurationName</key>
                <string>Default Configuration</string>
                <!--【UISceneDelegateClassName】用于指明哪个类将处理特定场景的生命周期事件 -->
                <key>UISceneDelegateClassName</key>
                <string>SceneDelegate</string>
                <!--【UISceneStoryboardFile】用来定义应用启动时应该加载的特定 Storyboard 文件 -->
                <key>UISceneStoryboardFile</key>
                <string>Main</string>
            </dict>
        </array>
    </dict>
</dict>
```

## 11、`WKWebKit` 相关

```xml
<!--允许加载外部资源-->
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
    <key>NSExceptionDomains</key>
    <dict>
        <key>livechatinc.com</key>
        <dict>
            <key>NSIncludesSubdomains</key>
            <true/>
            <key>NSExceptionAllowsInsecureHTTPLoads</key>
            <true/>
            <key>NSExceptionMinimumTLSVersion</key>
            <string>TLSv1.2</string>
            <key>NSExceptionRequiresForwardSecrecy</key>
            <false/>
        </dict>
    </dict>
</dict>
<key>NSNetworkLogsEnabled</key>
<true/>
```


## 12、其他

* ```xml
  <!-- 配置 UILaunchStoryboardName，项目里面就必须将 Main.storyboard 包含到工程，进入编译期-->
  <key>UILaunchStoryboardName</key>
  <string>LaunchScreen</string>
  ```

* ```xml
  <!-- 应用程序是否需要持久的 Wi-Fi 连接才能运行。已废弃 -->
  <key>UIRequiresPersistentWiFi</key>
  <true/>
  <!-- 于启用应用程序中的摇动手势，通常与撤销/重做操作相关联 -->
  <key>UIApplicationSupportsShakeToEdit</key>
  <true/>
  <!-- Core Data -->
  <key>NSPersistentStoreTypeKey</key>
  <string>SQLite</string>
  ```
