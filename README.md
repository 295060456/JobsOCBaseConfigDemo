# 基础的配置说明
<p align="left">
  <img src="https://img.shields.io/badge/pod-1.15.2-brightgreen" alt="cocoapods" title="cocoapods"/>
  <img src="https://img.shields.io/badge/OC-orange" alt="OC" title="OC"/>
  <img src="https://img.shields.io/badge/xcode-15.4-blue" alt="xcode" title="xcode"/>
</p>

## 目的
* 所有的项目根据这个根来进行统一配置和调用。
* 将它作为所有项目的基类，做到全局的统一
* 千万要保证这个工程的编译通过，以后项目直接进行引用
* 作为某些代码实践的靶场，是非常有必要的
* 作为代码笔记，记录一些常用的代码，方便查阅
* 作为学习的资料，可以快速了解到一些常用的知识
* 作为项目的参考，可以快速的了解到项目的架构，代码规范，以及一些设计模式

## 特色
- [x] 网络模块Api<br>
- [x] Toast<br>
- [x] 系统、UI配置<br>
- [x] UI组件库<br>
- [x] 语言本地化<br>
- [x] 数据存储UserDefaults<br>
- [ ] 统一的WebView<br>
## 几点重要说明
### 1、在Apple芯片（目前是M系列）编译失败的解决方案
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
    ```
    sudo chown -R $(whoami) 项目目录
    sudo chmod -R u+rw 项目目录
    ```
  * 在`podfile`文件里面，设置：
    ```ruby
    # 用于指定你的 Pod 项目应使用静态库而不是动态库。
    # 这个选项主要用于解决某些与动态库相关的兼容性和性能问题。
    use_frameworks! :linkage => :static
    ```
  * 重新运行pod
    ```shell
    pod install
    ```
### 2、xcode 日志配置
* `Environment Variables`标签，添加一个新的环境变量。将 `Name` 设置为 `IDEPreferLogStreaming`，将 `Value` 设置为 `YES`
![image-20240629161626945](./assets/image-20240629161626945.png)

### 3、iOS xcode 代码块，提升编码效率必备之选
* 提升编码效率，快用[**快捷键调取代码块**](https://github.com/JobsKit/JobsCodeSnippets)
## 代码讲解

<details id="UIButton">
 <summary><strong>UIButton</strong></summary>

* 苹果在后续的Api中推出了 UIButtonConfiguration 来设置UIButton，但是这个新Api会存在几大问题

  * 大多数开发者对这个Api不熟悉
  * 用了新Api以后，老的Api的一些调用方式可能不会起效果。如果还是按照以前的方式创建，你会发现UIButton不正常出现
  * 大多数时候，我们会涉及到富文本。而富文本和普通的文本之间对于控件有优先级。富文本的优先级最高
  * 因为要做兼容处理，但是 UIButtonConfiguration 的设置环节非常繁琐
  
* 所以，为了应对以上的问题，可以快捷键（init.JobsBtn）调代码块来设置 UIButton

  * 得出的 UIButton 是没有约束的，需要自己在外界加
  * 具体的内部实现，请关注`@implementation UIButton (UI)`
  
* 用新Api（UIButtonConfiguration）创建一个带富文本的UIButton

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

  * * [**UIButtonConfiguration**](https://www.jianshu.com/p/12426709420e)
    * [**Chat GPT 3.5**](https://chatgpt.com/)
      </details>

<details id="Masonry约束动画<br>">
 <summary><strong>Masonry约束动画<br></strong></summary>

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

<details id="退出ViewController的时候，需要做的操作">
 <summary><strong>退出ViewController的时候，需要做的操作</strong></summary>

 ```objective-c
  @jobs_weakify(self)
  self.jobsBackBlock = ^id _Nullable(id _Nullable data) {
      @jobs_strongify(self)
      NSLog(@"退出页面的逻辑");
      return nil;
  };
 ```
</details>

<details id="Test">
 <summary><strong>Test</strong></summary>

 ```objective-c
// TODO
 ```
</details>









<details id="一些文档和资料">
 <summary><strong>一些文档和资料</strong></summary>

- [**关于响应链的一些研究成果**](文档和资料/关于响应链的一些研究成果/关于响应链的一些研究成果.md)<br>
- [**模型解析**](文档和资料/模型解析/模型解析.md)<br>
- [**iOS状态栏颜色的修改**](文档和资料/iOS状态栏颜色的修改.md)<br>
- [**UICollectionView点击事件**](文档和资料/UICollectionView点击事件.md)<br>
- [**路由**](文档和资料/路由.md)<br>
- 其他
  * [**其他-关于系统Nav**](文档和资料/其他/关于系统Nav.md)<br>
  * [**其他-键盘方法生命周期**](文档和资料/其他/键盘方法生命周期.md)<br>
  * [**其他-精确度量iOS-App的启动时间**](文档和资料/其他/精确度量iOS-App的启动时间.md)<br>
  * [**其他-谁说HTTP和GET就不能通过Body来发送数据呢？**](文档和资料/其他/谁说HTTP和GET就不能通过Body来发送数据呢？.md)<br>
    </details>

## 打开苹果的[<font color=red>**反馈助理**</font>](applefeedback://)
* 浏览器打开并输入 
  ```html
  feedbackassistant://
 ```
