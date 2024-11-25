## 通过 Bundler 运行 CocoaPods 命令
## bundle exec pod update
#begin
#  require 'bundler/setup'
#  Bundler.setup(:default)
#  puts 'Bundler setup completed'
#  require 'cocoapods-downloader'
#  puts 'cocoapods-downloader plugin loaded'
#rescue LoadError => e
#  puts 'cocoapods-downloader plugin could not be loaded'
#  puts e.message
#end
#puts 'Podfile is being loaded...'
# 加速 CocoaPods 依赖下载的工具 https://github.com/CocoaPods/cocoapods-downloader
# 使用前提：gem install cocoapods-downloader
#plugin 'cocoapods-downloader', {
#  'https://github.com/CocoaPods/Specs.git' => [
#    'https://mirrors.aliyun.com/pods/specs.git',
#    'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git',
#    'https://mirrors.cloud.tencent.com/CocoaPods/Specs.git',
#    'https://mirrors.ustc.edu.cn/CocoaPods/Specs.git'
#  ]
#}

# plugin 'cocoapods-repo-update'

## 指明依赖库的来源地址
#source 'https://cdn.cocoapods.org/'
#source 'https://github.com/CocoaPods/Specs.git'# 使用官方默认地址（默认）
#source 'https://github.com/Artsy/Specs.git'# 使用其他来源地址

# 需要特别说明的：在 post_install 时，为了一些版本的兼容，需要遍历所有 target，调整一部分库的版本；但是如果开启了 generate_multiple_pod_projects 的话，由于项目结构的变化，installer.pod_targets 就没办法获得所有 pods 引入的 target 了
install! 'cocoapods',# install! 只走一次，多次使用只以最后一个标准执行
  :deterministic_uuids => false,# 【解决与私有库的冲突】用于控制生成的库的唯一标识符（UUID）是否是确定性的。UUID 是用于标识对象的唯一标识符，通常在构建软件时用于确保唯一性。当 deterministic_uuids 设置为 false 时，意味着 CocoaPods 将不会确保生成的库的 UUID 是确定性的。换句话说，每次构建时，生成的库的 UUID 可能会发生变化，即使源代码没有变化也可能如此。这可能会影响一些情况，例如在依赖库的版本控制方面。通常情况下，将 deterministic_uuids 设置为 true 会更安全，因为它可以确保每次构建生成的库都具有相同的 UUID，从而确保了可预测性和一致性。
  :generate_multiple_pod_projects => true,# ❤️可以让每个依赖都作为一个单独的项目引入（而不是文件夹的形式），大大增加了解析速度❤️；cocoapods 1.7 以后支持
  :disable_input_output_paths => true # 在 CocoaPods 中，disable_input_output_paths 是一个选项，用于控制是否禁用输入和输出路径。当设置为 true 时，这意味着 CocoaPods 将会禁用与输入和输出路径相关的功能或设置。通常情况下，禁用输入和输出路径可能会用于某些特定的构建环境或配置中，以确保在构建过程中不考虑或不使用指定的输入和输出路径。这可能是出于安全性、调试或其他特定需求的考虑。具体来说，当 disable_input_output_paths 设置为 true 时，可能会禁用与输入和输出路径相关的功能，例如对输入文件的读取、对输出文件的写入等操作。这样可以确保构建过程不受指定路径的影响。

platform :ios, '10.0'
inhibit_all_warnings!
# 用于指定你的 Pod 项目应使用静态库而不是动态库。
# 这个选项主要用于解决某些与动态库相关的兼容性和性能问题。
use_frameworks! :linkage => :static

# 单元测试框架
def testApp

end

def longConnection
  pod 'Socket.IO-Client-Swift'
end

# 调试框架
def debugPods
# pod 'Bugly' # https://github.com/BuglyDevTeam 日志收集
# pod 'DoraemonKit' # https://github.com/didi/DoraemonKit 滴滴打车出的工具 NO_SMP
# pod 'CocoaDebug' # https://github.com/CocoaDebug/CocoaDebug NO_SMP
# pod 'FLEX'  # https://github.com/Flipboard/FLEX 调试界面相关插件 NO_SMP
# pod 'JJException' # https://github.com/jezzmemo/JJException 保护App,一般常见的问题不会导致闪退，增强App的健壮性，同时会将错误抛出来，根据每个App自身的日志渠道记录 NO_SMP
# pod 'FBRetainCycleDetector' # https://github.com/facebook/FBRetainCycleDetector
  #pod 'LookinServer', :configurations => ['Debug'] # https://lookin.work/
end

# 几乎每个App都会用到的
def appCommon
#  pod 'JobsBlock' # https://github.com/295060456/JobsBlock
  pod 'FTroulette' # https://github.com/520coding/FTdashboad
  pod 'UITextView+Placeholder' # https://github.com/devxoul/UITextView-Placeholder A missing placeholder for UITextView.
  pod 'XYColorOC' # https://github.com/RayJiang16/XYColor 适配iOS 13夜间模式/深色外观(Dark Mode)
  pod 'IQKeyboardManager' # https://github.com/hackiftekhar/IQKeyboardManager Codeless drop-in universal library allows to prevent issues of keyboard sliding up and cover UITextField/UITextView. Neither need to write any code nor any setup required and much more.
  pod 'Masonry' # https://github.com/SnapKit/Masonry NO_SMP
#  pod 'SDAutoLayout' # https://github.com/gsdios/SDAutoLayout
#  pod 'AFNetworking' # https://github.com/AFNetworking/AFNetworking YES_SMP ⚠️作者停止维护
  pod 'Reachability'  # https://github.com/tonymillion/Reachability 检查联网情况 NO_SMP
  pod 'ReactiveObjC' # https://github.com/ReactiveCocoa/ReactiveObjC NO_SMP
  pod 'XZMRefresh' # https://github.com/xiezhongmin/XZMRefresh 横向刷新
  pod 'MJRefresh' # https://github.com/CoderMJLee/MJRefresh 纵向刷新 NO_SMP
  pod 'MJExtension' # https://github.com/CoderMJLee/MJExtension NO_SMP
  pod 'SDWebImage' # https://github.com/SDWebImage/SDWebImage YES_SMP
#  pod 'YYKit' # https://github.com/ibireme/YYKit NO_SMP
  pod 'YQImageTool'
  pod 'OpenUDID'  # https://github.com/ylechelle/OpenUDID Open source initiative for a universal and persistent UDID solution for iOS
  pod 'TABAnimated' # https://github.com/tigerAndBull/TABAnimated
  pod 'HXRotationTool' # https://github.com/TheLittleBoy/HXRotationTool 屏幕旋转
  pod 'YTKNetwork' # https://github.com/yuantiku/YTKNetwork
#  pod 'ZBNetworking', :git => 'https://github.com/Suzhibin/ZBNetworking.git' # https://github.com/Suzhibin/ZBNetworking
end
## GK一族
def gk
  pod 'GKNavigationBar' # https://github.com/QuintGao/GKNavigationBar NO_SMP
  pod 'GKPhotoBrowser' # https://github.com/QuintGao/GKPhotoBrowser iOS仿微信、今日头条等图片浏览器
end
## JX一族
def jx
  pod 'JXCategoryView' # https://github.com/pujiaxin33/JXCategoryView NO_SMP
  pod 'JXPagingView/Pager' # https://github.com/pujiaxin33/JXPagingView NO_SMP
  
#  pod 'JXCategoryViewExt' # https://github.com/QuintGao/JXCategoryViewExt 来自于另外一个作者的优化
#  # 分类
#  pod 'JXCategoryViewExt' # 基础库
#  pod 'JXCategoryViewExt/Title'# 文字
#  pod 'JXCategoryViewExt/SubTitle'# 文字+副标题
#  pod 'JXCategoryViewExt/Image'# 图片
#  pod 'JXCategoryViewExt/TitleImage'# 文字+图片
#  pod 'JXCategoryViewExt/TitleAttribute'# 富文本
#  pod 'JXCategoryViewExt/Dot'# title+小红点
#  pod 'JXCategoryViewExt/DotZoom'# title+小红点缩放
#  pod 'JXCategoryViewExt/Number'# title+数字
#  pod 'JXCategoryViewExt/Badge'# title+(文字、数字、红点混合)
#  pod 'JXCategoryViewExt/VerticalZoomTitle'# title垂直滚动缩放
#  # 指示器
#  pod 'JXCategoryViewExt/Background' # 背景
#  pod 'JXCategoryViewExt/Indicator/Line'# 线
#  pod 'JXCategoryViewExt/Indicator/AlignmentLine'# 线+对齐
#  pod 'JXCategoryViewExt/Indicator/RainbowLine'# 线+彩虹效果
#  pod 'JXCategoryViewExt/Indicator/Image'# 图片
#  pod 'JXCategoryViewExt/Indicator/Ball'# 球
#  pod 'JXCategoryViewExt/Indicator/Triangle'# 三角形
#  pod 'JXCategoryViewExt/Indicator/DotLine'# 点线
#  # RTL
#  pod 'JXCategoryViewExt/RTL'

end
## 提示框
def alert
  pod 'SPAlertController' # https://github.com/SPStore/SPAlertController 深度定制AlertController NO_SMP
#  pod 'TFPopup' # https://github.com/shmxybfq/TFPopup 不耦合view代码,可以为已创建过 / 未创建过的view添加弹出方式;只是一种弹出方式;
end
# UI相关
def ui
  pod 'ZMJTipView' # https://github.com/keshiim/ZMJTipView
  pod 'ZMJGanttChart' # https://github.com/keshiim/ZMJGanttChart excel
  pod 'LMJDropdownMenu' # https://github.com/JerryLMJ/LMJDropdownMenu 下拉菜单
#  pod 'WMZBanner' # https://github.com/wwmz/WMZBanner 轻量级轮播图+卡片样式+自定义样式 ⚠️作者停止维护
  pod 'MGSwipeTableCell' # https://github.com/MortimerGoro/MGSwipeTableCell 滑动tableViewCell
  pod 'Shimmer' # https://github.com/facebookarchive/Shimmer⚠️作者停止维护 Facebook 推出的一款具有闪烁效果的第三方控件
  pod 'RQShineLabel'  # https://github.com/zipme/RQShineLabel 一个类似Secret文字渐变效果的开源库
  pod 'SZTextView' # https://github.com/glaszig/SZTextView SZTextView 用于替代内置的 UITextView，实现了 placeholder
  pod 'BRPickerView'  # https://github.com/91renb/BRPickerView 平替UIPickerView 该组件封装的是iOS中常用的选择器组件，主要包括：日期选择器、时间选择器（DatePickerView）、地址选择器（AddressPickerView）、自定义字符串选择器（StringPickerView）。支持自定义主题样式，适配深色模式，支持将选择器组件添加到指定容器视图。
#  pod 'LYEmptyView' # https://github.com/dev-liyang/LYEmptyView iOS一行代码集成空白页面占位图(无数据、无网络占位图)
#  pod 'ZZCircleProgress' # https://github.com/zhouxing5311/ZZCircleProgress 可以高度自定义的环形进度条 我用手动pods管理
  pod 'FLAnimatedImageView+RGWrapper' #
  pod 'PPBadgeView' # https://github.com/jkpang/PPBadgeView iOS自定义Badge组件, 支持UIView, UITabBarItem, UIBarButtonItem以及子类 NO_SMP
  pod 'WHToast' # https://github.com/remember17/WHToast 一个轻量级的提示控件，没有任何依赖 NO_SMP
  pod 'BEMCheckBox' # https://github.com/Boris-Em/BEMCheckBox 复选框 更炫 Tasteful Checkbox for iOS
#  pod 'WMZCode' # https://github.com/wwmz/WMZCode
#  pod 'KJBannerView' # https://github.com/yangKJ/KJBannerViewDemo 轮播图 【有点问题，暂时手动管理】
#  pod 'YYKit'
  pod 'YYImage'
#  pod 'UICountingLabel'
  pod 'pop', '~> 1.0.10'
  gk # GK一族
  jx # JX一族
  alert # 提示框
  
end
# 视频相关
def videoFunc
  pod 'ZFPlayer' # https://github.com/renzifeng/ZFPlayer
  pod 'ZFPlayer/ControlView'
  pod 'ZFPlayer/AVPlayer'
  pod 'ZFPlayer/ijkplayer'
#  pod 'KTVHTTPCache' # 边下边播
#  pod 'VIMediaCache' # https://github.com/vitoziv/VIMediaCache 边下边播
end
# 一些功能性
def func
  pod 'LiveChat' # 第三方的聊天工具 https://github.com/livechat/chat-window-ios
  pod 'NTESVerifyCode' # 网易验证码 https://github.com/yidun/NTESVerifyCode https://support.dun.163.com/documents/15588062143475712?docId=150442931089756160
  pod 'TXFileOperation' # 文件夹操作 https://github.com/xtzPioneer/TXFileOperation
  pod 'HXPhotoPicker' # 相册选择 https://github.com/SilenceLove/HXPhotoPickerObjC 没有完全兼容横屏
  pod 'BMLongPressDragCellCollectionView' # https://github.com/liangdahong/BMLongPressDragCellCollectionView
  pod 'JPImageresizerView' # https://github.com/Rogue24/JPImageresizerView 一个专门裁剪图片、GIF、视频的轮子，简单易用，功能丰富（高自由度的参数设定、支持旋转和镜像翻转、蒙版、压缩等），能满足绝大部分裁剪的需求。
  pod 'lottie-ios', '~> 2.5.3' # 这是OC终极版本 https://github.com/airbnb/lottie-ios
#  pod 'WCDB'
  pod 'AYCheckVersion'  # https://github.com/AYJk/AYCheckVersion 提示更新 Check version from AppStore / 从AppStore检查更新
#  pod 'FSCalendar' # https://github.com/WenchaoD/FSCalendar 日历签到
  #pod 'LCAuthManager' # https://github.com/LennonChin/LCAuthManager 简单易用的权限验证库，提供了手势密码、生物特性验证（包括Touch ID和Face ID）的集成
  videoFunc # 视频相关
end
# 数据库
def database
  pod 'Realm'
  
  pod 'FMDB' # https://github.com/ccgus/fmdb
#  pod 'JQFMDB' # https://github.com/gaojunquan/JQFMDB 对 FMDB进行的二次封装
  # pod 'FMDB/FTS'   # FMDB with FTS
  # pod 'FMDB/standalone'   # FMDB with latest SQLite amalgamation source
  # pod 'FMDB/standalone/FTS'   # FMDB with latest SQLite amalgamation source and FTS
  # pod 'FMDB/SQLCipher'   # FMDB with SQLCipher
end
# 基础的公共配置
def cocoPodsConfig
  # ❤️新工程需要修改这里❤️
  target 'JobsOCBaseConfigDemoTests' do
    inherit! :search_paths # abstract! 指示当前的target是抽象的，因此不会直接链接Xcode target。与其相对应的是 inherit！
    # Pods for testing
  end
  # ❤️新工程需要修改这里❤️
  target 'JobsOCBaseConfigDemoUITests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  # 当我们下载完成，但是还没有安装之时，可以使用hook机制通过pre_install指定要做更改，更改完之后进入安装阶段。 格式如下：
  pre_install do |installer|
      # 做一些安装之前的更改
  end
  
  # 这个是cocoapods的一些配置,官网并没有太详细的说明,一般采取默认就好了,也就是不写.
  post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
    end
    # 这段代码的作用是在 CocoaPods 安装完所有依赖库之后，遍历所有生成的 Xcode 项目的 targets，并为每个 target 设置特定的构建配置。
    # 具体来说，它在 post_install 钩子中执行，用于修改生成的项目的构建配置。
    installer.generated_projects.each do |project|
      project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
          config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
        end
      end
    end
    
    # 遍历 CocoaPods 项目中的所有 targets，并为每个 target 设置特定的构建配置。
    # 具体来说，它是在 post_install 钩子中执行的，用于修改 Pods 项目的构建配置。
    installer.pods_project.targets.each do |target|
      # 用于在控制台输出每个 CocoaPods target 的名称。它通常放在 post_install 钩子中，用于调试或验证。
      puts "!!!! #{target.name}"
      # YTKNetwork 会集成 AFNetworking。而 AFNetworking 目前OC版本已经停更，且或许在某些场景下，需要修改 AFNetworking 源代码。
      # 所以，拉 YTKNetwork 的时候，需要排除 AFNetworking
#      if target.name == 'YTKNetwork'
#        target.dependencies.delete_if { |dependency| dependency.name == 'AFNetworking' }
#      end
      
      # 有时候，在 Podfile 中没有明确指定最低支持的 iOS 版本时，某些 Pods 可能默认使用较低版本的 IPHONEOS_DEPLOYMENT_TARGET。
      # 这可能导致构建时出现兼容性问题或警告。
      # 因此，通过在 post_install 钩子中统一设置所有 Pods 的 IPHONEOS_DEPLOYMENT_TARGET，可以确保所有依赖库使用一致的最低 iOS 版本，减少潜在的兼容性问题。
      # 在 CocoaPods 安装完所有依赖库之后，遍历每个 target 的构建配置，并将 IPHONEOS_DEPLOYMENT_TARGET 设置为 13.0。
      # 具体来说，它是在 post_install 钩子中执行的，这意味着它会在所有 Pods 安装完成之后、写入 Xcode 项目之前被调用。
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
      end
    end
    
    # 这段代码的作用是在 CocoaPods 安装完所有依赖库之后，遍历 Pods 项目的所有构建配置，并设置 EXCLUDED_ARCHS 构建设置，以排除 arm64 架构。
    # 这通常是为了解决在模拟器上构建项目时遇到的 arm64 架构兼容性问题。
    installer.pods_project.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end
# ❤️新工程需要修改这里❤️
target 'JobsOCBaseConfigDemo' do
  # Pods for JobsOCBaseConfigDemo
#  testApp # 单元测试框架
  longConnection # 长链接框架
  debugPods # 调试框架
  appCommon # 几乎每个App都会用到的
  ui # UI相关
  func # 一些功能性
  database # 数据库
  
  cocoPodsConfig # 基础的公共配置
end
