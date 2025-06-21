#!/bin/zsh

# ✅ 获取脚本自身所在目录
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$BASE_DIR" || exit 1

# ✅ 输出方法
info()    { echo "📘 $1"; }
success() { echo "✅ $1"; }
error()   { echo "❌ $1"; }

# ✅ 清理函数
clean_ios() {
  local path="$1"
  cd "$path" || {
    error "无法进入 $path"
    exit 1
  }

  info "🧹 正在清理 iOS 缓存目录..."
  rm -rf Pods
  rm -rf Podfile.lock
  rm -rf ~/Library/Developer/Xcode/DerivedData/*
  success "🧽 iOS 缓存清理完成"
}

clean_flutter_ios() {
  local path="$1"
  cd "$path" || {
    error "无法进入 $path"
    exit 1
  }

  info "🧹 正在清理 Flutter iOS 缓存..."
  rm -rf ios/Pods
  rm -rf ios/Podfile.lock
  rm -rf ios/.symlinks
  rm -rf ios/Flutter/Flutter.podspec
  rm -rf ios/Flutter/App.framework
  rm -rf ios/Flutter/engine
  rm -rf ios/Flutter/*.xcframework
  rm -rf ios/Flutter/Flutter.framework
  rm -rf ios/Flutter/flutter_export_environment.sh
  rm -rf ios/Flutter/Generated.xcconfig
  rm -rf ios/Flutter/ephemeral
  rm -rf .dart_tool
  rm -rf build
  rm -rf pubspec.lock
  rm -rf ~/Library/Developer/Xcode/DerivedData/*
  success "🧽 Flutter iOS 缓存清理完成"
}

# ✅ 开始判断路径类型并清理
info "📂 当前起点: $BASE_DIR"

if [[ -f "$BASE_DIR/pubspec.yaml" && -d "$BASE_DIR/ios" ]]; then
  info "🧩 检测到 Flutter 工程"
  clean_flutter_ios "$BASE_DIR"
elif [[ -f "$BASE_DIR/Podfile" ]]; then
  info "📱 检测到 iOS 工程"
  clean_ios "$BASE_DIR"
else
  error "无法识别的工程结构，未检测到 Podfile 或 pubspec.yaml"
  exit 1
fi
