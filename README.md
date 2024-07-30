# <font color=red>iOS.OC靶场项目</font><基础配置的说明>
<p align="left">
  <a><img src="https://img.shields.io/badge/pod-1.15.2-brightgreen" alt="cocoapods" title="cocoapods"/></a>
  <a><img src="https://img.shields.io/badge/OC-orange" alt="OC" title="OC"/></a>
  <a><img src="https://img.shields.io/badge/xcode-15.4-blue" alt="xcode" title="xcode"/>  </a>
  <a><img src="https://img.shields.io/badge/github-actions-black" alt="github actions" title="github actions"/></a>
  <a href="https://github.com/295060456/JobsOCBaseConfigDemo"><img src="https://img.shields.io/github/license/295060456/JobsOCBaseConfigDemo?style=flat" alt="License" title="License"/></a>
  <a href="https://github.com/295060456/JobsOCBaseConfigDemo"><img src="https://img.shields.io/badge/platform-iOS-lightgrey?style=flat" alt="Platform" title="Platform"/></a>
</p>

[toc]

## <font id=前言>前言</font>

* **工欲善其事必先利其器**
* **面向信仰编程**

## 一、目的

* 所有的项目根据这个根来进行统一配置和调用
* 将它作为所有项目的基类，做到全局的统一
* 千万要保证这个工程的编译通过，以后项目直接进行引用
* 作为某些代码实践的靶场，是非常有必要的
* 作为代码笔记，记录一些常用的代码，方便查阅
* 作为学习的资料，可以快速了解到一些常用的知识
* 作为项目的参考，可以快速的了解到项目的架构，代码规范，以及一些设计模式
* <font color=blue>**示例Demo可能因为相关Api的升级没有覆盖处理会出现闪退。修复即可**</font>

## 二、特色

* <font color=red>**自主研发**</font>
  * [x] 公共的协议簇 **BaseProtocol**<br>
  * [x] 统一的**Block**管理：[**<font color=red>JobsBlock</font>**](https://github.com/295060456/JobsBlock/blob/main/README.md)<br>
  * [x] 统一数据源的封装：[**<font color=red>UIViewModel</font>**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/BaseObject/UIViewModelFamily/UIViewModel)<br>
  * [x] UIButton兼容最新Api：**UIButtonConfiguration**<br>
  * [x] 统一的UI组件库**JobsOCBaseCustomizeUIKitCore**<br>
  * [x] 统一注册全局的 **UICollectionViewCell**<br>
  * [x] 对**UITabBarController**和**UITabBar**的封装<br>
  * [x] **UserDefaults**数据存储封装<br>
  * [x] 对打开**URL**的兼容性封装<br>
  * [x] 对**KVC**的封装<br>
  * [x] 富文本的封装<br>
  * [x] 对倒计时按钮的封装<br>
  * [x] 统一的输入框封装<br>
  * [x] [**高仿蜜柚App的登录模块动态UI：`JobsAppDoor`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/JobsAppDoor-2)<br>
  * [x] [**聊天功能：`JobsIM`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/JobsIM)<br>
  * [x] [**发帖功能：`JobsPostVC`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/%E5%8F%91%E5%B8%96%E5%8A%9F%E8%83%BD) （相册获取资源+存/取未完成字符串）<br>
  * [x] [**评论功能：`JobsComment`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/JobsComment)<br>
  * [x] [**搜索功能：`JobsSearch`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/JobsSearchCore/JobsSearchVC)<br>
  * [x] [**时间管理：`JobsTimerVC`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/JobsTimer/ViewController/JobsTimerVC)<br>
  * [x] [**悬浮模块：`JobsSuspend`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/OCBaseConfig/JobsMixFunc/JobsSuspend)<br>
  * [x] [**下载流量监控：`JobsBitsMonitor`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/OCBaseConfig/JobsMixFunc/JobsBitsMonitor)<br>
  * [x] [**下拉列表：`JobsDropDownListVC`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/JobsDropDownList)<br>
* UI层封装
  * [x] 对悬浮层的封装<br>
  * [x] 对视频播放器的二次封装<br>
  * [x] 统一的**Toast**封装<br>
  * [x] 设备屏幕横竖屏适配<br>
  * [x] 对调用系统相机、系统相册的功能性封装<br>
  * [x] [**高仿抖音：Douyin_ZFPlayer**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/Douyin_ZFPlayer)<br>
  * [x] [**3D Touch：长按Cell出菜单**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/PeekAndPop)<br>
  * [x] [**卡片式滑动效果**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8D%A1%E7%89%87%E5%BC%8F%E6%BB%91%E5%8A%A8%E6%95%88%E6%9E%9C)<br>
  * [x] [**图形验证码**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/OCBaseConfig/JobsMixFunc/%E5%9B%BE%E5%BD%A2%E9%AA%8C%E8%AF%81%E7%A0%81)<br>
  * [x] [**App图标切换**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/App%E5%9B%BE%E6%A0%87%E5%88%87%E6%8D%A2)<br>
  * [x] [**镂空特效**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/TransparentRegion/TransparentRegionVC)<br>
  * [x] [**不规则的按钮**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/TestIrregularView)<br>
  * [x] [**转场动画研究：`JobsPresentingVC`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/UIPresentationController%E7%9A%84%E4%BD%BF%E7%94%A8/JobsPresentingVC)<br>
  * [x] 特色UI：**UITableViewCell**
    * [**UITableViewCell的折叠效果**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/UITableViewCell%E7%9A%84%E6%8A%98%E5%8F%A0%E6%95%88%E6%9E%9C)
    * [**自定义UITableViewCell内置控件距离并添加复制按钮**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/%E8%87%AA%E5%AE%9A%E4%B9%89UITableViewCell%E5%86%85%E7%BD%AE%E6%8E%A7%E4%BB%B6%E8%B7%9D%E7%A6%BB%E5%B9%B6%E6%B7%BB%E5%8A%A0%E5%A4%8D%E5%88%B6%E6%8C%89%E9%92%AE)
    * [**替换系统UITableViewCell编辑状态下前面的按钮UI样式，及其一部分逻辑**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/UITableViewCellEditorVC)
    * [**自定义UITableViewCell内置控件距离并添加复制按钮**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/%E8%87%AA%E5%AE%9A%E4%B9%89UITableViewCell%E5%86%85%E7%BD%AE%E6%8E%A7%E4%BB%B6%E8%B7%9D%E7%A6%BB%E5%B9%B6%E6%B7%BB%E5%8A%A0%E5%A4%8D%E5%88%B6%E6%8C%89%E9%92%AE/ViewController/CustomTableViewCellVC)
  * [x] 特色UI：**UICollectionViewCell**
    * [**UICollectionView实现重叠的卡包效果**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/UICollectionView%E5%AE%9E%E7%8E%B0%E9%87%8D%E5%8F%A0%E7%9A%84%E5%8D%A1%E5%8C%85%E6%95%88%E6%9E%9C/JobsWalletVC)
  * [x] 特色UI：**JX**系列Demo
    * [**JXCategoryView垂直表达**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/JXCategoryView%E5%9E%82%E7%9B%B4%E8%A1%A8%E8%BE%BE)
    * [**JXCategoryView下拉headerView变大**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/JXCategoryView%E4%B8%8B%E6%8B%89headerView%E5%8F%98%E5%A4%A7)
    * [**JXCategory弹出框**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/JXCategoryPopup/JXCategoryPopupVC)
  * [ ] 统一的**WebView**封装<br>
* 数据层封装
  * [x] 网络模块Api<br>
  * [x] **Block** 替换 **@selector** <br>
  * [x] 统一的对手势的封装<br>
  * [x] 多语言支持<br>
  * [x] 防止多次推出同一控制器页面<br>
  * [x] [**OC动态添加类、方法列表、属性列表**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/OC%E5%8A%A8%E6%80%81%E6%B7%BB%E5%8A%A0%E7%B1%BB%E3%80%81%E6%96%B9%E6%B3%95%E5%88%97%E8%A1%A8%E3%80%81%E5%B1%9E%E6%80%A7%E5%88%97%E8%A1%A8)<br>
  * [x] 加密相关<br>
    * [**指纹识别**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/BaseObject/TouchID)<br>
    * [**手势解锁**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/AESCrypt-ObjC)<br>
    * [**钥匙串管理**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/KeyChainManager)<br>
    * [**设置手势密码**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/%E8%AE%BE%E7%BD%AE%E6%89%8B%E5%8A%BF%E5%AF%86%E7%A0%81)<br>
    * [**图片字符串化（加盐）存取**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/%E5%9B%BE%E7%89%87%E5%AD%97%E7%AC%A6%E4%B8%B2%E5%8C%96%EF%BC%88%E5%8A%A0%E7%9B%90%EF%BC%89%E5%AD%98%E5%8F%96)<br>
    * [**字符串解压缩**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/%F0%9F%87%A8%F0%9F%87%B3ServiceLogic/%E5%8A%9F%E8%83%BD%E6%A8%A1%E5%9D%97/%E5%AD%97%E7%AC%A6%E4%B8%B2%E8%A7%A3%E5%8E%8B%E7%BC%A9)<br>
* 其他
  * [x] **GitHub.workflow**<br>
  * [x] iOS手动打包/脚本打包成`*.ipa`<br>
  * [x] iOS代码块<br>
  * [x] 实用性脚本`*.command`<br>
  * [x] 对`info.plist`的备份<br>

## 三、几点重要说明 

### 1、特别说明 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* xcode对中文的兼容性非常好，所以可以中文命名路径（比如文件夹名称）

* 经实践证明，如果配置多语言化，那么xcode将会刷新`Info.plist`，<u>导致里面的注释消失</u>。正确的做法是，对`Info.plist`进行备份，随时进行替换

* 工程项目的`Info.plist`文件是对整个工程的配置说明，<u>系统固定读取</u>，所以必须在工程项目根目录的同名文件夹下。否则项目启动会出问题

  ![image-20240706113246025](./assets/image-20240706113246025.png)


### 2、在Apple芯片（目前是M系列）编译失败的解决方案 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>
* 禁用系统完整性保护 (**S**ystem **I**ntegrity **P**rotection, SIP)   <font color=red>**如果不禁用，会对某些文件夹有读写权限控制**</font>
  * 重启MacOS，长按开机键，直到🌏页面，进入恢复模式
  * 在恢复模式的 macOS 实用工具窗口中，选择“实用工具”菜单，然后选择“终端”以打开终端窗口
    ```shell
    csrutil disable
    ```
  * 重启MacOS
  * 在xcode里面做如下设置：<font color=red>**每一个工程下都做检查**</font>
  	因为涉及到xcode的安全设置，所以下列操作只能手动操作，而不能用脚本进行。如果不做设置，很可能编译失败
    ![image-20240628195445480](./assets/image-20240628195445480.png)
    ![image-20240628200436387](./assets/image-20240628200436387.png)
  
  * 文件夹授权
    ```shell
    sudo chown -R $(whoami) 项目目录
    sudo chmod -R u+rw 项目目录
    ```
  * 在`podfile`文件里面，设置：
    ```ruby
    # 用于指定你的 Pod 项目应使用静态库而不是动态库。
    # 这个选项主要用于解决某些与动态库相关的兼容性和性能问题。
    use_frameworks! :linkage => :static
    ```
  * 重新运行`pod`
    ```shell
    pod install
    ```
### 3、iOS模拟器 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 命令行唤起 iOS模拟器

  ```shell
  open -a Simulator
  ```

* 如果更新或者删除xcode，那么下载的iOS模拟器将会丢失

* 模拟器文件通常存储在以下路径

  ```shell
  open ~/Library/Developer/CoreSimulator/Volumes/
  ```

* 备份iOS模拟器文件夹到桌面`Volumes`

  脚本自动化：[**【MacOS】备份iOS模拟器.command**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%E3%80%90MacOS%E3%80%91%E5%A4%87%E4%BB%BDiOS%E6%A8%A1%E6%8B%9F%E5%99%A8.command)

  ```shell
  #!/bin/bash
  
  # 创建桌面上的Volumes文件夹（如果不存在）
  mkdir -p ~/Desktop/Volumes
  # 使用rsync复制目录并显示进度
  sudo rsync -avh --progress /Library/Developer/CoreSimulator/Volumes/ ~/Desktop/Volumes/
  echo "Volumes文件夹已成功复制到桌面。"
  ```

* 还原iOS模拟器（执行完毕后，需要重启xcode）

  脚本自动化：[**【MacOS】恢复iOS模拟器.command**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%E3%80%90MacOS%E3%80%91%E6%81%A2%E5%A4%8DiOS%E6%A8%A1%E6%8B%9F%E5%99%A8.command)
  
  ```shell
  #!/bin/bash
  
  # 确保目标目录存在
  sudo mkdir -p /Library/Developer/CoreSimulator/Volumes
  # 使用rsync复制目录并显示进度
  sudo rsync -avh --progress ~/Desktop/Volumes/ /Library/Developer/CoreSimulator/Volumes/
  echo "桌面的Volumes文件夹内容已成功复制到/Library/Developer/CoreSimulator/Volumes。"
  ```

### 4、`lldb`的使用 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

```shell
(lldb) target list
Current targets:
* target #0: /Users/user/Library/Developer/CoreSimulator/Devices/E17E7DE8-7ADA-42FD-A743-A1A3A6CB7E42/data/Containers/Bundle/Application/C590303C-50A7-4BB2-826F-8598E5F3A66C/JobsOCBaseConfigDemo.app/JobsOCBaseConfigDemo ( arch=x86_64-apple-ios-simulator, platform=ios-simulator, pid=89318, state=stopped )
(lldb) target select 0
Current targets:
* target #0: /Users/user/Library/Developer/CoreSimulator/Devices/E17E7DE8-7ADA-42FD-A743-A1A3A6CB7E42/data/Containers/Bundle/Application/C590303C-50A7-4BB2-826F-8598E5F3A66C/JobsOCBaseConfigDemo.app/JobsOCBaseConfigDemo ( arch=x86_64-apple-ios-simulator, platform=ios-simulator, pid=89318, state=stopped )
```

### 5、`Command Line Tools` <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 查看`Command Line Tools`版本

  ```shell
  Last login: Wed Jul 10 09:58:40 on ttys003
  ➜  Desktop pkgutil --pkg-info=com.apple.pkg.CLTools_Executables
  
  package-id: com.apple.pkg.CLTools_Executables
  version: 15.3.0.0.1.1708646388
  volume: /
  location: /
  install-time: 1719293997
  ```

### 6、xcode 配置 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

#### 6.1、新工程配置

* <font id =Unknown_class_in_Interface_Builder_file>处理编译器警告：**`Unknown class in Interface Builder file`**</font>

  * 错误的原因通常是因为在**Interface Builder**中指定的类名与实际代码中的类名不匹配
  * 在`*.Storyboard`或`*.xib`文件中，选择**View Controller**，查看**Identity Inspector**，确保**Class**字段中的类名拼写正确（这里的处理方式是删除），并且**Module**字段留空或选择正确的模块（通常是你的项目名）。

  ![image-20240715141329097](./assets/image-20240715141329097.png)

#### 6.2、`Arguments Passed On Launch`标签设置

* 设置应用的语言环境

  ```
  AppleLanguages ( "en" )
  ```

* 启用**Core Data SQL**语句调试日志

  ```
  -com.apple.CoreData.SQLDebug 1
  ```

* 忽略应用的保存状态，强制应用在每次启动时都以初始状态运行    <font color=red>**这个参数在调试应用启动问题时很有用**</font>

  ```
  -ApplePersistenceIgnoreState YES
  ```

* 强制应用使用特定的用户界面风格（浅色模式或深色模式）

  ```
  -UIUserInterfaceStyle Light
  -UIUserInterfaceStyle Dark
  ```

* 启用 **Firebase** 调试日志

  ```
  -FIRDebugEnabled
  ```

* 启用`僵尸对象`检测   <font color=red>**帮助调试被释放的对象仍然被访问的问题**</font>

  ```
  -NSZombieEnabled YES
  ```

* 启用视图对齐矩形的可视化   <font color=red>**这可以帮助调试视图布局问题**</font>

  ```
  -UIViewShowAlignmentRects YES
  ```

* 启用 **Foundation** 框架的调试描述

  ```
  -NSDebugDescription YES
  ```

* 启用文档修订调试模式

  ```
  -NSDocumentRevisionsDebugMode YES
  ```

* 启用 CFNetwork 诊断日志。    <font color=red>**这对于调试网络请求问题非常有用**</font>

  ```
  -CFNetworkDiagnosticsEnable 1
  ```

* 强制应用使用特定的文本方向（例如从左到右或从右到左）

  ```
  -AppleTextDirection YES
  ```

#### 6.3、`Environment Variables`标签

* 日志配置：添加一个新的环境变量。将 `Name` 设置为 `IDEPreferLogStreaming`，将 `Value` 设置为 `YES`

  ![image-20240629161626945](./assets/image-20240629161626945.png)

### 7、打印 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

#### 7.1、重写打印输出

* 关注文件：[**MacroDef_Log.h**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/OCBaseConfig/%E5%90%84%E9%A1%B9%E5%85%A8%E5%B1%80%E5%AE%9A%E4%B9%89/%E5%90%84%E9%A1%B9%E5%AE%8F%E5%AE%9A%E4%B9%89/MacroDef_Sys/MacroDef_Log.h)

  * 使之能定位到具体文件行的输出

    ```objective-c
    #pragma mark —— 控制台Log打印格式重写
    #ifndef NSLog
    #define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
    #endif
    ```

  * 使之能简化打印结构体步骤

    ![image-20240703193326163](./assets/image-20240703193326163.png)

    ```objective-c
    #pragma mark —— 打印结构体
    #ifndef JobsLogCGPoint
    #define JobsLogCGPoint(format, ...) NSLog(@"%s = %@", #format, NSStringFromCGPoint(__VA_ARGS__))
    #endif
    
    #ifndef JobsLogCGVector
    #define JobsLogCGVector(format, ...) NSLog(@"%s = %@", #format, NSStringFromCGVector(__VA_ARGS__))
    #endif
    
    #ifndef JobsLogCGSize
    #define JobsLogCGSize(format, ...) NSLog(@"%s = %@", #format, NSStringFromCGSize(__VA_ARGS__))
    #endif
    
    #ifndef JobsLogCGRect
    #define JobsLogCGRect(format, ...) NSLog(@"%s = %@", #format, NSStringFromCGRect(__VA_ARGS__))
    #endif
    
    #ifndef JobsLogCGAffineTransform
    #define JobsLogCGAffineTransform(format, ...) NSLog(@"%s = %@", #format, NSStringFromCGAffineTransform(__VA_ARGS__))
    #endif
    
    #ifndef JobsLogUIEdgeInsets
    #define JobsLogUIEdgeInsets(format, ...) NSLog(@"%s = %@", #format, NSStringFromUIEdgeInsets(__VA_ARGS__))
    #endif
    
    #ifndef JobsLogDirectionalEdgeInsets
    #define JobsLogDirectionalEdgeInsets(format, ...) NSLog(@"%s = %@", #format, NSStringFromDirectionalEdgeInsets(__VA_ARGS__))
    #endif
    
    #ifndef JobsLogOffset
    #define JobsLogOffset(format, ...) NSLog(@"%s = %@", #format, NSStringFromUIOffset(__VA_ARGS__))
    #endif
    ```

* 关注实现类：[**@interface UIView (Extras)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIView/UIView%2BCategory/UIView%2BExtras)

  ![image-20240710102050455](./assets/image-20240710102050455.png)

  * 定义在`View`层

    ```objective-c
    -(jobsByStringBlock _Nonnull)jobsLogFrame;
    -(jobsByStringBlock _Nonnull)jobsLogPoint;
    -(jobsByStringBlock _Nonnull)jobsLogSize;
    ```
  
  * 相关调用

    ```objective-c
    label.jobsLogFrame(@"打印的时候额外添加的标识字符");
    label.jobsLogPoint(@"打印的时候额外添加的标识字符");
    label.jobsLogSize(@"打印的时候额外添加的标识字符");
    ```
  
#### 7.2、利用Runtime的机制打印类的内容

* 返回并打印成员变量列表

  ```objective-c
  -(NSMutableArray <NSString *>*)printIvarList;
  ```

* 返回并打印属性列表

  ```objective-c
  -(NSMutableArray <NSString *>*)printPropertyList;
  ```

* 返回并打印方法列表

  ````objective-c
  -(NSMutableArray <NSString *>*)printMethodList;
  ````

* 返回并打印协议列表

  ```objective-c
  -(NSMutableArray <NSString *>*)printProtocolList;
  ```


### 8、iOS xcode <font color=red>代码块</font>，提升编码效率必备之首选 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 提升编码效率，快用[**快捷键调取代码块**](https://github.com/JobsKit/JobsCodeSnippets)
* 脚本自动化：[**`【MacOS】安装JobsCodeSnippets.command`**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%E3%80%90MacOS%E3%80%91%E5%AE%89%E8%A3%85JobsCodeSnippets.command)

### 9、**手动打包`*.ipa`流程 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>**

* 电脑桌面新建文件夹，并重命名为`payload`

* 真机运行项目（不同设备，不同芯片组，底层指令集不一致）

* 打开项目工程目录下`Products`，里面有个`*.app`

  ![image-20240704113342353](./assets/image-20240704113342353.png)

* 将这个`*.app`复制到刚才电脑桌面新建的`payload`文件夹

* 压缩电脑桌面新建的`payload`文件夹为zip格式的压缩包

* 将这个`zip`格式的压缩包，强行改名`*.ipa`

* 脚本自动化：[**`【MacOS】放在iOS项目工程根目录下，自动打包并输出为ipa文件.command`**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%E3%80%90MacOS%E3%80%91%E6%94%BE%E5%9C%A8iOS%E9%A1%B9%E7%9B%AE%E5%B7%A5%E7%A8%8B%E6%A0%B9%E7%9B%AE%E5%BD%95%E4%B8%8B%EF%BC%8C%E8%87%AA%E5%8A%A8%E6%89%93%E5%8C%85%E5%B9%B6%E8%BE%93%E5%87%BA%E4%B8%BAipa%E6%96%87%E4%BB%B6.command)

### 10、[**<font color=red>`JobsBlock`</font>**](https://github.com/295060456/JobsBlock/blob/main/README.md) <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 背景意义：**统一全局的Block定义，减少冗余代码**

* <font color=blue>**特别说明**</font>：[**<font color=red>`JobsBlock`</font>**](https://github.com/295060456/JobsBlock/blob/main/README.md) 只对原生系统的类进行封装。如果有外源自定义的类，移步[<font color=red>**JobsBlock_Ex**</font>](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/OCBaseConfig/%E5%90%84%E9%A1%B9%E5%85%A8%E5%B1%80%E5%AE%9A%E4%B9%89/%E5%85%B6%E4%BB%96%E7%9A%84%E4%B8%80%E4%BA%9B%E5%85%A8%E5%B1%80%E5%AE%9A%E4%B9%89%E6%96%87%E4%BB%B6/JobsBlock_Ex/JobsBlock_Ex.h)

  * 因为外源自定义的类会引用[**<font color=red>`JobsBlock`</font>**](https://github.com/295060456/JobsBlock/blob/main/README.md)
  * 如果[**<font color=red>`JobsBlock`</font>**](https://github.com/295060456/JobsBlock/blob/main/README.md)再继续引用这些外源自定义类，就会导致循环引用，无法编译
  * 同时，[<font color=red>**JobsBlock_Ex**</font>](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/OCBaseConfig/%E5%90%84%E9%A1%B9%E5%85%A8%E5%B1%80%E5%AE%9A%E4%B9%89/%E5%85%B6%E4%BB%96%E7%9A%84%E4%B8%80%E4%BA%9B%E5%85%A8%E5%B1%80%E5%AE%9A%E4%B9%89%E6%96%87%E4%BB%B6/JobsBlock_Ex/JobsBlock_Ex.h)也不能被全局所包含。<u>在需要用的地方，单独的引入</u>

* ```ruby
  pod 'JobsBlock' # https://github.com/295060456/JobsBlock
  ```

  ![image-20240706110034202](./assets/image-20240706110034202.png)

* <font color=red>因为**CDN**同步的原因，有些第三方pod并不能在[**cocoapods.org**](https://cocoapods.org/)被成功的搜索到，这就导致如果`pod install`拉取不到代码，可能需要切换镜像，然后再进行操作。建议运行项目根目录下的2个脚本文件，自动获取</font>

  * `【MacOS】Pod_Install（适用于IOS工程根目录）.command`
  * `【MacOS】Pod_Update（适用于IOS工程根目录）.command`

### 11、[**<font color=red>`BaseProtocol` 相关继承结构关系图</font>**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/BaseProtocol/BaseProtocol.md) <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* **如果两个对象都继承了共同的协议，互相包含会造成编译器错误**

```mermaid
classDiagram
    NSObject <|-- UIViewModelProtocol
    NSObject <|-- BaseProtocol
    BaseProtocol <|-- AppToolsProtocol
    BaseProtocol <|-- BaseViewProtocol
    BaseViewProtocol <|-- BaseViewControllerProtocol
    BaseViewProtocol <|-- BaseButtonProtocol
    BaseViewProtocol <|-- BaseCellProtocol
    BaseCellProtocol <|-- UITableViewCellProtocol
    BaseCellProtocol <|-- UICollectionViewCellProtocol
    NSObject <|-- NTESVerifyCodeManagerProtocol
    NSObject <|-- ZFDouYinCellDelegate

    class UIViewModelProtocol {
    }
    class BaseProtocol {
    }
    class AppToolsProtocol {
    }
    class BaseViewProtocol {
    }
    class BaseViewControllerProtocol {
    }
    class BaseButtonProtocol {
    }
    class BaseCellProtocol {
    }
    class UITableViewCellProtocol {
    }
    class UICollectionViewCellProtocol {
    }
    class NTESVerifyCodeManagerProtocol {
    }
    class ZFDouYinCellDelegate {
    }
```

### 12、**`UIViewModelFamily`（将持续更新） <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>**

* 产生背景：页面之间传值，只需要瞄准1个<font color=red>**数据束**</font>。当需要增删数据的时候，可以有效减少操作，方便管理
* `UIViewModel`即是页面之间传值的这个<font color=red>**数据束**</font>
* `UITextModel`是专门针对文本的<font color=red>**数据束**</font>
* 结合`BaseProtocol`进行封装
* 减少冗余代码，将公用头文件提升到协议进行定义
```mermaid
classDiagram
class UIViewModelProtocol {
    +@property(nonatomic,strong,nullable)UITextModel *textModel;
    +@property(nonatomic,strong,nullable)UITextModel *subTextModel;
    +@property(nonatomic,strong,nullable)UITextModel *backBtnTitleModel;
    +@property(nonatomic,strong,nullable)UIButtonModel *buttonModel;
    +@property(nonatomic,strong,nullable)UIButtonModel *subButtonModel;
    +@property(nonatomic,strong,nullable)JobsReturnIDByIDBlock jobsBlock;
    +@property(nonatomic,strong,nullable)NSMutableArray <JobsReturnIDByIDBlock>*jobsBlockMutArr;
}
UIPictureAndBackGroundCorProtocol <|-- UIViewModelProtocol
UILocationProtocol <|-- UIViewModelProtocol
UIMarkProtocol <|-- UIViewModelProtocol
UIViewModelOthersProtocol <|-- UIViewModelProtocol
BaseButtonProtocol <|-- UIViewModelProtocol
UITextModelProtocol <|-- UIViewModelProtocol

class UICollectionViewCellProtocol {
    +-(UICollectionView *)jobsGetCurrentCollectionView;
    +-(NSIndexPath *)jobsGetCurrentIndexPath;
    +-(NSInteger)jobsGetCurrentNumberOfSections;
    +-(NSInteger)jobsGetCurrentNumberOfItemsInSection;
    +-(UITextView *)getTextView;
    +-(UIButton *)getBgBtn;
}
BaseCellProtocol <|-- UICollectionViewCellProtocol

class UIMarkProtocol {
    +@property(nonatomic,strong,nullable)NSIndexPath __block *indexPath;
    +@property(nonatomic,assign)NSInteger __block section;
    +@property(nonatomic,assign)NSInteger __block row;
    +@property(nonatomic,assign)NSInteger __block item;
    +@property(nonatomic,assign)CGPoint __block lastPoint;
    +@property(nonatomic,assign)NSInteger __block index;
    +@property(nonatomic,assign)NSInteger __block currentPage;
    +@property(nonatomic,assign)NSInteger __block pageSize;
    +@property(nonatomic,assign)BOOL __block isMark;
    +@property(nonatomic,assign)CGFloat presentUpHeight;
}
NSObject <|-- UIMarkProtocol

class UIPictureAndBackGroundCorProtocol {
    +@property(nonatomic,strong,nullable)UIImage __block *image;
    +@property(nonatomic,strong,nullable)UIImage __block *bgImage;
    +@property(nonatomic,strong,nullable)NSString __block *imageURLString;
    +@property(nonatomic,strong,nullable)NSString __block *bgImageURLString;
    +@property(nonatomic,strong,nullable)UIColor __block *bgCor;
    +@property(nonatomic,strong,nullable)UIImage __block *backBtnIMG;
    +@property(nonatomic,strong,nullable)UIBackgroundConfiguration *bgConfig API_AVAILABLE(ios(14.0), tvos(14.0), watchos(7.0));
    +@property(nonatomic,strong,nullable)UIImage __block *selectedImage;
    +@property(nonatomic,strong,nullable)UIImage __block *bgSelectedImage;
    +@property(nonatomic,strong,nullable)NSString __block *selectedImageURLString;
    +@property(nonatomic,strong,nullable)NSString __block *bgSelectedImageURLString;
    +@property(nonatomic,strong,nullable)UIColor __block *bgSelectedCor;
    +@property(nonatomic,strong,nullable)UIImage __block *backBtnSelectedIMG;
    +@property(nonatomic,strong,nullable)UIBackgroundConfiguration *bgSelectedConfig API_AVAILABLE(ios(14.0), tvos(14.0), watchos(7.0));
    +@property(nonatomic,strong,nullable)UIImageView __block *bgImageView;
}
NSObject <|-- UIPictureAndBackGroundCorProtocol

class BaseViewControllerProtocol {
    +- (void)updateStatusBarCor:(UIColor *_Nullable)cor;
    +-(void)restoreStatusBarCor:(UIColor *_Nullable)cor;
    +-(void)showUserInfo;
    +-(void)setGKNav;
    +-(void)setGKNavBackBtn;
    +@property(nonatomic,weak)UIViewController *fromVC;
    +@property(nonatomic,strong,nullable)SPAlertController *alertController;
    +@property(nonatomic,assign)ComingStyle pushOrPresent;
    +@property(nonatomic,assign)BOOL setupNavigationBarHidden;
    +@property(nonatomic,strong)UIView *statusBar;
}
BaseViewProtocol <|-- BaseViewControllerProtocol

class AppToolsProtocol {
    +-(void)toLoginOrRegister:(CurrentPage)appDoorContentType;
    +-(void)toLogin;
    +-(void)forcedLogin;
    +-(void)popUpViewToLogout;
    +-(UITabBar *)getTabBar;
    +-(void)tabBarClosePan;
    +-(void)tabBarOpenPan;
    +-(void)jumpToHome;
    +-(NSMutableArray <UIViewController *>*)appRootVC;
    +-(BOOL)isRootVC;
    +-(NSString *)encodePicStr:(NSString *)picStr;
    +-(NSString *)decodePicStr:(NSString *)encodePicStr;
    +-(void)openGameWithUrl:(NSString *)url;
    +-(UIImage *)defaultHeaderImage;
    +-(NSString *)currentLanguage;
    +-(HTTPRequestHeaderLanguageType)currentLanguageType;
    +-(void)actionForHotLabel:(JobsHotLabelWithSingleLine *)hl;
}
BaseProtocol <|-- AppToolsProtocol

class UIViewModelOthersProtocol {
    +-(BOOL)jobsVisible;
    +-(void)setJobsVisible:(BOOL)jobsVisible;
    +@property(nonatomic,assign)AppLanguage appLanguage;
    +@property(nonatomic,strong,nullable)Class __block cls;
    +@property(nonatomic,strong,nullable)UIViewModel __block *viewModel;
    +@property(nonatomic,strong,nullable)NSMutableArray <UIViewModel *> __block *viewModelMutArr;
    +@property(nonatomic,strong,nullable)RACSignal __block *reqSignal;
    +@property(nonatomic,strong,nullable)NSString __block *internationalizationKEY;
    +@property(nonatomic,assign)NSUInteger __block jobsTag;
    +@property(nonatomic,assign)BOOL __block jobsSelected;
    +@property(nonatomic,assign)BOOL __block isMultiLineShows;
    +@property(nonatomic,assign)BOOL __block isTranslucent;
    +@property(nonatomic,assign)BOOL __block isVisible;
    +@property(nonatomic,assign)UILabelShowingType labelShowingType;
    +@property(nonatomic,strong,nullable)id __block data;
    +@property(nonatomic,strong,nullable)id __block requestParams;
    +@property(nonatomic,strong,nullable)NSMutableSet __block *jobsDataMutSet;
    +@property(nonatomic,strong,nullable)NSMutableArray __block *jobsDataMutArr;
    +@property(nonatomic,strong,nullable)NSMutableDictionary __block *jobsDataMutDic;
    +@property(nonatomic,strong,nullable)UIColor __block *layerBorderCor;
    +@property(nonatomic,assign)CGFloat __block layerBorderWidth;
    +@property(nonatomic,assign)CGFloat __block layerCornerRadius;
}
NSObject <|-- UIViewModelOthersProtocol

class UITextModelProtocol {
    +@property(nonatomic,assign)NSTextAlignment __block textAlignment;
    +@property(nonatomic,assign)NSLineBreakMode __block lineBreakMode;
    +@property(nonatomic,assign)CGFloat __block textLineSpacing;
    +@property(nonatomic,copy)NSString __block *placeholder;
    +@property(nonatomic,strong)UIColor __block *placeholderColor;
    +@property(nonatomic,assign)NSInteger __block curWordCount;
    +@property(nonatomic,assign)NSInteger __block maxWordCount;
    +@property(nonatomic,strong,nullable)NSString __block *text;
    +@property(nonatomic,strong,nullable)UIFont __block *font;
    +@property(nonatomic,strong,nullable)UIColor __block *textCor;
    +@property(nonatomic,strong,nullable)NSAttributedString __block *attributedText API_AVAILABLE(ios(6.0));
    +@property(nonatomic,strong)NSMutableArray <RichTextConfig *>__block *titleAttributedDataMutArr;
    +@property(nonatomic,strong,nullable)NSString __block *selectedText;
    +@property(nonatomic,strong,nullable)UIFont __block *selectedFont;
    +@property(nonatomic,strong,nullable)UIColor __block *selectedTextCor;
    +@property(nonatomic,strong,nullable)NSAttributedString __block *selectedAttributedText API_AVAILABLE(ios(6.0));
    +@property(nonatomic,strong)NSMutableArray <RichTextConfig *>__block *selectedTitleAttributedDataMutArr;
}
NSObject <|-- UITextModelProtocol

class BaseButtonProtocol {
    +-(void)richElementsInButtonWithModel:(id _Nullable)model;
    ++(CGFloat)buttonWidthWithModel:(id _Nullable)model;
    ++(CGFloat)buttonHeightWithModel:(id _Nullable)model;
    ++(CGSize)buttonSizeWithModel:(id _Nullable)model;
    ++(CGRect)buttonFrameWithModel:(id _Nullable)model;
    +-(CGFloat)buttonWidthWithModel:(id _Nullable)model;
    +-(CGFloat)buttonHeightWithModel:(id _Nullable)model;
    +-(CGSize)buttonSizeWithModel:(id _Nullable)model;
    +-(CGRect)buttonFrameWithModel:(id _Nullable)model;
    +@property(nonatomic,strong)UIFont *titleFont;
    +@property(nonatomic,assign)NSTextAlignment titleAlignment;
    +@property(nonatomic,assign)BOOL jobsSelected;
    +@property(nonatomic,strong)UIImage *normalImage;
    +@property(nonatomic,strong)UIImage *normalBackgroundImage;
    +@property(nonatomic,strong)NSString *normalTitle;
    +@property(nonatomic,strong)NSString *normalSubTitle;
    +@property(nonatomic,strong)UIColor *normalTitleColor;
    +@property(nonatomic,strong)UIColor *normalSubTitleColor;
    +@property(nonatomic,strong)NSAttributedString *normalAttributedTitle;
    +@property(nonatomic,strong)NSAttributedString *normalAttributedSubTitle;
    +@property(nonatomic,strong)UIImage *selectedImage;
    +@property(nonatomic,strong)UIImage *selectedBackgroundImage;
    +@property(nonatomic,strong)NSString *selectedTitle;
    +@property(nonatomic,strong)NSString *selectedSubTitle;
    +@property(nonatomic,strong)UIColor *selectedTitleColor;
    +@property(nonatomic,strong)UIColor *selectedSubTitleColor;
    +@property(nonatomic,strong)NSAttributedString *selectedAttributedTitle;
    +@property(nonatomic,strong)NSAttributedString *selectedAttributedSubTitle;
    +@property(nonatomic,strong)UIColor *btnBackgroundColor;
    +@property(nonatomic,assign)CGSize imageSize;
    +@property(nonatomic,assign)UIControlContentHorizontalAlignment contentHorizontalAlignment;
    +@property(nonatomic,assign)UIControlContentVerticalAlignment contentVerticalAlignment;
    +@property(nonatomic,assign)UIEdgeInsets contentEdgeInsets;
    +@property(nonatomic,readwrite,assign)NSDirectionalEdgeInsets contentInsets;
    +@property(nonatomic,assign)CGFloat contentSpacing;
    +@property(nonatomic,assign)NSLineBreakMode lineBreakMode;
    +@property(nonatomic,assign)CGFloat btnWidth;
    +@property(nonatomic,assign)CGRect textLabelFrame;
    +@property(nonatomic,assign)CGRect subTextLabelFrame;
    +@property(nonatomic,assign)CGRect imageViewFrame;
    +@property(nonatomic,assign)CGSize textLabelSize;
    +@property(nonatomic,assign)CGSize subTextLabelSize;
    +@property(nonatomic,assign)CGSize imageViewSize;
    +@property(nonatomic,assign)CGFloat textLabelWidth;
    +@property(nonatomic,assign)CGFloat subTextLabelWidth;
    +@property(nonatomic,assign)CGFloat imageViewWidth;
    +@property(nonatomic,assign)CGFloat textLabelHeight;
    +@property(nonatomic,assign)CGFloat subTextLabelHeight;
    +@property(nonatomic,assign)CGFloat imageViewHeight;
    +@property(nonatomic,assign)CGFloat textLabelFrameOffsetX;
    +@property(nonatomic,assign)CGFloat textLabelFrameOffsetY;
    +@property(nonatomic,assign)CGFloat textLabelFrameOffsetWidth;
    +@property(nonatomic,assign)CGFloat textLabelFrameOffsetHeight;
    +@property(nonatomic,assign)CGFloat subTextLabelFrameOffsetX;
    +@property(nonatomic,assign)CGFloat subTextLabelFrameOffsetY;
    +@property(nonatomic,assign)CGFloat subTextLabelFrameOffsetWidth;
    +@property(nonatomic,assign)CGFloat subTextLabelFrameOffsetHeight;
    +@property(nonatomic,assign)CGFloat imageViewFrameOffsetX;
    +@property(nonatomic,assign)CGFloat imageViewFrameOffsetY;
    +@property(nonatomic,assign)CGFloat imageViewFrameOffsetWidth;
    +@property(nonatomic,assign)CGFloat imageViewFrameOffsetHeight;
}
BaseViewProtocol <|-- BaseButtonProtocol

class UITableViewCellProtocol {
    ++(instancetype)initTableViewCellWithStyle:(UITableViewCellStyle)style;
    ++(instancetype)cellStyleDefaultWithTableView:(UITableView *)tableView;
    ++(instancetype)cellStyleValue1WithTableView:(UITableView *)tableView;
    ++(instancetype)cellStyleValue2WithTableView:(UITableView *)tableView;
    ++(instancetype)cellStyleSubtitleWithTableView:(UITableView *)tableView;
    ++(void)settingForTableViewCell:(UITableViewCell *)tableViewCell;
    +-(UITableView *)jobsGetCurrentTableView;
    +-(NSIndexPath *)jobsGetCurrentIndexPath;
    +-(NSInteger)jobsGetCurrentNumberOfSections;
    +-(NSInteger)jobsGetCurrentNumberOfRowsInSection;
    +@property(nonatomic,assign)CGRect textLabelFrame;
    +@property(nonatomic,assign)CGRect detailTextLabelFrame;
    +@property(nonatomic,assign)CGRect imageViewFrame;
    +@property(nonatomic,assign)CGSize textLabelSize;
    +@property(nonatomic,assign)CGSize detailTextLabelSize;
    +@property(nonatomic,assign)CGSize imageViewSize;
    +@property(nonatomic,assign)CGFloat textLabelWidth;
    +@property(nonatomic,assign)CGFloat textLabelHeight;
    +@property(nonatomic,assign)CGFloat detailTextLabelWidth;
    +@property(nonatomic,assign)CGFloat detailTextLabelHeight;
    +@property(nonatomic,assign)CGFloat imageViewWidth;
    +@property(nonatomic,assign)CGFloat imageViewHeight;
    +@property(nonatomic,assign)CGFloat textLabelFrameOffsetX;
    +@property(nonatomic,assign)CGFloat textLabelFrameOffsetY;
    +@property(nonatomic,assign)CGFloat textLabelFrameOffsetWidth;
    +@property(nonatomic,assign)CGFloat textLabelFrameOffsetHeight;
    +@property(nonatomic,assign)CGFloat detailTextLabelOffsetX;
    +@property(nonatomic,assign)CGFloat detailTextLabelOffsetY;
    +@property(nonatomic,assign)CGFloat detailTextLabelOffsetWidth;
    +@property(nonatomic,assign)CGFloat detailTextLabelOffsetHeight;
    +@property(nonatomic,assign)CGFloat imageViewFrameOffsetX;
    +@property(nonatomic,assign)CGFloat imageViewFrameOffsetY;
    +@property(nonatomic,assign)CGFloat imageViewFrameOffsetWidth;
    +@property(nonatomic,assign)CGFloat imageViewFrameOffsetHeight;
}
BaseCellProtocol <|-- UITableViewCellProtocol

class BaseCellProtocol {
    +-(void)richElementsInCellWithModel:(id _Nullable)model;
    ++(CGFloat)cellHeightWithModel:(id _Nullable)model;
    ++(CGSize)cellSizeWithModel:(id _Nullable)model;
    +-(void)setCellBgImage:(UIImage *)bgImage;
    +-(UIButton *)getLeftBtn;
    +-(UIButton *)getRightBtn;
}
BaseViewProtocol <|-- BaseCellProtocol

class BaseViewProtocol {
    +-(void)richElementsInViewWithModel:(id _Nullable)model;
    ++(CGFloat)viewWidthWithModel:(id _Nullable)model;
    ++(CGFloat)viewHeightWithModel:(id _Nullable)model;
    ++(CGFloat)heightForFooterInSection:(id _Nullable)model;
    ++(CGFloat)heightForHeaderInSection:(id _Nullable)model;
    ++(CGSize)viewSizeWithModel:(id _Nullable)model;
    ++(CGRect)viewFrameWithModel:(id _Nullable)model;
    ++(CGFloat)viewChangeXWithModel:(id _Nullable)model;
    ++(CGFloat)viewChangeYWithModel:(id _Nullable)model;
    ++(CGFloat)viewChangeWidthWithModel:(id _Nullable)model;
    ++(CGFloat)viewChangeHeightWithModel:(id _Nullable)model;
    ++(CGSize)collectionReusableViewSizeWithModel:(id _Nullable)model;
    ++(CGFloat)widthByData:(UIViewModel *_Nonnull)data;
    ++(CGFloat)heightByData:(UIViewModel *_Nonnull)data;
    +-(CGFloat)viewWidthWithModel:(id _Nullable)model;
    +-(CGFloat)viewHeightWithModel:(id _Nullable)model;
    +-(CGFloat)heightForFooterInSection:(id _Nullable)model;
    +-(CGFloat)heightForHeaderInSection:(id _Nullable)model;
    +-(CGSize)viewSizeWithModel:(id _Nullable)model;
    +-(CGRect)viewFrameWithModel:(id _Nullable)model;
    +-(CGFloat)viewChangeXWithModel:(id _Nullable)model;
    +-(CGFloat)viewChangeYWithModel:(id _Nullable)model;
    +-(CGFloat)viewChangeWidthWithModel:(id _Nullable)model;
    +-(CGFloat)viewChangeHeightWithModel:(id _Nullable)model;
    +-(CGSize)collectionReusableViewSizeWithModel:(id _Nullable)model;
    +-(CGFloat)widthByData:(UIViewModel *_Nonnull)data;
    +-(CGFloat)heightByData:(UIViewModel *_Nonnull)data;
    +-(instancetype)initWithSize:(CGSize)thisViewSize;
    +-(UIViewModel *_Nullable)getViewModel;
    +-(UIView *_Nullable)makeViewOnTableViewHeaderFooterView:(UITableViewHeaderFooterView *)headerFooterView;
    +@property(nonatomic,strong,nullable)JobsReturnIDByIDBlock jobsBackBlock;
    +@property(nonatomic,assign)UIRectCorner layoutSubviewsRectCorner;
    +@property(nonatomic,assign)CGSize layoutSubviewsRectCornerSize;
    +@property(nonatomic,strong)NSMutableArray <MASConstraint *>*constraintMutArr;
    +@property(nonatomic,assign)CGSize thisViewSize;
    +@property(nonatomic,assign)JobsHeaderFooterViewStyle headerFooterViewStyle;
}
BaseProtocol <|-- BaseViewProtocol

class UILocationProtocol {
    +@property(nonatomic,assign)UIInterfaceOrientationMask currentInterfaceOrientationMask;
    +@property(nonatomic,assign)CGFloat __block cornerRadius;
    +@property(nonatomic,assign)UIRectCorner __block rectCorner;
    +@property(nonatomic,assign)CGSize __block cornerRadii;
    +@property(nonatomic,assign)CGFloat __block jobsWidth;
    +@property(nonatomic,assign)CGFloat __block jobsHeight;
    +@property(nonatomic,assign)CGFloat __block jobsTop;
    +@property(nonatomic,assign)CGFloat __block jobsLeft;
    +@property(nonatomic,assign)CGFloat __block jobsRight;
    +@property(nonatomic,assign)CGFloat __block jobsBottom;
    +@property(nonatomic,assign)CGFloat __block jobsOffsetX;
    +@property(nonatomic,assign)CGFloat __block jobsOffsetY;
    +@property(nonatomic,assign)CGSize __block jobsSize;
    +@property(nonatomic,assign)CGRect __block jobsRect;
    +@property(nonatomic,assign)CGPoint __block jobsPoint;
    +@property(nonatomic,assign)UILayoutConstraintAxis __block axis;
    +@property(nonatomic,assign)UIStackViewDistribution __block distribution;
    +@property(nonatomic,assign)UIStackViewAlignment __block alignment;
    +@property(nonatomic,assign)NSDirectionalRectEdge __block buttonEdgeInsetsStyle;
    +@property(nonatomic,assign)CGFloat __block imageTitleSpace;
    +@property(nonatomic,assign)CGFloat __block titleSpace;
    +@property(nonatomic,assign)CGFloat __block cellHeight;
    +@property(nonatomic,assign)CGFloat __block heightForHeaderInSection;
    +@property(nonatomic,assign)CGSize __block cellSize;
    +@property(nonatomic,assign)CGSize __block tableHeaderViewSize;
    +@property(nonatomic,assign)CGSize __block tableFooterViewSize;
    +@property(nonatomic,assign)BOOL __block usesTableViewHeaderView;
    +@property(nonatomic,assign)BOOL __block usesTableViewFooterView;
    +@property(nonatomic,assign)CGFloat __block offsetXForEach;
    +@property(nonatomic,assign)CGFloat __block offsetYForEach;
    +@property(nonatomic,assign)CGFloat __block offsetHeight;
    +@property(nonatomic,assign)CGFloat __block offsetWidth;
}
NSObject <|-- UILocationProtocol

class BaseProtocol {
    +-(void)languageSwitchNotificationWithSelector:(SEL)aSelector;
    +-(void)changeTabBarItemTitle:(NSIndexPath *)indexPath;
    +-(JobsReturnIDByIDBlock _Nonnull)valueForKeyBlock;
    +-(JobsReturnBOOLByIDBlock _Nonnull)isKindOfClassBlock;
    +-(JobsReturnBOOLByIDBlock _Nonnull)isMemberOfClassBlock;
    ++(void)target:(id)target languageSwitchNotificationWithSelector:(SEL)aSelector;
    +-(void)monitorAppLanguage;
    +-(void)languageSwitchNotification:(nonnull NSNotification *)notification;
    ++(void)destroySingleton;
    ++(instancetype)sharedManager;
    +@property(nonatomic,assign)BOOL isLock;
    +@property(nonatomic,strong)RACDisposable *racDisposable;
    +@property(nonatomic,copy)JobsReturnIDByIDBlock keyboardUpNotificationBlock;
    +@property(nonatomic,copy)JobsReturnIDByIDBlock keyboardDownNotificationBlock;
}
NSObject <|-- BaseProtocol
```
### 13、`JobsOCBaseCustomizeUIKitCore` <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 产生背景
  * OC的基类是单继承
  * 继承会产生很多基类，客观上造成代码的冗余
* 解决方案
  * 继承和分类应该结合使用，功能各有优劣
  * 分类即是"超级继承"，不需要产生额外的分类，方便管理和调用

### 14、度量衡 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* [**手机屏幕尺寸大全**](https://www.strerr.com/screen.html)

* 关注文件： [**MacroDef_Size.h**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/OCBaseConfig/%E5%90%84%E9%A1%B9%E5%85%A8%E5%B1%80%E5%AE%9A%E4%B9%89/%E5%90%84%E9%A1%B9%E5%AE%8F%E5%AE%9A%E4%B9%89/MacroDef_Size/MacroDef_Size.h)

* <font color=red>**当设备横竖屏切换的时候，设备宽高定义会互相反转**</font>。 [即，**此时（横屏）的屏幕宽即为垂直屏的高。同样的，此时（横屏）的屏幕高即为垂直屏的宽**](#横屏的时候，较之于竖屏，宽高会互换)

  * 寻找此设备真正的高
    
    ```objective-c
    static inline CGFloat JobsDeviceRealHeight(void){
        return MAX(JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT());
    }
    ```
    
  * 寻找此设备真正的宽
    
    ```objective-c
    static inline CGFloat JobsDeviceRealWidth(void){
        return MIN(JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT());
    }
    ```
    
  * 寻找当前屏幕真正的高
    
    ```objective-c
    static inline CGFloat JobsRealHeight(void){
        return JobsAppTool.currentInterfaceOrientationMask == UIInterfaceOrientationMaskLandscape ? JobsDeviceRealWidth() :JobsDeviceRealHeight();
    }
    ```
    
  * 寻找当前屏幕真正的宽

    ```objective-c
    static inline CGFloat JobsRealWidth(void){
        return JobsAppTool.currentInterfaceOrientationMask == UIInterfaceOrientationMaskLandscape ? JobsDeviceRealHeight() :JobsDeviceRealWidth();
    }
    ```

* **当前设备是否是全面屏**：

  * 关注实现类：[**@interface UIDevice (XMUtils)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIDevice/UIDevice%2BCategory/UIDevice%2BXMUtils) 和 [**MacroDef_Size.h**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/OCBaseConfig/%E5%90%84%E9%A1%B9%E5%85%A8%E5%B1%80%E5%AE%9A%E4%B9%89/%E5%90%84%E9%A1%B9%E5%AE%8F%E5%AE%9A%E4%B9%89/MacroDef_Size/MacroDef_Size.h)

    ```objective-c
    +(BOOL)isFullScreen;
    ```

* **全局比例尺**
  
  * ```objective-c
    static inline CGFloat JobsWidth(CGFloat width){
        return (JobsDeviceRealWidth() / 375) * width;
    }
    ```
    
  * ```objective-c
    static inline CGFloat JobsHeight(CGFloat height){
        return (JobsDeviceRealHeight() / 743) * height;
    }
    ```
  
* **安全距离**
  
  * 顶部的安全距离
  
    ```objective-c
    static inline CGFloat JobsTopSafeAreaHeight(void){
        if (@available(iOS 11.0, *)) {
            return jobsGetMainWindow().safeAreaInsets.top;
        } else return 0.f;
    }
    ```
  
  * 底部的安全距离：全面屏手机为**34pt**，非全面屏手机为**0pt** 
  
    ```objective-c
    static inline CGFloat JobsBottomSafeAreaHeight(void){
        if (@available(iOS 11.0, *)) {
            return jobsGetMainWindow().safeAreaInsets.bottom;
        } else return 0.f;
    }
    ```
  
* **状态栏高度**
  
  * `static inline CGFloat JobsStatusBarHeightByAppleIncData(void) `
  
  * ```objective-c
    static inline CGFloat JobsRectOfStatusbar(void){
        SuppressWdeprecatedDeclarationsWarning(
            if (@available(iOS 13.0, *)){
                UIStatusBarManager *statusBarManager = jobsGetMainWindow().windowScene.statusBarManager;
                return statusBarManager.statusBarHidden ? 0 : statusBarManager.statusBarFrame.size.height;
            }else return UIApplication.sharedApplication.statusBarFrame.size.height;);
    }
    ```
  
  * ```objective-c
    static inline CGFloat JobsStatusBarHeight(void){
        if (@available(iOS 11.0, *)) {
            return jobsGetMainWindow().safeAreaInsets.top;
        } else return JobsRectOfStatusbar();
    }
    ```
  
* **导航栏高度**
  * ```objective-c
    static inline CGFloat JobsNavigationHeight(UINavigationController * _Nullable navigationController){
        if (navigationController) {
            return navigationController.navigationBar.frame.size.height;
        }else return 44.f;
    }
    ```
  
* **状态栏 + 导航栏高度**
  * ```objective-c
    /// 非刘海屏：状态栏高度(20.f) + 导航栏高度(44.f) = 64.f
    /// 刘海屏系列：状态栏高度(44.f) + 导航栏高度(44.f) = 88.f
    static inline CGFloat JobsNavigationBarAndStatusBarHeight(UINavigationController * _Nullable navigationController){
        return JobsStatusBarHeight() + JobsNavigationHeight(navigationController);
    }
    ```
  
* **TabBar高度**：全面屏手机比普通手机多34的安全区域
  
  * ```objective-c
    static inline CGFloat JobsTabBarHeight(UITabBarController * _Nullable tabBarController){
        //因为tabbar可以自定义高度，所以这个地方返回系统默认的49像素的高度
        if (tabBarController) {
            return tabBarController.tabBar.frame.size.height;
        }else return 49.f;
    }
    ```
  
  * <font color=red>**包括了底部安全区域的TabBar高度，一般用这个**</font>
  
    ```objective-c
    /// tabbar高度：【包括了底部安全区域的TabBar高度，一般用这个】
    static inline CGFloat JobsTabBarHeightByBottomSafeArea(UITabBarController * _Nullable tabBarController){
        return JobsTabBarHeight(tabBarController) + JobsBottomSafeAreaHeight();
    }
    ```
  
* **除开 tabBarController 和 navigationController 的内容可用区域的大小**
  
  * ```objective-c
    #pragma mark ——  除开 tabBarController 和 navigationController 的内容可用区域的大小
    static inline CGFloat JobsContentAreaHeight(UITabBarController * _Nullable tabBarController,
                                                UINavigationController * _Nullable navigationController){
        CGFloat tabBarHeightByBottomSafeArea = JobsTabBarHeightByBottomSafeArea(tabBarController);
        CGFloat navigationBarAndStatusBarHeight = JobsNavigationBarAndStatusBarHeight(navigationController);
        return JobsMainScreen_HEIGHT(nil) - tabBarHeightByBottomSafeArea - navigationBarAndStatusBarHeight;
    }
    ```

### 15、字符串 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* **富文本字符串的优先级要高于普通字符串。也就意味着，如果调用了富文本字符串，即便将其设置为nil，普通字符串的设置依然不会奏效**

  ```objective-c
  -(UILabel *)titleLab{
      @jobs_weakify(self)
      if(!_titleLab){
          _titleLab = UILabel.new;
          _titleLab.text = NavBarConfig.title;
          if(NavBarConfig.attributedTitle){
              _titleLab.attributedText = NavBarConfig.attributedTitle;
          }
          _titleLab.font = NavBarConfig.font;
          _titleLab.textColor = NavBarConfig.titleCor;
          [self addSubview:_titleLab];
          [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
              make.center.equalTo(self);
              make.height.mas_equalTo(self.height);
          }];
          _titleLab.makeLabelByShowingType(UILabelShowingType_03);
          [self layoutIfNeeded];
          NSLog(@"");
      }return _titleLab;
  }
  ```

#### 15.1、字符串转化

* 关注头文件`JobsString.h`

* 基本数据类型转化成字符串类型

  ```objective-c
  static inline NSString * _Nonnull toStringByInt(int i){
      return [NSString stringWithFormat:@"%d",i];
  }
  
  static inline NSString * _Nonnull toStringByFloat(float i){
      return [NSString stringWithFormat:@"%f",i];
  }
  
  static inline NSString * _Nonnull toStringByDouble(double i){
      return [NSString stringWithFormat:@"%f",i];
  }
  
  static inline NSString * _Nonnull toStringByNSInteger(NSInteger i){
      return [NSString stringWithFormat:@"%ld",(long)i];
  }
  
  static inline NSString * _Nonnull toStringByNSUInteger(NSUInteger i){
      return [NSString stringWithFormat:@"%lu",(unsigned long)i];
  }
  
  static inline NSString * _Nonnull toStringByLong(long i){
      return [NSString stringWithFormat:@"%ld",i];
  }
  
  static inline NSString * _Nonnull toStringByLongLong(long long i){
      return [NSString stringWithFormat:@"%lld",i];
  }
  ```

#### 15.2、<font color=red>**字符串拼接**</font>

* ```objective-c
  -(JobsReturnStringByStringBlock _Nonnull)add{
      return ^(NSString *_Nonnull str) {
          return [self stringByAppendingString:str];
      };
  }
  ```

  ```objective-c
  config_01.targetString = JobsInternationalization(@"编译器自动管理内存地址").add(@"\n");
  ```

#### 15.2、<font color=red>**字符串比较**</font>

* **字符串相等**

  ```objective-c
  -(JobsReturnBoolByIDBlock)isEqualToString{
      @jobs_weakify(self)
      return ^(NSString *data){
          @jobs_strongify(self)
          if ([data isKindOfClass:NSString.class]) {
              return [self isEqualToString:data];
          }return NO;
      };
  }
  ```

* **字符串包含**

  ```objective-c
  -(JobsReturnBoolByIDBlock)containsString{
      @jobs_weakify(self)
      return ^(NSString *data){
          @jobs_strongify(self)
          if ([data isKindOfClass:NSString.class]) {
              return [self containsString:data];
          }return NO;
      };
  }
  ```

#### 15.3、字符串转`NSURL *`

* ```objective-c
  /**
   问题：直接其他地方复制过来的中文字进行网页搜索、或者中文字识别排序等情况的，会出现搜索不到的情况。
   解决方法：可能存在复制源里面的文字带了空白url编码%E2%80%8B，空白编码没有宽度，虽然看不到但是会影响结果无法正确匹配对应的中文字。可以把文字重新url编码即可。
   */
  -(NSString *)urlProtect{
      if ([self containsString:@"\u200B"]) {
          return [self stringByReplacingOccurrencesOfString:@"\u200B" withString:JobsInternationalization(@"")];
      }else return self;
  }
  ```

  ```objective-c
  @"http://47.243.60.31:9200".urlProtect;
  ```

#### 15.4、更多...

### 16、`UILabel`的自适应 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 影响范围：**`UILabe`** 和 **`UIButton`**

* 关键代码

  * ```objective-c
    #ifndef JobsLabelDef_h
    #define JobsLabelDef_h
    typedef enum : NSInteger {
        /// 一行显示。定宽、定高、定字体。多余部分用…表示（省略号的位置由NSLineBreakMode控制）
        UILabelShowingType_01 = 1,
        /// 一行显示。定宽、定高、定字体。多余部分scrollerView
        UILabelShowingType_02,
        /// 一行显示。不定宽、定高、定字体。宽度自适应 【单行：ByFont】
        UILabelShowingType_03,
        /// 一行显示。定宽、定高。缩小字体方式全展示 【单行：ByWidth】
        UILabelShowingType_04,
        /// 多行显示。定宽、不定高、定字体 【多行：ByFont】
        UILabelShowingType_05,
    } UILabelShowingType;// UILabel的显示样式
    #endif /* JobsLabelDef_h */
    ```

  * 作用于 `UILabe` <font color=red>**必须等`UILabe *`的Frame正确刷新加载以后，才可以使用以下方法**</font>

    ```objective-c
    -(jobsByNSIntegerBlock _Nonnull)makeLabelByShowingType;
    ```

  * 作用于 `UIButton` <font color=red>**必须等`UIButton *`的Frame正确刷新加载以后，才可以使用以下方法**</font>

    ```objective-c
    -(jobsByNSIntegerBlock _Nonnull)makeBtnLabelByShowingType;
    ```

* 示例

  ```objective-c
  -(UILabel *)titleLab{
      if(!_titleLab){
          _titleLab = UILabel.new;
          _titleLab.text = JobsInternationalization(@"LOGIN");
          _titleLab.font = bayonRegular(20);
          _titleLab.textColor = JobsCor(@"FFC700");
          [self addSubview:_titleLab];
          [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
              make.centerX.equalTo(self);
              make.top.equalTo(self).offset(JobsWidth(13));
          }];
          _titleLab.makeLabelByShowingType(UILabelShowingType_03);
      }return _titleLab;
  }
  ```

### 17、文件介绍 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 各项宏定义

  ```objective-c
  #import "MacroDef_Size.h"
  #import "MacroDef_App.h"
  #import "MacroDef_Cor.h"
  #import "MacroDef_Func.h"
  #import "MacroDef_Sys.h"
  #import "MacroDef_Font.h"
  #import "MacroDef_String.h"
  #import "MacroDef_Singleton.h"
  #import "MacroDef_Time.h"
  #import "MacroDef_QUEUE.h"
  #import "JobsUserDefaultDefine.h"
  #import "MacroDef_Strong@Weak.h"
  #import "MacroDef_Notification.h"
  #import "MacroDef_Log.h"
  ```

* 全局通知名字符串的管理

  ```objective-c
  #import "JobsOCBaseConfigNotificationManager.h"
  ```

* [**CocoaPods**](https://cocoapods.org/)的头文件管理

  ```objective-c
  #import "DDPods.h"
  #import "DDPodsManual.h"
  ```

* 全局枚举定义

  ```objective-c
  #import "JobsDefineAllEnumHeader.h"
  ```

* **`.pch`**文件

  ```objective-c
  #import "FMPrefixHeader.pch"
  #import "JobsOCBaseConfigDemoPrefixHeader.pch"
  ```

* 储存key值的文件：

  ```objective-c
  #import "APIKey.h"
  ```

* 网络请求的接口的文件

  ```objective-c
  #import "NSObject+URLManager.h
  ```

### 18、输入框（UITextField） <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

#### 18.1、UITextFieldDelegate

* 在文本字段即将开始编辑时调用。返回YES表示允许编辑，返回NO则表示不允许编辑

  ```objective-c
  /// 用途：您可以使用此方法进行输入验证或单元格选择，以决定是否允许用户开始编辑。
  -(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
      return YES;
  }
  ```

* 文本字段已经开始编辑时调用

  ```objective-c
  /// 用途：在此方法中，您可以开始相应的操作，例如更新用户界面（UI），显示工具条等
  -(void)textFieldDidBeginEditing:(UITextField *)textField{
      
  }
  ```

* 在文本字段即将结束编辑时调用。返回YES表示允许结束编辑，返回NO则表示不允许结束编辑

  ```objective-c
  /// 用途：您可以在这里执行验证，例如检查用户输入的有效性
  -(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
      return YES;
  }
  ```

* 文本字段已经结束编辑时调用

  ```objective-c
  /// 用途：在此方法中，可以处理输入完成后的操作，例如更新数据模型或用户界面的状态
  -(void)textFieldDidEndEditing:(UITextField *)textField{
      
  }
  ```

* 文本字段结束编辑时调用，并带有结束原因

  ```objective-c
  /// 用途：可以根据不同的结束原因执行不同的操作
  /// API_AVAILABLE(ios(10.0))
  -(void)textFieldDidEndEditing:(UITextField *)textField
                          reason:(UITextFieldDidEndEditingReason)reason{
  }
  ```
  
* <font color=red id=textField的文本变化监控>**在文本字段的字符将要改变时调用，因为用户输入、删除或粘贴内容。返回YES允许更改，返回NO禁止更改**</font>

  * 对于删除操作，此时的**string**是<u>长度为0个字符单位</u>的空字符
  * 对于空格操作，此时的**string**是<u>长度为1个字符单位</u>的空字符

  ```objective-c
  /// 用途：您可以用于限制输入的字符类型或长度，或实现某些格式化规则
  -(BOOL)textField:(UITextField *)textField
  shouldChangeCharactersInRange:(NSRange)range
  replacementString:(NSString *)string{
      return YES;
  }
  ```

* 在文本字段的选中文本发生改变时调用    <font color=red>**API_AVAILABLE(ios(13.0), tvos(13.0))**</font>

  ```objective-c
  /// 用途：可以用于实时更新相关UI或执行某些操作
  -(void)textFieldDidChangeSelection:(UITextField *)textField{
      
  }
  ```

* 在清除文本字段内容之前调用。返回YES允许清除，返回NO禁止清除

  ```objective-c
  /// 用途：可以用于提示用户、确认清除操作或进行额外的验证。
  -(BOOL)textFieldShouldClear:(UITextField *)textField{
      return YES;
  }
  ```

* 在用户按下**Return**键时调用。返回YES表示处理当前输入（如关闭键盘），返回NO表示不处理

  ```objective-c
  /// 用途：一般用于提交表单，关闭键盘，或进行下一步的输入
  -(BOOL)textFieldShouldReturn:(UITextField *)textField{
      return YES;
  }
  ```

* 在文本字段要展示编辑菜单时调用。可自定义菜单内容    <font color=red>**API_AVAILABLE(ios(16.0))**</font>

  ```objective-c
  /// 用途：可以提供自定义的剪切、复制、粘贴等操作选项
  -(nullable UIMenu *)textField:(UITextField *)textField
    editMenuForCharactersInRange:(NSRange)range
                suggestedActions:(NSArray<UIMenuElement *> *)suggestedActions{
      return nil;
  }
  ```

* 在文本字段即将展示编辑菜单时调用    <font color=red>**API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos, watchos)**</font>

  ```objective-c
  /// 用途：可以在菜单展示前进行动画处理或其他UI调整
  -(void)textField:(UITextField *)textField
  willPresentEditMenuWithAnimator:(id<UIEditMenuInteractionAnimating>)animator{
      
  }
  ```

* 在文本字段即将消失编辑菜单时调用

  ```objective-c
  /// 用途：可以在菜单消失前进行相关清理或动画效果
  /// API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos, watchos)
  -(void)textField:(UITextField *)textField
  willDismissEditMenuWithAnimator:(id<UIEditMenuInteractionAnimating>)animator{
      
  }
  ```

#### 18.2、系统提供的修改接口（子类需要重写以下父类方法）

* **当前文本框聚焦时就会调用**

  ```objective-c
  -(BOOL)becomeFirstResponder{
      return [super becomeFirstResponder];
  }
  ```

* **当前文本框失去焦点时就会调用**

    ```objective-c
    -(BOOL)resignFirstResponder{
        return [super resignFirstResponder];
    }
    ```

* **重写来重置clearButton位置,改变size可能导致button的图片失真**

    ```objective-c
    -(CGRect)clearButtonRectForBounds:(CGRect)bounds{
    	return [super clearButtonRectForBounds:bounds];
    }
    ```

* **leftView——Rect 【键盘弹起会调用此方法】**

    ```objective-c
    -(CGRect)leftViewRectForBounds:(CGRect)bounds{
    	return [super leftViewRectForBounds:bounds];
    }
    ```

* **rightView——Rect 【键盘弹起会调用此方法】**

    ```objective-c
    - (CGRect)rightViewRectForBounds:(CGRect)bounds{
    	return [super rightViewRectForBounds:bounds];
    }
    ```

* **重写改变绘制占位符属性。重写时调用super可以按默认图形属性绘制;若自己完全重写绘制函数，就不用调用super了**

    ```objective-c
    -(void)drawPlaceholderInRect:(CGRect)rect{
    	return [super drawPlaceholderInRect:rect];
    }
    ```

* **重写来重置边缘区域**

    ```objective-c
    -(CGRect)borderRectForBounds:(CGRect)bounds{
        return [super borderRectForBounds:bounds];
    }
    ```

* **重写来重置占位符区域 【键盘弹起会调用此方法】**

    ```objective-c
    -(CGRect)placeholderRectForBounds:(CGRect)bounds{
        return [super placeholderRectForBounds:bounds];
    }
    ```

* **重写来重置文字区域 【未编辑状态下光标的起始位置】【键盘弹起会调用此方法】**

    ```objective-c
    -(CGRect)textRectForBounds:(CGRect)bounds{
        return [super textRectForBounds:bounds];
    }
    ```

* **重写来重置编辑区域【编辑状态下的起始位置】、UIFieldEditor的位置大小【键盘弹起会调用此方法】**

    ```objective-c
    -(CGRect)editingRectForBounds:(CGRect)bounds{
        return [super editingRectForBounds:bounds];
    }
    ```

#### 18.3、有4+1个`TextField`可供继承使用（具体使用方式，查询相关头文件定义）

##### 18.3.1、处理方式：将**UITextField**作为一个子视图加载到一个父容器视图

* 产生背景

  * iOS系统的 **UITextField** 内部其实还有若干子视图，对于这些子视图原则上是不希望我们进行直接访问的，所以在设计之初就没有提供更多的Api对外暴露给我们使用
  * 然而，当我们需要自定义一些UI的时候，因为在`-(void)layoutSubviews`等生命周期方法中是过程值（不准确，不是我们想要的），这个过程值又UI的展开有关，很难定位终值，就会对我们的布局产生纠缠，至少增加思维量和代码厚度，加大接入难度
  * <font color=red>**键盘的弹起和回收也会对这些子视图的frame产生影响**</font>。这让情况变得更加错综复杂
  * 特别的，如果要<u>自定义光标的闪动位置</u>、<u>**TextField**.**leftView**.**frame**</u>、<u>**TextField**.**rightView**.**frame**</u>、<u>清除按钮的frame</u>等功能的话，就会变得很吃力，甚至不可为


  * 现在的做法是将系统的**UITextField**作为一个整体，<u>不再去关心内部的子视图的实现及其布局调整</u>
    * 外界传入的**leftView**替代系统的**TextField**.**leftView**
    * 外界传入的**rightView**替代系统的**TextField**.**rightView**
  * 对**textField**我们只关心2个值
    * 当下输入的文本值
    * 当前**textField**的文本值
  * `placeholder`是针对普通文本。系统原则上不希望我们在这个属性上去过多纠缠文本字体、文本色号，转而考虑`attributedPlaceholder`。但如果一定要对`placeholder`的文本字体、文本色号进行定义，则关注`placeholderColor`、`placeholderFont`

* <font color=red>`JobsTextField`</font>：**BaseView**

  ```objective-c
  -(JobsTextField *)textField{
      if(!_textField){
          _textField = JobsTextField.new;
          _textField.backgroundColor = JobsRedColor;
          // 只针对真实的textField配置
          _textField.realTextFieldBgCor = JobsClearColor;
          _textField.leftViewByOutLineOffset = JobsWidth(4);
          _textField.leftViewByTextFieldOffset = JobsWidth(4);
          _textField.rightViewByTextFieldOffset = JobsWidth(4);
          _textField.rightViewByOutLineOffset = JobsWidth(4);
          _textField.returnKeyType = UIReturnKeyDefault;
          _textField.keyboardAppearance = UIKeyboardAppearanceDefault;
          _textField.keyboardType = UIKeyboardTypeDefault;
          _textField.leftViewMode = UITextFieldViewModeNever;
          _textField.rightViewMode = UITextFieldViewModeNever;
          _textField.leftView = self.textFieldLeftView;
          _textField.rightView = self.textFieldRightView;
          _textField.placeholder = JobsInternationalization(@"wwe");
          _textField.placeholderColor = JobsWhiteColor;
          _textField.placeholderFont = UIFontWeightSemiboldSize(12);
          _textField.attributedPlaceholder = nil;
          _textField.layoutSubviewsRectCorner = UIRectCornerAllCorners;
          _textField.layoutSubviewsRectCornerSize = CGSizeMake(JobsWidth(8), JobsWidth(8));
          // 真实的textField，输入回调（每次输入的字符），如果要当前textField的字符，请取值textField.text
          @jobs_weakify(self)
          [_textField actionReturnObjectBlock:^id _Nullable(id _Nullable data) {
              @jobs_strongify(self)
              NSLog(@"ddf = %@",data);
              return nil;
          }];
          [self addSubview:_textField];
          [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
              make.size.mas_equalTo(CGSizeMake(JobsWidth(148), JobsWidth(28)));
              make.centerY.equalTo(self);
              if (self.vipClassImageView.right >= self.userNameLab.right) {
                  make.left.equalTo(self.vipClassImageView.mas_right).offset(JobsWidth(18));
              }else{
                  make.left.equalTo(self.userNameLab.mas_right).offset(JobsWidth(18));
              }
          }];
          [_textField richElementsInViewWithModel:nil];
          [self layoutIfNeeded];
          // 最外层的UI-描边
          [_textField layerBorderCor:JobsCor(@"#FFD8D8")
                      andBorderWidth:JobsWidth(1)];
          // 最外层的UI-切全角
          [_textField cornerCutToCircleWithCornerRadius:JobsWidth(8)];
      }return _textField;
  }
  ```

  ```objective-c
  -(UIImageView *)textFieldLeftView{
      if(!_textFieldLeftView){
          _textFieldLeftView = UIImageView.new;
          _textFieldLeftView.image = JobsIMG(@"UserLogoTextFieldLeftImage");
          _textFieldLeftView.size = CGSizeMake(JobsWidth(15), JobsWidth(15));
      }return _textFieldLeftView;
  }
  
  -(UIImageView *)textFieldRightView{
      if(!_textFieldRightView){
          _textFieldRightView = UIImageView.new;
          _textFieldRightView.image = JobsIMG(@"UserLogoTextFieldRightImage");
          _textFieldLeftView.size = CGSizeMake(JobsWidth(16), JobsWidth(16));
      }return _textFieldRightView;
  }
  ```

##### 18.3.2、处理方式：**UITextField**的子类

* `CJTextField`：**UITextField**

* `HQTextField`：**CJTextField**：**UITextField**

* `JobsMagicTextField`：**ZYTextField**：**UITextField**

  ```objective-c
  -(JobsMagicTextField *)textField{
      if (!_textField) {
          _textField = JobsMagicTextField.new;
          _textField.delegate = self;
          @jobs_weakify(self)
          [_textField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
              @jobs_strongify(self)
              return self.returnBoolByIDBlock ? self.returnBoolByIDBlock(data) : YES;
          } subscribeNextBlock:^(id _Nullable x) {
              @jobs_strongify(self)
              NSLog(@"MMM = %@",x);
              [self block:self->_textField
                    value:x];
          }];
          [self addSubview:_textField];
          [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
              make.left.top.bottom.equalTo(self);
              make.right.equalTo(self.imageCodeView.mas_left);
          }];
      }return _textField;
  }
  ```

  ```objective-c
  -(void)configTextField{
      _textField.leftView = [UIImageView.alloc initWithImage:self.doorInputViewBaseStyleModel.leftViewIMG];
      _textField.leftViewMode = self.doorInputViewBaseStyleModel.leftViewMode;
      _textField.returnKeyType = self.doorInputViewBaseStyleModel.returnKeyType;
      _textField.keyboardAppearance = self.doorInputViewBaseStyleModel.keyboardAppearance;
      _textField.placeholder = self.doorInputViewBaseStyleModel.placeHolderStr;
      _textField.keyboardType = self.doorInputViewBaseStyleModel.keyboardType;
      _textField.textColor = self.doorInputViewBaseStyleModel.titleStrCor;
      _textField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
      _textField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
      _textField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
      _textField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
      _textField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(17);
      _textField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
      _textField.requestParams = self.textFieldInputModel;
      _textField.animationColor = self.doorInputViewBaseStyleModel.animationColor ? : Cor4;
      _textField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft;
      _textField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(20);
      _textField.moveDistance = self.doorInputViewBaseStyleModel.moveDistance ? : JobsWidth(40);
      _textField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50);
  }
  ```

* `ZYTextField`： **UITextField**

  ```objective-c
  -(ZYTextField *)textField{
     if (!_textField) {
         _textField = ZYTextField.new;
         _textField.delegate = self;
         _textField.textColor = JobsBlackColor;
         _textField.backgroundColor = RGBA_COLOR(245, 245, 245, 1);
         _textField.returnKeyType = UIReturnKeyDefault;
         _textField.keyboardAppearance = UIKeyboardAppearanceDefault;
         _textField.keyboardType = UIKeyboardTypeDefault;
         _textField.rightView = self.titleLab;
         _textField.rightViewMode = UITextFieldViewModeAlways;
         _textField.placeholder = JobsInternationalization(@"打赏的Mata值");
         _textField.placeholderColor = JobsCor(@"#333333");
         _textField.placeholderFont = UIFontWeightRegularSize(12);
  
         _textField.drawPlaceholderInRect = CGRectMake(0, 0, JobsWidth(255 - 20 - 40 - 5), JobsWidth(32));
         _textField.rightViewRectForBounds = CGRectMake(JobsWidth(255 - 20 - 40), JobsWidth(10), JobsWidth(40), JobsWidth(12));
         _textField.placeholderRectForBounds = CGRectMake(JobsWidth(10), JobsWidth(10), JobsWidth(255 - 20 - 40 - 5), JobsWidth(12));
         _textField.textRectForBounds = CGRectMake(JobsWidth(10), 0, JobsWidth(255 - 20 - 40 - 10), 100);
         _textField.editingRectForBounds = CGRectMake(JobsWidth(10), 0, JobsWidth(255 - 20 - 40 - 10), 100);
  
         @jobs_weakify(self)
         [_textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
  //            @jobs_strongify(self)
             return YES;
         } subscribeNextBlock:^(NSString * _Nullable x) {
             @jobs_strongify(self)
             self.textField.text = x;
             [self textFieldBlock:self.textField
                   textFieldValue:x];
         }];
         [_textField cornerCutToCircleWithCornerRadius:JobsWidth(8)];
         [self addSubview:_textField];
         [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
             make.size.mas_equalTo(CGSizeMake(JobsWidth(255), JobsWidth(32)));
             make.centerX.equalTo(self);
             make.top.equalTo(self.titleView.mas_bottom).offset(JobsWidth(10));
         }];
     }return _textField;
  }
  ```

#### 18.4、字符过滤

* 一般情况下，如果要监控输入字符，需要实现相应的`UITextFieldDelegate`方法，某些情况下会比较繁琐，包括但不仅限于下列：

  * 监控**emoji**字符（多个字符组成一个**emoji**字符，且**emoji**字符集还在随时扩充）
  * [**监控输入空格和删除操作**](#textField的文本变化监控)

* 目前最好的字符过滤解决方案：利用[**ReactiveCocoa**](https://github.com/ReactiveCocoa/ReactiveObjC)框架

  * 对[**ReactiveCocoa**](https://github.com/ReactiveCocoa/ReactiveObjC)框架的二次封装，方便对[**ReactiveCocoa**](https://github.com/ReactiveCocoa/ReactiveObjC)框架不熟悉的使用者

    ```objective-c
    -(RACDisposable *)jobsTextFieldEventFilterBlock:(JobsReturnBoolByIDBlock)filterBlock
                                 subscribeNextBlock:(jobsByIDBlock)subscribeNextBlock{
        return [[self.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
            return filterBlock ? filterBlock(value) : YES;
        }] subscribeNext:^(NSString * _Nullable x) {
            if (subscribeNextBlock) subscribeNextBlock(x);
        }];
    }
    ```

  * 最外层的调用方式

    ```objective-c
     @jobs_weakify(self)
     [_textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
    //            @jobs_strongify(self)
         return YES;
     } subscribeNextBlock:^(NSString * _Nullable x) {
         @jobs_strongify(self)
         self.textField.text = x;
         [self textFieldBlock:self.textField
               textFieldValue:x];
     }];
    ```

### 19、[<font color=red>**寻找系统关键变量**</font>](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/OCBaseConfig/%E5%90%84%E9%A1%B9%E5%85%A8%E5%B1%80%E5%AE%9A%E4%B9%89/%E5%90%84%E9%A1%B9%E5%AE%8F%E5%AE%9A%E4%B9%89/MacroDef_Func/MacroDef_Func.h) <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>
* [**寻找当前控制器 **](#寻找当前控制器 )

* 获取**window**

  * 获取<font color=blue>**iOS 13**</font>之前的 **window**

    ```objective-c
    static inline UIWindow *_Nullable jobsGetMainWindowBefore13(void){
        UIWindow *window = nil;
        /// 使用UIApplication的windows属性来获取当前窗口：
        /// 这种方式获取窗口的方式在iOS 13之前是常用的做法
        if (UIApplication.sharedApplication.delegate.window) {
            window = UIApplication.sharedApplication.delegate.window;
        }
        
        if(!window){
            /// 这种获取窗口的方式在iOS 2.0到iOS 13.0版本之间都是可用的
            SuppressWdeprecatedDeclarationsWarning(
                if (UIApplication.sharedApplication.keyWindow) {
                window = UIApplication.sharedApplication.keyWindow;
            });
        }return window;
    }
    ```

    ```objective-c
    static inline UIWindow *_Nullable jobsGetMainWindowBefore13(void);
    ```

  * 获取<font color=blue>**iOS 13**</font>之后的 **window**

    ```objective-c
    static inline UIWindow *_Nullable jobsGetMainWindowAfter13(void){
        UIWindow *mainWindow = nil;
        if (@available(iOS 13.0, *)) {
            for (UIWindowScene* windowScene in UIApplication.sharedApplication.connectedScenes) {
                if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                    for (UIWindow *window in windowScene.windows) {
                        if (window.isKeyWindow) {
                            mainWindow = window;
                            break;
                        }
                    }
                }
                if (mainWindow) {
                    break; // 如果找到主窗口，退出循环
                }else{
                    mainWindow = windowScene.windows.firstObject;
                }
            }
        }return mainWindow;
    }
    ```

    ```objective-c
    static inline UIWindow *_Nullable jobsGetMainWindowAfter13(void);
    ```

  * 获取全系统是的 **window**

    ```objective-c
    static inline UIWindow *_Nullable jobsGetMainWindow(void){
        return UIDevice.currentDevice.systemVersion.floatValue >= 13.0 ? jobsGetMainWindowAfter13() : jobsGetMainWindowBefore13();
    }
    ```

    ```objective-c
    static inline UIWindow *_Nullable jobsGetMainWindow(void);
    ```

  * 获取一个有Size的 **window**

    ```objective-c
    static inline UIWindow *_Nullable jobsGetMainWindowWithSize(void){
        UIWindow *window = nil;
        window = jobsGetMainWindow();
        return CGSizeEqualToSize(CGSizeZero, window.size) ? jobsGetMainWindowBefore13() : window;
    }
    ```

    ```objective-c
    static inline UIWindow *_Nullable jobsGetMainWindowWithSize(void);
    ```

  * 获取 **keyWindowScene**<font color=blue>**iOS 13**</font>版本后可用

    ```objective-c
    static inline UIWindowScene *_Nullable jobsGetkeyWindowScene(void) {
        if(@available(iOS 13.0, *)){
            UIWindowScene *keyWindowScene = (UIWindowScene *)UIApplication.sharedApplication.connectedScenes.allObjects.firstObject;
            return keyWindowScene;
        }else return nil;
    }
    ```
    
    ```objective-c
    static inline UIWindowScene *_Nullable jobsGetkeyWindowScene(void);
    ```

* 寻找**AppDelegate**

  * ```objective-c
    static inline id<UIApplicationDelegate> _Nullable getSysAppDelegate(void){
        return UIApplication.sharedApplication.delegate;
    }
    ```

    ```objective-c
    getSysAppDelegate();
    ```

  * ```objective-c
    AppDelegate *appDelegate;/// 声明，否则 extern AppDelegate *appDelegate;会崩溃
    @interface AppDelegate ()
    
    @end
    ```

    ```c
    extern AppDelegate *appDelegate;
    ```

* 寻找**SceneDelegate**

  * ```objective-c
    static inline id _Nullable getSysSceneDelegate(void){
        id sceneDelegate = nil;
        if (@available(iOS 13.0, *)) {
            sceneDelegate = UIApplication.sharedApplication.connectedScenes.allObjects.firstObject.delegate;
        }return sceneDelegate;
    }
    ```
  
    ```objective-c
    getSysSceneDelegate();
    ```
  
* 读取用户信息

  ```objective-c
  /// 模拟用户数据
  -(void)simulateUserData{
      JobsUserModel *userModel = JobsUserModel.new;
      userModel.userHeaderIMG = JobsIMG(@"用户默认头像");
      userModel.userName = @"张三丰";
      userModel.phone = @"134****0000";
      [self saveUserInfo:userModel];
      
      id f = self.readUserInfo;
      NSLog(JobsInternationalization(@""));
  }
  /// 存取用户信息Demo
  -(void)saveAndReadUserInfoDemo{
      JobsUserModel *userModel = JobsUserModel.new;
      userModel.token = @"12345";
      userModel.uid = @"54321";
      
      [self saveUserInfo:userModel];
      NSLog(JobsInternationalization(@""));
      JobsUserModel *f = [self readUserInfo];
      NSLog(JobsInternationalization(@""));
  }
  ```
  
### 20、[**`JobsTabBarCtrl`-深层次自定义`UITabbar`**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/OCBaseConfig/JobsMixFunc/%E6%B7%B1%E5%BA%A6%E6%8B%93%E5%B1%95%E7%B3%BB%E7%BB%9FUITabBar%E5%85%A8%E5%AE%B6%E6%A1%B6/JobsTabbarCtrl.md) <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 背景介绍
  * 完全继承自系统Api，最大化兼容系统特色
  * 扩展系统的一些方法，丰富使用
* 功能介绍
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

### 21、iOS横竖屏切换 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* [**相关文档：iOS 横竖屏切换**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E6%A8%AA%E5%B1%8FUI%E5%88%87%E6%8D%A2.md/%E6%A8%AA%E5%B1%8FUI%E5%88%87%E6%8D%A2.md)

* <font color=red>**相关经验总结**</font>
  
  * <font id=横屏的时候，较之于竖屏，宽高会互换>**横屏的时候，较之于竖屏，宽高会互换**</font>
  
    ![image-20240721132456126](./assets/image-20240721132456126.png)
  
  * 系统通知`UIDeviceOrientationDidChangeNotification`也是需要服从界面UI的生命周期，否则取值不成功
  
  * 其实系统有2个维度来读取是否横屏
    * 设备真实的方向（定义手机横卧为横屏）
    * 在`AppDelegate`里面，对<font color=green>`- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window`</font>进行了配置。因为是强制性的横屏呈现，所以<font color=red>**优先级最高**</font>
    
  * <font color=red>`- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions`</font> 的执行早于<font color=green>`- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window`</font>
  
  * <font color=green>`- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window`</font> **会执行多次**
  
  * 如果配置了<font color=green>`- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window`</font>为横屏模式（默认为竖屏模式），但是终值为竖屏，**则为错误读取**
  
  * 如果不配置<font color=green>`- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window`</font>为横屏模式（默认为竖屏模式），则以当前设备定位为准
  
  * 对于页面，因为需要自适应调整，那么以靠后的生命周期读取值为准。比如在**viewController**里面`-(void)viewDidAppear:(BOOL)animated`的值为最终系统在综合各种因素后调整后的值。<font color=red>**不要去关心中间值，以终值为准，这样方便定位我们从何时调用方法为有效调用**</font>
  
  * **一般的架构是将`UITabBarController`及其子类作为根控制器，那么在呈现页面的时候，内部会去调整UI适配横竖屏。所以，`UITabBarController`及其子类以及挂载在上面的子控制器，均是需要在页面生命周期走完以后（即，`-(void)viewDidAppear:(BOOL)animated`以后）才能获取到正确的值**
  
  * [**如果锚定`UIDevice.currentDevice.orientation`**](#锚定`UIDevice.currentDevice.orientation`)
    * `UIDevice.currentDevice.orientation`不是总是有效。在应用启动时，设备方向信息有时可能还没有完全初始化，这可能导致得到 `UIDeviceOrientationUnknown`
    * <font color=red>不能配置 </font> <font color=green>`- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window`</font> <font color=red>因为竖屏检测会失败 </font>
    
    * 如果当前控制器为`UITabBarController`及其子类，`-(void)viewDidAppear:(BOOL)animated`生命周期以后（包含），方位数据才正常
    * 如果当前控制器为普通的`UIViewController`及其子类，则全部生命周期正常
    
  * [**如果锚定场景方向`UIInterfaceOrientation`**](#锚定场景方向`UIInterfaceOrientation`)，则需要在相关控制器的`-(void)viewDidAppear:(BOOL)animated`生命周期（包含）以后，才会获取到真正的`UIInterfaceOrientation`
  
  * [**如果锚定`view.traitCollection.verticalSizeClass`**](#锚定`view.traitCollection.verticalSizeClass`)，则需要配置 <font color=green>`- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window`</font> 方可正常检测横竖屏

### 22、<font color=red>**全局工具箱**</font> <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* [**JobsAppTools**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/BaseObject/JobsAppTools) （单例模式）
* [**NSObject+AppTools**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/NSObject%2BCategory/NSObject%2BAppTools) （分类模式）
* [**`FileFolderHandleModel`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/BaseObject/FileFolderHandleTool)：**文件夹操作**
* [**`JobsLoadingImage`**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIImage/JobsLoadingImage)：**图片存取**

### 23、<font color=red>`View` 和 `ViewController`</font> <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 两者都是属于UI层

* 因为`ViewController`里面也包含了一部分数据层，不利于解耦。所以在Flutter中对UI层和数据层进行完全的剥离，即一个UI层带一个状态（State）

* `View`层可以允许初始化方法带参（Frame）。而`ViewController`是控制器，通常铺满整个屏幕，所以不需要带参（Frame）初始化

* 两者的生命周期有很大区别。主要关系到UI布局和进数据

* <font color=red>**因为是继承，所以创建和销毁必须调用父类，否则异常**</font>。<font size=2>因为是ARC模式，所以`-(void)dealloc`方法不需要调用父类</font>

* 一般`View`不会独立存在，会依附于`ViewController`。<font color=red>就要求`ViewController`需要观察是否正常销毁</font>（即，退出页面是否执行`-(void)dealloc`方法）。<font color=blue>如果对象没有成功销毁，会影响数据的写入，且下一次新建对象的时候，会优先执行上一个对象的`-(void)dealloc`方法</font>

#### 23.1、`ViewController`的生命周期

* **初始化方法**`-(instancetype)init`：最早装载本页面数据的时机
    * `- (void)loadView`：**一般在此方法里面装载**本页面的固定数据和刷新的数据（比如网络请求的数据）
    * `- (void)viewDidLoad`：最晚装载本页面数据的时机。**只要本页面没有被销毁，则此方法只执行一次**
    * `-(void)viewWillAppear:(BOOL)animated`：不建议在此生命周期方法及其以后装载本页面的一些固定的数据，刷新的数据（比如网络请求的数据）可以。**只要出现本页面都会走一次**
    * `-(void)viewDidAppear:(BOOL)animated`：同上
    * `-(void)viewWillLayoutSubviews`：页面UI进行调整的时候，都会执行（多次运行，直到UI布局）稳定。**这里取值可能是过程值，有可能不准确**
    * `-(void)viewDidLayoutSubviews `：同上
* 销毁流程
    * `-(void)viewWillDisappear:(BOOL)animated`
    * `-(void)viewDidDisappear:(BOOL)animated`
    * `-(void)dealloc`

#### 23.2、`View`的生命周期

* **初始化方法**`-(instancetype)init`：最根本的初始化方法

  * **初始化方法（带参Frame）**`-(instancetype)initWithFrame:(CGRect)frame`
  * `- (void)layoutSubviews`：只要布局UI，此方法会执行多次，直到UI布局稳定。**这里取值可能是过程值，有可能不准确**
  * `-(void)drawRect:(CGRect)rect`：UI布局完成，进行绘制，**只会执行一次**
  * `- (void)layoutIfNeeded`：<font color=red>如果利用`Masonry`进行布局，不可能马上得到**Frame**值。但是如果需要马上得到**Frame**值，就需要在最顶层的父View上执行`layoutIfNeeded`，在子View上执行得到的值为过程值，可能不准确。</font>

* 销毁流程

  * 如果当前View是单例模式，则需要

    ```objective-c
    static JobsMenuView *JobsMenuViewInstance = nil;
    static dispatch_once_t JobsMenuViewOnceToken;
    + (void)destroyInstance {
        JobsMenuViewOnceToken = 0;
        JobsMenuViewInstance = nil;
    }
    ```

  * ```objective-c
    -(void)dealloc
    ```

### 24、<font color=red>**AppDelegate** 和 **SceneDelegate** </font> <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 在iOS 13及更高版本中，Apple引入了多窗口支持，这意味着一个应用程序可以拥有多个场景（Scene），每个场景都有自己的生命周期和界面

* 这种多场景架构允许应用程序支持多窗口环境，特别是在iPad上，每个窗口可以有自己独立的生命周期和界面

* 一个iOS应用程序App的生命周期里面，只有一个**AppDelegate**实例存在，但是可能有多个**SceneDelegate**实例存在

  * **AppDelegate**：应用程序的委托对象。整个应用程序在其生命周期中只有一个`AppDelegate`实例，负责处理应用程序级别的事件，例如应用程序的启动、终止、后台和前台切换等
  * **SceneDelegate**：场景的委托对象。每个场景都有一个`SceneDelegate`实例，负责处理该场景级别的事件，例如场景的连接、断开、后台和前台切换等。在多窗口应用程序中，可能有多个`SceneDelegate`实例，每个实例对应一个场景

* <font color=red>故，**AppDelegate** 可以设计成为单例</font>

  ```objective-c
  static AppDelegate *AppDelegateInstance = nil;
  static dispatch_once_t AppDelegateOnceToken;
  +(instancetype)sharedManager{
      dispatch_once(&AppDelegateOnceToken, ^{
          AppDelegateInstance = [super allocWithZone:NULL].init;
      });return AppDelegateInstance;
  }
  /// 单例的销毁
  +(void)destroyInstance{
      AppDelegateOnceToken = 0;
      AppDelegateInstance = nil;
  }
  /// 防止外部使用 alloc/init 等创建新实例
  +(instancetype)allocWithZone:(struct _NSZone *)zone{
      dispatch_once(&AppDelegateOnceToken, ^{
          AppDelegateInstance = [super allocWithZone:zone];
      });return AppDelegateInstance;
  }
  
  -(instancetype)copyWithZone:(NSZone *)zone{
      return self;
  }
  
  -(instancetype)mutableCopyWithZone:(NSZone *)zone{
      return self;
  }
  
  -(instancetype)init{
      if (self = [super init]) {
  
      }return self;
  }
  ```

* 关于 **UIWindow ***

  * 每个`SceneDelegate`实例都有自己的`UIWindow`，而不再是通过`AppDelegate`共享一个单独的`UIWindow`实例
  * 即便是单场景App， `SceneDelegate`和 `AppDelegate`都有各自的`UIWindow`
  * `AppDelegate`中的`window`属性在多场景应用中实际上不再被使用。这是为了向后兼容一些现有代码，但在多场景环境下，`AppDelegate`不会处理任何具体的窗口
  * 在多场景架构下，`SceneDelegate`中的`window`是实际显示和管理UI的窗口，而`AppDelegate`中的`window`只是为了兼容老的单窗口应用

* 获取 **AppDelegate**

  * ```objective-c
    UIApplication.sharedApplication.delegate;
    ```

  * ```objective-c
    AppDelegate.sharedManager;
    ```

* 获取 **SceneDelegate**

  * ```objective-c
    if (@available(iOS 13.0, *)) {
    	sceneDelegate = UIApplication.sharedApplication.connectedScenes.allObjects.firstObject.delegate;
    }
    ```

### 26、`UIScrollView` 的滚动生命周期

* 有2种方式驱动滚动效果

  * 用户手动拖拽（拖拽过程的执行生命周期，由上至下。<font color=red>**只会执行一次**</font>）

    * ```objective-c
      -(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
      ```

    * ```objective-c
      -(void)scrollViewWillEndDragging:(UIScrollView *)scrollView 
                          withVelocity:(CGPoint)velocity
                   targetContentOffset:(inout CGPoint *)targetContentOffset
      ```

    * ```objective-c
      -(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                       willDecelerate:(BOOL)decelerate
      ```

  * 代码事件触发，改变`UIScrollView.contentOffset`

* <font color=red>**`- (void)scrollViewDidScroll:(UIScrollView *)scrollView`**</font>

  * 不管是哪种方式驱动的滚动效果，最终都会汇集到这个方法里面
  * 只要在滚动，<font color=red>**这个方法一定会重复多次的调用**</font>
  * 如果开启了分页滚动，即：`UIScrollView.pagingEnabled = YES;`。如果`scrollView.contentOffset.x`为负，<u>最后在这个方法里面会被调整为0</u>
  * 因为这个方法会被反复调用多次，所以一般的逻辑处理，不建议在这里进行处理

### 25、对象间传值比较（**通知**/**Block**/**协议**）<a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

#### 25.1、正向传值一般是通过初始化方法、属性等手段正向传入

#### 25.2、一般重点关注对象的反向传值

* **通知**
  * 万能的上帝模式。但<font color=red>**不建议过分的使用**</font>
  * 有一定的系统开销，在最开始的iOS版本里面，通知的使用是有上限的。后期版本可以无限制的使用
  * 如果对象释放的时候，不手动对其通知进行释放，可能会造成对象内存的溢出。所以，在iOS7以后，即便不写移除通知，系统帮我们解决
* **Block**
  * C语言底层的API，执行效率高。但是<font color=red>**只能单项订阅**</font>，<u>后出现的Block实现会覆盖掉之前的Block实现</u>。即，如果需要多个地方接收到数据，则不行
  * **Block不一定开异步线程**
  * 可以实现类似于内部类的功能
  * <font color=red>**如果数据的发出发和接收方之间存在若干对象，需要层层反向传值，比较冗余**</font>
  * 依附于实例变量，需要关注循环引用的问题
* **协议**
  * **协议也可以提取公共的头文件，作为一个规范，而广泛遵守**
  * 引申出一个中间对象：代理（**Delegate**）
  * 依附于实例变量。**协议同样存在循环引用的问题**
  * 可以多点订阅，解决Block的痛点
  * 容易造成代码割裂。<u>如果修改协议方法的定义，对应的协议方法的实现不会有警告或者报错，会降格为普通方法，会造成代码业务逻辑的变更</u>

#### 25.3、总结

* 一般建议系统级别的用通知。例如：检测键盘、横竖屏...
* 对象间传值一般的业务场景是：需要传值的对象之间至多有一个中间对象。此时建议用Block
* 如果需要涉及到多点订阅，那么使用**通知**或者**协议**

### 26、其他 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* <font color=red>属性化的block可以用**assign**修饰，但是最好用**copy**</font>

* <font color=red>不要在属性上加`__block`</font>。转而是在这个对象上使用`__block`

* <font color=red>属性化的`NSString *`可以用**assign**修饰，但是最好用**copy**</font>

* [**iOS 父视图透明度影响到子视图**](https://blog.csdn.net/ios_xumin/article/details/114263960)

  * 父视图的透明度会影响到其子视图。跟着一起变得半透明

    ```objective-c
    self.view.backgroundColor = UIColor.redColor;
    self.view.alpha = 0.5f;
    ```

  * 避免以上的情况的写法

    ```objective-c
    self.view.backgroundColor = [UIColor.redColor colorWithAlphaComponent:0.5f];
    ```

## 四、架构相关 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

### 1、[**不使用 Storyboard + 使用自定义的控制器（ViewController@1）**](#https://blog.csdn.net/htwhtw123/article/details/125348408) + **不使用多场景**

* 给`AppDelegate.h`添加属性，作为渲染的window

  ```objective-c
  #import <UIKit/UIKit.h>
  #import "ViewController@1.h"
  
  @interface AppDelegate : UIResponder <UIApplicationDelegate>
  @property (strong, nonatomic) UIWindow *window;
  @end
  ```

* `AppDelegate.m`

  ```objective-c
  - (BOOL)application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
      self.window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
      // 创建并设置初始视图控制器为登录界面
      self.window.rootViewController = ViewController_1.new;
      [self.window makeKeyAndVisible];
      self.window.backgroundColor = UIColor.cyanColor;
      NSLog(@"qwer");
      return YES;
  }
  ```

* 删除以下`AppDelegate`里面对多场景的支持代码

  ```objective-c
  #pragma mark - UISceneSession lifecycle
  - (UISceneConfiguration *)application:(UIApplication *)application
  configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession
                                options:(UISceneConnectionOptions *)options {
      // Called when a new scene session is being created.
      // Use this method to select a configuration to create the new scene with.
      return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
  }
  
  
  - (void)application:(UIApplication *)application
  didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
      // Called when the user discards a scene session.
      // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
      // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }
  ```

* 删除`Info.plist`中，关于多场景的键值对

  ```objective-c
  <key>UIApplicationSceneManifest</key>
  <dict>
    <key>UIApplicationSupportsMultipleScenes</key>
    <false/>
    <key>UISceneConfigurations</key>
    <dict>
      <key>UIWindowSceneSessionRoleApplication</key>
      <array>
        <dict>
          <key>UISceneConfigurationName</key>
          <string>Default Configuration</string>
          <key>UISceneDelegateClassName</key>
          <string>SceneDelegate</string>
          <key>UISceneStoryboardFile</key>
          <string>Main</string>
        </dict>
      </array>
    </dict>
  </dict>
  ```

* 删除新建工程默认生成的`ViewController` (或者不包含进工程目录，防止进入编译期)

  ![image-20240715150036945](./assets/image-20240715150036945.png)

* 删除`SceneDelegate.h`和 `SceneDelegate.m`   (或者不包含进工程目录，防止进入编译期)

  ![image-20240715145437169](./assets/image-20240715145437169.png)

* [处理：**`Unknown class ViewController in Interface Builder file.`**](#Unknown_class_in_Interface_Builder_file)

### 2、iOS新建应用使用多场景

* TODO


## 五、代码讲解

### 1、**UIButton.UIButtonConfiguration** <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>
<details id="UIButton">
<summary><strong>点我了解详情</strong></summary>

* 苹果在后续的Api中推出了`UIButtonConfiguration` 来设置UIButton，但是这个新Api会存在几大问题

  * 大多数开发者对这个Api不熟悉
  * <font color=red>**用了新Api以后，老的Api的一些调用方式可能不会起效果**</font>。如果还是按照以前的方式创建，你会发现**UIButton**不正常出现
  * 大多数时候，我们会涉及到富文本。而富文本和普通的文本之间对于控件有优先级。<font color=blue>**富文本的优先级最高**</font>
  * 因为要做兼容处理，但是`UIButtonConfiguration` 的设置环节非常繁琐
  
* 所以，为了应对以上的问题，可以使用快捷键（`init.JobsBtn`）调取代码块来设置 **UIButton**。[**快捷键调取代码块**](https://github.com/JobsKit/JobsCodeSnippets)

  * 得出的 UIButton 是没有约束的，需要自己在外界加
  * 关注实现类：[<font color=blue>**`@implementation UIButton (UI)`**</font>](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIButton/UIButton+Category/UIButton+UI)
  
* [<font color=blue>**`@interface UIButtonModel : BaseModel<BaseButtonProtocol>`**</font>](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/BaseObject/UIViewModelFamily/UIButtonModel)

  * 可以对单个的**UIButton**进行配置
  * 可以批量对**UIButton**进行配置（自带数据源）
  
* 系统配置文件

  * ```objective-c
    @interface UIButtonConfiguration : NSObject <NSCopying, NSSecureCoding>
    ```
  
  * ```objective-c
    @interface UIBackgroundConfiguration : NSObject <NSCopying, NSSecureCoding>
    ```
  
  * ```objective-c
    @interface UIImageConfiguration : NSObject <NSCopying, NSSecureCoding>
    ```
  
    * ```objective-c
      @interface UIImageSymbolConfiguration : UIImageConfiguration
      ```
  
* 新的Api（**UIButtonConfiguration**）不带状态。即以下的带状态的无法配置。全部由**UIButtonConfiguration**接管

  * ```objective-c
    typedef NS_OPTIONS(NSUInteger, UIControlState) {
        UIControlStateNormal       = 0,
        UIControlStateHighlighted  = 1 << 0,                  // used when UIControl isHighlighted is set
        UIControlStateDisabled     = 1 << 1,
        UIControlStateSelected     = 1 << 2,                  // flag usable by app (see below)
        UIControlStateFocused API_AVAILABLE(ios(9.0)) = 1 << 3, // Applicable only when the screen supports focus
        UIControlStateApplication  = 0x00FF0000,              // additional flags available for application use
        UIControlStateReserved     = 0xFF000000               // flags reserved for internal framework use
    };
    ```
  
  * ```objective-c
    - (void)setTitle:(nullable NSString *)title forState:(UIControlState)state;                     // default is nil. title is assumed to be single line
    - (void)setTitleColor:(nullable UIColor *)color forState:(UIControlState)state UI_APPEARANCE_SELECTOR; // default is nil. use opaque white
    - (void)setTitleShadowColor:(nullable UIColor *)color forState:(UIControlState)state UI_APPEARANCE_SELECTOR; // default is nil. use 50% black
    - (void)setImage:(nullable UIImage *)image forState:(UIControlState)state;                      // default is nil. should be same size if different for different states
    - (void)setBackgroundImage:(nullable UIImage *)image forState:(UIControlState)state UI_APPEARANCE_SELECTOR; // default is nil
    - (void)setPreferredSymbolConfiguration:(nullable UIImageSymbolConfiguration *)configuration forImageInState:(UIControlState)state UI_APPEARANCE_SELECTOR API_AVAILABLE(ios(13.0), tvos(13.0), watchos(6.0));
    - (void)setAttributedTitle:(nullable NSAttributedString *)title forState:(UIControlState)state API_AVAILABLE(ios(6.0)); // default is nil. title is assumed to be single line
    
    - (nullable NSString *)titleForState:(UIControlState)state;          // these getters only take a single state value
    - (nullable UIColor *)titleColorForState:(UIControlState)state;
    - (nullable UIColor *)titleShadowColorForState:(UIControlState)state;
    - (nullable UIImage *)imageForState:(UIControlState)state;
    - (nullable UIImage *)backgroundImageForState:(UIControlState)state;
    - (nullable UIImageSymbolConfiguration *)preferredSymbolConfigurationForImageInState:(UIControlState)state API_AVAILABLE(ios(13.0), tvos(13.0), watchos(6.0));
    - (nullable NSAttributedString *)attributedTitleForState:(UIControlState)state API_AVAILABLE(ios(6.0));
    ```
  
* 对配置文件的修改：<font color=red>**必须对配置文件`UIButtonConfiguration *configuration`进行整体的替换**</font>

  * 无效的修改
  
    ```objective-c
    id A = button.configuration.background.image;
    button.configuration.background.image = nil;
    [button updateConfiguration];
    id B = button.configuration.background.image;
    ```
  
  * 有效的修改
  
    ```objective-c
    id A = button.configuration;
    button.configuration = nil;
    [button updateConfiguration];
    id B = button.configuration;
    ```
  
* <font color=red id=用新Api（UIButtonConfiguration）创建一个带富文本的UIButton>**用新Api（UIButtonConfiguration）创建一个带富文本的UIButton**</font>

  ```objective-c
  @property(nonatomic,strong)BaseButton *titleBtn;
  @property(nonatomic,strong)NSMutableArray <NSString *>*richTextMutArr;
  @property(nonatomic,strong)NSMutableArray <RichTextConfig *>*richTextConfigMutArr;
  
  -(BaseButton *)titleBtn{
     if(!_titleBtn){
         @jobs_weakify(self)
         _titleBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                        background:nil
                                                    buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                     textAlignment:NSTextAlignmentCenter
                                                  subTextAlignment:NSTextAlignmentCenter
                                                       normalImage:nil
                                                    highlightImage:nil
                                                   attributedTitle:nil
                                           selectedAttributedTitle:nil
                                                attributedSubtitle:[self richTextWithDataConfigMutArr:self.richTextConfigMutArr]
                                                             title:JobsInternationalization(@"请支付")
                                                          subTitle:nil//Internationalization(@"观看完整教学视频需支付99Mata值")
                                                         titleFont:UIFontWeightBoldSize(18)
                                                      subTitleFont:nil
                                                          titleCor:JobsCor(@"#333333")
                                                       subTitleCor:nil
                                                titleLineBreakMode:NSLineBreakByWordWrapping
                                             subtitleLineBreakMode:NSLineBreakByWordWrapping
                                               baseBackgroundColor:UIColor.whiteColor
                                                      imagePadding:JobsWidth(0)
                                                      titlePadding:JobsWidth(10)
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
             make.height.mas_equalTo(JobsWidth(72));
             make.top.equalTo(self).offset(JobsWidth(20));
             make.centerX.equalTo(self);
         }];
         _titleBtn.makeBtnLabelByShowingType(UILabelShowingType_03);
     }return _titleBtn;
  }
  
  -(NSMutableArray<NSString *> *)richTextMutArr{
     if (!_richTextMutArr) {
         _richTextMutArr = NSMutableArray.array;
         [_richTextMutArr addObject:Internationalization(@"观看完整教学视频需支付")];
         [_richTextMutArr addObject:Internationalization(@"99")];
         [_richTextMutArr addObject:Internationalization(@"Mata值")];
     }return _richTextMutArr;
  }
  
  -(NSMutableArray<RichTextConfig *> *)richTextConfigMutArr{
     if (!_richTextConfigMutArr) {
         _richTextConfigMutArr = NSMutableArray.array;
         {
             RichTextConfig *config_01 = RichTextConfig.new;
             config_01.font = UIFontWeightRegularSize(14);
             config_01.textCor = JobsCor(@"#666666");
             config_01.targetString = self.richTextMutArr[0];
             config_01.paragraphStyle = self.jobsParagraphStyleCenter;
             [_richTextConfigMutArr addObject:config_01];
         }
  
         {
             RichTextConfig *config_02 = RichTextConfig.new;
             config_02.font = UIFontWeightRegularSize(14);
             config_02.textCor = JobsCor(@"#BA9B77");
             config_02.targetString = self.richTextMutArr[1];
             config_02.paragraphStyle = self.jobsParagraphStyleCenter;
             [_richTextConfigMutArr addObject:config_02];
         }
  
         {
             RichTextConfig *config_03 = RichTextConfig.new;
             config_03.font = UIFontWeightRegularSize(14);
             config_03.textCor = JobsCor(@"#666666");
             config_03.targetString = self.richTextMutArr[2];
             config_03.paragraphStyle = self.jobsParagraphStyleCenter;
             [_richTextConfigMutArr addObject:config_03];
         }
     }return _richTextConfigMutArr;
  }
  ```
  
* 对按钮各项属性的设置

  * ```objective-c
    -(jobsByBOOLBlock _Nonnull)makeNewLineShows;
    -(jobsByNSIntegerBlock _Nonnull)titleAlignment;
    -(jobsByFontBlock _Nonnull)titleFont;
    -(jobsByImageBlock _Nonnull)normalImage;
    -(jobsByImageBlock _Nonnull)normalBackgroundImage;
    -(jobsByStringBlock _Nonnull)normalTitle;
    -(jobsByCorBlock _Nonnull)normalTitleColor;
    -(jobsByAttributedStringBlock _Nonnull)normalAttributedTitle;/// 富文本
    ```
  
  * ```objective-c
    -(jobsByImageBlock _Nonnull)selectedImage;
    -(jobsByImageBlock _Nonnull)selectedBackgroundImage;
    -(jobsByStringBlock _Nonnull)selectedTitle;
    -(jobsByCorBlock _Nonnull)selectedTitleColor;
    -(jobsByAttributedStringBlock _Nonnull)selectedAttributedTitle;/// 富文本
    ```
  
  * ```objective-c
    /// 重设Btn的描边：线宽和线段的颜色
    -(jobsByColor_FloatBlock)jobsResetBtnlayerBorderCorAndWidth;
    /// 重设Btn的描边线段的颜色
    -(jobsByCorBlock)jobsResetBtnlayerBorderCor;
    /// 重设Btn的描边线段的宽度
    -(jobsByFloatBlock)jobsResetBtnlayerBorderWidth;
    /// 重设Btn的圆切角
    -(jobsByCGFloatBlock)jobsResetBtnCornerRadiusValue;
    /// 重设Btn主标题的文字内容
    -(jobsByStringBlock)jobsResetBtnTitle;
    /// 重设Btn.Image
    -(jobsByImageBlock)jobsResetBtnImage;
    /// 重设Btn主标题的文字颜色
    -(jobsByCorBlock)jobsResetBtnTitleCor;
    /// 重设Btn主标题的背景颜色
    -(jobsByCorBlock)jobsResetBtnBgCor;
    /// 重设Btn的背景图片
    -(jobsByImageBlock)jobsResetBtnBgImage;
    ```
  
  * ```objective-c
    -(JobsReturnButtonConfigurationByBackgroundBlock _Nonnull)jobsResetBackground API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByImageBlock _Nonnull)jobsResetBackgroundImage API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByCornerStyleBlock _Nonnull)jobsResetCornerStyle API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationBySizeBlock _Nonnull)jobsResetButtonSize API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByMacIdiomStyleBlock _Nonnull)jobsResetMacIdiomStyle API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByBaseBackgroundColorBlock _Nonnull)jobsResetBaseBackgroundColor API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByImageBlock _Nonnull)jobsResetImage API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByImageColorTransformerBlock _Nonnull)jobsResetImageColorTransformer API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByPreferredSymbolConfigurationForImageBlock _Nonnull)jobsResetPreferredSymbolConfigurationForImage API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByShowsActivityIndicatorBlock _Nonnull)jobsResetShowsActivityIndicator API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByActivityIndicatorColorTransformerBlock _Nonnull)jobsResetActivityIndicatorColorTransformer API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByTitleBlock _Nonnull)jobsResetTitle API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByAttributedTitleBlock _Nonnull)jobsResetAttributedTitle API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByTitleTextAttributesTransformerBlock _Nonnull)jobsResetTitleTextAttributesTransformer API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByTitleLineBreakModeBlock _Nonnull)jobsResetTitleLineBreakMode API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByTitleLineBreakModeBlock _Nonnull)jobsResetSubTitleLineBreakMode API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationBySubtitleBlock _Nonnull)jobsResetSubtitle API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByAttributedSubtitleBlock _Nonnull)jobsResetAttributedSubtitle API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationBySubtitleTextAttributesTransformerBlock _Nonnull)jobsResetSubtitleTextAttributesTransformer API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationBySubtitleLineBreakModeBlock _Nonnull)jobsResetSubtitleLineBreakMode API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByIndicatorBlock _Nonnull)jobsResetIndicator API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByIndicatorColorTransformerBlock _Nonnull)jobsResetIndicatorColorTransformer API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByContentInsetsBlock _Nonnull)jobsResetContentInsets API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByImagePlacementBlock _Nonnull)jobsResetImagePlacement API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByImagePaddingBlock _Nonnull)jobsResetImagePadding API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByTitlePaddingBlock _Nonnull)jobsResetTitlePadding API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByTitleAlignmentBlock _Nonnull)jobsResetTitleAlignment API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByAutomaticallyUpdateForSelectionBlock _Nonnull)jobsResetAutomaticallyUpdateForSelection API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByBaseForegroundColorBlock _Nonnull)jobsResetTitleBaseForegroundColor API_AVAILABLE(ios(16.0));
    -(JobsReturnButtonConfigurationByBaseForegroundColorBlock _Nonnull)jobsResetSubTitleBaseForegroundColor API_AVAILABLE(ios(16.0));
    -(jobsByFontBlock _Nonnull)jobsResetTitleFont API_AVAILABLE(ios(16.0));
    -(jobsByFontBlock _Nonnull)jobsResetSubTitleFont API_AVAILABLE(ios(16.0));
    ```
  
* 资料来源：

  * [**UIButtonConfiguration**](https://www.jianshu.com/p/12426709420e)
  * [**Chat GPT 3.5**](https://chatgpt.com/)

 </details>

### 2、倒计时按钮的封装 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 关注实现类 [**@interface UIButton (Timer)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIButton/UIButton+Category/UIButton+Timer)

* 调用示例

  ```objective-c
  @property(nonatomic,strong)UIButton *countDownBtn;
  @property(nonatomic,strong)ButtonTimerConfigModel *btnTimerConfigModel;
  ```

   ```objective-c
   -(UIButton *)countDownBtn{
       if (!_countDownBtn) {
           @jobs_weakify(self)
           _countDownBtn = [UIButton.alloc initWithConfig:self.btnTimerConfigModel
                               longPressGestureEventBlock:nil
                                          clickEventBlock:^id _Nullable(UIButton *_Nullable x) {
               x.selected = !x.selected;
               [self adDidFinish];
               return nil;
           }];
           [self.adView addSubview:_countDownBtn];
            [_countDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(JobsWidth(72));
                make.top.equalTo(self).offset(JobsWidth(20));
                make.centerX.equalTo(self);
            }];
            _countDownBtn.makeBtnLabelByShowingType(UILabelShowingType_03);
           /// 倒计时按钮点击事件
           [_countDownBtn jobsBtnClickEventBlock:^id(UIButton *x) {
               [x startTimer];//选择时机、触发启动
               NSLog(@"🪓🪓🪓🪓🪓 = 获取验证码");
               return nil;
           }];
           /// 定时器跳动的回调
           [_countDownBtn actionObjectBlock:^(id data) {
               @jobs_strongify(self)
               if ([data isKindOfClass:TimerProcessModel.class]) {
                   TimerProcessModel *model = (TimerProcessModel *)data;
                   NSLog(@"❤️❤️❤️❤️❤️%f",model.data.anticlockwiseTime);
               }
               [self adDidFinish];
           }];
       }return _countDownBtn;
   }
   ```
  
  ```objective-c
   -(ButtonTimerConfigModel *)btnTimerConfigModel{
       if (!_btnTimerConfigModel) {
           _btnTimerConfigModel = ButtonTimerConfigModel.new;
           /// 一些通用的设置
           _btnTimerConfigModel.jobsSize = CGSizeMake(JobsWidth(108), JobsWidth(14));
           _btnTimerConfigModel.count = 60;
           _btnTimerConfigModel.showTimeType = ShowTimeType_SS;//时间显示风格
           _btnTimerConfigModel.countDownBtnType = TimerStyle_anticlockwise;/// 逆时针模式（倒计时模式）
           _btnTimerConfigModel.cequenceForShowTitleRuningStrType = CequenceForShowTitleRuningStrType_tail;
           _btnTimerConfigModel.labelShowingType = UILabelShowingType_03;/// 一行显示。不定宽、定高、定字体。宽度自适应 【单行：ByFont】
           _btnTimerConfigModel.secondStr = JobsInternationalization(@"秒后重新发送");
           /// 计时器未开始【静态值】
           _btnTimerConfigModel.readyPlayValue.layerBorderWidth = 0;
           _btnTimerConfigModel.readyPlayValue.layerCornerRadius = JobsWidth(0);
           _btnTimerConfigModel.readyPlayValue.bgCor = JobsClearColor;
           _btnTimerConfigModel.readyPlayValue.layerBorderCor = JobsClearColor;
           _btnTimerConfigModel.readyPlayValue.textCor = JobsCor(@"#333333");
           _btnTimerConfigModel.readyPlayValue.text = JobsInternationalization(@"获取验证码");
           _btnTimerConfigModel.readyPlayValue.font = UIFontWeightRegularSize(14);
           /// 计时器进行中【动态值】
           _btnTimerConfigModel.runningValue.layerBorderWidth = 0;
           _btnTimerConfigModel.runningValue.layerCornerRadius = JobsWidth(0);
           _btnTimerConfigModel.runningValue.bgCor = JobsClearColor;
           _btnTimerConfigModel.runningValue.layerBorderCor = JobsClearColor;
           _btnTimerConfigModel.runningValue.textCor = JobsCor(@"#333333");
           _btnTimerConfigModel.runningValue.text = JobsInternationalization(@"");
           _btnTimerConfigModel.runningValue.font = UIFontWeightRegularSize(14);
  
           /// 计时器结束【静态值】
           _btnTimerConfigModel.endValue.layerBorderWidth = 0;
           _btnTimerConfigModel.endValue.layerCornerRadius = JobsWidth(0);
           _btnTimerConfigModel.endValue.bgCor = JobsClearColor;
           _btnTimerConfigModel.endValue.layerBorderCor = JobsClearColor;
           _btnTimerConfigModel.endValue.textCor = JobsCor(@"#333333");
           _btnTimerConfigModel.endValue.text = JobsInternationalization(@"重新获取");
           _btnTimerConfigModel.endValue.font = UIFontWeightRegularSize(14);
           
       }return _btnTimerConfigModel;
   }
  ```
  
* <font color=red>**倒计时事件触发**</font>
  
  * **对倒计时按钮的倒计时功能进行控制**
  
    * **开始**
    
      ```objective-c
      [self.countDownBtn startTimer];
      ```
    
    * **暂停**

      ```objective-c
      [self.countDownBtn timerSuspend];
      ```

    * **继续**

      ```objective-c
      [self.countDownBtn timerContinue];
      ```

    * **结束**

      ```objective-c
      [self.countDownBtn timerDestroy];
      ```
    
  * **正常的按钮点击事件**
    
    * 主调用中的`clickEventBlock:(JobsReturnIDByIDBlock _Nullable)clickEventBlock`参数
    
    * 和主调用进行剥离，可以在其他地方灵活实现
    
      ```objective-c
      [self.countDownBtn jobsBtnClickEventBlock:^id(UIButton *x) {
         [x startTimer];//选择时机、触发启动
         NSLog(@"🪓🪓🪓🪓🪓 = 获取验证码");
         return nil;
      }];
      ```
    
  * **按钮的长按事件**：
    
    * 因为是低频需求，所以目前只封装在主调用上进行呈现
    * `longPressGestureEventBlock:(JobsSelectorBlock _Nullable)longPressGestureEventBlock`参数

### 3、**Masonry** 的一些使用技巧 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 关注实现类：[**@interface UIView (Masonry)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIView/UIView+Category/UIView+Masonry)

* ```objective-c
  [self.chatBubbleIMGV addSubview:_chatContentLab];
  [_chatContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
      make.edges.equalTo(self.chatBubbleIMGV).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
  }];
  ```

<details id="Masonry约束动画<br>">
 <summary><strong>点我了解详情：Masonry约束动画<br></strong></summary>
```objective-c
-(MSMineView2 *)view2{
    if(!_view2){
        _view2 = MSMineView2.new;
        [_view2 richElementsInViewWithModel:nil];
        [self addSubview:_view2];
        [_view2 jobsMasonryBeforeBlock:^(MASConstraintMaker * _Nonnull make) {
            // 添加第一个 _view2 的约束
            make.width.mas_equalTo(0);
            make.height.mas_equalTo([MSMineView2 viewSizeWithModel:nil].height);
            make.right.equalTo(self).offset(JobsWidth(-10));
            make.top.equalTo(self).offset(JobsWidth(10));
        }
                     masonryAfterBlock:^(MASConstraintMaker * _Nonnull make) {
            // 添加第二个 _view2 的约束
            make.size.mas_equalTo([MSMineView2 viewSizeWithModel:nil]);
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(JobsWidth(10));
        }];
        [_view2 cornerCutToCircleWithCornerRadius:[MSMineView2 viewSizeWithModel:nil].height / 2];
    }return _view2;
}
```
</details>

### 4、退出`ViewController`的时候，需要做的操作 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

<details id="退出ViewController的时候，需要做的操作">
 <summary><strong>点我了解详情</strong></summary>

* 定义于`BaseViewProtocol`，因为是进数据，所以可以实现在控制器生命周期的任意处

  ```objective-c
   @jobs_weakify(self)
   self.jobsBackBlock = ^id _Nullable(id _Nullable data) {
       @jobs_strongify(self)
       NSLog(@"退出页面的逻辑");
       return nil;
   };
  ```

* 也可以在具体的子控制器覆写下列方法

  ```objective-c
  -(void)backBtnClickEvent:(UIButton *_Nullable)sender;
  ```
  
  ```objective-c
  ///【子类需要覆写 】创建返回键的点击事件
  -(void)backBtnClickEvent:(UIButton *_Nullable)sender{
      if (self.jobsBackBlock) self.jobsBackBlock(sender);
      switch (self.pushOrPresent) {
          case ComingStyle_PRESENT:{
              [self dismissViewControllerAnimated:YES completion:nil];
          }break;
          case ComingStyle_PUSH:{
              self.navigationController ? [self.navigationController popViewControllerAnimated:YES] : [self dismissViewControllerAnimated:YES completion:nil];
          }break;
              
          default:
              break;
      }
  }
  ```

</details>

### 5、实例对象的weak化，避免循环引用 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>
<details id="相关定义">
<summary><strong>点我了解详情：相关定义</strong></summary>

```objective-c
#ifndef MacroDef_Strong_Weak_h
#define MacroDef_Strong_Weak_h

/** 强弱引用
    Uses
    UIView *view;
    UIButton *btn;

    @jobs_weakify(view)
    weak_view.size;
    @jobs_weakify(btn)
    weak_btn.frame

 # 能用@符号进行调用的根本原因：来自GPT-3.5的回答
    在如下的宏定义中：
    @符号可以用于调用的原因是因为宏内部实际上不包含Objective-C代码块，而是包含了一个函数调用，
    这个函数调用是Objective-C代码中的一个有效表达式。
 */
#ifndef jobs_weakify
#if DEBUG
#if __has_feature(objc_arc)
#define jobs_weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define jobs_weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define jobs_weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define jobs_weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef jobs_strongify
#if DEBUG
#if __has_feature(objc_arc)
#define jobs_strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define jobs_strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define jobs_strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define jobs_strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#endif /* MacroDef_Strong_Weak_h */
```

</details>

<details id="使用方式">
 <summary><strong>点我了解详情：使用方式</strong></summary>

 ```objective-c
@jobs_strongify(self)
@jobs_weakify(self)
 ```
</details>

### 6、**使用block，对`@selector`的替代封装，避免方法割裂** <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

<details id="使用block，对selector的封装，避免方法割裂">
 <summary><strong>点我了解详情</strong></summary>

   ```objective-c
 typedef id _Nullable(^JobsReturnIDBySelectorBlock)(id _Nullable weakSelf, id _Nullable arg);
 /// 用block来代替selector
 -(SEL _Nullable)jobsSelectorBlock:(JobsReturnIDBySelectorBlock)selectorBlock{
    return selectorBlocks(selectorBlock,nil,self);
 }
   ```

   ```objective-c
   /// 替代系统 @selector(selector) ,用Block的方式调用代码，使得代码逻辑和形式上不割裂
   /// - Parameters:
   ///   - block: 最终的执行体
   ///   - selectorName: 实际调用的方法名（可不填），用于对外输出和定位调用实际使用的方法
   ///   - target: 执行目标
   SEL _Nullable selectorBlocks(JobsReturnIDBySelectorBlock block,
                                NSString *_Nullable selectorName,
                                id _Nullable target){
       if (!block) {
           toastErr(JobsInternationalization(@"方法不存在,请检查参数"));
           /// 【经常崩溃损伤硬件】 [NSException raise:JobsInternationalization(@"block can not be nil") format:@"%@ selectorBlock error", target];
       }
       /// 动态注册方法：对方法名进行拼接（加盐），以防止和当下的其他方法名引起冲突
       NSString *selName = [NSString stringWithFormat:@"selector_%d_%@",random100__200(),selectorName];
       NSLog(@"selName = %@",selName);
       SEL sel = NSSelectorFromString(selName);
       /**
        方法签名由方法名称和一个参数列表（方法的参数的顺序和类型）组成
        注意：方法签名不包括方法的返回类型。不包括返回值和访问修饰符
        第一个参数是在哪个类中添加方法
        第二个参数是所添加方法的编号SEL
        第三个参数是所添加方法的函数实现的指针IMP
        第四个参数是所添加方法的签名
        */
       NSLog(@"%@",[NSString stringWithFormat:@"%d",random100__200()]);
       if(class_getInstanceMethod([target class], sel)){
           NSLog(@"方法曾经已经被成功添加，再次添加会崩溃");
       }else{
           /// class_addMethod这个方法的实现会覆盖父类的方法实现，但不会取代本类中已存在的实现，如果本类中包含一个同名的实现，则函数会返回NO
           if (class_addMethod([target class],
                               sel,
                               (IMP)selectorImp,
                               "111")) {
               objc_setAssociatedObject(target,
                                        sel,
                                        block,
                                        OBJC_ASSOCIATION_COPY_NONATOMIC);
           }else{
               [NSException raise:JobsInternationalization(@"添加方法失败")
                           format:@"%@ selectorBlock error", target];
           }
       }return sel;
   }
   /// 内部调用无需暴露
   static void selectorImp(id self,
                           SEL _cmd,
                           id arg) {
       JobsReturnIDBySelectorBlock block = objc_getAssociatedObject(self, _cmd);
       @jobs_weakify(self)
       if (block) block(weak_self, arg);
   }
   ```
</details>

#### 6.1、[**对按钮点击事件的使用**](#用新Api（UIButtonConfiguration）创建一个带富文本的UIButton)

#### 6.2、对通知的使用

* 关注实现类：[**`MacroDef_Notification.h`**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/OCBaseConfig/%E5%90%84%E9%A1%B9%E5%85%A8%E5%B1%80%E5%AE%9A%E4%B9%89/%E5%90%84%E9%A1%B9%E5%AE%8F%E5%AE%9A%E4%B9%89/MacroDef_Func/MacroDef_Notification.h)

  ```objective-c
  #ifndef JobsAddNotification
  #define JobsAddNotification(Observer, SEL, NotificationName, Obj)\
  [JobsNotificationCenter addObserver:(Observer) \
                          selector:(SEL) \
                          name:(NotificationName) \
                          object:(Obj)]
  #endif
  ```
  
* 接收通知：

  ```objective-c
  @jobs_weakify(self)
  [NSNotificationCenter.defaultCenter addObserver:self
                                        selector:selectorBlocks(^id _Nullable(id  _Nullable weakSelf,
                                                                              id  _Nullable arg) {
     NSNotification *notification = (NSNotification *)arg;
     if([notification.object isKindOfClass:NSNumber.class]){
         NSNumber *b = notification.object;
         NSLog(@"SSS = %d",b.boolValue);
     }
     @jobs_strongify(self)
     NSLog(@"通知传递过来的 = %@",notification.object);
     return nil;
  }, nil, self)
                                            name:JobsLanguageSwitchNotification
                                          object:nil];
  ```

  ```objective-c
  @jobs_weakify(self)
  JobsAddNotification(self,
                  selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                            id _Nullable arg){
      NSNotification *notification = (NSNotification *)arg;
      if([notification.object isKindOfClass:NSNumber.class]){
          NSNumber *b = notification.object;
          NSLog(@"SSS = %d",b.boolValue);
      }
      @jobs_strongify(self)
      NSLog(@"通知传递过来的 = %@",notification.object);
      return nil;
  },nil, self),JobsLanguageSwitchNotification,nil);
  ```

* 发通知：

  ```objective-c
  [NSNotificationCenter.defaultCenter postNotificationName:LanguageSwitchNotification object:@(NO)];
  ```

### 7、`UIViewModel`的使用 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 将数据束`UIViewModel`绑定到UI中，包括一些UI交互事件

<details id="UIViewModel的使用">
 <summary><strong>对 UICollectionView 点击事件的封UIViewModel+block</strong></summary>

 ```objective-c
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;
 ```
```objective-c
-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        @jobs_weakify(self)

        {
            UITextModel *textModel = UITextModel.new;
            textModel.text = JobsInternationalization(@"Hello");
            textModel.textCor = JobsRedColor;
            textModel.textAlignment = NSTextAlignmentCenter;
            
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel = textModel;
            viewModel.jobsBlock = ^id(id param){
                @jobs_strongify(self)
                NSLog(@"Hello");
                return nil;
            };
            [_dataMutArr addObject:viewModel];
        }

        {
            UITextModel *textModel = UITextModel.new;
            textModel.text = JobsInternationalization(@"OK");
            textModel.textCor = JobsRedColor;
            textModel.textAlignment = NSTextAlignmentCenter;
            
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel = textModel;
            viewModel.jobsBlock = ^id(id param){
                @jobs_strongify(self)
                NSLog(@"OK");
                return nil;
            };
            [_dataMutArr addObject:viewModel];
        }
    }return _dataMutArr;
}
```

```objective-c
/// collectionView 选中操作
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    self.dataMutArr[indexPath.item].jobsBlock(nil);
    /**
     滚动到指定位置
     _collectionView.contentOffset = CGPointMake(0,-100);
     [_collectionView setContentOffset:CGPointMake(0, -200) animated:YES];// 只有在viewDidAppear周期 或者 手动触发才有效
     */
}
```

</details>

### 8、统一注册全局的 `UICollectionViewCell` <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>
* 不注册相对应当`UICollectionViewCell`相关子类，使用时会崩溃

* 系统注册`UICollectionViewCell`相关子类，是利用字符串作为桥梁进行操作

* <font color=red>**注册不会开辟内存，只有当使用的时候才会开辟内存**</font>

* 对全局进行统一的`UICollectionViewCell`相关子类注册是很有必要的，方便管理，防止崩溃

* 关注实现类[<font color=blue>**`@implementation UICollectionView (JobsRegisterClass)`**</font>](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UICollectionView/UICollectionView+Category/UICollectionView+JobsRegisterClass)

* 在每一个`_collectionView`创建的时候，加入以下这一段代码

  ```objective-c
  [_collectionView registerCollectionViewClass];
  ```

### 9、全局的弹出框 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

#### 9.1、全局统一的<font color=red>**提示弹出框**</font>

* 本质是对[**`WHToast`**](https://github.com/remember17/WHToast)的二次封装。其实[**TFPopup**](https://github.com/shmxybfq/TFPopup)也有同样的功能

* 接入方式：

  * `Podfile`
  
    ```ruby
    pod 'WHToast' # https://github.com/remember17/WHToast 一个轻量级的提示控件，没有任何依赖 NO_SMP
    ```
    
  * ```objective-c
    #if __has_include(<WHToast/WHToast.h>)
    #import <WHToast/WHToast.h>
    #else
    #import "WHToast.h"
    #endif
    ```
    
  * 关注实现类：[<font color=blue>**`@implementation NSObject (WHToast)`**</font>](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/NSObject+Category/NSObject+WHToast)
  
    关注实现类：[<font color=blue>**`MacroDef_Func.h`**</font>](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/OCBaseConfig/%E5%90%84%E9%A1%B9%E5%85%A8%E5%B1%80%E5%AE%9A%E4%B9%89/%E5%90%84%E9%A1%B9%E5%AE%8F%E5%AE%9A%E4%B9%89/MacroDef_Func/MacroDef_Func.h)
    
    ```objective-c
    static inline void toast(NSString *_Nullable msg){
        if(!msg || ![msg isKindOfClass:NSString.class]){
            msg = JobsInternationalization(@"数据错误");
        }
        [NSObject jobsToastMsg:JobsInternationalization(msg)];
    }
    ```

#### 9.2、[**TFPopup**](https://github.com/shmxybfq/TFPopup)

* 最底层承接的是一个**UIButton**

* **弹窗消失的时候，挂载的视图一定要销毁，而不是隐藏**

* 对其二次封装，方便使用。关注实现类：[<font color=blue>**`@implementation NSObject (TFPopup)`**</font>](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/NSObject%2BCategory/NSObject%2BTFPopup)

* 接入方式

  * `Podfile`

    ```ruby
    pod 'TFPopup' # https://github.com/shmxybfq/TFPopup 不耦合view代码,可以为已创建过 / 未创建过的view添加弹出方式;只是一种弹出方式;
    ```

  * ```objective-c
    #if __has_include(<TFPopup/TFPopup.h>)
    #import <TFPopup/TFPopup.h>
    #else
    #import "TFPopup.h"
    #endif
    ```

  * ```objective-c
    -(jobsByViewBlock _Nonnull)show_view{
        @jobs_weakify(self)
        return ^(UIView *_Nonnull view) {
            @jobs_strongify(self)
            self.popupParameter.dragEnable = YES;
            self.popupParameter.disuseBackgroundTouchHide = NO;
            [view tf_showSlide:jobsGetMainWindow()
                     direction:PopupDirectionContainerCenter
                    popupParam:self.popupParameter];
        };
    }
    ```

### 10、关于`UIViewController`的一些配置 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

####  10.1、`BaseViewController`

  * 为了方便管理，理论上，全局只应有一个`UIViewController`。开发者不应该创建过多的子控制器

  * 如果在`BaseViewController`无法满足的操作，应该提升到`UIViewController`的分类进行

  * 命名为`BaseViewController`也是充分考虑同业者的偏好习惯

  * 正常情况下，在建立子控制器的时候，为了缩短命名，应该将`ViewController`命名为`VC`

  * 在 `BaseViewController` 里面对导航栏进行二选一的使用

    ```objective-c
    - (void)viewDidLoad {
        [super viewDidLoad];
        
        self.view.backgroundColor = JobsRandomColor;
    //    self.setGKNav(nil);
    //    self.setGKNavBackBtn(nil);
    //    self.gk_navigationBar.jobsVisible = NO;
        
        self.makeNavBarConfig(nil);
        self.navBar.alpha = 1;
        
    //    [self.bgImageView removeFromSuperview];
    }
    ```

#### 10.2、导航栏

##### 10.2.1、[**`GKNavigationBar`**](https://github.com/QuintGao/GKNavigationBar)

* ```ruby
  pod 'GKNavigationBar' # https://github.com/QuintGao/GKNavigationBar NO_SMP
  ```

* 产生的背景和原因

  * 系统原生的`NavigationBar`晦涩难懂不方便修改，很多人理解不深刻容易出问题
  * 系统原生的`NavigationBar`有很多内部类（系统创建但不希望程序员进行直接访问的）。某些版本内部类的图层结构会用有所不同
  * 第三方`GKNavigationBar`因为是分类实现，没有代码入侵性，更加的安全和方便
  * 第三方`GKNavigationBar`更加契合国人的开发思维

* 一般情况下，需要<font color=red>禁用系统的`UINavigationBar`转而用 [**`gk_navigationBar`**](https://github.com/QuintGao/GKNavigationBar)进行替代 </font>

* 分类实现，无代码入侵

* [**`gk_navigationBar`**](https://github.com/QuintGao/GKNavigationBar)没有做到对横屏模式的很好兼容，且没有办法自定义 [**`gk_navigationBar`**](https://github.com/QuintGao/GKNavigationBar)的高度

* 对系统类做了扩充和兼容

  * <font color=blue>**@interface UIBarButtonItem (GKNavigationBar)**</font>
  * <font color=blue>**@interface UIImage (GKNavigationBar)**</font>
  * <font color=blue>**@interface UINavigationController (GKNavigationBar)**</font>
  * <font color=blue>**@interface UINavigationItem (GKNavigationBar)**</font>
  * <font color=blue>**@interface UIViewController (GKNavigationBar)**</font>
  * <font color=red>**@interface GKCustomNavigationBar : UINavigationBar**</font>

* 在这个基础上进行的二次封装

  * 关注实现类：[**`@interface BaseViewController : UIViewController`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/BaseViewController)
  * 关注实现类：[**`@interface UIViewController (BaseVC)`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/UIViewController+Category/UIViewController+Others/UIViewController+BaseVC)

##### 10.2.2、[**JobsNavBar**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/JobsNavBar)

* 适配横屏

* 内部含3个子控件：左按钮/中间的标题/右边的按钮。如果右边希望多个子控件按钮，获取[**JobsNavBar**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/JobsNavBar)以后进行添加

* 可以自定义**NavBar**的高度

* 完全一个新的View，不涉及系统的**UINavigationBar**

* 以分类的方式集成在**UIViewController**层。关注实现类：[**`@interface UIViewController (BaseVC)`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/UIViewController+Category/UIViewController+Others/UIViewController+BaseVC)

* 配置并使用

  * ```objective-c
    self.makeNavBarConfig(nil,nil);
    self.navBar.alpha = 1;
    ```

    ```objective-c
    -(UIButtonModel *)closeBtnModel{
        if(!_closeBtnModel){
            _closeBtnModel = UIButtonModel.new;
            _closeBtnModel.backgroundImage = JobsIMG(@"联系我们");
    //        _closeBtnModel.selected_backgroundImage = JobsIMG(@"联系我们");
    //        _closeBtnModel.normalImage = JobsIMG(@"联系我们");
    //        _closeBtnModel.highlightImage = JobsIMG(@"联系我们");
    //        _closeBtnModel.imagePadding = JobsWidth(5);
            _closeBtnModel.roundingCorners = UIRectCornerAllCorners;
            _closeBtnModel.baseBackgroundColor = JobsClearColor;
        }return _closeBtnModel;
    }
    
    -(UIButtonModel *)backBtnModel{
        if(!_backBtnModel){
            _backBtnModel = UIButtonModel.new;
    //        _backBtnModel.backgroundImage = JobsIMG(@"返回");
    //        _backBtnModel.selected_backgroundImage = JobsIMG(@"返回");
            _backBtnModel.normalImage = JobsIMG(@"返回");
            _backBtnModel.highlightImage = JobsIMG(@"返回");
            _backBtnModel.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
            _backBtnModel.title = self.viewModel.backBtnTitleModel.text;
            _backBtnModel.titleCor = JobsBlackColor;
            _backBtnModel.selected_titleCor = JobsBlackColor;
            _backBtnModel.roundingCorners = UIRectCornerAllCorners;
            _backBtnModel.imagePlacement = NSDirectionalRectEdgeLeading;
            _backBtnModel.imagePadding = JobsWidth(5);
            @jobs_weakify(self)
            _backBtnModel.longPressGestureEventBlock = ^(id  _Nullable weakSelf,
                                                         id  _Nullable arg) {
                NSLog(@"按钮的长按事件触发");
            };
            _backBtnModel.clickEventBlock = ^id(BaseButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
                self.backBtnClickEvent(x);
                return nil;
            };
        }return _backBtnModel;
    }
    
    -(JobsReturnNavBarConfigByButtonModelBlock)makeNavBarConfig{
        @jobs_weakify(self)
        return ^(UIButtonModel *_Nullable backBtnModel,
                 UIButtonModel *_Nullable closeBtnModel) {
            @jobs_strongify(self)
            JobsNavBarConfig *_navBarConfig = JobsNavBarConfig.new;
            _navBarConfig.bgCor = self.viewModel.navBgCor;
            _navBarConfig.bgImage = self.viewModel.navBgImage;
            _navBarConfig.attributedTitle = self.viewModel.backBtnTitleModel.attributedText;
            _navBarConfig.title = self.viewModel.textModel.text;
            _navBarConfig.font = self.viewModel.textModel.font;
            _navBarConfig.titleCor = self.viewModel.textModel.textCor;
            _navBarConfig.backBtnModel = backBtnModel ? : self.backBtnModel;
            _navBarConfig.closeBtnModel = closeBtnModel ? : self.closeBtnModel;
            self.navBarConfig = _navBarConfig;
            return _navBarConfig;
        };
    }
    ```

#### 10.3、推控制器

  * 关注实现类：[**`@interface NSObject (Extras)`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/NSObject%2BCategory/NSObject%2BExtras)

    ```objective-c
    /// 强制以Push的方式展现页面
    /// @param toPushVC 需要进行展现的页面
    /// @param requestParams 正向推页面传递的参数
    /// 如果想用AppDelegate的自定义TabbarVC：
    /// extern AppDelegate *appDelegate;
    /// (UIViewController *)appDelegate.tabBarVC;
    -(void)forceComingToPushVC:(UIViewController *_Nonnull)toPushVC
                 requestParams:(id _Nullable)requestParams;
    /// 强制以Present的方式展现页面
    /// @param toPresentVC 需要进行展现的页面
    /// @param requestParams 正向推页面传递的参数
    /// @param completion 完成Present动作以后得动作
    -(void)forceComingToPresentVC:(UIViewController *_Nonnull)toPresentVC
                    requestParams:(id _Nullable)requestParams
                       completion:(void (^ __nullable)(void))completion;
    ```
    
  * 关注实现类：[**`@interface UIViewController (BaseVC)`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/UIViewController%2BCategory/UIViewController%2BOthers/UIViewController%2BBaseVC)

    ```objective-c
    #pragma mark —— present
    /// 简洁版强制present展现一个控制器页面【不需要正向传参】
    -(void)comingToPresentVC:(UIViewController *_Nonnull)viewController;
    /// 简洁版强制present展现一个控制器页面【需要正向传参】
    -(void)comingToPresentVC:(UIViewController *_Nonnull)viewController
               requestParams:(id _Nullable)requestParams;
    #pragma mark —— push
    /// 简洁版强制展现一个控制器页面【不需要正向传参】
    -(void)comingToPushVC:(UIViewController *_Nonnull)viewController;
    /// 简洁版强制展现一个控制器页面【需要正向传参】
    -(void)comingToPushVC:(UIViewController *_Nonnull)viewController
            requestParams:(id _Nullable)requestParams;
    ```
    
    ```objective-c
    /**
     ❤️【强制推控制器】❤️
     1、自定义是PUSH还是PRESENT展现控制器，如果自定义PUSH但是navigationController不存在，则换用PRESENT展现控制器
     2、定位于@implementation UINavigationController (SafeTransition)，交换系统的push方法，防止某些情况下系统资源紧张导致的多次推控制器
     @param fromVC 从A控制器（上一个页面）
     @param toVC  推到B控制器 （下一个页面）
     @param comingStyle 自定义展现的方式
     @param presentationStyle  如果是PRESENT情况下的一个系统参数设定
     @param requestParams  A控制器—>B控制器，正向传值
     @param hidesBottomBarWhenPushed 跳转子页面的时候隐藏tabbar
     @param animated  是否动画展现
     @param successBlock 在推控制器之前，反向block(B控制器），以便对B控制器的一些自定义修改
     */
    +(instancetype _Nullable)comingFromVC:(UIViewController *_Nonnull)fromVC
                                     toVC:(UIViewController *_Nonnull)toVC
                              comingStyle:(ComingStyle)comingStyle
                        presentationStyle:(UIModalPresentationStyle)presentationStyle
                            requestParams:(id _Nullable)requestParams
                 hidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed
                                 animated:(BOOL)animated
                                  success:(jobsByIDBlock _Nullable)successBlock;
    ```

  #### 10.4、[**`UIViewController`转场动画的使用方法**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/UIViewController%2BCategory/UIViewController%2BXLBubbleTransition/UIViewController%2BXLBubbleTransition.md/UIViewController%2BXLBubbleTransition.md)

  * 关注实现类：[**@interface UIViewController (XLBubbleTransition)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/UIViewController%2BCategory/UIViewController%2BXLBubbleTransition)

#### 10.5、<font color=red>**悬浮视图**</font>

  * 以分类的方式，定义在`view`层，针对全局所有的`UIView *`

    * 关注实现类：[**@interface UIViewController (SuspendBtn)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/UIViewController+Category/UIViewController+Others/UIViewController+SuspendBtn)
    * 关注实现类：[**@interface UIView (SuspendView)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIView/UIView+Category/UIView+SuspendView)

  * 使用方法

    * **在需要作用的UIView的子类**

      * 关键代码（外界传进来的，父承接的VC）：<font color=red>self.vc = self.vcer;</font>
      * 关键代码（是否允许拖动手势 <font color=red>= isAllowDrag</font>）：<font color=red>self.panRcognize.enabled = YES;</font>

      ```objective-c
      -(void)drawRect:(CGRect)rect{
           [super drawRect:rect];
      	   //开启悬浮效果
           if (self.isSuspend) {
               self.vc = self.vcer;//外界传进来的，父承接的VC
               self.panRcognize.enabled = YES;
           }else{
               self.vc = nil;
           }
       }
      ```

    * 在某个控制器上添加某个悬浮视图（按钮为例）

      * 关键代码：<font color=red>self.view.vc = weak_self;</font>
      * 关键代码（悬浮效果必须要的参数）：<font color=red>SuspendBtn.isAllowDrag = YES;</font>

      ```objective-c
      -(JobsSuspendBtn *)suspendBtn{
          JobsSuspendBtn *SuspendBtn = Jobs_getAssociatedObject(_suspendBtn);
          if (!SuspendBtn) {
              SuspendBtn = JobsSuspendBtn.new;
              SuspendBtn.normalImage = JobsIMG(@"旋转");
              SuspendBtn.isAllowDrag = YES;//悬浮效果必须要的参数
              @jobs_weakify(self)
              [SuspendBtn jobsBtnClickEventBlock:^id(UIButton *x) {
                  @jobs_strongify(self)
                  x.selected = !x.selected;
                  NSLog(@"%@",x.selected ? JobsInternationalization(@"开始旋转") : JobsInternationalization(@"停止旋转"));
      //            [x rotateAnimation:x.selected];
                  if (self.objectBlock) self.objectBlock(x);
                  return nil;
              }];
              self.view.vc = weak_self;
              [self.view addSubview:SuspendBtn];
              SuspendBtn.frame = CGRectMake(JobsMainScreen_WIDTH(nil) - JobsWidth(50) - JobsWidth(5),
                                            JobsMainScreen_HEIGHT(nil) - JobsTabBarHeightByBottomSafeArea(nil) - JobsWidth(100),
                                            JobsWidth(50),
                                            JobsWidth(50));
              [SuspendBtn cornerCutToCircleWithCornerRadius:SuspendBtn.width / 2];
              Jobs_setAssociatedRETAIN_NONATOMIC(_suspendBtn, SuspendBtn)
          }return SuspendBtn;
      }
      ```

####  10.6、防止过多的`presented`模态推出`UIViewController`
  * 关注实现类：[**@interface UIViewController (SafeTransition)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/UIViewController%2BCategory/UIViewController%2BOthers/UIViewController%2BSafeTransition)

#### 10.7、<font color=red id=寻找当前控制器>**寻找当前控制器**</font>

* 关注实现类：[**@interface NSObject (Extras)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/NSObject%2BCategory/NSObject%2BExtras)

  ```objective-c
  -(UIViewController *_Nullable)getCurrentViewControllerFromRootVC:(UIViewController *_Nullable)rootVC;
  -(UIViewController *_Nullable)getCurrentViewController;
  -(UIViewController *_Nullable)jobsGetCurrentViewController
  ```

* 关注实现类：[**@interface UIView (ViewController)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIView/UIView%2BCategory/UIView%2BViewController)

  ```objective-c
  -(UIViewController *_Nullable)currentController;
  ```

### 11、`KVC`的封装 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 关注实现类：[**@interface NSObject (Extras)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/NSObject+Category/NSObject+Extras)

  * 存值

    ```objective-c
    -(jobsByKey_ValueBlock _Nonnull)jobsKVC;
    ```

  * 取值

    ```objective-c
    -(JobsReturnIDByIDBlock _Nonnull)valueForKeyBlock;
    ```

* 使用方法

  ```objective-c
  /// 存值
  UIImageView *headIcon = UIImageView.new;
  headIcon.jobsKVC(@"name", @"John Doe");
  /// 取值
  UIImageView *headIcon = self.valueForKeyBlock(@"headIcon");/// 账户头像
  ```

### 12、**键盘监听** <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 关注实现类：[**`@implementation NSObject (Extras)`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/NSObject+Category/NSObject+Extras)

  ```objective-c
  /// 加入键盘通知的监听者
  -(void)keyboard{
      @jobs_weakify(self)
      /// 键盘的弹出
      JobsAddNotification(self,
                      selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                id _Nullable arg){
          NSNotification *notification = (NSNotification *)arg;
          @jobs_strongify(self)
          NSLog(@"通知传递过来的 = %@",notification.object);
          NSNotificationKeyboardModel *notificationKeyboardModel = NSNotificationKeyboardModel.new;
          notificationKeyboardModel.userInfo = notification.userInfo;
          notificationKeyboardModel.beginFrame = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
          notificationKeyboardModel.endFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
          notificationKeyboardModel.keyboardOffsetY = notificationKeyboardModel.beginFrame.origin.y - notificationKeyboardModel.endFrame.origin.y;// 正则抬起 ，负值下降
          notificationKeyboardModel.notificationName = UIKeyboardWillChangeFrameNotification;
          NSLog(@"KeyboardOffsetY = %f", notificationKeyboardModel.keyboardOffsetY);
       
          if (notificationKeyboardModel.keyboardOffsetY > 0) {
              NSLog(@"键盘抬起");
              if (self.keyboardUpNotificationBlock) self.keyboardUpNotificationBlock(notificationKeyboardModel);
          }else if(notificationKeyboardModel.keyboardOffsetY < 0){
              NSLog(@"键盘收回");
              if (self.keyboardDownNotificationBlock) self.keyboardDownNotificationBlock(notificationKeyboardModel);
          }else{
              NSLog(@"键盘");
          }return nil;
      },nil, self),UIKeyboardWillChangeFrameNotification,nil);
      /// 键盘的回收
      JobsAddNotification(self,
                      selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                id _Nullable arg){
          NSNotification *notification = (NSNotification *)arg;
          @jobs_strongify(self)
          NSLog(@"通知传递过来的 = %@",notification.object);
          return nil;
      },nil, self),UIKeyboardDidChangeFrameNotification,nil);
  }
  ```

### 13、iOS 状态栏颜色的修改 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 全局修改

  * 在`Info.plist`里面加入如下键值对

    ```xml
    <!-- iOS 状态栏颜色的修改【全局设置 全局是NO、局部是YES】View controller-based status bar appearance : NO-->
    <key>UIViewControllerBasedStatusBarAppearance</key>
    <false/>
    <!-- iOS 状态栏颜色的修改【全局设置】Status bar style : Light Content-->
    <key>UIStatusBarStyle</key>
    <string>UIStatusBarStyleLightContent</string>
    ```

  * ```objective-c
    UIApplication.sharedApplication.statusBarStyle = UIStatusBarStyleLightContent;// iOS 13 后方法被标注废弃
    ```

* 局部修改

  * 在`Info.plist`里面加入如下键值对

    ```xml
    <!-- iOS 状态栏颜色的修改【全局设置 全局是NO、局部是YES】View controller-based status bar appearance : NO-->
    <key>UIViewControllerBasedStatusBarAppearance</key>
    <true/>
    ```

  * 关注实现类：[**`@interface BaseNavigationVC : UINavigationController`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UINavigationController/BaseNavigationVC)

    *在 `BaseNavigationVC.m`里面写入*

    ```objective-c
    - (UIViewController *)childViewControllerForStatusBarStyle {
        return self.topViewController;
    }
    ```

    *在具体的需要修改的`VC.m`里面写入*

    ```objective-c
    -(UIStatusBarStyle)preferredStatusBarStyle{
        return UIStatusBarStyleLightContent;
    }
    ```

### 14、对`NSUserDefaults.standardUserDefaults` 的二次封装 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

#### 14.1、使用<font color=red>**宏定义**</font>对`NSUserDefaults.standardUserDefaults` 的二次封装

* 关注实现类：[**`JobsUserDefaultDefine.h`**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSUserDefaults/JobsUserDefaultDefine.h)

* 存数据

  * 设置 `UserDefault` 值（Value）

    ```objective-c
    JobsSetUserDefaultKeyWithValue
    ```

  * 设置 `UserDefault` 对象（Object）

    ```objective-c
    JobsSetUserDefaultKeyWithObject
    ```

  * 设置 `UserDefault` 布尔值（Bool）

    ```objective-c
    JobsSetUserBoolKeyWithBool
    ```

  * 设置  `UserDefault`  整数值（Integer）

    ```objective-c
    JobsSetUserDefaultKeyWithInteger
    ```

  * 设置  `UserDefault`  浮点数值（Float）

    ```objective-c
    JobsSetUserDefaultKeyWithFloat
    ```

  * 设置  `UserDefault`  双精度浮点数值（Double）

    ```objective-c
    JobsSetUserDefaultKeyWithDouble
    ```

  * 设置  `UserDefault`  URL（URL）

    ```objective-c
    JobsSetUserDefaultKeyWithURL
    ```

* 读取数据

  * 获取 `UserDefault` 值（Value）

    ```objective-c
    JobsGetUserDefaultValueForKey
    ```

  * 获取 `UserDefault` 对象（Object）

    ```objective-c
    JobsGetUserDefaultObjForKey
    ```

  * 获取 `UserDefault` 布尔值（Bool）

    ```objective-c
    JobsGetUserDefaultBoolForKey
    ```

  * 获取 `UserDefault` 整数值（Integer）

    ```objective-c
    JobsGetUserDefaultIntegerForKey
    ```

  * 获取 `UserDefault` 浮点数值（Float）

    ```objective-c
    JobsGetUserDefaultFloatForKey
    ```

  * 获取 `UserDefault` 双精度浮点数值（Double）

    ```objective-c
    JobsGetUserDefaultDoubleForKey
    ```

  * 获取 `UserDefault` URL（URL）

    ```objective-c
    JobsGetUserDefaultURLForKey
    ```

* 删除数据

  ```objective-c
  JobsDeleUserDefaultWithKey
  ```

* 其他

  * 单例对象

    ```objective-c
    JobsUserDefaults
    ```

  * 同步 `NSUserDefaults`

    ```objective-c
    JobsUserDefaultSynchronize
    ```

#### 14.2、以<font color=red>**分类**</font>的形式对`NSUserDefaults.standardUserDefaults` 的二次封装

* 关注实现类：[**`@interface NSUserDefaults (Manager)`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSUserDefaults/NSUserDefaults+Category/NSUserDefaults+Manager)

* 存数据（包括父类直到`NSObject`的所有属性）。<font color=red>**将数据封装到对象`UserDefaultModel`里面进行存取**</font>

  ```objective-c
  +(void)updateWithModel:(UserDefaultModel *)userDefaultModel;
  ```

* 读取数据

  ```objective-c
  +(id _Nullable)readWithKey:(NSString *)key;
  ```

* 删除数据

  ```objective-c
  +(void)deleteWithKey:(NSString *)key;
  ```

### 15、对小型本地化数据的读取（`NSUserDefaults`） <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

  * 产生背景：方便临时调试，避免打印输出

  * 关注Demo实现类：[**`@interface JobsShowObjInfoVC : BaseViewController`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/OCBaseConfig/JobsMixFunc/Debug/DebugTools/%E6%9F%A5%E7%9C%8B%E5%AF%B9%E8%B1%A1)

  * 因为是小型化的一些临时数据，所以数据本地化方案选用的是`NSUserDefaults.standardUserDefaults`

  * 数据来源`JobsUserModel`。用key = 用户信息进行存取

    ```objective-c
    /// 读取用户信息
    -(JobsUserModel *)readUserInfo{
        return [self readUserInfoByUserName:用户信息];
    }
    ```

### 16、视频播放器 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 关注实现类：[**@interface UIView (ZFPlayer)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIView/UIView+Category/UIView+ZFPlayer)

* `Podfile`

   ```ruby
   pod 'ZFPlayer' # https://github.com/renzifeng/ZFPlayer
   pod 'ZFPlayer/ControlView'
   pod 'ZFPlayer/AVPlayer'
   pod 'ZFPlayer/ijkplayer'
   #  pod 'KTVHTTPCache' # 边下边播
   #  pod 'VIMediaCache' # https://github.com/vitoziv/VIMediaCache 边下边播
   ```

### 17、动画相关 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* `Podfile`

  ```
  pod 'lottie-ios', '~> 2.5.3' # 这是OC终极版本 https://github.com/airbnb/lottie-ios
  ```

* 关注实现类：[**@interface UIView (Animation)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIView/UIView%2BCategory/UIView%2BAnimation)

### 18、手势封装 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 因为手势传递是在view层。所以对其进行了一次封装。关注实现类：[**@interface UIView (Gesture)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIView/UIView%2BCategory/UIView%2BGesture)

  调用示例

  ```objective-c
  {
      _adView.numberOfTouchesRequired = 1;
      _adView.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
      _adView.minimumPressDuration = 0.1;
      _adView.numberOfTouchesRequired = 1;
      _adView.allowableMovement = 1;
      _adView.userInteractionEnabled = YES;
      _adView.target = self;/// ⚠️注意：任何手势这一句都要写
  
      {
          _adView.longPressGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable weakSelf,
                                                                                      UILongPressGestureRecognizer *  _Nullable arg) {
             NSLog(@"长按手势被触发");
             return nil;
          }];
          _adView.longPressGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
      }
  
      {
          _adView.tapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable target,
                                                                                UITapGestureRecognizer *_Nullable arg) {
             NSLog(@"单击手势被触发");
             return nil;
          }];
          _adView.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
      }
  
      {
          _adView.doubleTapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable target, UITapGestureRecognizer *_Nullable arg) {
              NSLog(@"双击手势被触发");
              return nil;
          }];
          _adView.doubleTapGR.enabled = YES; // 必须在设置完Target和selector以后方可开启执行
      }
  }
  ```
### 19、富文本 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 富文本是告诉系统，某段文字的表达方式。<u>其本质是一个带配置信息的字符串</u>

* 如果要实现富文本某段文字的点击事件的监听，此时的承接控件不能是**`UILabel`**，而应该换成**`UITextView`**，并实现其相应的**<UITextViewDelegate>**方法

  * ```objective-c
    -(UITextView *)tipsTextView{
        if (!_tipsTextView) {
            _tipsTextView = UITextView.new;
            _tipsTextView.textContainer.lineFragmentPadding = 0;
            _tipsTextView.layoutManager.allowsNonContiguousLayout = YES;
            _tipsTextView.delegate = self;
            _tipsTextView.editable = NO;/// 必须禁止输入，否则点击将会弹出输入键盘
            _tipsTextView.scrollEnabled = NO;/// 可选的，视具体情况而定
            _tipsTextView.linkTextAttributes = @{NSForegroundColorAttributeName:HEXCOLOR(0xCCB17E)};/// 链接文字颜色
            _tipsTextView.attributedText = self.richTextWithDataConfigMutArr(self.richLabelDataStringsMutArr_2);
            _tipsTextView.userInteractionEnabled = YES;
            [self addSubview:_tipsTextView];
            [_tipsTextView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.top.equalTo(self.toggleBaseView.mas_bottom).offset(JobsWidth(5));
                make.height.mas_equalTo(JobsWidth(20));
            }];
        }return _tipsTextView;
    }
    ```
  
  * **UITextViewDelegate**
  
    * iOS 17 之后弃用
  
      ```objective-c
      /// 点击事件监听
      #pragma clang diagnostic push
      #pragma clang diagnostic ignored "-Wdeprecated-declarations"
      -(BOOL)textView:(UITextView *)textView
      shouldInteractWithURL:(NSURL *)URL
      inRange:(NSRange)characterRange
      interaction:(UITextItemInteraction)interaction {
          [WHToast jobsToastMsg:JobsInternationalization(@"专属客服")];
          return YES;
      }
      #pragma clang diagnostic pop
      ```
  
    * iOS 17 之后使用
  
      ```objective-c
      /// 如果你只需要在用户点击URL时执行一个动作，可以使用primaryActionForTextItem:方法。这个方法允许你为指定的文本项（如URL）提供自定义的操作。
      - (nullable UIAction *)textView:(UITextView *)textView
             primaryActionForTextItem:(UITextItem *)textItem
                        defaultAction:(UIAction *)defaultAction {
          if (KindOfTextItemCls(textItem) && [textItem.link isEqual:@"你的URL".jobsUrl]) {
              return [UIAction actionWithTitle:@"专属客服"
                                         image:nil
                                    identifier:nil
                                       handler:^(__kindof UIAction * _Nonnull action) {
                  [WHToast jobsToastMsg:JobsInternationalization(@"专属客服")];
              }];
          }return defaultAction; // 默认行为
      }
      /// 如果你希望显示一个自定义菜单而不是直接执行一个动作，可以使用menuConfigurationForTextItem:方法。
      - (nullable UITextItemMenuConfiguration *)textView:(UITextView *)textView
                            menuConfigurationForTextItem:(UITextItem *)textItem
                                             defaultMenu:(UIMenu *)defaultMenu {
          if (KindOfTextItemCls(textItem) && [textItem.link isEqual:@"你的URL".jobsUrl]) {
              UIAction *customAction = [UIAction actionWithTitle:@"专属客服"
                                                           image:nil
                                                      identifier:nil
                                                         handler:^(__kindof UIAction * _Nonnull action) {
                  [WHToast jobsToastMsg:JobsInternationalization(@"专属客服")];
              }];
              UIMenu *customMenu = [UIMenu menuWithTitle:@"" children:@[customAction]];
              return [UITextItemMenuConfiguration configurationWithMenu:customMenu];
          }return nil; // 默认菜单
      }
      ```
  
* 运行机制

  * 将根数据源：`RichTextConfig` 赋值后，装载到可变数组里面

  * 关注实现类：[**@interface NSObject (RichText)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/NSObject+Category/NSObject+RichText)。<font color=red>**最终输出`NSMutableAttributedString *`供系统解析使用**</font>

    ```objective-c
    /// 整合输出富文本，作用于lable.attributedText
    /// @param richTextDataConfigMutArr 富文本的配置集合,对该纯文本字符串的释义
    /// @param paragraphStyle 段落样式
    -(NSMutableAttributedString *_Nullable)richTextWithDataConfigMutArr:(NSArray <RichTextConfig *>*_Nonnull)richTextDataConfigMutArr
                                                         paragraphStyle:(NSMutableParagraphStyle *_Nullable)paragraphStyle;
    /// 利用 NSArray <RichTextConfig *>* 形成富文本
    /// @param richTextDataConfigMutArr 富文本的配置集合,对该纯文本字符串的释义
    -(NSMutableAttributedString *_Nullable)richTextWithDataConfigMutArr:(NSArray <RichTextConfig *>*_Nonnull)richTextDataConfigMutArr;
    ```

* 调用示例

  ```objective-c
  @property(nonatomic,strong)NSMutableArray <RichTextConfig *>*richLabelDataStringsMutArr;
  @property(nonatomic,strong,nullable)NSAttributedString *attributedText API_AVAILABLE(ios(6.0));
  ```

  ```objective-c
  #pragma mark —— lazyLoad
  -(NSMutableArray<RichTextConfig *> *)richLabelDataStringsMutArr{
      if (!_richLabelDataStringsMutArr) {
          _richLabelDataStringsMutArr = NSMutableArray.array;
          
          RichTextConfig *config_01 = RichTextConfig.new;
          config_01.font = [UIFont systemFontOfSize:JobsWidth(12) weight:UIFontWeightRegular];
          config_01.textCor = JobsBlueColor;
          config_01.targetString = @"编译器自动管理内存地址,\n";
          config_01.textBgCor = UIColor.brownColor;
          config_01.paragraphStyle = self.paragtaphStyle;
          
          RichTextConfig *config_02 = RichTextConfig.new;
          config_02.font = [UIFont systemFontOfSize:JobsWidth(13) weight:UIFontWeightMedium];
          config_02.textCor = JobsWhiteColor;
          config_02.targetString = @"让程序员更加专注于\n";
          config_02.textBgCor = UIColor.brownColor;
          config_02.paragraphStyle = self.paragtaphStyle;
          
          RichTextConfig *config_03 = RichTextConfig.new;
          config_03.font = [UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightSemibold];
          config_03.textCor = JobsGreenColor;
          config_03.targetString = @"APP的业务。";
          config_03.textBgCor = UIColor.brownColor;
          config_03.paragraphStyle = self.paragtaphStyle;
          
          [_richLabelDataStringsMutArr addObject:config_01];
          [_richLabelDataStringsMutArr addObject:config_02];
          [_richLabelDataStringsMutArr addObject:config_03];
          
      }return _richLabelDataStringsMutArr;
  }
  
  -(NSAttributedString *)attributedText{
      if (!_attributedText) {
          _attributedText = [self richTextWithDataConfigMutArr:self.richLabelDataStringsMutArr];
      }return _attributedText;
  }
  
  -(NSMutableParagraphStyle *)paragtaphStyle{
      if (!_paragtaphStyle) {
          _paragtaphStyle = NSMutableParagraphStyle.new;
          _paragtaphStyle.alignment = NSTextAlignmentJustified;
          _paragtaphStyle.paragraphSpacing = 0;//段距，取值 float
          _paragtaphStyle.paragraphSpacingBefore = 0;//段首空间，取值 float
          _paragtaphStyle.firstLineHeadIndent = 0.0;//首行缩进，取值 float
          _paragtaphStyle.headIndent = 0.0;//整体缩进(首行除外)，取值 float
          _paragtaphStyle.lineSpacing = 0;//行距，取值 float
          
  /**
   
   常见的属性及说明
   alignment               对齐方式，取值枚举常量 NSTextAlignment
   firstLineHeadIndent     首行缩进，取值 float
   headIndent              缩进，取值 float
   tailIndent              尾部缩进，取值 float
   ineHeightMultiple       可变行高,乘因数，取值 float
   maximumLineHeight       最大行高，取值 float
   minimumLineHeight       最小行高，取值 float
   lineSpacing             行距，取值 float
   paragraphSpacing        段距，取值 float
   paragraphSpacingBefore  段首空间，取值 float
  
   baseWritingDirection    句子方向，取值枚举常量 NSWritingDirection
   lineBreakMode           断行方式，取值枚举常量 NSLineBreakMode
   hyphenationFactor       连字符属性，在iOS，唯一支持的值分别为0和1
   
   */
          
      }return _paragtaphStyle;
  }
  ```

### 20、字符串定义 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

*  ```objective-c
   FOUNDATION_EXTERN NSString *const 皇冠符号;
   ```

  ```objective-c
  NSString *const 皇冠符号 = @"♚　♛　♝　♞　♜　♟　♔　♕　♗　♘　♖　♟";
  ```

* ```objective-c
  extern NSString *const UserDefaultKey_AppLanguage;
  ```

  ```objective-c
  NSString *const UserDefaultKey_AppLanguage = @"AppLanguage";
  ```

### 21、<font color=red>**万物回调**</font> <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 产生背景：点击事件的带参回调

* 关注实现类：[**@interface NSObject (CallBackInfoByBlock)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/NSObject%2BCategory/NSObject%2BCallBackInfoByBlock)

* 调用情况

  ```objective-c
  -(void)touchesBegan:(NSSet<UITouch *> *)touches
            withEvent:(UIEvent *)event{
      if (self.objectBlock) self.objectBlock(@1);
  }
  
  @jobs_weakify(self)
  [headerView actionObjectBlock:^(id data) {
    @jobs_strongify(self)
  }];
  ```

### 22、系统相机相册调取 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 借助第三方[**`HXPhotoPicker`**](https://github.com/SilenceLove/HXPhotoPicker)

  ```ruby
  pod 'HXPhotoPicker' # 相册选择 https://github.com/SilenceLove/HXPhotoPicker
  ```

  ```objective-c
  #if __has_include(<HXPhotoPicker/HXPhotoPicker.h>)
  #import <HXPhotoPicker/HXPhotoPicker.h>
  #else
  #import "HXPhotoPicker.h"
  #endif
  ```

* 对第三方[**`HXPhotoPicker`**](https://github.com/SilenceLove/HXPhotoPicker)的数据层进行二次封装，方便调用

  * 关注实现类：[**@interface HXPhotoPickerModel : NSObject**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/NSObject%2BCategory/NSObject%2BHXPhotoPicker)
  * 关注实现类：[**@interface NSObject (HXPhotoPicker)<HXCustomNavigationControllerDelegate>**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/NSObject%2BCategory/NSObject%2BHXPhotoPicker)

* [**需要对`info.plist` 文件进行相应字段的配置**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/%E9%85%8D%E7%BD%AEinfo.plist/%E9%85%8D%E7%BD%AEinfo.plist.md)。<font color=red>**系统需要主动索取用户权限。如果未授权，则以下代码将会调用失败**</font>

  ```xml
  <string>$(NSPhotoLibraryAddUsageDescription)</string><!-- 我们需要获取你的相册权限以完成选择本地图片功能 -->
  <key>NSPhotoLibraryUsageDescription</key>
  <string>$(NSPhotoLibraryUsageDescription)</string><!-- 我们需要获取你的相册权限以完成选择本地图片功能 -->
  <key>NSRemindersUsageDescription</key>
  ```

* 调取系统相册

  ```objective-c
  [_photoAlbumBtn jobsBtnClickEventBlock:^id(id data) {
      /// 调取系统相册
      @jobs_weakify(self)
      [self invokeSysPhotoAlbumSuccessBlock:^(HXPhotoPickerModel *data) {
          self.photoManager = data.photoManager;
          [data.photoList hx_requestImageWithOriginal:NO
                                           completion:^(NSArray<UIImage *> * _Nullable imageArray,
                                                        NSArray<HXPhotoModel *> * _Nullable errorArray) {
              @jobs_strongify(self)
              self.photosImageMutArr = [NSMutableArray arrayWithArray:imageArray];
              self.imageView.image = (UIImage *)self.photosImageMutArr.lastObject;/// 永远值显示最后选择的图
          }];
      } failBlock:^(HXPhotoPickerModel *data) {
          @jobs_strongify(self)
      }];return nil;
  }];
  ```

* 调取系统相机

  ```objective-c
  @jobs_weakify(self)
  [_cameraBtn jobsBtnClickEventBlock:^id(id data) {
      /// 调取系统相机
      [self invokeSysCameraSuccessBlock:^(HXPhotoPickerModel *data) {
          @jobs_strongify(self)
          self.imageView.image = data.photoModel.previewPhoto;
      } failBlock:^(HXPhotoPickerModel *data) {
          @jobs_strongify(self)
      }];
      return nil;
  }];
  ```

### 23、完整的单例写法 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 在 **OC**中，`static` 关键字用于声明静态变量。这些变量在整个应用程序的生命周期内只会被初始化一次，并且它们的作用域仅限于定义它们的文件

* 在单例实现中，如果覆盖了 `allocWithZone:`应该确保初始化方法也使用这个覆盖的方法进行实例化

* 单例宏：关注文件 `MacroDef_Singleton.h`

* 以`GCD`的方式实现

  * `dispatch_once_t` 是 **GCD**（**G**rand **C**entral **D**ispatch）提供的一种机制，用于确保某段代码在应用程序的生命周期内只执行一次。它是线程安全的，适用于多线程环境
  * `JobsCustomTabBarVCOnceToken`为0才会进`dispatch_once`

  ```objective-c
  static JobsCustomTabBarVC *JobsCustomTabBarVCInstance = nil;
  static dispatch_once_t JobsCustomTabBarVCOnceToken;
  
  + (instancetype)sharedManager {
      dispatch_once(&JobsCustomTabBarVCOnceToken, ^{
  				if(!JobsCustomTabBarVCInstance){
              JobsCustomTabBarVCInstance = [super allocWithZone:NULL].init;
          }
      });return JobsCustomTabBarVCInstance;
  }
  
  + (void)destroyInstance {
      JobsCustomTabBarVCInstance = nil;
      JobsCustomTabBarVCOnceToken = 0;
  }
  /// 防止外部使用 alloc/init 等创建新实例
  + (instancetype)allocWithZone:(struct _NSZone *)zone {
      return [self sharedManager];
  }
  /// 防止外部使用 alloc/init 等创建新实例
  - (instancetype)copyWithZone:(NSZone *)zone {
      return self;
  }
  /// 防止外部调用copy
  - (instancetype)mutableCopyWithZone:(NSZone *)zone {
      return self;
  }
  ```

* 以<font color=red>**`@synchronized`**</font>的方式实现

  <font color=red>**`@synchronized`**</font>关键字用于实现线程安全,它确保一段代码在同一时间内只能被一个线程执行，从而防止多个线程同时访问和修改共享资源，避免数据竞争和不一致性问题

  ```objective-c
  static JobsCustomTabBarVC *JobsCustomTabBarVCInstance = nil;
  
  + (instancetype)sharedManager {
      @synchronized (self) {
          if (JobsCustomTabBarVCInstance == nil) {
              JobsCustomTabBarVCInstance = [[super allocWithZone:NULL] init];
          }
      }
      return JobsCustomTabBarVCInstance;
  }
  
  + (void)destroyInstance {
      @synchronized (self) {
          JobsCustomTabBarVCInstance = nil;
      }
  }
  
  /// 防止外部使用 alloc/init 等创建新实例
  + (instancetype)allocWithZone:(struct _NSZone *)zone {
      return [self sharedManager];
  }
  /// 防止外部使用 alloc/init 等创建新实例
  - (instancetype)copyWithZone:(NSZone *)zone {
      return self;
  }
  /// 防止外部调用copy
  - (instancetype)mutableCopyWithZone:(NSZone *)zone {
      return self;
  }
  // 初始化代码可以放在这里
  - (instancetype)init {
      if (self = [super init]) {
          // Initialization code
      }return self;
  }
  ```

### 24、打开`URL` <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 关注实现类：[**@interface NSObject (OpenURL)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/NSObject+Category/NSObject+OpenURL)

* 处理警告，向下兼容API

* **URL**兼容`NSString *` 和 `NSURL *`

* 丰富打开失败后的操作

* 具体代码调用

  ```objective-c
              [self jobsOpenURL:self.redirectURL
  successCompletionHandlerBlock:^(id  _Nullable data) {
  
              } failCompletionHandlerBlock:^(id  _Nullable data) {
  
              }];
  ```

### 25、数据库 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* **FMDB**

  <font color=blue>**需要写SQL**</font>

  ```objective-c
  #if __has_include(<FMDB/FMDB.h>)
  #import <FMDB/FMDB.h>
  #else
  #import "FMDB.h"
  #endif
  
  /// 建表
  - (void)createTable {
      [self.databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
          NSString *createTableQuery = @"CREATE TABLE IF NOT EXISTS Users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)";
          BOOL success = [db executeUpdate:createTableQuery];
          if (success) {
              NSLog(@"Table created successfully.");
          } else {
              NSLog(@"Failed to create table.");
          }
      }];
  }
  /// 插入数据
  - (void)insertUserWithName:(NSString *)name age:(NSInteger)age {
      [self.databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
          NSString *insertQuery = @"INSERT INTO Users (name, age) VALUES (?, ?)";
          BOOL success = [db executeUpdate:insertQuery, name, @(age)];
          if (success) {
              NSLog(@"User inserted successfully.");
          } else {
              NSLog(@"Failed to insert user.");
          }
      }];
  }
  /// 查询数据
  - (NSArray *)fetchAllUsers {
      NSMutableArray *users = NSMutableArray.array;
      [self.databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
          NSString *selectQuery = @"SELECT * FROM Users";
          FMResultSet *result = [db executeQuery:selectQuery];
          while (result.next) {
              NSDictionary *user = @{
                  @"id": @([result intForColumn:@"id"]),
                  @"name": [result stringForColumn:@"name"],
                  @"age": @([result intForColumn:@"age"])
              };
              [users addObject:user];
          }
      }];return users;
  }
  /// 更新/改正 数据
  - (void)updateUserWithID:(NSInteger)userID
                   newName:(NSString *)newName
                    newAge:(NSInteger)newAge {
      [self.databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
          NSString *updateQuery = @"UPDATE Users SET name = ?, age = ? WHERE id = ?";
          BOOL success = [db executeUpdate:updateQuery, newName, @(newAge), @(userID)];
          if (success) {
              NSLog(@"User updated successfully.");
          } else {
              NSLog(@"Failed to update user.");
          }
      }];
  }
  /// 删除数据
  - (void)deleteUserWithID:(NSInteger)userID {
      [self.databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
          NSString *deleteQuery = @"DELETE FROM Users WHERE id = ?";
          BOOL success = [db executeUpdate:deleteQuery, @(userID)];
          if (success) {
              NSLog(@"User deleted successfully.");
          } else {
              NSLog(@"Failed to delete user.");
          }
      }];
  }
  ```

* **Realm**

  * <font color=red>**不需要写SQL，pod一键集成**</font>
  * **model**需要继承自**RLMObject**

  ```objective-c
  #if __has_include(<Realm/Realm.h>)
  #import <Realm/Realm.h>
  #else
  #import "Realm.h"
  #endif
  
  /// 插入数据
  - (void)insertUserWithName:(NSString *)name age:(NSInteger)age {
      RLMRealm *realm = RLMRealm.defaultRealm;
      [realm transactionWithBlock:^{
          User *newUser = User.new;
          newUser.name = name;
          newUser.age = age;
          [realm addObject:newUser];
      }];
  }
  /// 查询数据
  - (NSArray *)fetchAllUsers {
      RLMResults<User *> *results = User.allObjects;
      NSMutableArray *users = NSMutableArray.array;
      for (User *user in results) {
          [users addObject:user];
      }return users;
  }
  /// 更新/改正 数据
  - (void)updateUser:(User *)user
             newName:(NSString *)newName
              newAge:(NSInteger)newAge {
      RLMRealm *realm = RLMRealm.defaultRealm;
      [realm transactionWithBlock:^{
          user.name = newName;
          user.age = newAge;
      }];
  }
  /// 删除数据
  - (void)deleteUser:(User *)user {
      RLMRealm *realm = RLMRealm.defaultRealm;
      [realm transactionWithBlock:^{
          [realm deleteObject:user];
      }];
  }
  ```

* **Core Data**

  * <font color=blue>**不需要写SQL，但是需要在xcode上进行配置，比较繁琐**</font>

  * `Info.plist`中，添加一个新的键 `NSPersistentStoreTypeKey`，并将值设置为 `SQLite`

  * 创建**Core Data**模型文件`.xcdatamodeld`，并在其中创建一个实体 `User`，并添加两个属性：

    - `name` (**String**)
    - `age` (**Integer 32**)

    ![image-20240706231719263](./assets/image-20240706231719263.png)

  * `AppDelegate`设置**Core Data**堆栈

    ```objective-c
    #import <UIKit/UIKit.h>
    #import <CoreData/CoreData.h>
    
    @interface AppDelegate : UIResponder <UIApplicationDelegate>
    
    @property (strong, nonatomic) UIWindow *window;
    @property (readonly, strong) NSPersistentContainer *persistentContainer;
    
    - (void)saveContext;
    
    @end
    ```

    ```objective-c
    #import "AppDelegate.h"
    
    @interface AppDelegate ()
    
    @end
    
    @implementation AppDelegate
    
    @synthesize persistentContainer = _persistentContainer;
    
    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        return YES;
    }
    
    - (NSPersistentContainer *)persistentContainer {
        @synchronized (self) {
            if (_persistentContainer == nil) {
                _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"ModelName"];
                [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                    if (error != nil) {
                        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                        abort();
                    }
                }];
            }
        }
        return _persistentContainer;
    }
    
    - (void)saveContext {
        NSManagedObjectContext *context = self.persistentContainer.viewContext;
        if ([context hasChanges]) {
            NSError *error = nil;
            if (![context save:&error]) {
                NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                abort();
            }
        }
    }
    
    @end
    ```

  * 增删查改

    ```objective-c
    #import "ViewController.h"
    #import "AppDelegate.h"
    #import <CoreData/CoreData.h>
    
    @interface ViewController ()
    
    @property (nonatomic, strong) NSManagedObjectContext *context;
    
    @end
    
    @implementation ViewController
    
    - (void)viewDidLoad {
        [super viewDidLoad];
        
        self.context = ((AppDelegate *)[UIApplication sharedApplication].delegate).persistentContainer.viewContext;
        
        // 插入数据
        [self insertUserWithName:@"Alice" age:25];
        [self insertUserWithName:@"Bob" age:30];
        
        // 获取所有用户
        NSArray *users = [self fetchAllUsers];
        NSLog(@"Users: %@", users);
        
        // 更新用户
        if (users.count > 0) {
            NSManagedObject *user = users[0];
            [self updateUser:user newName:@"Alice Smith" newAge:26];
        }
        
        // 删除用户
        if (users.count > 1) {
            NSManagedObject *user = users[1];
            [self deleteUser:user];
        }
        
        // 获取更新后的用户列表
        users = [self fetchAllUsers];
        NSLog(@"Updated Users: %@", users);
    }
    
    - (void)insertUserWithName:(NSString *)name age:(NSInteger)age {
        NSManagedObject *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.context];
        [newUser setValue:name forKey:@"name"];
        [newUser setValue:@(age) forKey:@"age"];
        [self saveContext];
    }
    
    - (NSArray *)fetchAllUsers {
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
        NSError *error = nil;
        NSArray *result = [self.context executeFetchRequest:fetchRequest error:&error];
        if (error) {
            NSLog(@"Error fetching users: %@", error);
        }
        return result;
    }
    
    - (void)updateUser:(NSManagedObject *)user newName:(NSString *)newName newAge:(NSInteger)newAge {
        [user setValue:newName forKey:@"name"];
        [user setValue:@(newAge) forKey:@"age"];
        [self saveContext];
    }
    
    - (void)deleteUser:(NSManagedObject *)user {
        [self.context deleteObject:user];
        [self saveContext];
    }
    
    - (void)saveContext {
        NSError *error = nil;
        if ([self.context hasChanges] && ![self.context save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, error.userInfo);
            abort();
        }
    }
    
    @end
    ```

### 26、指纹识别 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 关注实现类：[**@interface  TouchID : NSObject**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/BaseObject/TouchID)

### 27、<font id=创建UICollectionView>创建`UICollectionView`</font> <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* ```objective-c
  @property(nonatomic,strong)UICollectionViewFlowLayout *layout;
  @property(nonatomic,strong)BaseCollectionView *collectionView;
  ```

  ```objective-c
  -(UICollectionViewFlowLayout *)layout{
      if (!_layout) {
          _layout = UICollectionViewFlowLayout.new;
          _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
      }return _layout;
  }
  
  -(BaseCollectionView *)collectionView{
      if (!_collectionView) {
          @jobs_weakify(self)
          _collectionView = [BaseCollectionView.alloc initWithFrame:CGRectZero
                                               collectionViewLayout:self.layout];
          _collectionView.backgroundColor = JobsCor(@"#FFFFFF");
          [self dataLinkByCollectionView:_collectionView];
          _collectionView.showsVerticalScrollIndicator = NO;
          _collectionView.showsHorizontalScrollIndicator = NO;
          _collectionView.bounces = NO;
          
          [_collectionView registerCollectionViewClass];
          [_collectionView registerCollectionViewCellClass:MSMineView6CVCell.class];
          
          {
              MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
              refreshConfigHeader.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
              refreshConfigHeader.pullingTitle = JobsInternationalization(@"下拉可以刷新");
              refreshConfigHeader.refreshingTitle = JobsInternationalization(@"松开立即刷新");
              refreshConfigHeader.willRefreshTitle = JobsInternationalization(@"刷新数据中");
              refreshConfigHeader.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
              refreshConfigHeader.loadBlock = ^id _Nullable(id  _Nullable data) {
                  @jobs_strongify(self)
                  [self feedbackGenerator];//震动反馈
                  return nil;
              };
  
              MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
              refreshConfigFooter.stateIdleTitle = JobsInternationalization(@"");
              refreshConfigFooter.pullingTitle = JobsInternationalization(@"");
              refreshConfigFooter.refreshingTitle = JobsInternationalization(@"");
              refreshConfigFooter.willRefreshTitle = JobsInternationalization(@"");
              refreshConfigFooter.noMoreDataTitle = JobsInternationalization(@"");
              refreshConfigFooter.loadBlock = ^id _Nullable(id  _Nullable data) {
                  @jobs_strongify(self)
                  return nil;
              };
  
              {
                self.refreshConfigHeader = refreshConfigHeader;
                self.refreshConfigFooter = refreshConfigFooter;
  
                _collectionView.mj_header = self.mjRefreshNormalHeader;
                _collectionView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
              }
  
            // 如果需要支持lottie动画
            //{
            //               // 赋值
            //  self.lotAnimMJRefreshHeader.refreshConfigModel = refreshConfigHeader;
            //  self.refreshConfigFooter = refreshConfigFooter;//数据赋值
            //  // 用值
            //  _collectionView.mj_header = self.lotAnimMJRefreshHeader;
            //}
          }
        
  //          {
  //            
  //            NSArray *classArray = @[
  //                                    DDCollectionViewCell_Style2.class,
  //                                    DDCollectionViewCell_Style3.class,
  //                                    DDCollectionViewCell_Style4.class,
  //                                    ];
  //            NSArray *sizeArray = @[
  //                                   [NSValue valueWithCGSize:[DDCollectionViewCell_Style2 cellSizeWithModel:nil]],
  //                                   [NSValue valueWithCGSize:[DDCollectionViewCell_Style3 cellSizeWithModel:nil]],
  //                                   [NSValue valueWithCGSize:[DDCollectionViewCell_Style4 cellSizeWithModel:nil]]
  //                                   ];
  //            
  //            _collectionView.tabAnimated = [TABCollectionAnimated animatedWithCellClassArray:classArray
  //                                                                              cellSizeArray:sizeArray
  //                                                                         animatedCountArray:@[@(1),@(1),@(1)]];
  //            
  //            [_collectionView.tabAnimated addHeaderViewClass:BaseCollectionReusableView_Style1.class
  //                                                   viewSize:[BaseCollectionReusableView_Style1 collectionReusableViewSizeWithModel:nil]
  //                                                  toSection:0];
  //            [_collectionView.tabAnimated addHeaderViewClass:BaseCollectionReusableView_Style1.class
  //                                                   viewSize:[BaseCollectionReusableView_Style2 collectionReusableViewSizeWithModel:nil]
  //                                                  toSection:2];
  //            
  //            _collectionView.tabAnimated.containNestAnimation = YES;
  //            _collectionView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
  //            _collectionView.tabAnimated.canLoadAgain = YES;
  //            [_collectionView tab_startAnimation];   // 开启动画
  //        }
          
          [self addSubview:_collectionView];
          [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
              make.top.left.right.equalTo(self);
              make.height.mas_equalTo(JobsWidth(102));
          }];
      }return _collectionView;
  }
  ```

### 28、<font color=red id=创建UITableView>创建`UITableView`</font> <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

#### 28.1、关于<font color=red>`UITableView`</font>

* **`UITableView`** 可以不用像**`UICollectionView`**一样执行注册机制。注册机制的生命周期有别于普通的生命周期
  
  ```objective-c
  /// UI
  @property(nonatomic,strong)BaseTableView *tableView;
  ```
  
  ```objective-c
  -(BaseTableView *)tableView{
      if (!_tableView) {
          @jobs_weakify(self)
          _tableView = BaseTableView.initWithStyleGrouped;/// 一般用 initWithStylePlain。Grouped会自己预留一块空间
          _tableView.ww_foldable = YES;
          [self dataLinkByTableView:_tableView];
          _tableView.backgroundColor = JobsCor(@"#FFFFFF");
          _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
          _tableView.separatorColor = HEXCOLOR(0xEEE2C8);
          _tableView.showsVerticalScrollIndicator = NO;
          _tableView.scrollEnabled = YES;
          _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
          _tableView.tableFooterView = UIView.new;/// 这里接入的就是一个UIView的派生类
          _tableView.ww_foldable = YES;//设置可折叠 见 @interface UITableView (WWFoldableTableView)
          [_tableView registerHeaderFooterViewClass:MSCommentTableHeaderFooterView.class];
          if(@available(iOS 11.0, *)) {
              _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
          }
          
          {
              MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
              refreshConfigHeader.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
              refreshConfigHeader.pullingTitle = JobsInternationalization(@"下拉可以刷新");
              refreshConfigHeader.refreshingTitle = JobsInternationalization(@"松开立即刷新");
              refreshConfigHeader.willRefreshTitle = JobsInternationalization(@"刷新数据中");
              refreshConfigHeader.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
              refreshConfigHeader.loadBlock = ^id _Nullable(id  _Nullable data) {
                  @jobs_strongify(self)
                  [self feedbackGenerator];//震动反馈
                  return nil;
              };
              
              MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
              refreshConfigFooter.stateIdleTitle = JobsInternationalization(@"");
              refreshConfigFooter.pullingTitle = JobsInternationalization(@"");
              refreshConfigFooter.refreshingTitle = JobsInternationalization(@"");
              refreshConfigFooter.willRefreshTitle = JobsInternationalization(@"");
              refreshConfigFooter.noMoreDataTitle = JobsInternationalization(@"");
              refreshConfigFooter.loadBlock = ^id _Nullable(id  _Nullable data) {
                  return nil;
              };
              
              self.refreshConfigHeader = refreshConfigHeader;
              self.refreshConfigFooter = refreshConfigFooter;
              
              _tableView.mj_header = self.mjRefreshNormalHeader;
              _tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
          }
          
          {
              _tableView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:JobsInternationalization(@"暂无数据")
                                                                  titleStr:JobsInternationalization(@"暂无数据")
                                                                 detailStr:JobsInternationalization(@"")];
              
              _tableView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
              _tableView.ly_emptyView.contentViewOffset = JobsWidth(-180);
              _tableView.ly_emptyView.titleLabFont = UIFontWeightLightSize(16);
          }
          
  //        {/// 设置tabAnimated相关属性
  //            // 可以不进行手动初始化，将使用默认属性
  //            _tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:MSCommentTBVCell.class
  //                                                                  cellHeight:74.5];
  //            _tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
  //            [_tableView tab_startAnimation];   // 开启动画
  //        }
  //
          [self addSubview:_tableView];
          [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
              make.edges.equalTo(self);
          }];
  
      }return _tableView;
  }
  ```

#### 28.2、关于<font id=UITableViewHeaderFooterView color=red>**UITableViewHeaderFooterView**</font>（**viewForHeaderInSection**）

* 注册（注册不开辟内存，通过全局唯一的字符串进行取值的时候才开辟内存）

  ```objective-c
  _tableView.registerHeaderFooterViewClass(FMTBVHeaderFooterView1.class,@"");
  _tableView.registerHeaderFooterViewClass(FMTBVHeaderFooterView2.class,@"");
  ```

* 这里涉及到复用机制，`return`出去的是**`UITableViewHeaderFooterView`**的派生类

  ```objective-c
  - (UIView *)tableView:(UITableView *)tableView
  viewForHeaderInSection:(NSInteger)section{
      if(section == 0){
          FMTBVHeaderFooterView1 *headerView = tableView.tableViewHeaderFooterView(FMTBVHeaderFooterView1.class,@"");
          if(!headerView){
  //            headerView = FMTBVHeaderFooterView1.jobsInitWithReuseIdentifier(@"");// 不要用这个
              tableView.registerHeaderFooterViewClass(FMTBVHeaderFooterView1.class,@"");
              headerView = tableView.tableViewHeaderFooterView(FMTBVHeaderFooterView1.class,@"");
          }
          headerView.backgroundColor = JobsRedColor;
          headerView.section = section;// 不写这一句有悬浮
          [headerView richElementsInViewWithModel:self.dataMutArr[section].data];
          @jobs_weakify(self)
          [headerView actionObjectBlock:^(id data) {
              @jobs_strongify(self)
          }];return headerView;
      }else if (section == 1){
          FMTBVHeaderFooterView2 *headerView = tableView.tableViewHeaderFooterView(FMTBVHeaderFooterView2.class,@"");
          if(!headerView){
  //            headerView = FMTBVHeaderFooterView2.jobsInitWithReuseIdentifier(@"");// 不要用这个
              tableView.registerHeaderFooterViewClass(FMTBVHeaderFooterView2.class,@"");
              headerView = tableView.tableViewHeaderFooterView(FMTBVHeaderFooterView2.class,@"");
          }
          headerView.backgroundColor = JobsBlueColor;
          headerView.section = section;// 不写这一句有悬浮
          [headerView richElementsInViewWithModel:self.dataMutArr[section].data];
          @jobs_weakify(self)
          [headerView actionObjectBlock:^(id data) {
              @jobs_strongify(self)
          }];return headerView;
      }else if (section == 2){
          FMTBVHeaderFooterView2 *headerView = tableView.tableViewHeaderFooterView(FMTBVHeaderFooterView2.class,@"");
          if(!headerView){
  //            headerView = FMTBVHeaderFooterView2.jobsInitWithReuseIdentifier(@"");// 不要用这个
              tableView.registerHeaderFooterViewClass(FMTBVHeaderFooterView2.class,@"");
              headerView = tableView.tableViewHeaderFooterView(FMTBVHeaderFooterView2.class,@"");
          }
          headerView.backgroundColor = JobsYellowColor;
          headerView.section = section;// 不写这一句有悬浮
          [headerView richElementsInViewWithModel:self.dataMutArr[section].data];
          @jobs_weakify(self)
          [headerView actionObjectBlock:^(id data) {
              @jobs_strongify(self)
          }];return headerView;
      }else return UIView.new;
  }
  ```

  ```objective-c
  - (CGFloat)tableView:(UITableView *)tableView
  heightForHeaderInSection:(NSInteger)section{
      return JobsWidth(36);
  }
  ```

 * **`UITableViewHeaderFooterView`**的子类

   ```objective-c
   #import "BaseViewProtocol.h"
   #import "UIViewModelOthersProtocol.h"
   
   NS_ASSUME_NONNULL_BEGIN
   
   @interface FMTBVHeaderFooterView1 : UITableViewHeaderFooterView
   <BaseViewProtocol,UIViewModelOthersProtocol>
   @end
   
   NS_ASSUME_NONNULL_END
   ```

   ```objective-c
   #import "FMTBVHeaderFooterView1.h"
   
   @interface FMTBVHeaderFooterView1 ()
   /// UI
   @property(nonatomic,strong)UILabel *titleLab;
   
   @end
   
   @implementation FMTBVHeaderFooterView1
   @synthesize viewModel = _viewModel;
   /// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
   -(void)richElementsInViewWithModel:(id _Nullable)model{
       self.contentView.backgroundColor = self.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
       if([model isKindOfClass:UIViewModel.class]){
           self.viewModel = (UIViewModel *)model;
       }
       self.titleLab.alpha = 1;
   }
   #pragma mark —— lazyLoad
   -(UILabel *)titleLab{
       if(!_titleLab){
           _titleLab = UILabel.new;
           _titleLab.text = self.viewModel.text;
           _titleLab.font = self.viewModel.font;
           _titleLab.textColor = self.viewModel.textCor;
           [self.contentView addSubview:_titleLab];
           [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
               make.edges.equalTo(self.contentView);
           }];
       }return _titleLab;
   }
   
   @end
   ```


### 29、字符串写文件 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

```objective-c
-(void)保留文字{
    if (![NSString isNullString:self.inputDataString]) {
        JobsUserModel.sharedManager.postDraftURLStr = [NSObject saveData:self.inputDataString
                                                   withDocumentsChildDir:JobsInternationalization(@"发帖草稿数据临时文件夹")
                                                            fileFullname:@"发帖草稿数据.txt"
                                                                   error:nil];
    }else{
        [FileFolderHandleTool cleanFilesWithPath:JobsUserModel.sharedManager.postDraftURLStr];
    }
    NSLog(@"%@",JobsUserModel.sharedManager.postDraftURLStr);
    [self.view hx_showLoadingHUDText:nil];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        BOOL success = [self.photoManager saveLocalModelsToFile];//保存图片
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.view hx_handleLoading];
            if (success) {
                [self back:nil];
            }else {
                [self.view hx_showImageHUDText:JobsInternationalization(@"保存失败")];
            }
        });
    });
}
```

### 30、关于`UITabBarController` <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

#### 30.1、架构说明

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

#### 30.2、[自定义 UITabBarController](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/OCBaseConfig/JobsMixFunc/UITabBarCtr/%E8%87%AA%E5%AE%9A%E4%B9%89%20UITabBarController.md/%E8%87%AA%E5%AE%9A%E4%B9%89%20UITabBarController.md)

### 31、联动视图的解决方案 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

#### 31.1、[**`JXCategoryView`**](https://github.com/pujiaxin33/JXCategoryView)

* 评价

  * 是一个针对`UIViewController`的视图联动，<font color=red>所属可滑动的子部是`UIViewController`的子类</font>
  * <font color=red>**但是因为`View`上不能添加`UIViewController`，所以在某些场景的使用会有一定局限**</font>
  * <font color=red>**垂直方向的使用会有局限。所以[`JXCategoryView`](https://github.com/pujiaxin33/JXCategoryView)是针对的水平场景**</font>
  
* 集成方式

  ```ruby
  pod 'JXCategoryView' # https://github.com/pujiaxin33/JXCategoryView NO_SMP
  pod 'JXPagingView/Pager' # https://github.com/pujiaxin33/JXPagingView NO_SMP
  # pod 'JXCategoryViewExt' # https://github.com/QuintGao/JXCategoryViewExt 来自于另外一个作者的优化
  ```
  
  ```objective-c
  #if __has_include(<JXCategoryView/JXCategoryView.h>)
  #import <JXCategoryView/JXCategoryView.h>
  #else
  #import "JXCategoryView.h"
  #endif
  ```
  
  ```objective-c
  <
  JXCategoryTitleViewDataSource
  ,JXCategoryListContainerViewDelegate
  ,JXCategoryViewDelegate
  >
  ```
  
* 公共部分

  * 定义高度

    ```objective-c
    #ifndef listContainerViewDefaultOffset
    #define listContainerViewDefaultOffset JobsWidth(50)
    #endif
    ```

  * UI部分

    * ```objective-c
      @property(nonatomic,strong)JXCategoryTitleView *categoryView;/// 文字
      ```

    * ```objective-c
      @property(nonatomic,strong)JXCategoryDotView *categoryView;/// 右上角带红点
      ```

    * ```objective-c
      @property(nonatomic,strong)JXCategoryImageView *categoryView;/// 纯图
      ```

    * ```objective-c
      @property(nonatomic,strong)JXCategoryNumberView *categoryView;/// 右上角带文字
      ```

    * ```objective-c
      @property(nonatomic,strong)JXCategoryIndicatorLineView *lineView;/// 跟随的指示器
      @property(nonatomic,strong)JXCategoryListContainerView *listContainerView;/// 此属性决定依附于此的viewController
      @property(nonatomic,strong)JXCategoryIndicatorBackgroundView *categoryBgView;
      ```

  * Data部分

    ```objective-c
    @property(nonatomic,strong)NSMutableArray <NSString *>*titleMutArr;
    @property(nonatomic,strong)NSMutableArray <NSString *>*imageNames;
    @property(nonatomic,strong)NSMutableArray <NSString *>*selectedImageNames;
    @property(nonatomic,strong)NSMutableArray <__kindof UIViewController *>*childVCMutArr;
    ```

  * ```objective-c
    -(JXCategoryIndicatorBackgroundView *)categoryBgView{
        if (!_categoryBgView) {
            _categoryBgView = JXCategoryIndicatorBackgroundView.new;
            _categoryBgView.indicatorHeight = JobsWidth(30);
            _categoryBgView.indicatorWidth = JobsWidth(76);
            _categoryBgView.indicatorColor = HEXCOLOR(0xFFEABA);
            _categoryBgView.indicatorCornerRadius = JXCategoryViewAutomaticDimension;
        }return _categoryBgView;
    }
    
    -(JXCategoryIndicatorLineView *)lineView{
        if (!_lineView) {
            _lineView = JXCategoryIndicatorLineView.new;
            _lineView.indicatorColor = HEXCOLOR(0xFFEABA);
            _lineView.indicatorHeight = JobsWidth(4);
            _lineView.indicatorWidthIncrement = JobsWidth(10);
            _lineView.verticalMargin = 0;
        }return _lineView;
    }
    /// 此属性决定依附于此的viewController
    -(JXCategoryListContainerView *)listContainerView{
        if (!_listContainerView) {
            _listContainerView = [JXCategoryListContainerView.alloc initWithType:JXCategoryListContainerType_CollectionView
                                                                        delegate:self];
            _listContainerView.defaultSelectedIndex = 1;// 默认从第二个开始显示
            [self.view addSubview:_listContainerView];
            [_listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
    //            make.edges.equalTo(self.view);
                make.top.equalTo(self.infoBoardView.mas_bottom).offset(listContainerViewDefaultOffset);
                make.left.right.bottom.equalTo(self.view);
                
            }];
            [self.view layoutIfNeeded];
            
            /// ❤️在需要的地方写❤️
            NSNumber *currentIndex = [self.listContainerView valueForKey:@"currentIndex"];
            NSLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %d",currentIndex.intValue);
            
        }return _listContainerView;
    }
    
    -(NSMutableArray<NSString *> *)titleMutArr{
        if (!_titleMutArr) {
            _titleMutArr = NSMutableArray.array;
            [_titleMutArr addObject:JobsInternationalization(@"全部游戏")];
            [_titleMutArr addObject:JobsInternationalization(@"真人")];
            [_titleMutArr addObject:JobsInternationalization(@"体育")];
            [_titleMutArr addObject:JobsInternationalization(@"电子")];
            [_titleMutArr addObject:JobsInternationalization(@"棋牌")];
            [_titleMutArr addObject:JobsInternationalization(@"彩票")];
        }return _titleMutArr;
    }
    
    -(NSMutableArray<__kindof UIViewController *> *)childVCMutArr{
        if (!_childVCMutArr) {
            _childVCMutArr = NSMutableArray.array;
            [_childVCMutArr addObject:BaiShaETProjAllGameVC.new];// 全部游戏
            [_childVCMutArr addObject:BaiShaETProjManVideoVC.new];// 真人
            [_childVCMutArr addObject:BaiShaETProjSportVC.new];// 体育
            [_childVCMutArr addObject:BaiShaETProjGameOnllineVC.new];// 电子
            [_childVCMutArr addObject:BaiShaETProjChessPokerVC.new];// 棋牌
            [_childVCMutArr addObject:BaiShaETProjLotteryVC.new];// 彩票
        }return _childVCMutArr;
    }
    ```

  * 协议部分，主要是以下3个协议

    * **`JXCategoryTitleViewDataSource`**

      ```objective-c
      #pragma mark JXCategoryTitleViewDataSource
      //// 如果将JXCategoryTitleView嵌套进UITableView的cell，每次重用的时候，JXCategoryTitleView进行reloadData时，会重新计算所有的title宽度。所以该应用场景，需要UITableView的cellModel缓存titles的文字宽度，再通过该代理方法返回给JXCategoryTitleView。
      //// 如果实现了该方法就以该方法返回的宽度为准，不触发内部默认的文字宽度计算。
      //- (CGFloat)categoryTitleView:(JXCategoryTitleView *)titleView
      //               widthForTitle:(NSString *)title{
      //
      //    return 10;
      //}
      ```

    * **`JXCategoryListContainerViewDelegate`**

      ```objective-c
      #pragma mark JXCategoryListContainerViewDelegate
      /**
       返回list的数量
      
       @param listContainerView 列表的容器视图
       @return list的数量
       */
      - (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView{
          return self.titleMutArr.count;
      }
      /**
       根据index初始化一个对应列表实例，需要是遵从`JXCategoryListContentViewDelegate`协议的对象。
       如果列表是用自定义UIView封装的，就让自定义UIView遵从`JXCategoryListContentViewDelegate`协议，该方法返回自定义UIView即可。
       如果列表是用自定义UIViewController封装的，就让自定义UIViewController遵从`JXCategoryListContentViewDelegate`协议，该方法返回自定义UIViewController即可。
      
       @param listContainerView 列表的容器视图
       @param index 目标下标
       @return 遵从JXCategoryListContentViewDelegate协议的list实例
       */
      - (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView
                                                initListForIndex:(NSInteger)index{
          return self.childVCMutArr[index];
      }
      ```

    * **`JXCategoryViewDelegate`**

      ```objective-c
      #pragma mark JXCategoryViewDelegate
      ///【点击的结果】点击选中的情况才会调用该方法。传递didClickSelectedItemAt事件给listContainerView
      - (void)categoryView:(JXCategoryBaseView *)categoryView
      didClickSelectedItemAtIndex:(NSInteger)index {
          [self.listContainerView didClickSelectedItemAtIndex:index];
      }
      ///【点击选中或者滚动选中的结果】点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，不关心具体是点击还是滚动选中的。
      - (void)categoryView:(JXCategoryBaseView *)categoryView
      didSelectedItemAtIndex:(NSInteger)index {
          
      }
      ///【滚动选中的结果】滚动选中的情况才会调用该方法
      - (void)categoryView:(JXCategoryBaseView *)categoryView 
      didScrollSelectedItemAtIndex:(NSInteger)index{
          
      }
      /// 传递scrolling事件给listContainerView，必须调用！！！
      - (void)categoryView:(JXCategoryBaseView *)categoryView
      scrollingFromLeftIndex:(NSInteger)leftIndex
              toRightIndex:(NSInteger)rightIndex
                     ratio:(CGFloat)ratio {
          NSLog(@"");
      //    [self.listContainerView scrollingFromLeftIndex:leftIndex
      //                                      toRightIndex:rightIndex
      //                                             ratio:ratio
      //                                     selectedIndex:categoryView.selectedIndex];
      }
      ```

* 手动跳转到某个指定的页面

  ```objective-c
  [self.categoryTitleView selectItemAtIndex:3];
  ```

* 不同风格的`JXCategory`的实现

  * ```objective-c
    -(JXCategoryTitleView *)categoryView{
        if (!_categoryView) {
            _categoryView = JXCategoryTitleView.new;
            _categoryView.backgroundColor = UIColor.clearColor;
            _categoryView.titleSelectedColor = UIColor.whiteColor;
            _categoryView.titleColor = UIColor.whiteColor;
            _categoryView.titleFont = [UIFont systemFontOfSize:18 weight:UIFontWeightRegular];
            _categoryView.titleSelectedFont = [UIFont systemFontOfSize:28 weight:UIFontWeightRegular];
            _categoryView.delegate = self;
            _categoryView.titles = self.titleMutArr;
            _categoryView.titleColorGradientEnabled = YES;
            _categoryView.indicators = @[self.lineView];//
            _categoryView.defaultSelectedIndex = 1;// 默认从第二个开始显示
            _categoryView.cellSpacing = JobsWidth(-20);
            // 关联cotentScrollView，关联之后才可以互相联动！！！
            _categoryView.contentScrollView = self.listContainerView.scrollView;//
            _categoryView.indicators = @[self.categoryBgView];/// BackgroundView 椭圆形
            [self.view addSubview:_categoryView];
            [_categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.infoBoardView.mas_bottom).offset(0);
                make.left.right.equalTo(self.view);
                make.height.mas_equalTo(listContainerViewDefaultOffset);
            }];
            [self.view layoutIfNeeded];
        }return _categoryView;
    }
    ```

  * ```objective-c
    -(JXCategoryImageView *)categoryView{
        if (!_categoryView) {
            _categoryView = JXCategoryImageView.new;
            _categoryView.backgroundColor = UIColor.clearColor;
            _categoryView.delegate = self;
    
            _categoryView.imageNames = @[@"彩票_已选择",@"电子_已选择",@"棋牌_已选择",@"全部游戏_已选择",@"体育_已选择",@"真人直播_已选择"];
            _categoryView.selectedImageNames = @[@"彩票_已选择",@"电子_已选择",@"棋牌_已选择",@"全部游戏_已选择",@"体育_已选择",@"真人直播_已选择"];
            
            //_categoryView.imageInfoArray = @[@"彩票_已选择",@"电子_已选择",@"棋牌_已选择",@"全部游戏_已选择",@"体育_已选择",@"真人直播_已选择"];
            //@[KIMG(@"彩票_已选择"),KIMG(@"电子_已选择"),KIMG(@"棋牌_已选择"),KIMG(@"全部游戏_已选择"),KIMG(@"体育_已选择"),KIMG(@"真人直播_已选择")];
            //_categoryView.selectedImageInfoArray = @[@"彩票_已选择",@"电子_已选择",@"棋牌_已选择",@"全部游戏_已选择",@"体育_已选择",@"真人直播_已选择"];
            
            _categoryView.imageSize = CGSizeMake(JobsWidth(30), JobsWidth(30));
            _categoryView.imageCornerRadius = JobsWidth(8);
            _categoryView.imageZoomEnabled = YES;
            _categoryView.imageZoomScale = 2;
    
            _categoryView.indicators = @[self.lineView];//
            _categoryView.defaultSelectedIndex = 1;// 默认从第二个开始显示
            _categoryView.cellSpacing = JobsWidth(-20);
            // 关联cotentScrollView，关联之后才可以互相联动！！！
            _categoryView.contentScrollView = self.listContainerView.scrollView;//
            _categoryView.indicators = @[self.categoryBgView];/// BackgroundView 椭圆形
            [self.view addSubview:_categoryView];
            [_categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.infoBoardView.mas_bottom).offset(0);
                make.left.right.equalTo(self.view);
                make.height.mas_equalTo(listContainerViewDefaultOffset);
            }];
            [self.view layoutIfNeeded];
        }return _categoryView;
    }
    ```

  * ```objective-c
    -(JXCategoryDotView *)categoryTitleView{
        if (!_categoryTitleView) {
            _categoryTitleView = JXCategoryDotView.new;
            _categoryTitleView.delegate = self;
            _categoryTitleView.dotStates = self.dotStatesMutArr;
            _categoryTitleView.titles = self.titleMutArr;
            _categoryTitleView.indicators = @[self.lineView];
            _categoryTitleView.backgroundColor = HEXCOLOR(0xFCFBFB);
            _categoryTitleView.titleSelectedColor = HEXCOLOR(0xAE8330);
            _categoryTitleView.titleColor = HEXCOLOR(0xC4C4C4);
            _categoryTitleView.titleFont = notoSansRegular(12);
            _categoryTitleView.titleSelectedFont = notoSansRegular(12);
            _categoryTitleView.defaultSelectedIndex = 1;//默认从第二个开始显示
            _categoryTitleView.titleColorGradientEnabled = YES;
    //        _categoryTitleView.titleLabelZoomEnabled = YES;//默认为NO。为YES时titleSelectedFont失效，以titleFont为准。这句话貌似有点问题，等作者回复
            _categoryTitleView.listContainer = self.listContainerView;
            _categoryView.indicators = @[self.categoryBgView];/// BackgroundView 椭圆形
            _categoryTitleView.dotSize = CGSizeMake(JobsWidth(5), JobsWidth(5));
            // 关联cotentScrollView，关联之后才可以互相联动！！！
            _categoryTitleView.contentScrollView = self.listContainerView.scrollView;
            [_categoryTitleView reloadDataWithoutListContainer];
            [self.view addSubview:_categoryTitleView];
            [_categoryTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.topLineLab.mas_bottom);
                make.left.right.equalTo(self.view);
                make.height.mas_equalTo(listContainerViewDefaultOffset);
            }];
        }return _categoryTitleView;
    }
    ```

    ```objective-c
    @property(nonatomic,strong)NSMutableArray <NSNumber *>*dotStatesMutArr;
    -(NSMutableArray<NSNumber *> *)dotStatesMutArr{
        if (!_dotStatesMutArr) {
            _dotStatesMutArr = NSMutableArray.array;
            [_dotStatesMutArr addObject:@YES];
            [_dotStatesMutArr addObject:@NO];
            [_dotStatesMutArr addObject:@YES];
            [_dotStatesMutArr addObject:@NO];
            [_dotStatesMutArr addObject:@YES];
        }return _dotStatesMutArr;
    }
    
    - (void)categoryView:(JXCategoryBaseView *)categoryView
    didSelectedItemAtIndex:(NSInteger)index {
        self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
        //点击以后红点消除
        if ([self.dotStatesMutArr[index] boolValue]) {
            self.dotStatesMutArr[index] = @(NO);
            self.categoryTitleView.dotStates = self.dotStatesMutArr;
            [categoryView reloadCellAtIndex:index];
        }
    }
    ```
    
  * ```objective-c
    -(JXCategoryNumberView *)categoryTitleView{
        if (!_categoryTitleView) {
            _categoryTitleView = JXCategoryNumberView.new;
            _categoryTitleView.delegate = self;
            _categoryTitleView.titles = self.titleMutArr;
            _categoryTitleView.indicators = @[self.lineView];
            _categoryTitleView.backgroundColor = HEXCOLOR(0xFCFBFB);
            _categoryTitleView.titleSelectedColor = HEXCOLOR(0xAE8330);
            _categoryTitleView.titleColor = HEXCOLOR(0xC4C4C4);
            _categoryTitleView.titleFont = notoSansRegular(12);
            _categoryTitleView.titleSelectedFont = notoSansRegular(12);
            _categoryTitleView.defaultSelectedIndex = 1;//默认从第二个开始显示
            _categoryTitleView.titleColorGradientEnabled = YES;
    //        _categoryTitleView.titleLabelZoomEnabled = YES;//默认为NO。为YES时titleSelectedFont失效，以titleFont为准。这句话貌似有点问题，等作者回复
            _categoryTitleView.listContainer = self.listContainerView;
            _categoryTitleView.counts = self.numberMutArr;
            _categoryTitleView.numberLabelOffset = CGPointMake(JobsWidth(5), JobsWidth(2));
            /// 内部默认不会格式化数字，直接转成字符串显示。比如业务需要数字超过999显示999+，可以通过该block实现。
            _categoryTitleView.numberStringFormatterBlock = ^NSString *(NSInteger number) {
                if (number > 999) {
                    return @"999+";
                }
                return [NSString stringWithFormat:@"%ld", (long)number];
            };
            /// 关联cotentScrollView，关联之后才可以互相联动！！！
            _categoryTitleView.contentScrollView = self.listContainerView.scrollView;
            _categoryView.indicators = @[self.categoryBgView];/// BackgroundView 椭圆形
            [_categoryTitleView reloadDataWithoutListContainer];
            [self.view addSubview:_categoryTitleView];
            [_categoryTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.topLineLab.mas_bottom);
                make.left.right.equalTo(self.view);
                make.height.mas_equalTo(listContainerViewDefaultOffset);
            }];
        }return _categoryTitleView;
    }
    ```

#### 31.2、[**`JobsToggleView`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/JobsToggleView)优化自[**`RPTaggedNavView`**](https://github.com/RollingPin/RPTaggedNavView)

* `JobsToggleBaseView`
  * <font color=red>**这是一个纯视图**</font> 对外调用这个视图容器
  * `JobsToggleNavView`作为`JobsToggleBaseView`的属性，不对外暴露，仅通过`-(JobsToggleNavView *)getToggleNavView;`对外界访问
  * 上部的导航用`UIButton`的最新Api实现，可以丰富表现形式
  * 点击了导航的按钮以后在`JobsToggleBaseView`的`scrollviewDelegate`实现滚动逻辑
  * <font color=red>点击和手动滑动最后都会触发`- (void)selectingOneTagWithIndex:(NSInteger)index`</font>
  * 点击和手动滑动最后都会进入`- (void)scrollViewDidScroll:(UIScrollView *)scrollView`，但是，因为`- (void)scrollViewDidScroll:(UIScrollView *)scrollView`要反复调用，<u>所以将视图手动滚动逻辑的生命周期提前到`-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate`</u>
  
* `JobsToggleNavView`
  * 上部的导航栏
  * 可点击部分由`UIButton`构成，并匹配了系统最新的Api，丰富使用
  
* 使用方式
  
  ```objective-c
  @property(nonatomic,strong)JobsToggleBaseView *toggleBaseView;
  @property(nonatomic,strong)Login_account_code_view *account_code_view;
  @property(nonatomic,strong)Login_verification_code_view *verification_code_view;
  ```
  
  ```objective-c
  @synthesize buttonModel = _buttonModel;
  
  -(JobsToggleBaseView *)toggleBaseView{
      if(!_toggleBaseView){
          _toggleBaseView = JobsToggleBaseView.new;
  //        _toggleBaseView.backgroundColor = JobsClearColor;
          _toggleBaseView.buttonModel = self.buttonModel;
          [self addSubview:_toggleBaseView];
          [_toggleBaseView mas_makeConstraints:^(MASConstraintMaker *make) {
              make.size.mas_equalTo([JobsToggleBaseView viewSizeWithModel:nil]);
              make.top.equalTo(self);
              make.centerX.equalTo(self);
          }];
   				[self layoutIfNeeded];
          _toggleBaseView.taggedNavTitles = (NSMutableArray *)@[JobsInternationalization(@"PHONE NO."),JobsInternationalization(@"ACCOUNT NAME")];
          _toggleBaseView.scrollContentViews = (NSMutableArray *)@[self.verification_code_view,self.account_code_view];
          _toggleBaseView.btn_each_offset = JobsWidth(10);
          _toggleBaseView.taggedNavView_height = JobsWidth(24);
          _toggleBaseView.taggedNavView_width = JobsWidth(180);
          _toggleBaseView.toggleView_size = CGSizeMake(JobsWidth(400), JobsWidth(250));
          [_toggleBaseView richElementsInViewWithModel:nil];
          _toggleBaseView.getToggleNavView.backgroundColor = JobsClearColor;
      }return _toggleBaseView;
  }
  
  -(Login_verification_code_view *)verification_code_view{
      if(!_verification_code_view){
          _verification_code_view = Login_verification_code_view.new;
          _verification_code_view.size = [_verification_code_view viewSizeWithModel:nil];
          [_verification_code_view richElementsInViewWithModel:nil];
      }return _verification_code_view;
  }
  
  -(Login_account_code_view *)account_code_view{
      if(!_account_code_view){
          _account_code_view = Login_account_code_view.new;
          _account_code_view.size = [_account_code_view viewSizeWithModel:nil];
          [_account_code_view richElementsInViewWithModel:nil];
      }return _account_code_view;
  }
  
  -(UIButtonModel *)buttonModel{
      if(!_buttonModel){
          _buttonModel = UIButtonModel.new;
          _buttonModel.selected_titleFont = bayonRegular(JobsWidth(16));
          _buttonModel.titleFont = bayonRegular(JobsWidth(16));
          _buttonModel.selected_titleFont = bayonRegular(JobsWidth(16));
          _buttonModel.titleCor = JobsCor(@"#ABABAB");
          _buttonModel.selected_titleCor = JobsCor(@"#FFFFFF");
          _buttonModel.selected_backgroundImage = JobsIMG(@"按钮-8");
          _buttonModel.backgroundImage = JobsIMG(@"透明图");
          _buttonModel.baseBackgroundColor = JobsClearColor;
          _buttonModel.roundingCorners = UIRectCornerAllCorners;
      }return _buttonModel;
  }
  ```

#### 31.3、[**`JobsLinkageMenuView`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/JobsLinkageMenuView)优化自 [**`LinkageMenuView`**](https://github.com/EmotionV/LinkageMenu)

* <font color=red>**这是一个纯视图**</font>

* 可点击的部分是由`UIButton`实现的

* 使用方式

  ```objective-c
  @property(nonatomic,strong)JobsLinkageMenuView *menuView;
  ```

  ```objective-c
  -(JobsLinkageMenuView *)menuView{
      if(!_menuView){
          _menuView = [JobsLinkageMenuView.alloc initWithFrame:self.bounds 
                                                     btnConfig:self.buttonModel];
          @jobs_weakify(self)
          [_menuView actionObjectBlock:^(id  _Nullable x) {
              @jobs_strongify(self)
              if (self.objectBlock) self.objectBlock(x);
          }];
          [self addSubview:_menuView];
      }return _menuView;
  }
  
  -(UIButtonModel *)buttonModel{
      if(!_buttonModel){
          _buttonModel = UIButtonModel.new;
          _buttonModel.normal_titles = self.titleMutArr;
          _buttonModel.titleCor = JobsClearColor;
          _buttonModel.selected_titleCor = JobsClearColor;
          _buttonModel.normal_backgroundImages = self.normal_titleBgImageMutArr;
          _buttonModel.selected_backgroundImages = self.select_titleBgImageMutArr;// TODO
          _buttonModel.data = self.subViewMutArr;
      }return _buttonModel;
  }
  
  -(NSMutableArray<NSString *> *)titleMutArr{
      if(!_titleMutArr){
          _titleMutArr = NSMutableArray.array;
          [_titleMutArr addObject:JobsInternationalization(@"TOP GAMES")];
          [_titleMutArr addObject:JobsInternationalization(@"SLOT GAMES")];
          [_titleMutArr addObject:JobsInternationalization(@"LIVE CASINO")];
          [_titleMutArr addObject:JobsInternationalization(@"TABLE GAMES")];
          [_titleMutArr addObject:JobsInternationalization(@"SPORTS")];
          [_titleMutArr addObject:JobsInternationalization(@"FISHING")];
      }return _titleMutArr;
  }
  
  -(NSMutableArray<__kindof UIView *> *)subViewMutArr{
      if(!_subViewMutArr){
          _subViewMutArr = NSMutableArray.array;
          [_subViewMutArr addObject:self.topGamesView];
          [_subViewMutArr addObject:self.slotGamesView];
          [_subViewMutArr addObject:self.liveCasinoView];
          [_subViewMutArr addObject:self.tableGamesView];
          [_subViewMutArr addObject:self.sportsView];
          [_subViewMutArr addObject:self.fishingView];
      }return _subViewMutArr;
  }
  
  -(NSMutableArray<UIImage *> *)normal_titleBgImageMutArr{
      if(!_normal_titleBgImageMutArr){
          _normal_titleBgImageMutArr = NSMutableArray.array;
          [_normal_titleBgImageMutArr addObject:JobsIMG(@"Top_Games_menu")];
          [_normal_titleBgImageMutArr addObject:JobsIMG(@"Slot_Games_menu")];
          [_normal_titleBgImageMutArr addObject:JobsIMG(@"Live_Casino_menu")];
          [_normal_titleBgImageMutArr addObject:JobsIMG(@"Table_Games_menu")];
          [_normal_titleBgImageMutArr addObject:JobsIMG(@"Sport_Menu")];
          [_normal_titleBgImageMutArr addObject:JobsIMG(@"Fishing_menu")];
      }return _normal_titleBgImageMutArr;
  }
  // TODO
  -(NSMutableArray<UIImage *> *)select_titleBgImageMutArr{
      if(!_select_titleBgImageMutArr){
          _select_titleBgImageMutArr = NSMutableArray.array;
          [_select_titleBgImageMutArr addObject:JobsIMG(@"Top_Games_menu")];
          [_select_titleBgImageMutArr addObject:JobsIMG(@"Slot_Games_menu")];
          [_select_titleBgImageMutArr addObject:JobsIMG(@"Live_Casino_menu")];
          [_select_titleBgImageMutArr addObject:JobsIMG(@"Table_Games_menu")];
          [_select_titleBgImageMutArr addObject:JobsIMG(@"Sport_Menu")];
          [_select_titleBgImageMutArr addObject:JobsIMG(@"Fishing_menu")];
      }return _select_titleBgImageMutArr;
  }
  
  -(TopGamesView *)topGamesView{
      if(!_topGamesView){
          _topGamesView = TopGamesView.new;
          _topGamesView.frame = self.bounds;
          [_topGamesView richElementsInViewWithModel:nil];
      }return _topGamesView;
  }
  
  -(SlotGamesView *)slotGamesView{
      if(!_slotGamesView){
          _slotGamesView = SlotGamesView.new;
          _slotGamesView.frame = self.bounds;
          [_slotGamesView richElementsInViewWithModel:nil];
      }return _slotGamesView;
  }
  
  -(LiveCasinoView *)liveCasinoView{
      if(!_liveCasinoView){
          _liveCasinoView = LiveCasinoView.new;
          _liveCasinoView.frame = self.bounds;
          [_liveCasinoView richElementsInViewWithModel:nil];
      }return _liveCasinoView;
  }
  
  -(TableGamesView *)tableGamesView{
      if(!_tableGamesView){
          _tableGamesView = TableGamesView.new;
          _tableGamesView.frame = self.bounds;
          [_tableGamesView richElementsInViewWithModel:nil];
      }return _tableGamesView;
  }
  
  -(SportsView *)sportsView{
      if(!_sportsView){
          _sportsView = SportsView.new;
          _sportsView.frame = self.bounds;
          [_sportsView richElementsInViewWithModel:nil];
      }return _sportsView;
  }
  
  -(FishingView *)fishingView{
      if(!_fishingView){
          _fishingView = FishingView.new;
          _fishingView.frame = self.bounds;
          [_fishingView richElementsInViewWithModel:nil];
      }return _fishingView;
  }
  ```

### 32、切角 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 切整个View的4个角为统一的切角参数

  ```objective-c
  -(jobsByCGFloatBlock _Nonnull)cornerCutToCircleWithCornerRadius{
      @jobs_weakify(self)
      return ^(CGFloat cornerRadiusValue) {
          self.layer.cornerRadius = cornerRadiusValue;
          self.layer.masksToBounds = YES;
      };
  }
  ```

* 指定圆切角（方法一）

  ⚠️这种写法存在一定的弊端：如果在某个View上添加子View，并对这个View使用如下方法的圆切角，则这个View上的子视图不可见⚠️

  ```objective-c
  -(void)appointCornerCutToCircleByRoundingCorners:(UIRectCorner)corners
                                       cornerRadii:(CGSize)cornerRadii{
      // 设置切哪个直角
      //    UIRectCornerTopLeft     = 1 << 0,  左上角
      //    UIRectCornerTopRight    = 1 << 1,  右上角
      //    UIRectCornerBottomLeft  = 1 << 2,  左下角
      //    UIRectCornerBottomRight = 1 << 3,  右下角
      //    UIRectCornerAllCorners  = ~0UL     全部角
      if (CGSizeEqualToSize(cornerRadii, CGSizeZero)) {
          cornerRadii = CGSizeMake(self.width / 2,self.height / 2);
      }
      /// 得到view的遮罩路径
      UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                     byRoundingCorners:corners
                                                           cornerRadii:cornerRadii];
      /// 创建 layer
      CAShapeLayer *maskLayer = CAShapeLayer.new;
      maskLayer.frame = self.bounds;
      /// 赋值
      maskLayer.path = maskPath.CGPath;
      self.layer.mask = maskLayer;
  }
  ```

* 指定圆切角（方法二），避免了（方法一）的弊端

  作用于需要切的View的子类里面的`-(void)layoutSubviews`方法

  ```objective-c
  -(void)layoutSubviewsCutCnrByRoundingCorners:(UIRectCorner)corners
                                   cornerRadii:(CGSize)cornerRadii{
      //    设置切哪个直角
      //    UIRectCornerTopLeft     = 1 << 0,  左上角
      //    UIRectCornerTopRight    = 1 << 1,  右上角
      //    UIRectCornerBottomLeft  = 1 << 2,  左下角
      //    UIRectCornerBottomRight = 1 << 3,  右下角
      //    UIRectCornerAllCorners  = ~0UL     全部角
      
      if (CGSizeEqualToSize(cornerRadii, CGSizeZero)) {
          cornerRadii = CGSizeMake(self.width / 2,self.height / 2);
      }
      
      UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                     byRoundingCorners:corners
                                                           cornerRadii:cornerRadii];
      CAShapeLayer *maskLayer = CAShapeLayer.layer;
      maskLayer.frame = self.bounds;
      maskLayer.path = maskPath.CGPath;
      self.layer.mask = maskLayer;
  }
  ```

### 33、刷新控件 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* <font color=blue>都是锚定在其公共父类**UIScrollView**</font>

#### 33.1、纵向的刷新 [**MJRefresh**](https://github.com/CoderMJLee/MJRefresh)

* 集成方式
  
  ```ruby
  pod 'MJRefresh' # https://github.com/CoderMJLee/MJRefresh NO_SMP 不支持横向刷新
  ```
  
  ```objective-c
  #if __has_include(<MJRefresh/MJRefresh.h>)
  #import <MJRefresh/MJRefresh.h>
  #else
  #import "MJRefresh.h"
  #endif
  ```
  
*  使用方式
  
  * [**对`UITableView`的使用方式**](#创建UITableView) 
  * [**对`UICollectionView`的使用方式**](#创建UICollectionView)

#### 33.2、水平方向的刷新 [**XZMRefresh**](https://github.com/xiezhongmin/XZMRefresh)

* 集成方式
  
  ```ruby
  pod 'XZMRefresh' # https://github.com/xiezhongmin/XZMRefresh
  ```
  
  ```objective-c
  #if __has_include(<XZMRefresh/XZMRefresh.h>)
  #import <XZMRefresh/XZMRefresh.h>
  #else
  #import "XZMRefresh.h"
  #endif
  ```
  
* <font color=red>**值得注意**</font>

  * 需要在母控件正确得出Frame值以后，**XZMRefresh**方可生效。否则可能出现**xzm_header**或者**xzm_footer**的Frame值不正确（比如，高为0）

    * ```objective-c
      [self layoutIfNeeded];
      ```
  
    * ```objective-c
      [self.view layoutIfNeeded];
      ```
  
  * 如果母控件是**`UICollectionView`**，需要使用<font color=red>**`XZMLayout`**</font>
  
    ```objective-c
    #import <UIKit/UIKit.h>
    @interface XZMLayout : UICollectionViewFlowLayout
    @end
    ```
  
    ```objective-c
    @implementation XZMLayout
    
    -(instancetype)init{
        if (self = [super init]) {
            
        }return self;
    }
    /**
     * 当collectionView的显示范围发生改变的时候，是否需要重新刷新布局
     * 一旦重新刷新布局，就会重新调用下面的方法：
     1.prepareLayout
     2.layoutAttributesForElementsInRect:方法
     */
    - (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
        return YES;
    }
    /// 用来做布局的初始化操作（不建议在init方法中进行布局的初始化操作）
    - (void)prepareLayout{
        [super prepareLayout];
        // 水平滚动
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
        /** 设置内边距 */
        self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    }
    /**
     UICollectionViewLayoutAttributes *attrs;
     1.一个cell对应一个UICollectionViewLayoutAttributes对象
     2.UICollectionViewLayoutAttributes对象决定了cell的frame
     */
    /// 这个方法的返回值是一个数组（数组里面存放着rect范围内所有元素的布局属性）
    /// 这个方法的返回值决定了rect范围内所有元素的排布（frame）
    - (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
        // 获得super已经计算好的布局属性
        NSArray *array = [super layoutAttributesForElementsInRect:rect];
        // 计算collectionView最中心点的x值
        CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
        // 在原有布局属性的基础上，进行微调
        for (UICollectionViewLayoutAttributes *attrs in array) {
            // cell的中心点x 和 collectionView最中心点的x值 的间距
            CGFloat delta = ABS(attrs.center.x - centerX);
            // 根据间距值 计算 cell的缩放比例
            CGFloat scale = 1 - delta / self.collectionView.frame.size.width * 0.15;
            // 设置缩放比例
            attrs.transform = CGAffineTransformMakeScale(scale, scale);
        }return array;
    }
    /// 这个方法的返回值，就决定了collectionView停止滚动时的偏移量
    - (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset
                                     withScrollingVelocity:(CGPoint)velocity{
        // 计算出最终显示的矩形框
        CGRect rect;
        rect.origin.y = 0;
        rect.origin.x = proposedContentOffset.x;
        rect.size = self.collectionView.frame.size;
        // 获得super已经计算好的布局属性
        NSArray *array = [super layoutAttributesForElementsInRect:rect];
        // 计算collectionView最中心点的x值
        CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
        // 存放最小的间距值
        CGFloat minDelta = MAXFLOAT;
        for (UICollectionViewLayoutAttributes *attrs in array) {
            if (ABS(minDelta) > ABS(attrs.center.x - centerX)) {
                minDelta = attrs.center.x - centerX;
            }
        }
        // 修改原有的偏移量
        proposedContentOffset.x += minDelta;
        return proposedContentOffset;
    }
    
    @end
    ```
  
* 使用方式（以**UICollectionView**为例，**UITableView**同理）

  * **`UICollectionView` + 默认刷新**

    ```objective-c
    -(void)example01{
        @jobs_weakify(self)
        [_collectionView xzm_addNormalHeaderWithTarget:self
                                                action:selectorBlocks(^id(id target, id arg) {
            NSLog(@"KKK加载新的数据，参数: %@", arg);
            // 模拟延迟加载数据，因此2秒后才调用）
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                [self->_collectionView reloadData];
                [self->_collectionView.xzm_header endRefreshing];// 结束刷新
            });return nil;
        }, nil, self)];
    
        [_collectionView xzm_addNormalFooterWithTarget:self
                                                action:selectorBlocks(^id(id target, id arg) {
            NSLog(@"SSSS加载新的数据，参数: %@", arg);
            @jobs_strongify(self)
            // 模拟延迟加载数据，因此2秒后才调用）
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(2.0 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                [self->_collectionView reloadData];
                [self->_collectionView.xzm_footer endRefreshing];// 结束刷新
            });return nil;
        }, nil, self)];
    
        [_collectionView.xzm_header beginRefreshing];
    }
    ```

  * **`UICollectionView` + 隐藏时间**

    ```objective-c
    #pragma mark 
    -(void)example02{
        @jobs_weakify(self)
        [_collectionView xzm_addNormalHeaderWithTarget:self
                                                action:selectorBlocks(^id(id target, id arg) {
            NSLog(@"KKK加载新的数据，参数: %@", arg);
            // 模拟延迟加载数据，因此2秒后才调用）
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                [self->_collectionView reloadData];
                [self->_collectionView.xzm_header endRefreshing];// 结束刷新
            });return nil;
        }, nil, self)];
    
        [_collectionView xzm_addNormalFooterWithTarget:self
                                                action:selectorBlocks(^id(id target, id arg) {
            NSLog(@"SSSS加载新的数据，参数: %@", arg);
            @jobs_strongify(self)
            // 模拟延迟加载数据，因此2秒后才调用）
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(2.0 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                [self->_collectionView reloadData];
                [self->_collectionView.xzm_footer endRefreshing];// 结束刷新
            });return nil;
        }, nil, self)];
    
        // 隐藏时间
        _collectionView.xzm_header.updatedTimeHidden = YES;
        [_collectionView.xzm_header beginRefreshing];
    }
    ```

  * **`UICollectionView` + 动图刷新**

    ```objective-c
    -(void)example03{
        @jobs_weakify(self)
        [_collectionView xzm_addGifHeaderWithTarget:self
                                             action:selectorBlocks(^id(id target, id arg) {
            NSLog(@"KKK加载新的数据，参数: %@", arg);
            // 模拟延迟加载数据，因此2秒后才调用）
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                [self->_collectionView reloadData];
                [self->_collectionView.xzm_header endRefreshing];// 结束刷新
            });return nil;
        }, nil, self)];
    
        [_collectionView xzm_addGifFooterWithTarget:self
                                             action:selectorBlocks(^id(id target, id arg) {
            NSLog(@"SSSS加载新的数据，参数: %@", arg);
            @jobs_strongify(self)
            // 模拟延迟加载数据，因此2秒后才调用）
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(2.0 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                [self->_collectionView reloadData];
                [self->_collectionView.xzm_footer endRefreshing];// 结束刷新
            });return nil;
        }, nil, self)];
    
        // 设置普通状态的动画图片
        NSMutableArray *idleImages = NSMutableArray.array;
        for (NSUInteger i = 1; i<=60; i++) {
            UIImage *image = JobsIMG([NSString stringWithFormat:@"dropdown_anim__000%zd", i]);
            [idleImages addObject:image];
        }
        [_collectionView.xzm_gifHeader setImages:idleImages forState:XZMRefreshStateNormal];
        [_collectionView.xzm_gifFooter setImages:idleImages forState:XZMRefreshStateNormal];
        // 设置正在刷新状态的动画图片
        NSMutableArray <UIImage *>*refreshingImages = NSMutableArray.array;
        for (NSUInteger i = 1; i<=3; i++) {
            UIImage *image = JobsIMG([NSString stringWithFormat:@"dropdown_loading_0%zd", i]);
            [refreshingImages addObject:image];
        }
        [_collectionView.xzm_gifHeader setImages:refreshingImages forState:XZMRefreshStateRefreshing];
        [_collectionView.xzm_gifFooter setImages:refreshingImages forState:XZMRefreshStateRefreshing];
        // 马上进入刷新状态
        [_collectionView.xzm_gifHeader beginRefreshing];
    }
    ```

  * **`UICollectionView` + 动图刷新 + 隐藏文字**

    ```objective-c
    -(void)example04{
        @jobs_weakify(self)
        [_collectionView xzm_addGifHeaderWithTarget:self
                                             action:selectorBlocks(^id(id target, id arg) {
            NSLog(@"KKK加载新的数据，参数: %@", arg);
            // 模拟延迟加载数据，因此2秒后才调用）
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                [self->_collectionView reloadData];
                [self->_collectionView.xzm_header endRefreshing];// 结束刷新
            });return nil;
        }, nil, self)];
    
        [_collectionView xzm_addGifFooterWithTarget:self
                                             action:selectorBlocks(^id(id target, id arg) {
            NSLog(@"SSSS加载新的数据，参数: %@", arg);
            @jobs_strongify(self)
            // 模拟延迟加载数据，因此2秒后才调用）
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(2.0 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                [self->_collectionView reloadData];
                [self->_collectionView.xzm_footer endRefreshing];// 结束刷新
            });return nil;
        }, nil, self)];
        // 隐藏时间
        _collectionView.xzm_gifHeader.updatedTimeHidden = YES;
        // 隐藏状态
        _collectionView.xzm_gifHeader.stateHidden = YES;
        _collectionView.xzm_gifFooter.stateHidden = YES;
        // 设置普通状态的动画图片
        NSMutableArray <UIImage *>*idleImages = NSMutableArray.array;
        for (NSUInteger i = 1; i<=60; i++) {
            UIImage *image = JobsIMG([NSString stringWithFormat:@"dropdown_anim__000%zd", i]);
            [idleImages addObject:image];
        }
        [_collectionView.xzm_gifHeader setImages:idleImages forState:XZMRefreshStateNormal];
        [_collectionView.xzm_gifFooter setImages:idleImages forState:XZMRefreshStateNormal];
        // 设置正在刷新状态的动画图片
        NSMutableArray <UIImage *>*refreshingImages = NSMutableArray.array;
        for (NSUInteger i = 1; i<=3; i++) {
            UIImage *image = JobsIMG([NSString stringWithFormat:@"dropdown_loading_0%zd", i]);
            [refreshingImages addObject:image];
        }
        [_collectionView.xzm_gifHeader setImages:refreshingImages forState:XZMRefreshStateRefreshing];
        [_collectionView.xzm_gifFooter setImages:refreshingImages forState:XZMRefreshStateRefreshing];
        // 马上进入刷新状态
        [_collectionView.xzm_gifHeader beginRefreshing];
    }
    ```

  * **`UICollectionView` + 自定义文字**

    ```objective-c
    -(void)example05{
        @jobs_weakify(self)
        [_collectionView xzm_addNormalHeaderWithTarget:self
                                                action:selectorBlocks(^id(id target, id arg) {
            NSLog(@"KKK加载新的数据，参数: %@", arg);
            // 模拟延迟加载数据，因此2秒后才调用）
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                [self->_collectionView reloadData];
                [self->_collectionView.xzm_header endRefreshing];// 结束刷新
            });return nil;
        }, nil, self)];
    
        [_collectionView xzm_addNormalFooterWithTarget:self
                                             action:selectorBlocks(^id(id target, id arg) {
            NSLog(@"SSSS加载新的数据，参数: %@", arg);
            @jobs_strongify(self)
            // 模拟延迟加载数据，因此2秒后才调用）
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(2.0 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                [self->_collectionView reloadData];
                [self->_collectionView.xzm_footer endRefreshing];// 结束刷新
            });return nil;
        }, nil, self)];
        // 设置header文字
        [_collectionView.xzm_header setTitle:JobsInternationalization(@"滑动可以刷新") forState:XZMRefreshStateNormal];
        [_collectionView.xzm_header setTitle:JobsInternationalization(@"释放立即刷新") forState:XZMRefreshStatePulling];
        [_collectionView.xzm_header setTitle:JobsInternationalization(@"正在刷新中 ...") forState:XZMRefreshStateRefreshing];
        // 设置字体
        _collectionView.xzm_header.font = UIFontWeightRegularSize(15);
        // 设置颜色
        _collectionView.xzm_header.textColor = JobsRedColor;
        // 设置footer文字
        [_collectionView.xzm_footer setTitle:JobsInternationalization(@"滑动可以刷新") forState:XZMRefreshStateNormal];
        [_collectionView.xzm_footer setTitle:JobsInternationalization(@"释放立即刷新") forState:XZMRefreshStatePulling];
        [_collectionView.xzm_footer setTitle:JobsInternationalization(@"正在加载中数据 ...") forState:XZMRefreshStateRefreshing];
        // 设置字体
        _collectionView.xzm_footer.font = UIFontWeightRegularSize(17);
        // 设置颜色
        _collectionView.xzm_footer.textColor = JobsBlueColor;
        // 自动刷新(一进入程序就下拉刷新)
        [_collectionView.xzm_header beginRefreshing];
    }
    ```

### 34、<font color=red>**网络请求框架**</font> <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* ```objective-c
  -(void)基础的网络请求示例{
     [AFHTTPSessionManager.manager GET:@"http://172.24.135.12/CommentData.json"
                            parameters:nil
                               headers:nil
                              progress:^(NSProgress * _Nonnull downloadProgress) {
     } success:^(NSURLSessionDataTask * _Nonnull task,
                 id  _Nullable responseObject) {
         NSLog(@"%@",responseObject);
     } failure:^(NSURLSessionDataTask * _Nullable task,
                 NSError * _Nonnull error) {
         NSLog(@"%@",error);
     }];
  }
  ```

#### 34.1、[**猿题库的网络框架（强烈推荐使用）**](https://github.com/yuantiku/YTKNetwork)

* 集成
  
  ```ruby
  pod 'YTKNetwork' # https://github.com/yuantiku/YTKNetwork
  ```
  
  ```objective-c
  #if __has_include(<YTKNetwork/YTKNetwork.h>)
  #import <YTKNetwork/YTKNetwork.h>
  #else
  #import "YTKNetwork.h"
  #endif
  ```
  
* 公共配置：下列配置一般体现在**AppDelegate**

  ```objective-c
  YTKNetworkConfig *config = YTKNetworkConfig.sharedConfig;
  config.baseUrl = self.BaseUrl;
  config.cdnUrl = JobsInternationalization(@"");
  //config.urlFilters = nil;
  //config.cacheDirPathFilters = nil;
  config.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
  config.debugLogEnabled = YES;
  config.sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration;
  
  YTKUrlArgumentsFilter *urlFilter = [YTKUrlArgumentsFilter filterWithArguments:@{@"version": self.appVersion}];
  [config addUrlFilter:urlFilter];
  ```

* 请求的配置（<font color=blue>**请求的方式**</font>、<font color=blue>**请求的URL**</font>、是否使用CND...）

  ```objective-c
  @implementation GetImageApi {
      NSDictionary *_Nullable _parameters;
  }
  
  -(instancetype _Nullable)initWithParameters:(NSDictionary *_Nullable)parameters{
      if (self = [super init]) {
          _parameters = parameters;
      }return self;
  }
  
  -(NSString *)requestUrl{
      return self.BaseUrl.add(@"");
  }
  /// 请求方式
  -(YTKRequestMethod)requestMethod {
      return YTKRequestMethodGET;
  }
  
  //-(BOOL)useCDN{
  //    return YES;
  //}
  
  //-(NSString *)resumableDownloadPath{
  //    NSString *libPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
  //    NSString *cachePath = [libPath stringByAppendingPathComponent:@"Caches"];
  //    NSString *filePath = [cachePath stringByAppendingPathComponent:_imageId];
  //    return filePath;
  //}
  
  @end
  ```

* 请求方式

  * **普通的单个请求**

    ```objective-c
    /// 普通的单个请求
    -(void)loadCacheData{
        GetCustomerContactApi *api = [GetCustomerContactApi.alloc initWithParameters:nil];
        if ([api loadCacheWithError:nil]) {
            NSDictionary *json = [api responseJSONObject];
            NSLog(@"json = %@", json);
            // show cached data
        }
    
        api.animatingText = JobsInternationalization(@"正在加载");
        api.animatingView = self.view;
    
        [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
            NSLog(@"update ui");
            /// 以下是我们需要的值
            request.responseObject;
        } failure:^(YTKBaseRequest *request) {
            NSLog(@"failed");
        }];
    }
    ```

  * **多请求**

    * <font color=red>**同步请求**</font>

      ```objective-c
      /// 同步请求
      -(void)sendBatchRequest{
          GetImageApi *a = [GetImageApi.alloc initWithParameters:nil];
          GetImageApi *b = [GetImageApi.alloc initWithParameters:nil];
          GetImageApi *c = [GetImageApi.alloc initWithParameters:nil];
          GetUserInfoApi *d = [GetUserInfoApi.alloc initWithParameters:nil];
          
          YTKBatchRequest *batchRequest = [YTKBatchRequest.alloc initWithRequestArray:@[a, b, c, d]];
          [batchRequest startWithCompletionBlockWithSuccess:^(YTKBatchRequest *batchRequest) {
              NSLog(@"succeed");
              NSArray *requests = batchRequest.requestArray;
              GetImageApi *a = (GetImageApi *)requests[0];
              GetImageApi *b = (GetImageApi *)requests[1];
              GetImageApi *c = (GetImageApi *)requests[2];
              GetUserInfoApi *user = (GetUserInfoApi *)requests[3];
              ///deal with requests result ...
              NSLog(@"%@, %@, %@, %@", a, b, c, user);
              
              /// 以下是我们需要的值
              a.responseObject;
              b.responseObject;
              c.responseObject;
              user.responseObject;
              
          } failure:^(YTKBatchRequest *batchRequest) {
              NSLog(@"failed");
          }];
      }
      ```

    * <font color=red>**链式请求**</font>

      ```objective-c
      /// 链式请求的结果集体现在<YTKChainRequestDelegate>
      -(void)sendChainRequest{
          RegisterApi *reg = [RegisterApi.alloc initWithParameters:nil];
          YTKChainRequest *chainReq = YTKChainRequest.new;
          @jobs_weakify(self)
          [chainReq addRequest:reg
                      callback:^(YTKChainRequest *chainRequest,
                                 YTKBaseRequest *baseRequest) {
              @jobs_strongify(self)
              RegisterApi *result = (RegisterApi *)baseRequest;
              /// 在链式请求中，下一个请求的参数来源于上一个请求的结果
              GetUserInfoApi *api = [GetUserInfoApi.alloc initWithParameters:@{@"KKK":result.userId}];
              [chainRequest addRequest:api callback:nil];
          }];
          chainReq.delegate = self;
          [chainReq start];// start to send request
      }
      ```

      链式请求的结果集体现在 **YTKChainRequestDelegate**

      ```objective-c
      #pragma mark —— YTKChainRequestDelegate
      -(void)chainRequestFinished:(YTKChainRequest *)chainRequest{
          NSLog(@"all requests are done");
      }
      
      -(void)chainRequestFailed:(YTKChainRequest *)chainRequest
              failedBaseRequest:(YTKBaseRequest*)request{
          NSLog(@"some one of request is failed");
      }
      ```

#### 34.2、[**ZBNetworking**](https://github.com/Suzhibin/ZBNetworking)

* 集成

  ```ruby
  pod 'ZBNetworking', :git => 'https://github.com/Suzhibin/ZBNetworking.git'
  ```

  ```objective-c
  #if __has_include(<ZBNetworking/ZBNetworking.h>)
  #import <ZBNetworking/ZBNetworking.h>
  #else
  #import "ZBNetworking.h"
  #endif
  ```

* 一些拓展

  **JobsNetworkingAPI**

  ```objective-c
  @interface JobsNetworkingAPI : NSObject
  #pragma mark —— 普通的网络请求
  /// 【只有Body参数、不需要错误回调】
  +(void)requestApi:(NSString *_Nonnull)requestApi
         parameters:(id _Nullable)parameters
       successBlock:(jobsByIDBlock _Nullable)successBlock;
  ///【只有Body参数、需要错误回调的】
  +(void)requestApi:(NSString *_Nonnull)requestApi
         parameters:(id _Nullable)parameters
       successBlock:(jobsByIDBlock _Nullable)successBlock
       failureBlock:(jobsByIDBlock _Nullable)failureBlock;
  #pragma mark —— 特殊的上传文件的网络请求
  /// 上传【图片】文件的网络请求
  +(void)requestApi:(NSString *_Nonnull)requestApi
  uploadImagesParamArr:(NSArray *_Nullable)uploadImagesParamArr
       successBlock:(jobsByIDBlock _Nullable)successBlock
       failureBlock:(jobsByIDBlock _Nullable)failureBlock;
  /// 上传【视频】文件的网络请求
  +(void)requestApi:(NSString *_Nonnull)requestApi
  uploadVideosParamArr:(NSArray *_Nullable)uploadVideosParamArr
       successBlock:(jobsByIDBlock _Nullable)successBlock
       failureBlock:(jobsByIDBlock _Nullable)failureBlock;
  /// 请求成功的处理代码
  +(void)networkingSuccessHandleWithData:(JobsResponseModel *_Nullable)responseObject
                                 request:(ZBURLRequest *_Nullable)request
                            successBlock:(jobsByIDBlock _Nullable)successBlock
                            failureBlock:(jobsByIDBlock _Nullable)failureBlock;
  #pragma mark —— 错误处理
  +(void)handleError:(id)error;
  
  @end
  ```

* 普通的请求（**POST**、**GET**）：<font color=blue>**请求方法配置在如下的单个的api里面**</font>

  ```objective-c
  NSString *appInterfaceTesting;
  +(void)appInterfaceTesting:(id)parameters
                successBlock:(jobsByIDBlock _Nullable)successBlock
                failureBlock:(jobsByIDBlock _Nullable)failureBlock{
  //    NSDictionary *parameterss = @{};
  //    NSDictionary *headers = @{};
      
      [ZBRequestManager requestWithConfig:^(ZBURLRequest * _Nullable request) {
  
          request.server = self.BaseUrl;
          request.url = request.server.add(self.appInterfaceTesting.url);
          
          NSLog(@"request.URLString = %@",request.url);
          
          request.methodType = ZBMethodTypeGET;//默认为GET
          request.apiType = ZBRequestTypeRefresh;//（默认为ZBRequestTypeRefresh 不读取缓存，不存储缓存）
          request.parameters = parameters;//与公共配置 Parameters 兼容
  //        request.headers = headers;//与公共配置 Headers 兼容
          request.retryCount = 1;//请求失败 单次请求 重新连接次数 优先级大于 全局设置，不影响其他请求设置
          request.timeoutInterval = 10;//默认30 //优先级 高于 公共配置,不影响其他请求设置
          if (!DataManager.sharedInstance.tag.nullString) {
              request.userInfo = @{@"info":DataManager.sharedInstance.tag};//与公共配置 UserInfo 不兼容 优先级大于 公共配置
          };//与公共配置 UserInfo 不兼容 优先级大于 公共配置
          
          {
  //            request.filtrationCacheKey = @[JobsInternationalization(@"")];//与公共配置 filtrationCacheKey 兼容
  //            request.requestSerializer = ZBJSONRequestSerializer; //单次请求设置 请求格式 默认JSON，优先级大于 公共配置，不影响其他请求设置
  //            request.responseSerializer = ZBJSONResponseSerializer; //单次请求设置 响应格式 默认JSON，优先级大于 公共配置,不影响其他请求设置
             
              /**
               多次请求同一个接口 保留第一次或最后一次请求结果 只在请求时有用  读取缓存无效果。默认ZBResponseKeepNone 什么都不做
               使用场景是在 重复点击造成的 多次请求，如发帖，评论，搜索等业务
               */
  //            request.keepType=ZBResponseKeepNone;
          }//一些临时的其他的配置
          
      }progress:^(NSProgress * _Nullable progress){
          NSLog(@"进度 = %f",progress.fractionCompleted * 100);
      }success:^(id  _Nullable responseObject,
                 ZBURLRequest * _Nullable request){
          [JobsNetworkingAPI networkingSuccessHandleWithData:responseObject
                                                   request:request
                                              successBlock:successBlock
                                              failureBlock:failureBlock];
      }failure:^(NSError * _Nullable error){
          NSLog(@"error = %@",error);
          if (failureBlock) {
              failureBlock(error);
          }
      }finished:^(id  _Nullable responseObject,
                  NSError * _Nullable error,
                  ZBURLRequest * _Nullable request){
          NSLog(@"请求完成 userInfo:%@",request.userInfo);
      }];
  }
  ```

* 调用示例

  * 一般的网络请求，只带body参数，最多也就是自定义header

    ```objective-c
     -(void)networking_messageSecondClassListGET{
         NSLog(@"当前是否有网：%d 状态：%ld",[ZBRequestManager isNetworkReachable],(long)[ZBRequestManager networkReachability]);
         DataManager.sharedInstance.tag = [ReuseIdentifier stringByAppendingString:NSStringFromSelector(_cmd)];
         [RequestTool setupPublicParameters];//公共配置、插件机制、证书设置
         @jobs_weakify(self)
         NSDictionary *parameters = @{};
         [JobsNetworkingAPI requestApi:NSObject.messageSecondClassListGET.funcName
                          parameters:parameters
                        successBlock:^(id data) {
             @jobs_strongify(self)
         }failureBlock:^(id data) {
             @jobs_strongify(self)
         }];
     }
    ```

    ```objective-c
     /// 邀请好友
     +(void)userInfoInviteFriendPOST:(id)parameters
                        successBlock:(jobsByIDBlock _Nullable)successBlock{
     //    NSDictionary *parameterss = @{};
     //    NSDictionary *headers = @{};
         
         [ZBRequestManager requestWithConfig:^(ZBURLRequest * _Nullable request) {
    
             request.server = NSObject.BaseUrl;
             request.url = [request.server stringByAppendingString:NSObject.userInfoInviteFriendPOST.url];
             
             NSLog(@"request.URLString = %@",request.url);
             
             request.methodType = ZBMethodTypePOST;//默认为GET
             request.apiType = ZBRequestTypeRefresh;//（默认为ZBRequestTypeRefresh 不读取缓存，不存储缓存）
             request.parameters = parameters;//与公共配置 Parameters 兼容
     //        request.headers = headers;//与公共配置 Headers 兼容
             request.retryCount = 1;//请求失败 单次请求 重新连接次数 优先级大于 全局设置，不影响其他请求设置
             request.timeoutInterval = 10;//默认30 //优先级 高于 公共配置,不影响其他请求设置
             if (!DataManager.sharedInstance.tag.nullString) {
                 request.userInfo = @{@"info":DataManager.sharedInstance.tag};//与公共配置 UserInfo 不兼容 优先级大于 公共配置
             };//与公共配置 UserInfo 不兼容 优先级大于 公共配置
             
             {
     //            request.filtrationCacheKey = @[JobsInternationalization(@"")];//与公共配置 filtrationCacheKey 兼容
     //            request.requestSerializer = ZBJSONRequestSerializer; //单次请求设置 请求格式 默认JSON，优先级大于 公共配置，不影响其他请求设置
     //            request.responseSerializer = ZBJSONResponseSerializer; //单次请求设置 响应格式 默认JSON，优先级大于 公共配置,不影响其他请求设置
                
     /// 多次请求同一个接口 保留第一次或最后一次请求结果 只在请求时有用  读取缓存无效果。默认ZBResponseKeepNone 什么都不做。使用场景是在 重复点击造成的 多次请求，如发帖，评论，搜索等业务
     //            request.keepType=ZBResponseKeepNone;
             }//一些临时的其他的配置
             
         }progress:^(NSProgress * _Nullable progress){
             NSLog(@"进度 = %f",progress.fractionCompleted * 100);
         }success:^(id  _Nullable responseObject,
                    ZBURLRequest * _Nullable request){
             if (successBlock) {
                 successBlock(responseObject);
             }
         }failure:^(NSError * _Nullable error){
             NSLog(@"error = %@",error);
         }finished:^(id  _Nullable responseObject,
                     NSError * _Nullable error,
                     ZBURLRequest * _Nullable request){
             NSLog(@"请求完成 userInfo:%@",request.userInfo);
         }];
    }
    ```

  * 特殊的网络请求：可以body里面携带参数，也可以自定义header，并且表单模式post传输data数据

    * **传输图片**

      ```objective-c
      -(void)networking_postUploadImagePOST{
       NSLog(@"当前是否有网：%d 状态：%ld",[ZBRequestManager isNetworkReachable],(long)[ZBRequestManager networkReachability]);
       DataManager.sharedInstance.tag = [ReuseIdentifier stringByAppendingString:NSStringFromSelector(_cmd)];
      
       [RequestTool setupPublicParameters];//公共配置、插件机制、证书设置
       @jobs_weakify(self)
       NSDictionary *parameters = @{};
       [JobsNetworkingAPI requestApi:NSObject.postUploadImagePOST.funcName
              uploadImagesParamArr:@[parameters,
                                     self.photosImageMutArr]
                      successBlock:^(id data) {
           @jobs_strongify(self)
           NSLog(@"data = %@",data);
       }
                      failureBlock:^(id data) {
           @jobs_strongify(self)
           NSLog(@"data = %@",data);
       }];
      }
      ```

      ```objective-c
      +(void)postUploadImagePOST:(id)parameters
             uploadImageDatas:(NSMutableArray<UIImage *> *)uploadImageDatas
                 successBlock:(jobsByIDBlock _Nullable)successBlock
                 failureBlock:(jobsByIDBlock _Nullable)failureBlock{
       
       NSMutableArray *uploadDatas = NSMutableArray.array;
       for (int i = 0; i < uploadImageDatas.count; i++) {
           UIImage *image = uploadImageDatas[i];
           NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
           NSInteger time = NSDate.date.timeIntervalSince1970 * 1000;
           NSString *fileName = [NSString stringWithFormat:@"%ld_%u.jpeg",time,arc4random() / 1000];
           ZBUploadData *zbdata = [ZBUploadData formDataWithName:@"file"
                                                        fileName:fileName
                                                        mimeType:@"image/jpeg"
                                                        fileData:imageData];
           [uploadDatas addObject:zbdata];
       }
       [ZBRequestManager requestWithConfig:^(ZBURLRequest * request) {
           request.server = NSObject.BaseUrl;
           request.url = [request.server stringByAppendingString:NSObject.postUploadImagePOST.url];
           NSLog(@"request.URLString = %@",request.url);
           request.methodType = ZBMethodTypeUpload;
           request.apiType = ZBRequestTypeRefresh;//（默认为ZBRequestTypeRefresh 不读取缓存，不存储缓存）
      //        request.parameters = parameters;//与公共配置 Parameters 兼容
      //        request.headers = headers;//与公共配置Headers 兼容
           request.retryCount = 1;//请求失败 单次请求 重新连接次数 优先级大于 全局设置，不影响其他请求设置
           request.timeoutInterval = 120;//默认30 //优先级 高于 公共配置,不影响其他请求设置
           request.requestSerializer = ZBHTTPRequestSerializer;
           request.uploadDatas = uploadDatas;
           if (!DataManager.sharedInstance.tag.nullString) {
               request.userInfo = @{@"info":DataManager.sharedInstance.tag};//与公共配置 UserInfo 不兼容 优先级大于 公共配置
           };//与公共配置 UserInfo 不兼容 优先级大于 公共配置
       } progress:^(NSProgress * _Nullable progress) {
           NSLog(@"onProgress: %.2f", 100.f * progress.completedUnitCount/progress.totalUnitCount);
       } success:^(id  responseObject,ZBURLRequest * request) {
           NSLog(@"responseObject: %@", responseObject);
           if (successBlock) {
               successBlock(responseObject);
           }
       } failure:^(NSError * _Nullable error) {
           NSLog(@"error: %@", error);
           if (failureBlock) {
               failureBlock(error);
           }
       }];
      }
      ```

    * **传输视频**

      ```objective-c
      /// 帖子视频上传 POST
      -(void)networking_postuploadVideoPOST{
       NSLog(@"当前是否有网：%d 状态：%ld",[ZBRequestManager isNetworkReachable],(long)[ZBRequestManager networkReachability]);
       DataManager.sharedInstance.tag = [ReuseIdentifier stringByAppendingString:NSStringFromSelector(_cmd)];
      
       [RequestTool setupPublicParameters];//公共配置、插件机制、证书设置
       @jobs_weakify(self)
       NSDictionary *parameters = @{};
       
       extern NSString *postuploadVideoPOST;
       extern NSString *preproccess;
       
       [JobsNetworkingAPI requestApi:NSObject.postuploadVideoPOST.funcName
              uploadVideosParamArr:@[parameters,
                                     self.videosData]
                      successBlock:^(id data) {
           @jobs_strongify(self)
           NSLog(@"data = %@",data);
       }
                      failureBlock:^(id data) {
           @jobs_strongify(self)
           NSLog(@"data = %@",data);
       }];
      }
      ```

      ```objective-c
       NSString *postuploadVideoPOST;
       +(void)postuploadVideoPOST:(id)parameters
                      uploadVideo:(NSMutableArray <NSData *>*)videoDatas
                     successBlock:(jobsByIDBlock _Nullable)successBlock
                     failureBlock:(jobsByIDBlock _Nullable)failureBlock{
           NSMutableArray *uploadDatas = NSMutableArray.array;
           for (int i = 0; i < videoDatas.count; i++) {
               NSInteger time = NSDate.date.timeIntervalSince1970 * 1000;
               NSString *fileName = [NSString stringWithFormat:@"%ld_%u.mp4", time, arc4random() / 1000];
      
               ZBUploadData *zbdata = [ZBUploadData formDataWithName:@"file"
                                                            fileName:fileName
                                                            mimeType:@"video/mp4"
                                                            fileData:videoDatas[i]];
               
           //    ZBUploadData *zbdata = [ZBUploadData formDataWithName:@"file"
           //                                                 fileName:fileName
           //                                                 mimeType:@"video/mp4"
           //                                                  fileURL:videoURL];
               [uploadDatas addObject:zbdata];
           }
           
           [ZBRequestManager requestWithConfig:^(ZBURLRequest * request) {
               request.server = NSObject.BaseUrl;
               request.url = [request.server stringByAppendingString:NSObject.postuploadVideoPOST.url];
               NSLog(@"request.URLString = %@",request.url);
               request.methodType = ZBMethodTypeUpload;
               request.apiType = ZBRequestTypeRefresh;//（默认为ZBRequestTypeRefresh 不读取缓存，不存储缓存）
       //        request.parameters = parameters;//与公共配置 Parameters 兼容
       //        request.headers = headers;//与公共配置Headers 兼容
               request.retryCount = 1;//请求失败 单次请求 重新连接次数 优先级大于 全局设置，不影响其他请求设置
               request.timeoutInterval = 120;//默认30 //优先级 高于 公共配置,不影响其他请求设置
               request.requestSerializer = ZBHTTPRequestSerializer;
               request.uploadDatas = uploadDatas;
               if (!DataManager.sharedInstance.tag.nullString) {
                   request.userInfo = @{@"info":DataManager.sharedInstance.tag};//与公共配置 UserInfo 不兼容 优先级大于 公共配置
               };//与公共配置 UserInfo 不兼容 优先级大于 公共配置
           } progress:^(NSProgress * _Nullable progress) {
               NSLog(@"onProgress: %.2f", 100.f * progress.completedUnitCount/progress.totalUnitCount);
               [WHToast toastLoadingMsg:@"视频上传中...请稍后"];
           } success:^(id  responseObject,ZBURLRequest * request) {
               NSLog(@"responseObject: %@", responseObject);
               [WHToast toastHide];
               if (successBlock) {
                   successBlock(responseObject);
               }
           } failure:^(NSError * _Nullable error) {
               NSLog(@"error: %@", error);
               [WHToast toastHide];
               if (failureBlock) {
                   failureBlock(error);
               }
           }];
       }
      ```

### Test  

<details id="Test">
 <summary><strong>点我了解详情</strong></summary>
* [**OC代码实验室**](https://github.com/295060456/Jobs_ObjectiveC_Laboratory)
  ```objective-c
  /// TODO
  ```

 </details>

## 五、[一些文档和资料](https://github.com/295060456/JobsOCBaseConfig/tree/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99) <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>
### 1、配置相关
* [**解决xcode出现：SDK does not contain 'libarclite' 错误**](https://github.com/295060456/JobsOCBaseConfig/tree/main/%E8%A7%A3%E5%86%B3Xcode%E5%87%BA%E7%8E%B0%EF%BC%9ASDK%20does%20not%20contain%20'libarclite'%20%E9%94%99%E8%AF%AF)
* [**通过SSH连接到GitHub**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E9%80%9A%E8%BF%87SSH%E8%BF%9E%E6%8E%A5%E5%88%B0GitHub/%E9%80%9A%E8%BF%87SSH%E8%BF%9E%E6%8E%A5%E5%88%B0GitHub.md)
* [**JobsGenesis**](https://github.com/295060456/JobsGenesis)
* [**unknown class viewcontroller in interface builder file**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/unknown%20class%20viewcontroller%20in%20interface%20builder%20file.md)
* [**xcode资料下载**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/Xcode%E8%B5%84%E6%96%99%E4%B8%8B%E8%BD%BD.md)
* [**配置`info.plist`文件**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/%E9%85%8D%E7%BD%AEinfo.plist/%E9%85%8D%E7%BD%AEinfo.plist.md)
* [**Github.workflow（工作流）的使用**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/Github.workflow.md/Github.workflow.md)
### 2、面试相关
* [**yanmingLiu-Xminds**](https://github.com/yanmingLiu/Xminds)
* [**yanmingLiu-iOSNotes**](https://github.com/yanmingLiu/iOSNotes)
* [**OC相关经验**](https://github.com/295060456/JobsOCBaseConfig/blob/main/OCDoc/OCDoc.md)
* [**Swift 相关经验**](https://github.com/295060456/JobsOCBaseConfig/blob/main/SwiftDoc/SwiftDoc.md)
* [**谁说HTTP GET就不能通过Body来发送数据呢？**](https://juejin.cn/post/6844903685206573069)

### 3、功能相关
  * [**UITableView 的使用指南**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/UITableView/UITableView.md)
  * [**关于UITableViewCell和UICollectionViewCell圆切角+Cell的偏移量**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/%E5%85%B3%E4%BA%8EUITableViewCell%E5%92%8CUICollectionViewCell%E5%9C%86%E5%88%87%E8%A7%92%2BCell%E7%9A%84%E5%81%8F%E7%A7%BB%E9%87%8F.md)
  * [**查找系统警告对应的编码**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E6%9F%A5%E6%89%BE%E7%B3%BB%E7%BB%9F%E8%AD%A6%E5%91%8A%E5%AF%B9%E5%BA%94%E7%9A%84%E7%BC%96%E7%A0%81/%E6%9F%A5%E6%89%BE%E7%B3%BB%E7%BB%9F%E8%AD%A6%E5%91%8A%E5%AF%B9%E5%BA%94%E7%9A%84%E7%BC%96%E7%A0%81.png)
  * [**iOS状态栏颜色的修改**](文档和资料/iOS状态栏颜色的修改.md)
  * [**UICollectionView点击事件**](文档和资料/UICollectionView点击事件.md)
  * [**JXCategoryView**](https://github.com/295060456/JobsOCBaseConfig/tree/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/JXCategoryView)
  * [**同一应用设置不同图标和名称**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%90%8C%E4%B8%80%E5%BA%94%E7%94%A8%E8%AE%BE%E7%BD%AE%E4%B8%8D%E5%90%8C%E5%9B%BE%E6%A0%87%E5%92%8C%E5%90%8D%E7%A7%B0/%E5%90%8C%E4%B8%80%E5%BA%94%E7%94%A8%E8%AE%BE%E7%BD%AE%E4%B8%8D%E5%90%8C%E5%9B%BE%E6%A0%87%E5%92%8C%E5%90%8D%E7%A7%B0.md)
  * [**模型解析**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E6%A8%A1%E5%9E%8B%E8%A7%A3%E6%9E%90/%E6%A8%A1%E5%9E%8B%E8%A7%A3%E6%9E%90.md)
  * [**iOS 多语言环境设置**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/iOS%20%E5%A4%9A%E8%AF%AD%E8%A8%80%E7%8E%AF%E5%A2%83%E8%AE%BE%E7%BD%AE/iOS%20%E5%A4%9A%E8%AF%AD%E8%A8%80%E7%8E%AF%E5%A2%83%E8%AE%BE%E7%BD%AE.md)
  * [**Runtime 获取.m文件的属性（指针）**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/Runtime%20%E8%8E%B7%E5%8F%96.m%E6%96%87%E4%BB%B6%E7%9A%84%E5%B1%9E%E6%80%A7%EF%BC%88%E6%8C%87%E9%92%88%EF%BC%89.md)
  * [**<font color=red id=iOS功能：跳转其他App,如果本机不存在,则进行下载 >iOS功能：跳转其他App,如果本机不存在,则进行下载 （需要补充）</font>**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E8%B7%B3%E8%BD%AC%E5%85%B6%E4%BB%96App%E6%B2%A1%E6%9C%89%E5%88%99%E4%B8%8B%E8%BD%BD/%E8%B7%B3%E8%BD%AC%E5%85%B6%E4%BB%96App%E6%B2%A1%E6%9C%89%E5%88%99%E4%B8%8B%E8%BD%BD.md)
  * [**iOS禁用返回手势**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/iOS%E7%A6%81%E7%94%A8%E8%BF%94%E5%9B%9E%E6%89%8B%E5%8A%BF.md)
  * [**读取本地plist**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/%E8%AF%BB%E5%8F%96%E6%9C%AC%E5%9C%B0plist.md)
  * [**<font color=red id=时间按照【年-月份】分组>时间按照【年-月份】分组</font>**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/%E6%97%B6%E9%97%B4%E6%8C%89%E7%85%A7%E3%80%90%E5%B9%B4-%E6%9C%88%E4%BB%BD%E3%80%91%E5%88%86%E7%BB%84.md)
  * [**精确度量 iOS App 的启动时间**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/%E7%B2%BE%E7%A1%AE%E5%BA%A6%E9%87%8F%20iOS-App%E7%9A%84%E5%90%AF%E5%8A%A8%E6%97%B6%E9%97%B4.md)
### 4、相关研究
#### 4.1、架构问题
* [**路由**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/%E8%B7%AF%E7%94%B1.md)
#### 4.2、语法糖问题
* [**关于WMZBanner的怪异写法探究**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B3%E4%BA%8EWMZBanner%E7%9A%84%E6%80%AA%E5%BC%82%E5%86%99%E6%B3%95%E6%8E%A2%E7%A9%B6/%E5%85%B3%E4%BA%8EWMZBanner%E7%9A%84%E6%80%AA%E5%BC%82%E5%86%99%E6%B3%95%E6%8E%A2%E7%A9%B6.md)
* [**关于RAC框架中的@符号进行宏定义唤起的探究**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/%E5%85%B3%E4%BA%8ERAC%E6%A1%86%E6%9E%B6%E4%B8%AD%E7%9A%84%40%E7%AC%A6%E5%8F%B7%E8%BF%9B%E8%A1%8C%E5%AE%8F%E5%AE%9A%E4%B9%89%E5%94%A4%E8%B5%B7%E7%9A%84%E6%8E%A2%E7%A9%B6.md)
  * 响应链
    * [**关于响应链的一些研究成果**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/%E5%85%B3%E4%BA%8E%E5%93%8D%E5%BA%94%E9%93%BE%E7%9A%84%E4%B8%80%E4%BA%9B%E7%A0%94%E7%A9%B6%E6%88%90%E6%9E%9C.md)
    * [**UICollectionView点击事件**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/UICollectionView%E7%82%B9%E5%87%BB%E4%BA%8B%E4%BB%B6.md)
#### 4.3、算法问题
* [**N宫格问题**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/N%E5%AE%AB%E6%A0%BC%E9%97%AE%E9%A2%98.md)
* [**定一行个数得出几行**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/%E5%AE%9A%E4%B8%80%E8%A1%8C%E4%B8%AA%E6%95%B0%E5%BE%97%E5%87%BA%E5%87%A0%E8%A1%8C.md)
#### 4.4、加密体系相关
##### 4.4.1、加密（编码）算法
* **Base编码系列**
  * [**Base16**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/%E5%8A%A0%E5%AF%86%EF%BC%88%E7%BC%96%E7%A0%81%EF%BC%89%E7%AE%97%E6%B3%95/Base%E7%BC%96%E7%A0%81%E7%B3%BB%E5%88%97/Base16/Base16.md)
  * [**Base32**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/%E5%8A%A0%E5%AF%86%EF%BC%88%E7%BC%96%E7%A0%81%EF%BC%89%E7%AE%97%E6%B3%95/Base%E7%BC%96%E7%A0%81%E7%B3%BB%E5%88%97/Base32/Base32.md)
  * [**Base64**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/%E5%8A%A0%E5%AF%86%EF%BC%88%E7%BC%96%E7%A0%81%EF%BC%89%E7%AE%97%E6%B3%95/Base%E7%BC%96%E7%A0%81%E7%B3%BB%E5%88%97/Base64/Base64.md)
  * [**Base85**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/%E5%8A%A0%E5%AF%86%EF%BC%88%E7%BC%96%E7%A0%81%EF%BC%89%E7%AE%97%E6%B3%95/Base%E7%BC%96%E7%A0%81%E7%B3%BB%E5%88%97/Base85/Base85.md)
* [**Unicode**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/%E5%8A%A0%E5%AF%86%EF%BC%88%E7%BC%96%E7%A0%81%EF%BC%89%E7%AE%97%E6%B3%95/Unicode/Unicode.md)
* [**MIME**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/%E5%8A%A0%E5%AF%86%EF%BC%88%E7%BC%96%E7%A0%81%EF%BC%89%E7%AE%97%E6%B3%95/MIME/MIME.md)
* [**HexadecimalData**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/%E5%8A%A0%E5%AF%86%EF%BC%88%E7%BC%96%E7%A0%81%EF%BC%89%E7%AE%97%E6%B3%95/HexadecimalData/HexadecimalData.md)
* [**凯撒加密解密**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/%E5%8A%A0%E5%AF%86%EF%BC%88%E7%BC%96%E7%A0%81%EF%BC%89%E7%AE%97%E6%B3%95/%E5%87%AF%E6%92%92%E5%8A%A0%E5%AF%86%E8%A7%A3%E5%AF%86/%E5%87%AF%E6%92%92%E5%8A%A0%E5%AF%86%E8%A7%A3%E5%AF%86.md)
* [**AESCipher**]()
* [**DES**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/%E5%8A%A0%E5%AF%86%EF%BC%88%E7%BC%96%E7%A0%81%EF%BC%89%E7%AE%97%E6%B3%95/DES/DES.md)
* [**SHA**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/%E5%8A%A0%E5%AF%86%EF%BC%88%E7%BC%96%E7%A0%81%EF%BC%89%E7%AE%97%E6%B3%95/SHA/SHA.md)
  * [**SHA1**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/%E5%8A%A0%E5%AF%86%EF%BC%88%E7%BC%96%E7%A0%81%EF%BC%89%E7%AE%97%E6%B3%95/SHA/SHA-1/SHA-1.md)
  * [**SHA-224**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/%E5%8A%A0%E5%AF%86%EF%BC%88%E7%BC%96%E7%A0%81%EF%BC%89%E7%AE%97%E6%B3%95/SHA/SHA-224/SHA-224.md)
  * [**SHA-256**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/%E5%8A%A0%E5%AF%86%EF%BC%88%E7%BC%96%E7%A0%81%EF%BC%89%E7%AE%97%E6%B3%95/SHA/SHA-256/SHA-256.md)
  * [**SHA-384**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/%E5%8A%A0%E5%AF%86%EF%BC%88%E7%BC%96%E7%A0%81%EF%BC%89%E7%AE%97%E6%B3%95/SHA/SHA-384/SHA-384.md)
  * [**SHA-512**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/%E5%8A%A0%E5%AF%86%EF%BC%88%E7%BC%96%E7%A0%81%EF%BC%89%E7%AE%97%E6%B3%95/SHA/SHA-512/SHA-512.md)
* [**RSA**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/%E5%8A%A0%E5%AF%86%EF%BC%88%E7%BC%96%E7%A0%81%EF%BC%89%E7%AE%97%E6%B3%95/%E9%9D%9E%E5%AF%B9%E7%A7%B0%E5%8A%A0%E5%AF%86RSA/RSA.md)

##### 4.4.2、HASH 信息摘要

* [**MD5**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/HASH%20%E4%BF%A1%E6%81%AF%E6%91%98%E8%A6%81/MD5/MD5.md)
* [**HASH**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%F0%9F%94%A8Manual_Add_ThirdParty%EF%BC%88%E6%8C%89%E9%9C%80%E5%BC%95%E5%85%A5%EF%BC%89/%E5%8A%A0%E5%AF%86%E4%BD%93%E7%B3%BB/HASH%20%E4%BF%A1%E6%81%AF%E6%91%98%E8%A6%81/HASH.md)

### 5、其他研究
* [**LYM的研究成果**](https://github.com/295060456/JobsOCBaseConfig/tree/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E2%9D%A4%EF%B8%8FLYM%E7%9A%84%E7%A0%94%E7%A9%B6%E6%88%90%E6%9E%9C%E2%9D%A4%EF%B8%8F)
### 6、课外阅读
  * [**FFmpeg**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/FFmpeg/FFmpeg.md)
  * [**优秀的关于音视频处理的文献资料**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/%E4%BC%98%E7%A7%80%E7%9A%84%E5%85%B3%E4%BA%8E%E9%9F%B3%E8%A7%86%E9%A2%91%E5%A4%84%E7%90%86%E7%9A%84%E6%96%87%E7%8C%AE%E8%B5%84%E6%96%99.md)
  * [**Fastlane-iOS持续集成自动打包发布**](https://github.com/yanmingLiu/Xminds/blob/main/iOS/Fastlane-iOS%E6%8C%81%E7%BB%AD%E9%9B%86%E6%88%90%E8%87%AA%E5%8A%A8%E6%89%93%E5%8C%85%E5%8F%91%E5%B8%83%E3%80%82.md)
  * [**Flutter-iOS-打包等采坑ing**](https://github.com/yanmingLiu/Xminds/blob/main/iOS/Flutter-iOS-%E6%89%93%E5%8C%85%E7%AD%89%E9%87%87%E5%9D%91ing---.md)
  * [**创建Framework**](https://github.com/yanmingLiu/Xminds/blob/main/iOS/%E5%88%9B%E5%BB%BAFramework.md)
### 7、TODO
  * 将[**时间按照【年-月份】分组**](#时间按照【年-月份】分组)集成到靶场项目里
  * 完善 [**iOS功能：跳转其他App,如果本机不存在,则进行下载（需要补充）**](#iOS功能：跳转其他App,如果本机不存在,则进行下载)
  * iOS.热更新
  * iOS.Widget
* Demo里面有些因为Api升级而没有来得及对齐的，目前打开会崩溃
* 对多场景**SceneDelegate**的深入研究和支持
* JobsPostVC报错解决
* DebugLogDescription 会崩溃：`id value = self.valueForKeyBlock(name) ? : @"nil";//默认值为nil字符串`
* 侧滑菜单：JXCategoryView垂直表达
* 其他
## 六、打开苹果的[<font color=red>**反馈助理**</font>](applefeedback://) <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>
* 浏览器打开并输入 
  ```html
  feedbackassistant://
