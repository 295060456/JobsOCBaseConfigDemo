#!/bin/zsh

# ✅ 彩色输出
color_echo() {
  local color="$1"
  local msg="$2"
  case $color in
    red)    echo "\033[31m$msg\033[0m" ;;
    green)  echo "\033[32m$msg\033[0m" ;;
    yellow) echo "\033[33m$msg\033[0m" ;;
    blue)   echo "\033[34m$msg\033[0m" ;;
    *)      echo "$msg" ;;
  esac
}

# ✅ 功能说明
color_echo green "🛠️ 脚本功能："
color_echo green "1️⃣ 给所有当前目录下的文件添加可执行权限"
color_echo green "2️⃣ 自动删除 .xcworkspace、Pods、Podfile.lock"
color_echo green "3️⃣ 自动执行 pod install / pod repo update"
color_echo green "🧩 同时兼容 Flutter 和原生 iOS 项目"
echo ""
read "?👉 按下回车键继续执行，或按 Ctrl+C 取消..."

# ✅ 获取当前目录
basedir=$(cd "$(dirname "$0")"; pwd -P)
color_echo blue "📂 当前项目的绝对路径: $basedir"

# ✅ 给文件加执行权限
for file in "$basedir"/*; do
  if [ -f "$file" ]; then
    chmod +x "$file"
    color_echo green "✅ 添加执行权限: $(basename "$file")"
  fi
done

# ✅ 提取 .xcodeproj 工程名
project_file=$(find "$basedir" -maxdepth 1 -name "*.xcodeproj" | head -n 1)
if [[ -z "$project_file" ]]; then
  color_echo red "❌ 未找到 .xcodeproj 文件，请确认项目路径正确"
  exit 1
fi

ProjName=$(basename "$project_file" .xcodeproj)
color_echo green "✅ 当前工程名称为: $ProjName"

# ✅ 构造相关路径
Proj_xcworkspace_filePath="$basedir/${ProjName}.xcworkspace"
Proj_Pods_folderPath="$basedir/Pods"
Proj_PodfileLock_filePath="$basedir/Podfile.lock"

# ✅ 删除旧内容
if [[ -d "$Proj_xcworkspace_filePath" ]]; then
  color_echo yellow "🗑️ 正在删除: $Proj_xcworkspace_filePath"
  rm -rf "$Proj_xcworkspace_filePath"
fi

if [[ -d "$Proj_Pods_folderPath" ]]; then
  color_echo yellow "🗑️ 正在删除: $Proj_Pods_folderPath"
  rm -rf "$Proj_Pods_folderPath"
fi

if [[ -f "$Proj_PodfileLock_filePath" ]]; then
  color_echo yellow "🗑️ 正在删除: $Proj_PodfileLock_filePath"
  rm -f "$Proj_PodfileLock_filePath"
fi

color_echo green "✅ 工程 $ProjName 的旧缓存清理完毕"
color_echo blue "🚀 开始重新安装依赖..."

# ✅ 进入项目目录并执行 pod install
cd "$basedir" || exit 1

# ✅ 判断是否为 Flutter 工程
if [[ -f "$basedir/pubspec.yaml" && -d "$basedir/ios" ]]; then
  color_echo yellow "🧩 检测到 Flutter 工程，进入 ios 执行 pod install"
  cd ios || exit 1
fi

# ✅ CocoaPods 安装流程
pod install
pod setup
pod repo update --verbose

color_echo green "🎉 CocoaPods 安装与更新完成"
