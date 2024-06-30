#  配置`info.plist`

[toc]

## Open As Source Code，添加以下信息

### 开权限：
    <key>NSFaceIDUsageDescription</key>
    <string>App需要您的同意，才能访问您的面容识别功能，用于安全验证</string>
    <key>NSAppleMusicUsageDescription</key>
    <string>Add tracks to your music library.</string>
    <key>NSBluetoothAlwaysUsageDescription</key>
    <string>若不允许，你将无法使用联机服务</string>
    <key>NSBluetoothPeripheralUsageDescription</key>
    <string>若不允许，你将无法使用联机服务</string>
    <key>NSCalendarsUsageDescription</key>
    <string>若不允许，你将无法使用添加日历功能</string>
    <key>NSCameraUsageDescription</key>
    <string>若不允许，你将无法使用拍照功能</string>
    <key>NSContactsUsageDescription</key>
    <string>通讯录信息仅用于查找联系人，并会得到严格保密</string>
    <key>NSHealthShareUsageDescription</key>
    <string>若不允许，你将无法参与运动排行榜活动</string>
    <key>NSHealthUpdateUsageDescription</key>
    <string>若不允许，你将无法参与运动排行榜活动</string>
    <key>NSHomeKitUsageDescription</key>
    <string>若不允许，你将无法使用智能家居服务</string>
    <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
    <string>我们需要获取你的定位权限以供完成查找附近商户功能</string>
    <key>NSLocationAlwaysUsageDescription</key>
    <string>我们需要您的同意,您的位置信息将用于查看当前位置信息</string>
    <key>NSLocationWhenInUseUsageDescription</key>
    <string>我们需要获取你的定位权限以供完成查找附近商户功能</string>
    <key>NSMicrophoneUsageDescription</key>
    <string>我们需要获取你的麦克风权限以供完成语音搜索功能</string>
    <key>NSMotionUsageDescription</key>
    <string>我们需要获取你的运动权限以完成运动挑战赛功能</string>
    <key>NSPhotoLibraryAddUsageDescription</key>
    <string>我们需要获取你的相册权限以完成选择本地图片功能</string>
    <key>NSPhotoLibraryUsageDescription</key>
    <string>我们需要获取你的相册权限以完成图片上传和识别功能</string>
    <key>NSRemindersUsageDescription</key>
    <string>我们需要获取你的提醒事项权限以供添加提醒事项</string>
    <key>NSSiriUsageDescription</key>
    <string>我们需要获取你的Siri权限以方便完成Siri建议功能</string>
    <key>NSSpeechRecognitionUsageDescription</key>
    <string>我们需要获取你的语音识别功能已完成键盘语音识别输入功能</string>
    <key>NSVideoSubscriberAccountUsageDescription</key>
    <string>我们需要获取你的TV权限</string>

### 添加外部字体：
    <key>UIAppFonts</key>
    <array>
        <string>时尚中黑简体.ttf</string>
        <string>锐字锐线怒放黑简.ttf</string>
    </array>

### 苹果公司iOS 9系统策略更新，限制了http协议的访问，此外应用需要在`Info.plist`中将要使用的URL Schemes列为白名单，才可正常检查其他应用是否安装。
当你的应用在iOS 9中需要使用 QQ/QQ空间/支付宝/微信SDK的相关能力（分享、收藏、支付、登录等）时，需要在`Info.plist`里增加如下代码：

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

### 添加Appicon

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
