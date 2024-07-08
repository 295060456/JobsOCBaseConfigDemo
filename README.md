# <font color=red>iOS.OC靶场项目</font><基础配置的说明>
<p align="left">
  <img src="https://img.shields.io/badge/pod-1.15.2-brightgreen" alt="cocoapods" title="cocoapods"/>
  <img src="https://img.shields.io/badge/OC-orange" alt="OC" title="OC"/>
  <img src="https://img.shields.io/badge/xcode-15.4-blue" alt="xcode" title="xcode"/>
</p>
[toc]

## <font id=前言>前言</font>

* 工欲善其事必先利其器

## 一、目的

* 所有的项目根据这个根来进行统一配置和调用
* 将它作为所有项目的基类，做到全局的统一
* 千万要保证这个工程的编译通过，以后项目直接进行引用
* 作为某些代码实践的靶场，是非常有必要的
* 作为代码笔记，记录一些常用的代码，方便查阅
* 作为学习的资料，可以快速了解到一些常用的知识
* 作为项目的参考，可以快速的了解到项目的架构，代码规范，以及一些设计模式

## 二、特色
- [x] 网络模块Api<br>
- [x] Toast<br>
- [x] 系统、UI配置<br>
- [x] UI组件库<br>
- [x] 语言本地化<br>
- [x] 数据存储UserDefaults<br>
- [ ] 统一的WebView<br>
## 三、相关链接

* [**OC代码实验室**](https://github.com/295060456/Jobs_ObjectiveC_Laboratory)
* [**yanmingLiu-Xminds**](https://github.com/yanmingLiu/Xminds)
* [**yanmingLiu-iOSNotes**](https://github.com/yanmingLiu/iOSNotes)

## 四、几点重要说明 

### 1、特别说明 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* xcode对中文的兼容性非常好，所以可以中文命名路径（比如文件夹）

* 经实践证明，如果配置多语言化，那么xcode将会刷新`Info.plist`，导致里面的注释消失。正确的做法是，对`Info.plist`进行备份，随时进行替换

* 工程项目的`Info.plist`文件是对整个工程的配置说明，系统固定读取，所以必须在工程项目根目录的同名文件夹下。否则项目启动会出问题

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

### 4、lldb <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

```shell
(lldb) target list
Current targets:
* target #0: /Users/user/Library/Developer/CoreSimulator/Devices/E17E7DE8-7ADA-42FD-A743-A1A3A6CB7E42/data/Containers/Bundle/Application/C590303C-50A7-4BB2-826F-8598E5F3A66C/JobsOCBaseConfigDemo.app/JobsOCBaseConfigDemo ( arch=x86_64-apple-ios-simulator, platform=ios-simulator, pid=89318, state=stopped )
(lldb) target select 0
Current targets:
* target #0: /Users/user/Library/Developer/CoreSimulator/Devices/E17E7DE8-7ADA-42FD-A743-A1A3A6CB7E42/data/Containers/Bundle/Application/C590303C-50A7-4BB2-826F-8598E5F3A66C/JobsOCBaseConfigDemo.app/JobsOCBaseConfigDemo ( arch=x86_64-apple-ios-simulator, platform=ios-simulator, pid=89318, state=stopped )
```

### 5、xcode 配置 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* `Arguments Passed On Launch`标签设置

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

* `Environment Variables`标签

  * 日志配置：添加一个新的环境变量。将 `Name` 设置为 `IDEPreferLogStreaming`，将 `Value` 设置为 `YES`

    ![image-20240629161626945](./assets/image-20240629161626945.png)

### 6、重写打印输出 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 关注文件[**MacroDef_Log.h**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/OCBaseConfig/%E5%90%84%E9%A1%B9%E5%85%A8%E5%B1%80%E5%AE%9A%E4%B9%89/%E5%90%84%E9%A1%B9%E5%AE%8F%E5%AE%9A%E4%B9%89/MacroDef_Sys/MacroDef_Log.h)

* 使之能定位到具体文件行的输出

  ```objective-c
  #pragma mark —— 控制台Log打印格式重写
  #ifndef NSLog
  #define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
  #endif
  ```

* 使之能简化打印结构体步骤

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
  
  ![image-20240703193326163](./assets/image-20240703193326163.png)

### 7、iOS xcode 代码块，提升编码效率必备之首选 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 提升编码效率，快用[**快捷键调取代码块**](https://github.com/JobsKit/JobsCodeSnippets)
* 脚本自动化：[**`【MacOS】安装JobsCodeSnippets.command`**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%E3%80%90MacOS%E3%80%91%E5%AE%89%E8%A3%85JobsCodeSnippets.command)

### 8、**手动打包流程 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>**

* 电脑桌面新建文件夹，并重命名为`payload；`

* 真机运行项目（不同设备，不同芯片组，底层指令集不一致）

* 打开项目工程目录下`Products`，里面有个`*.app`

  ![image-20240704113342353](./assets/image-20240704113342353.png)

* 将这个`*.app`复制到刚才电脑桌面新建的`payload`文件夹

* 压缩电脑桌面新建的`payload`文件夹为zip格式的压缩包

* 将这个`zip`格式的压缩包，强行改名`*.ipa`

* 脚本自动化：[**`【MacOS】放在iOS项目工程根目录下，自动打包并输出为ipa文件.command`**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/%E3%80%90MacOS%E3%80%91%E6%94%BE%E5%9C%A8iOS%E9%A1%B9%E7%9B%AE%E5%B7%A5%E7%A8%8B%E6%A0%B9%E7%9B%AE%E5%BD%95%E4%B8%8B%EF%BC%8C%E8%87%AA%E5%8A%A8%E6%89%93%E5%8C%85%E5%B9%B6%E8%BE%93%E5%87%BA%E4%B8%BAipa%E6%96%87%E4%BB%B6.command)

### 9、[**<font color=red>JobsBlock</font>**](https://github.com/295060456/JobsBlock/blob/main/README.md) <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 背景意义：统一全局的Block定义，减少冗余代码

* ```ruby
  pod 'JobsBlock' # https://github.com/295060456/JobsBlock
  ```

  ![image-20240706110034202](./assets/image-20240706110034202.png)

* <font color=red>因为**CDN**同步的原因，有些第三方pod并不能在[**cocoapods.org**](https://cocoapods.org/)被成功的搜索到，这就导致如果`pod install`拉取不到代码，可能需要切换镜像，然后再进行操作。建议运行项目根目录下的2个脚本文件，自动获取</font>

  * `【MacOS】Pod_Install（适用于IOS工程根目录）.command`
  * `【MacOS】Pod_Update（适用于IOS工程根目录）.command`

### 10、[**<font color=red>BaseProtocol 相关继承结构关系图</font>**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/BaseProtocol/BaseProtocol.md) <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

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

### 11、**UIViewModelFamily <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>**

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
    +-(void)pullToRefresh;
    +-(void)loadMoreRefresh;
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
    ++(instancetype)sharedInstance;
    +@property(nonatomic,assign)BOOL isLock;
    +@property(nonatomic,strong)RACDisposable *racDisposable;
    +@property(nonatomic,copy)JobsReturnIDByIDBlock keyboardUpNotificationBlock;
    +@property(nonatomic,copy)JobsReturnIDByIDBlock keyboardDownNotificationBlock;
}
NSObject <|-- BaseProtocol
```
### 12、JobsOCBaseCustomizeUIKitCore <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 产生背景
  * OC的基类是单继承
  * 继承会产生很多基类，客观上造成代码的冗余
* 解决方案
  * 继承和分类应该结合使用，功能各有优劣
  * 分类即是"超级继承"，不需要产生额外的分类，方便管理和调用

### 13、度量衡适配。[**MacroDef_Size.h**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/OCBaseConfig/%E5%90%84%E9%A1%B9%E5%85%A8%E5%B1%80%E5%AE%9A%E4%B9%89/%E5%90%84%E9%A1%B9%E5%AE%8F%E5%AE%9A%E4%B9%89/MacroDef_Size/MacroDef_Size.h) <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* **当前设备是否是全面屏**：`static inline BOOL isFullScreen(void) ` 
* **全局比例尺**
  * `static inline CGFloat JobsWidth(CGFloat width)`  
  * `static inline CGFloat JobsHeight(CGFloat height)`
* **安全距离**
  * 顶部的安全距离：`static inline CGFloat JobsTopSafeAreaHeight(void)`
  * 底部的安全距离，全面屏手机为34pt，非全面屏手机为0pt：`static inline CGFloat JobsBottomSafeAreaHeight(void)`
* **状态栏高度**
  * `static inline CGFloat JobsStatusBarHeightByAppleIncData(void) `
  * `static inline CGFloat JobsRectOfStatusbar(void)`
  * `static inline CGFloat JobsStatusBarHeight(void)`
* **导航栏高度**
  * `static inline CGFloat JobsNavigationHeight(UINavigationController * _Nullable navigationController)`
* **状态栏 + 导航栏高度**
  * `static inline CGFloat JobsNavigationBarAndStatusBarHeight(UINavigationController * _Nullable navigationController)`
* **Tabbar高度**：全面屏手机比普通手机多34的安全区域
  * `static inline CGFloat JobsTabBarHeight(UITabBarController * _Nullable tabBarController)`
  * `static inline CGFloat JobsTabBarHeightByBottomSafeArea(UITabBarController * _Nullable tabBarController)`<font color=red>**包括了底部安全区域的TabBar高度，一般用这个**</font>
* **除开 tabBarController 和 navigationController 的内容可用区域的大小**
  * `static inline CGFloat JobsContentAreaHeight(UITabBarController * _Nullable tabBarController, UINavigationController * _Nullable navigationController)`

### 14、`NavigationBar` <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 摒弃系统的，而转为使用第三方`GKNavigationBar`

  ```ruby
  pod 'GKNavigationBar' # https://github.com/QuintGao/GKNavigationBar NO_SMP
  ```

* 背景和原因

  * 系统原生的`NavigationBar`晦涩难懂不方便修改，很多人理解不深刻容易出问题
  * 系统原生的`NavigationBar`有很多内部类（系统创建但不希望程序员进行直接访问的）。某些版本内部类的图层结构会用有所不同
  * 第三方`GKNavigationBar`因为是分类实现，没有代码入侵性，更加的安全和方便
  * 第三方`GKNavigationBar`更加契合国人的开发思维
  
* 应用层实现
  
  * 关注实现类：[**`@interface BaseViewController : UIViewController`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/BaseViewController)
  * 关注实现类：[**`@interface UIViewController (BaseVC)`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/UIViewController+Category/UIViewController+Others/UIViewController+BaseVC)

### 15、输入框 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 有4个`TextField`可供继承使用（具体使用方式，查询相关头文件定义）
  * `CJTextField`
  * `HQTextField`
  * `JobsMagicTextField`
  * `ZYTextField`

### 16、[<font color=red>**寻找系统关键变量**</font>](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/OCBaseConfig/%E5%90%84%E9%A1%B9%E5%85%A8%E5%B1%80%E5%AE%9A%E4%B9%89/%E5%90%84%E9%A1%B9%E5%AE%8F%E5%AE%9A%E4%B9%89/MacroDef_Func/MacroDef_Func.h) <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>
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
  
### 17、`JobsTabbarVC` <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* **`@interface JobsTabbarVC : UITabBarController`**，<font color=red>**继承自系统`UITabBarController`**</font>

* 支持单例模式

* 支持`Tabbaritem`的偏移

  ```objective-c
  if (config.humpOffsetY != 0) {
      //一般的图片
      /// 修改图片偏移量，上下，左右必须为相反数，否则图片会被压缩
      viewController.tabBarItem.imageInsets = UIEdgeInsetsMake(-config.humpOffsetY,
                                                               0,
                                                               -config.humpOffsetY / 2,
                                                               0);
      /// 修改文字偏移量
      viewController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, 0);
  }
  ```

* 支持**`Lottie`**动画

  * 关注实现类：[**@interface UIViewController (Lottie)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/UIViewController+Category/UIViewController+Others/UIViewController+Lottie)

  ```objective-c
  if ([self judgeLottieWithIndex:i]) {
      [self addLottieImage:config.lottieName];// 有Lottie动画名，则优先创建Lottie动画
  }
  ```

* 支持`Tabbaritem`长按手势。长按默认出列表菜单（仿**Telegram**）

  ```objective-c
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

* 支持手势左右滑动以切换`TabbarControl`挂载的`ViewController`

* 支持横屏模式

* 支持震动反馈

  ```objective-c
  if (self.isFeedbackGenerator) {
      [self feedbackGenerator];
  }
  ```

* 支持点击`Tabbaritem`有声音

  ```objective-c
  if (self.isPlaySound) {
      [self playSoundWithFileName:@"Sound.wav"];
  }
  ```

* 支持[**`PPBadgeView`**](https://github.com/jkpang/PPBadgeView)

  ```ruby
  pod 'PPBadgeView' # https://github.com/jkpang/PPBadgeView iOS自定义Badge组件, 支持UIView, UITabBarItem, UIBarButtonItem以及子类 NO_SMP
  ```

* 支持重力弹跳动画效果

  ```objective-c
  if (self.isShakerAnimation) {
      [item.badgeView shakerAnimationWithDuration:2 height:20];
  }
  ```

* 支持图片从小放大

  ```objective-c
  if (self.isAnimationAlert) {
     [self.UITabBarButtonMutArr[index] animationAlert];
  }
  ```

* 支持点击增加标数

  ```objective-c
  if (self.isOpenPPBadge) {
     [item pp_increase];
  }
  ```

* 防止当子控制器为`UIImagePickerController` 引起的崩溃

  ```objective-c
  UIViewController *viewController = self.childVCMutArr[i];
  if (![viewController isKindOfClass:UINavigationController.class]) {/// 防止UIImagePickerController崩
      BaseNavigationVC *nav = [BaseNavigationVC.alloc initWithRootViewController:viewController];
      nav.title = config.title;
      [self.childVCMutArr replaceObjectAtIndex:i withObject:nav];/// 替换元素，每个VC加Navigation
  }
  ```

## 五、代码讲解

### 1、**UIButton.UIButtonConfiguration** <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>
<details id="UIButton">
<summary><strong>点我了解详情</strong></summary>

* 苹果在后续的Api中推出了`UIButtonConfiguration` 来设置UIButton，但是这个新Api会存在几大问题

  * 大多数开发者对这个Api不熟悉
  * <font color=red>**用了新Api以后，老的Api的一些调用方式可能不会起效果**</font>。如果还是按照以前的方式创建，你会发现UIButton不正常出现
  * 大多数时候，我们会涉及到富文本。而富文本和普通的文本之间对于控件有优先级。<font color=blue>**富文本的优先级最高**</font>
  * 因为要做兼容处理，但是`UIButtonConfiguration` 的设置环节非常繁琐
  
* 所以，为了应对以上的问题，可以使用快捷键（`init.JobsBtn`）调取代码块来设置 UIButton。[**快捷键调取代码块**](https://github.com/JobsKit/JobsCodeSnippets)

  * 得出的 UIButton 是没有约束的，需要自己在外界加
  * 关注实现类：[<font color=blue>**`@implementation UIButton (UI)`**</font>](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIButton/UIButton+Category/UIButton+UI)
  
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
                                                    titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                     textAlignment:NSTextAlignmentCenter
                                                  subTextAlignment:NSTextAlignmentCenter
                                                       normalImage:nil
                                                    highlightImage:nil
                                                   attributedTitle:nil
                                           selectedAttributedTitle:nil
                                                attributedSubtitle:[self richTextWithDataConfigMutArr:self.richTextConfigMutArr]
                                                             title:Internationalization(@"请支付")
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
         [_titleBtn makeBtnLabelByShowingType:UILabelShowingType_03];
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
            [_countDownBtn makeBtnLabelByShowingType:UILabelShowingType_03];
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

### 3、Masonry的一些使用技巧 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* 关注实现类：[**@interface UIView (Masonry)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIView/UIView+Category/UIView+Masonry)

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

### 4、退出ViewController的时候，需要做的操作 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

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

### 6、**使用block，对selector的封装，避免方法割裂** <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

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
                                            name:LanguageSwitchNotification
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
  },nil, self),LanguageSwitchNotification,nil);
  ```

* 发通知：

  ```objective-c
  [NSNotificationCenter.defaultCenter postNotificationName:LanguageSwitchNotification object:@(NO)];
  ```

### 7、UIViewModel的使用 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

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
* 不注册相对应当UICollectionViewCell相关子类，使用时会崩溃
* 系统注册UICollectionViewCell相关子类，是利用字符串作为桥梁进行操作
* 注册不会开辟内存，只有当使用的时候才会开辟内存
* 对全局进行统一的UICollectionViewCell相关子类注册是很有必要的，方便管理，防止崩溃
* 关注实现类[<font color=blue>**`@implementation UICollectionView (JobsRegisterClass)`**</font>](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UICollectionView/UICollectionView+Category/UICollectionView+JobsRegisterClass)

### 9、全局统一的提示弹出框（对`WHToast`的二次封装） <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

* `Podfile`

  ```ruby
  pod 'WHToast' # https://github.com/remember17/WHToast 一个轻量级的提示控件，没有任何依赖 NO_SMP
  ```

* 关注实现类：[<font color=blue>**`@implementation NSObject (WHToast)`**</font>](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSObject/NSObject+Category/NSObject+WHToast)

* 关注实现类：[**`MacroDef_Func.h`**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/OCBaseConfig/%E5%90%84%E9%A1%B9%E5%85%A8%E5%B1%80%E5%AE%9A%E4%B9%89/%E5%90%84%E9%A1%B9%E5%AE%8F%E5%AE%9A%E4%B9%89/MacroDef_Func/MacroDef_Func.h)

  ```objective-c
  static inline void toast(NSString *_Nullable msg){
      if(!msg || ![msg isKindOfClass:NSString.class]){
          msg = JobsInternationalization(@"数据错误");
      }
      [NSObject jobsToastMsg:JobsInternationalization(msg)];
  }
  ```
  
* 在每一个`_collectionView`创建的时候，加入这一段代码：

  ```objective-c
  [_collectionView registerCollectionViewClass];
  ```

</details>

### 10、关于`UIViewController`的一些配置 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

####  10.1、BaseViewController

  * 为了方便管理，理论上，全局只应有一个`UIViewController`。开发者不应该创建过多的子控制器
  * 如果在`BaseViewController`无法满足的操作，应该提升到`UIViewController`的分类进行
  * 命名为`BaseViewController`也是充分考虑同业者的偏好习惯
  * 正常情况下，在建立子控制器的时候，为了缩短命名，应该将`ViewController`命名为`VC`

#### 10.2、推控制器

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

  #### 10.3、[**`UIViewController`转场动画的使用方法**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/UIViewController%2BCategory/UIViewController%2BXLBubbleTransition/UIViewController%2BXLBubbleTransition.md/UIViewController%2BXLBubbleTransition.md)

  * 关注实现类：[**@interface UIViewController (XLBubbleTransition)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/UIViewController%2BCategory/UIViewController%2BXLBubbleTransition)

#### 10.4、悬浮按钮

  * 关注实现类：[**@interface UIViewController (SuspendBtn)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/UIViewController+Category/UIViewController+Others/UIViewController+SuspendBtn)
  * 关注实现类：[**@interface UIView (SuspendView)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIView/UIView+Category/UIView+SuspendView)

####  10.5、防止过多的`presented`模态推出`UIViewController`
  * 关注实现类：[**@interface UIViewController (SafeTransition)**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/UIViewController/UIViewController%2BCategory/UIViewController%2BOthers/UIViewController%2BSafeTransition)

#### 10.6、<font color=red id=寻找当前控制器>**寻找当前控制器**</font>

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

### 11、KVC的封装 <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

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

* 对`NSUserDefaults.standardUserDefaults`的数据存取进行宏定义的方式的封装。关注实现类：[**`JobsUserDefaultDefine.h`**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSUserDefaults/JobsUserDefaultDefine.h)

* 关注实现类：[**`@interface NSUserDefaults (Manager)`**](https://github.com/295060456/JobsOCBaseConfigDemo/tree/main/JobsOCBaseConfigDemo/JobsOCBaseCustomizeUIKitCore/NSUserDefaults/NSUserDefaults+Category/NSUserDefaults+Manager)

* 读取数据

  ```objective-c
  +(id _Nullable)readWithKey:(NSString *)key;
  ```

* 删除数据

  ```objective-c
  +(void)deleteWithKey:(NSString *)key;
  ```

* 存数据（包括父类直到NSObject的所有属性）。<font color=red>**将数据封装到对象`UserDefaultModel`里面进行存取**</font>

  ```objective-c
  +(void)updateWithModel:(UserDefaultModel *)userDefaultModel;
  ```

### 15、对小型本地化数据的读取（NSUserDefaults） <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

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

* 富文本的本质是告诉系统，某段文字的表达方式

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
  @property(nonatomic,strong,nullable)NSAttributedString __block *attributedText API_AVAILABLE(ios(6.0));
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

* 以`GCD`的方式实现

  `dispatch_once_t` 是 **GCD**（**G**rand **C**entral **D**ispatch）提供的一种机制，用于确保某段代码在应用程序的生命周期内只执行一次。它是线程安全的，适用于多线程环境

  ```objective-c
  static JobsLaunchAdMgr *JobsLaunchAdMgrInstance = nil;
  static dispatch_once_t JobsLaunchAdMgrOnceToken;
  + (instancetype)sharedManager {
      dispatch_once(&JobsLaunchAdMgrOnceToken, ^{
          JobsLaunchAdMgrInstance = [super allocWithZone:NULL].init;
      });return JobsLaunchAdMgrInstance;
  }
  /// 单例的销毁
  + (void)destroyInstance {
      JobsLaunchAdMgrOnceToken = 0;
      JobsLaunchAdMgrInstance = nil;
  }
  /// 防止外部使用 alloc/init 等创建新实例
  + (instancetype)allocWithZone:(struct _NSZone *)zone {
      dispatch_once(&JobsLaunchAdMgrOnceToken, ^{
          JobsLaunchAdMgrInstance = [super allocWithZone:zone];
      });return JobsLaunchAdMgrInstance;
  }
  
  - (instancetype)copyWithZone:(NSZone *)zone {
      return self;
  }
  
  - (instancetype)mutableCopyWithZone:(NSZone *)zone {
      return self;
  }
  ```

* 以<font color=red>**`@synchronized`**</font>的方式实现

  <font color=red>**`@synchronized`**</font>关键字用于实现线程安全,它确保一段代码在同一时间内只能被一个线程执行，从而防止多个线程同时访问和修改共享资源，避免数据竞争和不一致性问题

  ```objective-c
  static JobsLaunchAdMgr *JobsLaunchAdMgrInstance = nil;
  + (instancetype)sharedManager {
      @synchronized(self) {
          if (!JobsLaunchAdMgrInstance) {
              JobsLaunchAdMgrInstance = [super allocWithZone:NULL].init;
          }
      }return JobsLaunchAdMgrInstance;
  }
  
  + (void)destroyInstance {
      @synchronized(self) {
          JobsLaunchAdMgrInstance = nil;
      }
  }
  
  + (instancetype)allocWithZone:(struct _NSZone *)zone {
      @synchronized(self) {
          if (!JobsLaunchAdMgrInstance) {
              JobsLaunchAdMgrInstance = [super allocWithZone:zone];
              return JobsLaunchAdMgrInstance;
          }
      }return nil;
  }
  
  - (instancetype)copyWithZone:(NSZone *)zone {
      return self;
  }
  
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

### 24、打开URL <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

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


### Test <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>

<details id="Test">
 <summary><strong>点我了解详情</strong></summary>

 ```objective-c
// TODO
 ```

## 六、[一些文档和资料](https://github.com/295060456/JobsOCBaseConfig/tree/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99) <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>
### 1、配置相关
* [**解决xcode出现：SDK does not contain 'libarclite' 错误**](https://github.com/295060456/JobsOCBaseConfig/tree/main/%E8%A7%A3%E5%86%B3Xcode%E5%87%BA%E7%8E%B0%EF%BC%9ASDK%20does%20not%20contain%20'libarclite'%20%E9%94%99%E8%AF%AF)
* [**通过SSH连接到GitHub**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E9%80%9A%E8%BF%87SSH%E8%BF%9E%E6%8E%A5%E5%88%B0GitHub/%E9%80%9A%E8%BF%87SSH%E8%BF%9E%E6%8E%A5%E5%88%B0GitHub.md)
* [**JobsGenesis**](https://github.com/295060456/JobsGenesis)
* [**unknown class viewcontroller in interface builder file**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/unknown%20class%20viewcontroller%20in%20interface%20builder%20file.md)
* [**xcode资料下载**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E5%85%B6%E4%BB%96.md/Xcode%E8%B5%84%E6%96%99%E4%B8%8B%E8%BD%BD.md)
* [**配置`info.plist`文件**](https://github.com/295060456/JobsOCBaseConfigDemo/blob/main/JobsOCBaseConfigDemo/%E9%85%8D%E7%BD%AEinfo.plist/%E9%85%8D%E7%BD%AEinfo.plist.md)
* [**Github.workflow（工作流）的使用**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/Github.workflow.md/Github.workflow.md)
### 2、面试相关
* [**OC相关经验**](https://github.com/295060456/JobsOCBaseConfig/blob/main/OCDoc/OCDoc.md)
* [**Swift 相关经验**](https://github.com/295060456/JobsOCBaseConfig/blob/main/SwiftDoc/SwiftDoc.md)
* [**iOSNotes**](https://github.com/yanmingLiu/iOSNotes)
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
  * [**iOS 横竖屏切换**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/%E6%A8%AA%E5%B1%8FUI%E5%88%87%E6%8D%A2.md/%E6%A8%AA%E5%B1%8FUI%E5%88%87%E6%8D%A2.md)
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
  * 这里还需要进一步研究，有点问题。[**Github.workflow（工作流）的使用**](https://github.com/295060456/JobsOCBaseConfig/blob/main/%E6%96%87%E6%A1%A3%E5%92%8C%E8%B5%84%E6%96%99/Github.workflow.md/Github.workflow.md)
  * 用FMDB来实现小型化数据的读写，生成Demo
* 其他
## 七、打开苹果的[<font color=red>**反馈助理**</font>](applefeedback://) <a href="#前言" style="font-size:17px; color:green;"><b>回到顶部</b></a>
* 浏览器打开并输入 
  ```html
  feedbackassistant://
