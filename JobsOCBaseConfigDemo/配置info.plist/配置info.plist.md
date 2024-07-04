#  配置`info.plist`

* 用Open As Source Code的方式，打开`info.plist`，并添加以下信息
[toc]
## 1、索取用户权限（做多语言化处理）
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

*Localizable.strings*

```
/// 权限设置
"NSFaceIDUsageDescription" = "App需要您的同意，才能访问您的面容识别功能，用于安全验证";
"NSAppleMusicUsageDescription" = "添加曲目到您的音乐库";
"NSBluetoothAlwaysUsageDescription" = "若不允许，你将无法使用联机服务";
"NSBluetoothPeripheralUsageDescription" = "若不允许，你将无法使用联机服务";
"NSCalendarsUsageDescription" = "若不允许，你将无法使用添加日历功能";
"NSCameraUsageDescription" = "若不允许，你将无法使用拍照功能";
"NSContactsUsageDescription" = "通讯录信息仅用于查找联系人，并会得到严格保密";
"NSHealthShareUsageDescription" = "若不允许，你将无法参与运动排行榜活动";
"NSHealthUpdateUsageDescription" = "若不允许，你将无法参与运动排行榜活动";
"NSHomeKitUsageDescription" = "若不允许，你将无法使用智能家居服务";
"NSLocationAlwaysAndWhenInUseUsageDescription" = "我们需要获取你的定位权限以供完成查找附近商户功能";
"NSLocationAlwaysUsageDescription" = "我们需要您的同意,您的位置信息将用于查看当前位置信息";
"NSLocationWhenInUseUsageDescription" = "我们需要获取你的定位权限以供完成查找附近商户功能";
"NSMicrophoneUsageDescription" = "我们需要获取你的麦克风权限以供完成语音搜索功能";
"NSMotionUsageDescription" = "我们需要获取你的运动权限以完成运动挑战赛功能";
"NSPhotoLibraryAddUsageDescription" = "我们需要获取你的相册权限以完成选择本地图片功能";
"NSPhotoLibraryUsageDescription" = "我们需要获取你的相册权限以完成选择本地图片功能";
"NSRemindersUsageDescription" = "我们需要获取你的提醒事项权限以供添加提醒事项";
"NSSiriUsageDescription" = "我们需要获取你的Siri权限以方便完成Siri建议功能";
"NSSpeechRecognitionUsageDescription" = "我们需要获取你的语音识别功能已完成键盘语音识别输入功能";
"NSVideoSubscriberAccountUsageDescription" = "我们需要获取你的TV权限";
```

## 2、添加外部字体

* 需要把外部字体包含进工程项目里面

  ```xml
  <key>UIAppFonts</key>
  <array>
      <string>时尚中黑简体.ttf</string>
      <string>锐字锐线怒放黑简.ttf</string>
  </array>
  ```

## 3、App白名单

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

## 4、屏幕旋转

```xml
<key>UISupportedInterfaceOrientations</key>
<array>
    <string>UIInterfaceOrientationPortrait</string>
    <string>UIInterfaceOrientationPortraitUpsideDown</string>
    <string>UIInterfaceOrientationLandscapeLeft</string>
    <string>UIInterfaceOrientationLandscapeRight</string>
</array>
```

## 5、iOS 横竖屏UI切换

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

## 6、添加Appicon

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

## 7、iOS 状态栏修改

```xml
<!-- iOS 状态栏颜色的修改【全局设置 全局是NO、局部是YES】View controller-based status bar appearance : NO-->
<key>UIViewControllerBasedStatusBarAppearance</key>
<false/>
<!-- iOS 状态栏颜色的修改【全局设置】Status bar style : Light Content-->
<key>UIStatusBarStyle</key>
<string>UIStatusBarStyleLightContent</string>
```

