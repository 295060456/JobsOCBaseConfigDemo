# Fastlane

[toc]

## 简介

* Fastlane 是一个广泛使用的自动化工具，用于简化 iOS 和 Android 应用程序的构建和发布流程。Fastlane 可以为你的 CI/CD 流程提供极大的帮助。

* 它帮助开发者和 DevOps 团队通过一系列预定义的和自定义的脚本（称为 "lanes"）来自动执行常见的任务，如测试、打包、签名、上传应用到应用商店，以及发布和管理发布记录。

* Fastlane 的主要功能

  * **自动化构建和发布**：
    * 自动化打包应用程序（例如生成 APK 或 IPA 文件）；
    * 管理和自动化代码签名过程（处理证书和配置文件）；
    * 上传应用到应用商店（Google Play 和 Apple App Store）；
  * **测试和质量检查**：
    * 运行单元测试和 UI 测试；
    * 集成代码质量工具，如 `eslint`、`swiftlint` 和 `detekt`；
  * **发布管理**：
    * 自动创建和管理发布记录；
    * 发布更新日志和版本说明；
  * **截图生成**：
    - 自动生成不同设备和语言的应用截图；
  * **通知和报告**：
    - 发送通知到 Slack 或电子邮件；
    - 生成构建和发布的详细报告；

* 答疑

  * For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)
  * This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.
  * More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).
  * The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).

## 快速入门

  * Make sure you have the latest version of the Xcode command line tools installed
    
  ```sh
  xcode-select --install
  ```

  * 安装
    
    * *使用 Homebrew 安装：*
    
    ```shell
    brew install fastlane
    ```
    
    * *使用 RubyGems 安装：*
    
    ```shell
    sudo gem install fastlane -NV
    ```

  * 初始化 Fastlane

    * *在项目根目录运行：*

    ```shell
    fastlane init
    ```

    Fastlane 会询问一些问题来设置你的项目。例如，它会询问是否要设置 iOS 项目、Android 项目或两者都设置。根据需要进行选择。

  * 配置 Fastlane

    * Fastlane 会在项目中创建一个 `fastlane` 目录，其中包含 `Fastfile` 和其他配置文件。<font color=red>**`Fastfile` 是定义 lanes 和其他配置的地方。**</font>

    * 简单的 `Fastfile` 示例，用于构建和发布 Flutter 应用：

    ```ruby
    # fastlane/Fastfile

    default_platform(:ios)

    platform :ios do
      desc "Build and release to TestFlight"
      lane :release do
        # 运行 flutter build ios
        sh "flutter build ios --release"

        # 上传到 TestFlight
        pilot
      end
    end

    platform :android do
      desc "Build and release to Google Play"
      lane :release do
        # 运行 flutter build apk
        sh "flutter build apk --release"

        # 上传到 Google Play
        supply
      end
    end
    ```

  * 运行 Fastlane

  ```shell
  fastlane ios release
  // 或者
  fastlane android release
  ```
