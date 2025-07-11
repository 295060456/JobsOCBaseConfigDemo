#!/bin/zsh

# ✅ 打印绿色信息
print_green() {
  echo "\033[0;32m$1\033[0m"
}

# ✅ 显示脚本功能说明并等待用户确认
print_green "🛠️ 脚本功能："
print_green "1️⃣ 自动判断当前目录是 iOS 工程还是 Flutter 工程。"
print_green "2️⃣ 对于 Apple Silicon 架构若 pod 命令支持 x86_64，则自动使用 Rosetta 执行 pod install。"
print_green "3️⃣ 自动进入正确目录并执行 pod install --repo-update。"
print_green "4️⃣ Pod 安装成功后，在桌面生成 .xcworkspace 快捷方式。"
print_green "📌 请确保已正确安装 CocoaPods。"
echo ""
read "?👉 按下回车键继续执行，或按 Ctrl+C 取消..."

# ✅ 打印信息函数
print_success() { echo "✅ $1"; }
print_info()    { echo "📘 $1"; }
print_error()   { echo "❌ $1"; }

# ✅ 获取脚本自身所在目录
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$BASE_DIR" || exit 1
print_info "📌 当前起点路径: $BASE_DIR"

# ✅ 定义执行 pod install 的函数，根据架构和 pod 二进制支持情况自动判断使用 Rosetta
install_pod() {
  local dir="$1"
  print_info "📁 进入目录: $dir"
  cd "$dir" || {
    print_error "❌ 无法进入目录: $dir"
    exit 1
  }

  local arch="$(uname -m)"
  print_info "🧠 当前架构: $arch"

  local POD_CMD="pod install --repo-update"
  
  if [[ "$arch" == "arm64" ]]; then
    local pod_binary
    pod_binary="$(which pod)"
    if [[ -z "$pod_binary" ]]; then
      print_error "❌ 未找到 pod 命令"
      exit 1
    fi

    # 获取 pod 命令支持的架构
    local arch_info
    arch_info=$(lipo -info "$pod_binary")
    print_info "🧩 pod 架构信息: $arch_info"

    if echo "$arch_info" | grep -q "x86_64"; then
      print_info "🍎 pod 命令支持 x86_64，使用 Rosetta 模式执行"
      POD_CMD="arch -x86_64 pod install --repo-update"
    else
      print_info "💻 pod 命令不支持 x86_64，直接执行"
    fi
  else
    print_info "💻 当前非 Apple Silicon，直接执行 pod install"
  fi

  # 执行 pod install
  print_info "⚙️ 执行命令: $POD_CMD"
  eval "$POD_CMD"

  print_success "🎉 Pod 安装完成"

  # ✅ 查找 xcworkspace 文件
  local workspace_file
  workspace_file="$(find . -maxdepth 1 -name '*.xcworkspace' | head -n 1)"
  if [[ -n "$workspace_file" ]]; then
    local workspace_name
    workspace_name="$(basename "$workspace_file")"
    local desktop_link="$HOME/Desktop/$workspace_name"

    print_info "🔗 检测到 workspace: $workspace_name"
    
    # 删除已有的同名链接或文件
    if [[ -e "$desktop_link" || -L "$desktop_link" ]]; then
      rm -f "$desktop_link"
    fi

    ln -s "$PWD/$workspace_name" "$desktop_link"
    print_success "📎 已在桌面创建快捷方式: $workspace_name"
  else
    print_error "❌ 未检测到生成的 .xcworkspace 文件"
  fi
}

# ✅ 主逻辑判断
if [[ -f "$BASE_DIR/Podfile" ]]; then
  print_info "📱 检测到 iOS 工程"
  install_pod "$BASE_DIR"
elif [[ -f "$BASE_DIR/pubspec.yaml" && -f "$BASE_DIR/ios/Podfile" ]]; then
  print_info "🧩 检测到 Flutter 工程，进入 ios 目录执行 pod install"
  install_pod "$BASE_DIR/ios"
else
  print_error "❌ 未找到 Podfile，无法继续"
  exit 1
fi
