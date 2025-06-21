#!/bin/zsh

# ✅ 打印绿色信息函数
print_green() {
  echo "\033[0;32m$1\033[0m"
}

# ✅ 显示脚本功能说明并等待用户确认
print_green "🛠️ 脚本功能："
print_green "1️⃣ 自动判断当前目录是 iOS 工程还是 Flutter 工程。"
print_green "2️⃣ 对于 Apple Silicon 架构自动使用 Rosetta 执行 pod update。"
print_green "3️⃣ 自动进入正确目录并执行 pod update。"
print_green "📌 请确保已正确安装 CocoaPods。"
echo ""
read "?👉 按下回车键继续执行，或按 Ctrl+C 取消..."

# ✅ 获取脚本自身所在目录
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$BASE_DIR" || exit 1

# ✅ 打印信息函数
print_success() { echo "✅ $1"; }
print_info()    { echo "📘 $1"; }
print_error()   { echo "❌ $1"; }

# ✅ 执行 pod update 函数
update_pod() {
  local dir="$1"
  print_info "📁 进入目录: $dir"
  cd "$dir" || {
    print_error "❌ 无法进入目录: $dir"
    exit 1
  }

  local arch="$(uname -m)"
  print_info "🧠 当前架构: $arch"

  if [[ "$arch" == "arm64" ]]; then
    print_info "🍎 使用 Rosetta 执行 pod update"
    arch -x86_64 pod update
  else
    print_info "💻 直接执行 pod update"
    pod update
  fi

  print_success "🎉 Pod 更新完成"
}

# ✅ 主逻辑判断入口
print_info "📌 当前起点路径: $BASE_DIR"

if [[ -f "$BASE_DIR/Podfile" ]]; then
  print_info "📱 检测到 iOS 工程"
  update_pod "$BASE_DIR"
elif [[ -f "$BASE_DIR/pubspec.yaml" && -f "$BASE_DIR/ios/Podfile" ]]; then
  print_info "🧩 检测到 Flutter 工程，进入 ios 执行 pod update"
  update_pod "$BASE_DIR/ios"
else
  print_error "未找到 Podfile，无法继续"
  exit 1
fi
